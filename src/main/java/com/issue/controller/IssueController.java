package com.issue.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.issue.service.EzFileService;
import com.issue.service.IssueService;
import com.issue.service.ReplyIssueService;
import com.issue.vo.Criteria;
import com.issue.vo.EzFileVO;
import com.issue.vo.IssueVO;
import com.issue.vo.PageMaker;
import com.issue.vo.ReplyIssueVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
@RequestMapping("/issue")
public class IssueController {

	@Autowired
    private IssueService issueService;
    
    public void setIssueService(IssueService issueService) {
		this.issueService = issueService;
	}
    
    // 댓글 Service
    @Autowired
    private ReplyIssueService replyIssueService;
    
    public void setReplyIssueService(ReplyIssueService replyIssueService) {
		this.replyIssueService = replyIssueService;
	}
    
    // 파일 Service
    @Autowired
    private EzFileService ezFileService;
    
    public void setEzFileService(EzFileService ezFileService) {
		this.ezFileService = ezFileService;
	}
    
    // 글 목록
    @RequestMapping(value="/list", method=RequestMethod.GET)
    public String getissueList(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
    	int totCnt = issueService.issueListCnt();
   	 	model.addAttribute("totCnt", totCnt);
    	List<IssueVO> issueList = issueService.issueList(cri);
    	model.addAttribute("issueList", issueList);
    	 
    	PageMaker pageMaker = new PageMaker();
    	pageMaker.setCri(cri);
    	 
    	pageMaker.setTotalCount(totCnt);
    	model.addAttribute("pageMaker", pageMaker);
		
    	return "issue/list";
    }
    
    // 글 검색
    @RequestMapping(value="/list/search", method=RequestMethod.GET)
    public String search(HttpServletRequest request, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
    	
    	String searchType = request.getParameter("searchType") == null ? "" : request.getParameter("searchType");
    	String keyword = request.getParameter("keyword") == null ? "" : request.getParameter("keyword");
    	String startDate = request.getParameter("startDate") == null ? "" : request.getParameter("startDate");
    	String endDate = request.getParameter("endDate") == null ? "" : request.getParameter("endDate");
    	String page = request.getParameter("page") == null ? "" : request.getParameter("page").toString();
    	String perPageNum = request.getParameter("perPageNum") == null ? "" : request.getParameter("perPageNum").toString();
    	
    	int totCnt = issueService.issueSearchCnt(searchType, keyword, startDate, endDate);
   	 	model.addAttribute("totCnt", totCnt);
   	 	
    	List<IssueVO> searchIsList = issueService.search(searchType, keyword, startDate, endDate, cri);
    	model.addAttribute("issueList", searchIsList);
    	model.addAttribute("page", page);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("searchType", searchType);
   	 	model.addAttribute("keyword", keyword);
   	 	model.addAttribute("startDate", startDate);
   	 	model.addAttribute("endDate", endDate);
    	
    	PageMaker pageMaker = new PageMaker();
    	pageMaker.setCri(cri);
    	 
    	pageMaker.setTotalCount(totCnt);
    	model.addAttribute("pageMaker", pageMaker);
    	
    	return "issue/list";
    }
    
    // 글 보기
    @RequestMapping(value="/view", method=RequestMethod.GET)
    public void viewContent(@ModelAttribute("cri") Criteria cri, HttpServletRequest request, Model model) throws Exception {
    	int no = request.getParameter("no").toString() == null ? 0 : Integer.parseInt(request.getParameter("no"));
    	IssueVO issueVO = issueService.viewContent(no);
    	
    	String searchType = request.getParameter("searchType") == null ? "" : request.getParameter("searchType");
    	String keyword = request.getParameter("keyword") == null ? "" : request.getParameter("keyword");
    	String startDate = request.getParameter("startDate") == null ? "" : request.getParameter("startDate");
    	String endDate = request.getParameter("endDate") == null ? "" : request.getParameter("endDate");
    	
    	model.addAttribute("searchType", searchType);
   	 	model.addAttribute("keyword", keyword);
   	 	model.addAttribute("startDate", startDate);
   	 	model.addAttribute("endDate", endDate);
   	 	
    	model.addAttribute("issue", issueVO);
    	model.addAttribute("cri", cri);
    }
    
