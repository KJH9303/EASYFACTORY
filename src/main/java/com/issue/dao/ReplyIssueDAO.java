package com.issue.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.issue.vo.Criteria;
import com.issue.vo.ReplyIssueVO;
import com.issue.vo.IssueVO;

@Repository
public class ReplyIssueDAO {

	private JdbcTemplate jdbcTemplate;
	/*
	private String[] search = new String[] {
		"where title like '% || %s || %",
		
	};
	
	HashMap<String, String> wheres = new HashMap<>() {
	}
	
	final static String where = "title like '% || %s || %";

	String makeWhere(String searchType, String keyword) {
		String sql = null;
		
		switch(searchType) {
		case "title":
			sql = String.format(where, keyword[0]);
		}
		
		return sql;
	}*/
	
	@Autowired
	public ReplyIssueDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	// 이슈게시판 댓글 mapper
	private static class issueReMapper implements RowMapper<ReplyIssueVO> {
        @Override
        public ReplyIssueVO mapRow(ResultSet rs, int rowNum) throws SQLException {
        	ReplyIssueVO replyIssueVO = new ReplyIssueVO();
        	replyIssueVO.setNo(rs.getInt("no"));
        	replyIssueVO.setReno(rs.getInt("reno"));
        	replyIssueVO.setContent(rs.getString("content"));
        	replyIssueVO.setAuthor(rs.getString("author"));
        	replyIssueVO.setRegDate(rs.getString("regDate"));
        	replyIssueVO.setModDate(rs.getString("modDate"));
            return replyIssueVO;
        }
    }
	
	// 댓글 갯수
	public int issueReplyListCnt(int reply_no) {
		String SQL = "SELECT COUNT(NO) FROM ISSUE_RE WHERE NO = " + reply_no + " AND RENO > 0";
		int cnt = jdbcTemplate.queryForObject(SQL, Integer.class);
		return cnt;
	}
	
	// 댓글 목록
	public List<ReplyIssueVO> getReplyList(int no) {
		String SQL = "SELECT"
				+ "			NO"
				+ "			, ReNO"
				+ "			, CONTENT"
				+ "			, AUTHOR"
				+ "			, TO_DATE(TO_CHAR(REGDATE,'yyyy-MM-DD HH24:MI:SS'), 'yyyy-MM-DD HH24:MI:SS') as REGDATE"
				+ "			, TO_DATE(TO_CHAR(MODDATE,'yyyy-MM-DD HH24:MI:SS'), 'yyyy-MM-DD HH24:MI:SS') as MODDATE"
				+ "	  FROM"
				+ "			ISSUE_RE"
				+ "	  WHERE"
				+ "			NO = ?";
		
		List<ReplyIssueVO> replyList = jdbcTemplate.query(SQL, new Object[]{no}, new issueReMapper());
		return replyList;
	}
	
	// 댓글 작성
	public void writeReply(int no, String content, String author) {
		String SQL = "INSERT INTO ISSUE_RE ("
				+ "				NO"
				+ "				, RENO"
				+ "				, CONTENT"
				+ "				, AUTHOR"
				+ "				, REGDATE )"
				+ "		VALUES ("
				+ "				?"
				+ "				, ISSUE_RE_SEQ.NEXTVAL"
				+ "				, ?"
				+ "				, ?"
				+ "				, sysdate)";
		jdbcTemplate.update(
				SQL
				, no, content, author);
	}
	
	// 댓글 수정
	public void updateReply(ReplyIssueVO replyIssueVO) {
		String SQL = "UPDATE ISSUE_RE"
				+ "		SET"
				+ ", 		CONTENT = ?"
				+ ", 		AUTHOR = ?"
				+ ", 		MODDATE = SYSDATE"
				+ "		WHERE"
				+ "			NO = ? AND RENO = ?";
		jdbcTemplate.update (
				SQL
				, replyIssueVO.getContent()
				, replyIssueVO.getAuthor()
				, replyIssueVO.getNo()
				, replyIssueVO.getReno());
	}
	
	// 댓글 삭제
	public void deleteReply(int reno) {
		String SQL = "DELETE FROM ISSUE WHERE NO = ?";
		jdbcTemplate.update(SQL, reno);
	}
}
