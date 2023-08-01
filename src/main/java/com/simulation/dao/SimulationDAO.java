package com.simulation.dao;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SimulationDAO {
	
    public Object updateTable;
	private JdbcTemplate jdbcTemplate;
	
    public SimulationDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    } 
	
    // 전기사용량 가져오기
    public double simulation_Elec_VO(String feb) {
        String SQL = "SELECT elec_using FROM feb_index_view_elec WHERE process_feb=?";
        Double val = jdbcTemplate.queryForObject(SQL, new Object[] {feb},	Double.class);
        
        return val;
    }

    // 비용 가져오기
    public double simulation_Cost_VO(String feb) {
        String SQL = "SELECT InDex_Cost FROM feb_index_view_cost WHERE process_feb=?";
        Double val = jdbcTemplate.queryForObject(SQL, new Object[] {feb},	Double.class);
        
        return val;
    }
}
