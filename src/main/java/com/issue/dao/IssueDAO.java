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
				+ "					*"
				+ "				FROM ISSUE"
				+ "		ORDER BY NO DESC) b) a"
				+ "		WHERE"
				+ "			rnum BETWEEN ? AND ?";
		int startPage = cri.getRowStart();
		int endPage = cri.getRowEnd();
		System.out.println("startPage : " + startPage + ", endPage : " + endPage);
		List<IssueVO> issueList = jdbcTemplate.query(SQL, new Object[]{startPage, endPage}, new issueMapper());
		return issueList;
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
				+ "				, to_char(sysdate,'yyyy-mm-dd'))";
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
