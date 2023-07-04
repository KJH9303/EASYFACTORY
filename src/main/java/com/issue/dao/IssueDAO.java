package com.issue.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

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
	
	/*
	// 로그인
	public MemberVO login(String id, String pw) {
		String SQL = "SELECT CODE, DEPARTMENT, ID, NAME, PHONE, EMAIL, PW, REPW FROM MEMBER WHERE UPPER(ID) = UPPER(?) AND PW = ?";
		MemberVO memberVO = jdbcTemplate.queryForObject(SQL, new Object[]{id, pw}, new signinMapper());
		return memberVO;
	}
	*/
	
	// 회원 정보 수정
	public void update(IssueVO issueVO) {
		String SQL = "UPDATE MEMBER"
				+ "		SET"
				+ "			TITLE = ?"
				+ ", 		CONTENT = ?"
				+ ", 		AUTHOR = ?"
				+ ", 		MODDATE = SYSDATE"
				+ "		WHERE"
				+ "			NO = ?";
		jdbcTemplate.update (
				SQL
				, issueVO.getNo()
				, issueVO.getTitle()
				, issueVO.getContent()
				, issueVO.getAuthor()
				, issueVO.getRegDate()
				, issueVO.getModDate());
	}
	
	// 회원 탈퇴
	public void delete(int no) {
		String SQL = "DELETE FROM ISSUE WHERE NO = ?";
		jdbcTemplate.update(SQL, no);
	}
}
