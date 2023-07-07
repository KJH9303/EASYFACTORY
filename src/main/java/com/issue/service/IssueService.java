package com.issue.service;

import java.util.List;

import com.issue.dao.IssueDAO;
import com.issue.vo.Criteria;
import com.issue.vo.IssueVO;
import com.member.vo.MemberVO;

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
	
	// 글 보기
	public IssueVO viewContent(int no) {
		IssueVO issueVO = issueDAO.viewContent(no);
		return issueVO; 
	}
	
	// 글 작성
	public void write(IssueVO issueVO) {
		issueDAO.write(issueVO);
	}
	
	// 글 수정
	public void update(IssueVO issueVO) {
		issueDAO.update(issueVO);
	}
	
	// 글 삭제
	public void delete(int no) {
		issueDAO.delete(no);
	}
	
	
}
