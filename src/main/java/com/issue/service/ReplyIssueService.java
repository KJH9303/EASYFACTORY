package com.issue.service;

import java.util.List;

import com.issue.dao.ReplyIssueDAO;
import com.issue.vo.ReplyIssueVO;

public class ReplyIssueService {
	
	private ReplyIssueDAO replyIssueDAO;

	public ReplyIssueService(ReplyIssueDAO replyIssueDAO) {
		this.replyIssueDAO = replyIssueDAO;
	}
	
	// 댓글 갯수
	public int issueReplyListCnt(int reply_no) {
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
	public void updateReply(int reno, String content) {
		replyIssueDAO.updateReply(reno, content);
	}
	
	// 글 삭제
	public void deleteReply(int reno) {
		replyIssueDAO.deleteReply(reno);
	}
	
	
}
