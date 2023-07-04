package com.energy.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.energy.vo.EnergyVO;

@Repository
public class EnergyDAO {
	
    private JdbcTemplate jdbcTemplate;

    public EnergyDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    // 가동률
    public List<EnergyVO> getOpratio(String startDate, String endDate) {
        String sql = "SELECT ROUND(AVG(avg_opratio), 2) AS avg_opratio "
                + "FROM FEB_DSUM "
                + "WHERE hiredate BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD')";

        List<EnergyVO> list = jdbcTemplate.query(sql, new Object[]{startDate, endDate}, new ResultSetExtractor<List<EnergyVO>>() {
            @Override
            public List<EnergyVO> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<EnergyVO> list = new ArrayList<EnergyVO>();
                while (rs.next()) {
                    EnergyVO energyData = new EnergyVO();
                    energyData.setOpratio(rs.getDouble("avg_opratio"));
                    list.add(energyData);
                }
                return list;
            }
        });

        return list;
    }
    
    // 온도
    public List<EnergyVO> getTemp(String startDate, String endDate) {
        String sql = "SELECT ROUND(AVG(AVG_TEMP), 0) AS AVG_TEMP "
                + "FROM FEB_DSUM "
                + "WHERE hiredate BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD')";

        List<EnergyVO> list = jdbcTemplate.query(sql, new Object[]{startDate, endDate}, new ResultSetExtractor<List<EnergyVO>>() {
            @Override
            public List<EnergyVO> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<EnergyVO> list = new ArrayList<EnergyVO>();
                while (rs.next()) {
                    EnergyVO energyData = new EnergyVO();
                    energyData.setTemp(rs.getInt("avg_temp"));
                    list.add(energyData);
                }
                return list;
            }
            
        });

        return list;
    }

    // 각 공정별 가동률
    public List<EnergyVO> getAllOpratio(String startDate, String endDate) {
        String sql = "SELECT  ROUND(AVG(feb1), 2) AS feb1,"
        		+ "        ROUND(AVG(feb2), 2) AS feb2,"
        		+ "        ROUND(AVG(feb3), 2) AS feb3,"
        		+ "        ROUND(AVG(feb4), 2) AS feb4,"
        		+ "        ROUND(AVG(feb5), 2) AS feb5,"
        		+ "        ROUND(AVG(feb6), 2) AS feb6,"
        		+ "        ROUND(AVG(feb7), 2) AS feb7,"
        		+ "        ROUND(AVG(feb8), 2) AS feb8 "
        		+ "FROM FEB_OPRATIO "
        		+ "WHERE hiredate BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD')";

        List<EnergyVO> list = jdbcTemplate.query(sql, new Object[]{startDate, endDate}, new ResultSetExtractor<List<EnergyVO>>() {
            @Override
            public List<EnergyVO> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<EnergyVO> list = new ArrayList<EnergyVO>();
                while (rs.next()) {
                    EnergyVO energyData = new EnergyVO();
                    double[] allopratios = new double[8];
                    for(int cnt=0; cnt < allopratios.length; cnt++) {
                    	allopratios[cnt] = rs.getDouble(cnt+1);
                    }
                 
                    energyData.setAllopratio(allopratios);
           
                    list.add(energyData);
                }
                return list;
            }
            
        });

        return list;
    }
}

       