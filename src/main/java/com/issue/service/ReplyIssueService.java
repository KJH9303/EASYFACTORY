package com.issue.service;

import java.util.List;

import com.issue.dao.IssueDAO;
import com.issue.dao.ReplyIssueDAO;
import com.issue.vo.Criteria;
import com.issue.vo.IssueVO;
import com.issue.vo.ReplyIssueVO;

public class ReplyIssueService {
	
	private ReplyIssueDAO replyIssueDAO;

	public ReplyIssueService(ReplyIssueDAO replyIssueDAO) {
		this.replyIssueDAO = replyIssueDAO;
	}
	
	// 글 갯수
	public int issueListCnt(int reply_no) {
		int cnt = replyIssueDAO.issueReplyListCnt(reply_no);
		return cnt;
	}
	
	// 글 목록
	public List<ReplyIssueVO> getReplyList(int no) {
		List<ReplyIssueVO> replyList = replyIssueDAO.getReplyList(no);
		return replyList;
	}
	
	// 글 작성
	public void writeReply(int no, String content, String author) {
		replyIssueDAO.writeReply(no, content, author);
	}
	
	// 글 수정
	public void update(ReplyIssueVO replyIssueVO) {
		replyIssueDAO.updateReply(replyIssueVO);
	}
	
	// 글 삭제
	public void delete(int reno) {
		replyIssueDAO.deleteReply(reno);
	}
	
	
}
