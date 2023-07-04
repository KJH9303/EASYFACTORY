package com.issue.service;

import com.issue.dao.IssueDAO;
import com.issue.vo.IssueVO;

public class IssueService {
	
	private IssueDAO issueDAO;

	public IssueService(IssueDAO issueDAO) {
		this.issueDAO = issueDAO;
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
