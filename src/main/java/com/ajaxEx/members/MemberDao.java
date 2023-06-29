package com.ajaxEx.members;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class MemberDao {
	private JdbcTemplate jdbcTemplate;

	public MemberDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public boolean isMemberID(String id) {
		Integer count = jdbcTemplate.queryForObject("select count(*) from member where id = ?", new Object[] {id},	Integer.class);	
		return (count > 0) ? true : false;
	}
}
