package com.feb.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FebIndexDAO {

	private JdbcTemplate jdbcTemplate;
	
    @Autowired
    public FebIndexDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    // 전기사용량 뷰
    public double selectFebIndex_Elec_VO(String feb) {
        String query = "SELECT elec_using FROM feb_index_view_elec WHERE process_feb=?";
        Double val = jdbcTemplate.queryForObject(query, new Object[] {feb},	Double.class);
        // System.out.printf("#### FebIndexDAO.selectFebIndexVO(%s) : elec_using(%f)\n", feb, val);
        
        return val;
    }

    // 비용 뷰
    public double selectFebIndex_Cost_VO(String feb) {
        String query = "SELECT InDex_Cost FROM feb_index_view_cost WHERE process_feb=?";
        Double val = jdbcTemplate.queryForObject(query, new Object[] {feb},	Double.class);
        
        return val;
    }
}
