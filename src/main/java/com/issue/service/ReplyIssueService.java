package com.issue.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.issue.dao.ReplyIssueDAO;
import com.issue.vo.ReplyIssueVO;

@Service
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
	
	// 댓글 목록
	public List<ReplyIssueVO> getReplyList(int no) {
		List<ReplyIssueVO> replyList = replyIssueDAO.getReplyList(no);
		return replyList;
	}
	
	// 댓글 작성
	public void writeReply(int no, String content, String author) {
		replyIssueDAO.writeReply(no, content, author);
	}
	
	// 댓글 수정
	public void updateReply(int reno, String content) {
		replyIssueDAO.updateReply(reno, content);
	}
	
	// 댓글 삭제
	public void deleteReply(int reno) {
		replyIssueDAO.deleteReply(reno);
	}
	
	public void deleteAllReply(int no) {
		replyIssueDAO.deleteAllReply(no);
	}
	
}
