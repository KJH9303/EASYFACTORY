package com.issue.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.issue.dao.IssueDAO;
import com.issue.vo.Criteria;
import com.issue.vo.IssueVO;

@Service
public class IssueService {
	
	private IssueDAO issueDAO;

	public IssueService(IssueDAO issueDAO) {
		this.issueDAO = issueDAO;
	}
	
	// 글 갯수
	public int issueListCnt() {
		int cnt = issueDAO.issueListCnt();
		return cnt;
	}
	
	// 글 목록
	public List<IssueVO> issueList(Criteria cri) {
		List<IssueVO> issueList = issueDAO.issueList(cri);
		return issueList;
	}
	
	// 글 검색
	public List<IssueVO> search(String searchType, String keyword, String startDate, String endDate, String selectProcess, Criteria cri) {
		List<IssueVO> searchIsList = issueDAO.search(searchType, keyword, startDate, endDate, selectProcess, cri);
		return searchIsList;
	}
	
	// 키워드와 일치하는 글 갯수
	public int issueSearchCnt(String searchType, String keyword, String startDate, String endDate, String selectProcess) {
		int cnt = issueDAO.issueSearchCnt(searchType, keyword, startDate, endDate, selectProcess);
		return cnt;
	}
	
	// 글 보기
	public IssueVO viewContent(int no) {
		IssueVO issueVO = issueDAO.viewContent(no);
		return issueVO; 
	}
	
	// 조회 수 증가
	public void viewCntUp(int no) {
		issueDAO.viewCntUp(no);
	}
	
	// 글 작성
	public void write(String process, String noticeYN, String title, String content, String author) {
		issueDAO.write(process, noticeYN, title, content, author);
	}
	
	// 글 수정
	public void update(String process, String noticeYN, String title, String content, String author, int no) {
		issueDAO.update(process, noticeYN, title, content, author, no);
	}
	
	// 글 삭제
	public void delete(int no) {
		issueDAO.delete(no);
	}
	
	
}
