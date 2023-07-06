package com.issue.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.issue.service.IssueService;
import com.issue.vo.Criteria;
import com.issue.vo.IssueVO;
import com.issue.vo.PageMaker;
import com.member.vo.MemberVO;

@Controller
@RequestMapping("/issue")
public class IssueController {

	@Autowired
    private IssueService issueService;
    
    public void setIssueService(IssueService issueService) {
		this.issueService = issueService;
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
    
    // 글 쓰기 페이지
    @RequestMapping(value="/write", method=RequestMethod.GET)
    public String writeView(HttpServletRequest request, Model model) throws Exception {
    	HttpSession session = request.getSession();
    	session.getAttribute("member");
		return "issue/write";
    }
    
    // 글 쓰기 기능
    @RequestMapping(value="/writeSubmit", method=RequestMethod.POST)
    public String write(@ModelAttribute IssueVO issueVO, Model model) throws Exception {
    	issueService.write(issueVO);
		return "redirect:/issue/list";
    }
}
