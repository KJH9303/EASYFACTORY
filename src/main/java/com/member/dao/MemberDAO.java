package com.member.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.member.vo.MemberVO;

@Repository
public class MemberDAO {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public MemberDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	// ID 중복체크
	public boolean loginCheck(String id, String pw) {
		String SQL = "SELECT COUNT(*)"
				+ "		FROM MEMBER"
				+ "		WHERE UPPER(ID) = UPPER(?) AND PW = ?";
		Integer count = jdbcTemplate.queryForObject (SQL, new Object[] {id, pw}, Integer.class);
		return (count == 1) ? true : false;
	}
		
	// 회원가입
	public void signUp(MemberVO memberVO) {
		String SQL = "INSERT INTO MEMBER ("
				+ "			code"
				+ "			, department"
				+ "			, id"
				+ "			, name"
				+ "			, phone"
				+ "			, email"
				+ "			, pw"
				+ "			, repw )"
				+ "	  VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update (
				SQL
				, memberVO.getCode()
				, memberVO.getDepartment()
				, memberVO.getId()
				, memberVO.getName()
				, memberVO.getPhone()
				, memberVO.getEmail()
				, memberVO.getPw()
				, memberVO.getRepw());
	}
	
	// id, 비밀번호 체크 Ajax
	public boolean checkDuplicateId(String id) {
		Integer count = jdbcTemplate.queryForObject (
				"  SELECT COUNT(*)"
				+ " 	FROM MEMBER "
				+ "WHERE UPPER(ID) = UPPER(?)"
				, new Object[] {id}, Integer.class);
		return (count > 0) ? true : false;
	}
	
	// 로그인 mapper
	private static class signinMapper implements RowMapper<MemberVO> {
        @Override
        public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
        	MemberVO memberVO = new MemberVO();
        	memberVO.setCode(rs.getString("code"));
        	memberVO.setDepartment(rs.getString("department"));
        	memberVO.setId(rs.getString("id"));
        	memberVO.setName(rs.getString("name"));
        	memberVO.setPhone(rs.getString("phone"));
        	memberVO.setEmail(rs.getString("email"));
            // 필요한 다른 사용자 정보를 설정합니다.
            return memberVO;
        }
    }
	
	// 로그인
	public MemberVO login(String id, String pw) {
		String SQL = "SELECT CODE, DEPARTMENT, ID, NAME, PHONE, EMAIL, PW, REPW FROM MEMBER WHERE UPPER(ID) = UPPER(?) AND PW = ?";
		MemberVO memberVO = jdbcTemplate.queryForObject(SQL, new Object[]{id, pw}, new signinMapper());
		return memberVO;
	}
	
	// 회원 정보 수정
	public void update(MemberVO memberVO) {
		String SQL = "UPDATE MEMBER"
				+ "		SET"
				+ "			CODE = ?"
				+ ", 		DEPARTMENT = ?"
				+ ", 		NAME = ?"
				+ ", 		PHONE = ?"
				+ ", 		EMAIL = ?"
				+ ", 		PW = ?"
				+ ", 		REPW = ?"
				+ "		WHERE"
				+ "			ID = ?";
		jdbcTemplate.update (
				SQL
				, memberVO.getCode()
				, memberVO.getDepartment()
				, memberVO.getName()
				, memberVO.getPhone()
				, memberVO.getEmail()
				, memberVO.getPw()
				, memberVO.getRepw()
				, memberVO.getId());
	}
	
	// 회원 탈퇴
	public void delete(String id) {
		String SQL = "DELETE FROM MEMBER WHERE ID = ?";
		jdbcTemplate.update(SQL, id);
	}
}
