package com.issue.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.issue.vo.Criteria;
import com.issue.vo.IssueVO;

@Repository
public class IssueDAO {

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
	public IssueDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	// 이슈게시판 테이블 mapper
	private static class issueMapper implements RowMapper<IssueVO> {
        @Override
        public IssueVO mapRow(ResultSet rs, int rowNum) throws SQLException {
        	IssueVO issueVO = new IssueVO();
        	issueVO.setNo(rs.getInt("no"));
        	issueVO.setTitle(rs.getString("title"));
        	issueVO.setContent(rs.getString("content"));
        	issueVO.setAuthor(rs.getString("author"));
        	issueVO.setRegDate(rs.getDate("regDate"));
        	issueVO.setModDate(rs.getDate("modDate"));
            // 필요한 다른 사용자 정보를 설정합니다.
            return issueVO;
        }
    }
	
	// 게시글 갯수
	public int issueListCnt() {
		String SQL = "SELECT COUNT(NO) FROM ISSUE WHERE NO > 0";
		int cnt = jdbcTemplate.queryForObject(SQL, Integer.class);
		return cnt;
	}
	
	// 게시판 목록
	public List<IssueVO> issueList(Criteria cri) {
		String SQL = "SELECT "
				+ "			ROWNUM"
				+ "			, a.*"
				+ "		FROM ("
				+ "			SELECT"
				+ "			ROWNUM rnum"
				+ "			, b.*"
				+ "		FROM ("
				+ "				SELECT"
				+ "					NO"
				+ "					, TITLE"
				+ "				 	, CONTENT"
				+ "					, AUTHOR"
				+ "					, TO_CHAR(REGDATE,'yyyy-MM-DD HH24:MI:SS') as REGDATE"
				+ "					, TO_CHAR(MODDATE,'yyyy-MM-DD HH24:MI:SS') as MODDATE"
				+ "				FROM ISSUE"
				+ "		ORDER BY NO DESC) b) a"
				+ "		WHERE"
				+ "			rnum BETWEEN ? AND ?";
		int startPage = cri.getRowStart();
		int endPage = cri.getRowEnd();
		List<IssueVO> issueList = jdbcTemplate.query(SQL, new Object[]{startPage, endPage}, new issueMapper());
		return issueList;
	}
	
	// 글 검색
	public List<IssueVO> search(String searchType, String keyword, String startDate, String endDate, Criteria cri) {
		int startPage = cri.getRowStart();
		int endPage = cri.getRowEnd();
		
		String SQL = "SELECT "
				+ "			ROWNUM"
				+ "			, a.*"
				+ "		FROM ("
				+ "			SELECT"
				+ "			ROWNUM rnum"
				+ "			, b.*"
				+ "		FROM ("
				+ "				SELECT"
				+ "					NO"
				+ "            		, TITLE"
				+ "            		, CONTENT"
				+ "            		, AUTHOR"
				+ "            		, TO_CHAR(REGDATE,'yyyy-MM-DD HH24:MI:SS') as REGDATE"
				+ "            		, TO_CHAR(MODDATE,'yyyy-MM-DD HH24:MI:SS') as MODDATE"
				+ "				FROM ISSUE"
				+ "		ORDER BY NO DESC) b) a"
				+ "		WHERE"
				+ "			rnum BETWEEN ? AND ?";
		if(searchType.equals("regDate")) {
			//SQL += " AND " + searchType + " BETWEEN TO_DATE('" + startDate + "', 'YYYY/MM/DD') AND TO_DATE('" + endDate + "', 'YYYY/MM/DD')";
			SQL += " AND " + searchType + " BETWEEN '" + startDate + "'|| ' 00:00:00' AND '" + endDate + "' || ' 23:59:59'";
			//AND REGDATE BETWEEN '2023-07-10' || ' 00:00:00' AND '2023-07-10' || ' 23:59:59';
		} else if(searchType.equals("title") || searchType.equals("content") || searchType.equals("author")) {
			SQL += " AND UPPER(" + searchType + ") LIKE UPPER('%" + keyword + "%')";
		} 
		List<IssueVO> searchIsList = jdbcTemplate.query(SQL, new Object[]{startPage, endPage}, new issueMapper());
		return searchIsList;
	}
	
	// 검색어가 일치하는 게시물 갯수
	public int issueSearchCnt(String searchType, String keyword, String startDate, String endDate) {
		String SQL = "SELECT COUNT(NO) FROM ISSUE WHERE NO > 0";
		if(searchType.equals("regDate")) {
			SQL += " AND " + searchType + " BETWEEN TO_DATE('" + startDate + "', 'YYYY/MM/DD') AND TO_DATE('" + endDate + "', 'YYYY/MM/DD')";
		} else if(searchType.equals("title") || searchType.equals("content") || searchType.equals("author")) {
			SQL += " AND UPPER(" + searchType + ") LIKE UPPER('%" + keyword + "%')";
		}
		
		int cnt = jdbcTemplate.queryForObject(SQL, Integer.class);
		return cnt;
	}
	
	// 글 보기
	public IssueVO viewContent(int no) {
		String SQL = "SELECT"
				+ "    		NO"
				+ "			, TITLE"
				+ "			, CONTENT"
				+ "			, AUTHOR"
				+ "			, REGDATE"
				+ "			, MODDATE"
				+ "		FROM ISSUE"
				+ "		WHERE NO = ?";
		IssueVO issueVO = jdbcTemplate.queryForObject(SQL, new Object[]{no}, new issueMapper());
		return issueVO;
	}
	
	// 글 작성
	public void write(IssueVO issueVO) {
		String SQL = "INSERT INTO ISSUE ("
				+ "				NO"
				+ "				, TITLE"
				+ "				, CONTENT"
				+ "				, AUTHOR"
				+ "				, REGDATE )"
				+ "		VALUES ("
				+ "				ISSUE_SEQ.NEXTVAL"
				+ "				, ?"
				+ "				, ?"
				+ "				, ?"
				+ "				, sysdate)";
		jdbcTemplate.update(
				SQL
				, issueVO.getTitle()
				, issueVO.getContent()
				, issueVO.getAuthor());
	}
	
	// 글 수정
	public void update(IssueVO issueVO) {
		String SQL = "UPDATE ISSUE"
				+ "		SET"
				+ "			TITLE = ?"
				+ ", 		CONTENT = ?"
				+ ", 		AUTHOR = ?"
				+ ", 		MODDATE = SYSDATE"
				+ "		WHERE"
				+ "			NO = ?";
		jdbcTemplate.update (
				SQL
				, issueVO.getTitle()
				, issueVO.getContent()
				, issueVO.getAuthor()
				, issueVO.getNo());
	}
	
	// 글 삭제
	public void delete(int no) {
		String SQL = "DELETE FROM ISSUE WHERE NO = ?";
		jdbcTemplate.update(SQL, no);
	}
}