    // 글 쓰기 페이지
    @RequestMapping(value="/write", method=RequestMethod.GET)
    public String writeView(HttpServletRequest request, Model model) throws Exception {
    	HttpSession session = request.getSession();
    	session.getAttribute("member");
		return "issue/write";
    }
    
    // 글 쓰기 기능
    @RequestMapping(value="/writeSubmit", method=RequestMethod.POST)
    public String write(Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception {
        String SAVEFOLDER = "C:\\easyfactory_file";
        String ENCTYPE = "UTF-8";
        int MAXSIZE = 50 * 1024 * 1024; // 5MB
        int DOWNLOAD_BUFF_SIZE = 1024 * 8; // 8KB 

        System.out.println("----------------------------------------------------------------------------");
        MultipartRequest multi = new MultipartRequest(request, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());

        String title = multi.getParameter("title");
        String content = multi.getParameter("content");
        String author = multi.getParameter("author");
        System.out.println("title :" + title + ", content : " + content + ", author : " + author);
        issueService.write(title, content, author);

        int no = ezFileService.getDynamicIssueNo();

        List<EzFileVO> fileList = new ArrayList<>(); // 파일 정보를 저장할 리스트 생성
        Enumeration filenames = multi.getFileNames();
        while(filenames.hasMoreElements()) {
            String file = (String) filenames.nextElement();
            String savename = multi.getFilesystemName(file);
            String originalname = multi.getOriginalFileName(file);
            int filesize = (int) multi.getFile(file).length();

            System.out.println("file :" + file + ", savename : " + savename + ", originalname : " + originalname + ", filesize : " + filesize);

            EzFileVO ezFileVO = new EzFileVO();
            ezFileVO.setOriginalname(originalname);
            ezFileVO.setSavename(savename);
            ezFileVO.setFilesize(filesize);
            fileList.add(ezFileVO); // 파일 정보를 fileList에 추가
        }

        for (EzFileVO fileVO : fileList) {
            ezFileService.uploadFile(fileVO, no);
        }

        System.out.println("ttttttttttttttttttttttttttttttttt" + fileList.size());
        return "redirect:/issue/list";
    }
    
    // 글 수정 페이지
    @RequestMapping(value="/update", method=RequestMethod.GET)
    public void updateView(@ModelAttribute Criteria cri, HttpSession session, HttpServletRequest request, Model model) throws Exception {
    	
    	int no = Integer.parseInt(request.getParameter("no"));
    	IssueVO issueVO = issueService.viewContent(no);
    	
//    	String author = request.getParameter("author") == null ? "" : request.getParameter("author");
//    	String id = request.getParameter("id") == null ? "" : request.getParameter("id");
//    	
//    	model.addAttribute("author", author);
//        model.addAttribute("id", id);
    	session.getAttribute("member");
        
    	String searchType = request.getParameter("searchType") == null ? "" : request.getParameter("searchType");
    	String keyword = request.getParameter("keyword") == null ? "" : request.getParameter("keyword");
    	String startDate = request.getParameter("startDate") == null ? "" : request.getParameter("startDate");
    	String endDate = request.getParameter("endDate") == null ? "" : request.getParameter("endDate");
    	
    	model.addAttribute("searchType", searchType);
   	 	model.addAttribute("keyword", keyword);
   	 	model.addAttribute("startDate", startDate);
   	 	model.addAttribute("endDate", endDate);
   	 	
    	model.addAttribute("issue", issueVO);
    	model.addAttribute("cri", cri);
    }
    
    // 글 수정 기능
    @RequestMapping(value="/updateSubmit", method=RequestMethod.POST)
    public String update(@ModelAttribute IssueVO issueVO, @ModelAttribute Criteria cri, HttpServletRequest request) {
    	int no = Integer.parseInt(request.getParameter("no"));
    	int page = cri.getPage();
    	int perPageNum = cri.getPerPageNum();
    	
    	issueService.update(issueVO);
    	return "redirect:/issue/view?no="+no+"&page="+page+"&perPageNum="+perPageNum;
    }
    
    // 글 삭제
    @RequestMapping(value="/delete", method=RequestMethod.GET)
    public String delete(@ModelAttribute IssueVO issueVO, @ModelAttribute Criteria cri, HttpServletRequest request, Model model) {
    	int no = Integer.parseInt(request.getParameter("no"));
    	issueService.delete(no);
    	
    	String searchType = request.getParameter("searchType") == null ? "" : request.getParameter("searchType");
    	String keyword = request.getParameter("keyword") == null ? "" : request.getParameter("keyword");
    	String startDate = request.getParameter("startDate") == null ? "" : request.getParameter("startDate");
    	String endDate = request.getParameter("endDate") == null ? "" : request.getParameter("endDate");
    	
    	int page = cri.getPage();
    	int perPageNum = cri.getPerPageNum();
    	
    	return "redirect:/issue/list?no="+no+"&page="+page+"&perPageNum="+perPageNum+"&searchType="+searchType+"&keyword="+keyword+"&startDate="+startDate+"&endDate="+endDate;
    }
    
    // 댓글 작성 ajax
    @RequestMapping(value="/writeReply", method=RequestMethod.POST)
    @ResponseBody
    public String writeReply(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
    	
    	int no = Integer.parseInt(request.getParameter("no"));
    	String content = request.getParameter("content");
    	String author = request.getParameter("author");
    	
    	if(session.getAttribute("member") == null) {
			return "fail";
		} else {
			replyIssueService.writeReply(no, content, author);
			return "InsertSuccess";
		}
    }
    
    // 댓글 출력 ajax
    @RequestMapping(value="/viewReply", method=RequestMethod.GET)
    public String replylist(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
    	int no = Integer.parseInt(request.getParameter("no"));
    	int replyCnt = replyIssueService.issueReplyListCnt(no); // 댓글 갯수
    	List<ReplyIssueVO> replyList= replyIssueService.getReplyList(no); // 댓글 목록
    	
    	model.addAttribute("replyList", replyList);
    	model.addAttribute("replyCnt", replyCnt);
        return "issue/reply";
    }
    
    // 댓글 수정 ajax
    @RequestMapping(value="/updateReply", method=RequestMethod.POST)
    @ResponseBody
    public void updateReply(HttpServletRequest request) {
    	int reno = Integer.parseInt(request.getParameter("reno"));
    	String content = request.getParameter("content");
    	replyIssueService.updateReply(reno, content);
    }
    
    
    // 댓글 삭제 ajax
    @RequestMapping(value="/deleteReply", method=RequestMethod.POST)
    @ResponseBody
    public void deleteReply(HttpServletRequest request) throws Exception {
    	int reno = Integer.parseInt(request.getParameter("reno"));
        
    	replyIssueService.deleteReply(reno);
    }
    
    // 파일 목록 출력 ajax
    @RequestMapping(value="/viewFileList", method=RequestMethod.GET)
    public String viewFileList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
    	String strNo = request.getParameter("no");
    	int no = (strNo != null && strNo.isEmpty() != true) ? Integer.parseInt(strNo) : 0;
    	
    	System.out.println("nononononononononnononnonononononnoon" + no);
    	int fileCnt = ezFileService.issueFileListCnt(no); // 파일 갯수
    	List<EzFileVO> fileList= ezFileService.getFileList(no); // 파일 목록
    	
    	for (EzFileVO file : fileList) {
    		int fileSize = file.getFilesize();
            String formattedSize = formatFileSize(fileSize);
            file.setFilesizeFormatted(formattedSize);
        }
    	
    	model.addAttribute("fileList", fileList);
    	model.addAttribute("fileCnt", fileCnt);
        return "issue/fileList";
    }
    
    // 파일 사이즈 포맷 변환
    private String formatFileSize(long fileSize) {
        String[] units = {"B", "KB", "MB", "GB", "TB"};
        int digitGroups = (int) (Math.log10(fileSize) / Math.log10(1024));

        if (digitGroups >= units.length) {
            digitGroups = units.length - 1;
        }

        double size = fileSize / Math.pow(1024, digitGroups);
        return String.format("%.2f %s", size, units[digitGroups]);
    }
}
