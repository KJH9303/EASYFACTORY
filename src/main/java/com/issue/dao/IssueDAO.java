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
import com.issue.vo.IssueVO;

@Repository
public class IssueDAO {

	private JdbcTemplate jdbcTemplate;
	
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
        	issueVO.setProcess(rs.getString("process"));
        	issueVO.setNoticeYN(rs.getString("noticeYN"));
        	issueVO.setTitle(rs.getString("title"));
        	issueVO.setContent(rs.getString("content"));
        	issueVO.setAuthor(rs.getString("author"));
        	issueVO.setRegDate(rs.getString("regDate"));
        	issueVO.setModDate(rs.getString("modDate"));
        	issueVO.setViewCnt(rs.getInt("viewCnt"));
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
				+ "					, PROCESS"
				+ "					, NOTICEYN"
				+ "					, TITLE"
				+ "					, CONTENT"
				+ "					, AUTHOR"
				+ "					, TO_CHAR(REGDATE,'yyyy-MM-DD HH24:MI:SS') as regDate"
				+ "					, TO_CHAR(MODDATE,'yyyy-MM-DD HH24:MI:SS') as modDate"
				+ "					, VIEWCNT"
				+ "				FROM ISSUE"
				+ "		ORDER BY NOTICEYN DESC, NO DESC) b) a"
				+ "		WHERE"
				+ "			rnum BETWEEN ? AND ?";
		int startPage = cri.getRowStart();
		int endPage = cri.getRowEnd();
		List<IssueVO> issueList = jdbcTemplate.query(SQL, new Object[]{startPage, endPage}, new issueMapper());
		return issueList;
	}
	
	// 글 검색
	public List<IssueVO> search(String searchType, String keyword, String startDate, String endDate, String selectProcess, Criteria cri) {
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
	            + "					, PROCESS"
	            + "					, NOTICEYN"
	            + "					, TITLE"
	            + "					, CONTENT"
	            + "					, AUTHOR"
	            + "					, TO_CHAR(REGDATE,'yyyy-MM-DD HH24:MI:SS') as regDate"
	            + "					, TO_CHAR(MODDATE,'yyyy-MM-DD HH24:MI:SS') as modDate"
	            + "					, VIEWCNT"
	            + "				FROM ISSUE";

	    if (searchType.equals("regDate")) {
	        SQL += " WHERE REGDATE BETWEEN TO_DATE(?, 'yyyy-MM-DD') AND TO_DATE(?, 'yyyy-MM-DD') + 1 ";
	    } else if (searchType.equals("title") || searchType.equals("content") || searchType.equals("author")) {
	        SQL += " WHERE UPPER(" + searchType + ") LIKE UPPER(?) ";
	    } else if (searchType.equals("process")) {
	        SQL += " WHERE UPPER(" + searchType + ") LIKE UPPER(?) ";
	    }

	    SQL += " ORDER BY NOTICEYN DESC, NO DESC) b) a WHERE rnum BETWEEN ? AND ?";

	    List<IssueVO> searchIsList;
	    if (searchType.equals("regDate")) {
	        searchIsList = jdbcTemplate.query(SQL, new Object[]{startDate, endDate, startPage, endPage}, new issueMapper());
	    } else if (searchType.equals("title") || searchType.equals("content") || searchType.equals("author")) {
	        searchIsList = jdbcTemplate.query(SQL, new Object[]{"%" + keyword + "%", startPage, endPage}, new issueMapper());
	    } else if (searchType.equals("process")) {
	        searchIsList = jdbcTemplate.query(SQL, new Object[]{"%" + selectProcess + "%", startPage, endPage}, new issueMapper());
	    } else {
	        searchIsList = jdbcTemplate.query(SQL, new Object[]{startPage, endPage}, new issueMapper());
	    }

	    return searchIsList;
	}
	
	// 검색어가 일치하는 게시물 갯수
	public int issueSearchCnt(String searchType, String keyword, String startDate, String endDate, String selectProcess) {
		String SQL = "SELECT COUNT(*) FROM ISSUE WHERE NO > 0";
		if(searchType.equals("regDate")) {
			SQL += " and " + searchType + " BETWEEN TO_DATE('" + startDate + " 00:00:00','YYYY-MM-DD HH24:MI:SS') AND TO_DATE('" + endDate + " 23:59:59', 'YYYY-MM-DD HH24:MI:SS')";
		} else if(searchType.equals("title") || searchType.equals("content") || searchType.equals("author")) {
			SQL += " AND UPPER(" + searchType + ") LIKE UPPER('%" + keyword + "%')";
		} else if(searchType.equals("process")) {
			SQL += " AND UPPER(" + searchType + ") LIKE UPPER('%" + selectProcess + "%')";
		}
		
		int cnt = jdbcTemplate.queryForObject(SQL, Integer.class);
		return cnt;
	}
	
	// 글 보기
	public IssueVO viewContent(int no) {
		String SQL = "SELECT"
				+ "    		NO"
				+ "			, PROCESS"
				+ "			, NOTICEYN"
				+ "			, TITLE"
				+ "			, CONTENT"
				+ "			, AUTHOR"
				+ "			, REGDATE"
				+ "			, MODDATE"
				+ "			, VIEWCNT"
				+ "		FROM ISSUE"
				+ "		WHERE NO = ?";
		IssueVO issueVO = jdbcTemplate.queryForObject(SQL, new Object[]{no}, new issueMapper());
		return issueVO;
	}
	
	// 조회 수 증가
	public void viewCntUp(int no) {
		String SQL = "UPDATE ISSUE SET VIEWCNT = VIEWCNT + 1 WHERE NO = ?";
		jdbcTemplate.update(SQL, no);
	}
	
	// 글 작성
	public void write(String process, String noticeYN, String title, String content, String author) {
		String SQL = "INSERT INTO ISSUE ("
				+ "				NO"
				+ "				, PROCESS"
				+ "				, NOTICEYN"
				+ "				, TITLE"
				+ "				, CONTENT"
				+ "				, AUTHOR"
				+ "				, REGDATE )"
				+ "		VALUES ("
				+ "				ISSUE_SEQ.NEXTVAL"
				+ "				, ?"
				+ "				, ?"
				+ "				, ?"
				+ "				, ?"
				+ "				, ?"
				+ "				, sysdate)";
		jdbcTemplate.update(
				SQL
				, process
				, noticeYN
				, title
				, content
				, author);
	}
	
	// 글 수정
	public void update(String process, String noticeYN, String title, String content, String author, int no) {
		String SQL = "UPDATE ISSUE"
				+ "		SET"
				+ "			PROCESS = ?"
				+ ",		NOTICEYN = ?"
				+ ",		TITLE = ?"
				+ ", 		CONTENT = ?"
				+ ", 		AUTHOR = ?"
				+ ", 		MODDATE = SYSDATE"
				+ "		WHERE"
				+ "			NO = ?";
		jdbcTemplate.update (
				SQL
				, process, noticeYN, title, content, author, no);
	}
	
	// 글 삭제
	public void delete(int no) {
		String SQL = "DELETE FROM ISSUE WHERE NO = ?";
		jdbcTemplate.update(SQL, no);
	}
}
