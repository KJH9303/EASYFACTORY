package com.energy.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.energy.vo.EnergyVO;

public class EnergyDao {
    private JdbcTemplate jdbcTemplate;

    public EnergyDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    @RequestMapping(value = "/energy", method = RequestMethod.GET)
    public String energy() {
        return "energyData";
    }
  
    // 기존 코드

    public List<EnergyVO> getSelectDay(String startDate, String endDate) {
        /*String sql = "SELECT ROUND(AVG(opratio),2) AS average_opratio, SUM(costs) AS total_cost, ROUND(SUM(usingratio),2) AS total_usingratio " +
                     "FROM FEB_DSUM " +
                     "WHERE hiredate BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD')";*/
    	
    	String sql ="SELECT ROUND(AVG(avg_opratio), 2) AS average_opratio "+
    			    "FROM FEB_DSUM "+
    			    "WHERE hiredate BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD')";
    	
    
        return jdbcTemplate.query(sql, new Object[] {startDate, endDate}, new ResultSetExtractor<List<EnergyVO>>() {
            @Override
            public List<EnergyVO> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<EnergyVO> list = new ArrayList<EnergyVO>();
                while (rs.next()) {
                    EnergyVO energyData = new EnergyVO();
                    Date start = Date.valueOf(startDate);
                    Date end = Date.valueOf(endDate);
                    energyData.setStartDate(start);
                    energyData.setEndDate(end);
                    energyData.setOpratio(rs.getDouble("average_opratio"));
                    /*
                    energyData.setCosts(rs.getInt("total_cost"));
                    energyData.setUsingratio(rs.getDouble("total_usingratio"));
                    */
                    list.add(energyData);
                }
                return list;
            }
        });
    }
}