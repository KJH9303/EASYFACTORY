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

import com.energy.vo.StockVO;

@Repository
public class StockDAO {
	
    private JdbcTemplate jdbcTemplate;

    public StockDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
 //-----------------------------------------------------------------------------------------------------------------
 // 재고량
    public List<StockVO> getStock(String startDate, String endDate) {
        String sql = "SELECT ROUND(sum(sum_stock), 2) AS sum_stock "
                + "FROM FEB_DSUM "
                + "WHERE hiredate BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD')";

        List<StockVO> list = jdbcTemplate.query(sql, new Object[]{startDate, endDate}, new ResultSetExtractor<List<StockVO>>() {
            @Override
            public List<StockVO> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<StockVO> list = new ArrayList<StockVO>();
                while (rs.next()) {
                    StockVO energyData = new StockVO();
                    energyData.setStock(rs.getInt("sum_stock"));
                    list.add(energyData);
                }
                return list;
            }
        });

        return list;
    }
    
    // 불량
    public List<StockVO> getFal(String startDate, String endDate) {
        String sql = "SELECT ROUND(SUM(SUM_FAL), 2) AS SUM_FAL "
                + "FROM FEB_DSUM "
                + "WHERE hiredate BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD')";

        List<StockVO> list = jdbcTemplate.query(sql, new Object[]{startDate, endDate}, new ResultSetExtractor<List<StockVO>>() {
            @Override
            public List<StockVO> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<StockVO> list = new ArrayList<StockVO>();
                while (rs.next()) {
                    StockVO energyData = new StockVO();
                    energyData.setFal(rs.getInt("SUM_FAL"));
                    list.add(energyData);
                }
                return list;
            }
        });

        return list;
    }
    
    // 각 공정별 재고량
    public List<StockVO> getFebstock(String startDate, String endDate) {
        String sql = "SELECT  ROUND(SUM(feb1), 2) AS feb1,"
        		+ "        ROUND(SUM(feb2), 2) AS feb2,"
        		+ "        ROUND(SUM(feb3), 2) AS feb3,"
        		+ "        ROUND(SUM(feb4), 2) AS feb4,"
        		+ "        ROUND(SUM(feb5), 2) AS feb5,"
        		+ "        ROUND(SUM(feb6), 2) AS feb6,"
        		+ "        ROUND(SUM(feb7), 2) AS feb7,"
        		+ "        ROUND(SUM(feb8), 2) AS feb8 "
        		+ "FROM FEB_STOCK "
        		+ "WHERE hiredate BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD')";

        List<StockVO> list = jdbcTemplate.query(sql, new Object[]{startDate, endDate}, new ResultSetExtractor<List<StockVO>>() {
            @Override
            public List<StockVO> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<StockVO> list = new ArrayList<StockVO>();
                while (rs.next()) {
                    StockVO energyData = new StockVO();
                    int[] febstocks = new int[8];
                    for(int cnt1=0; cnt1 < febstocks.length; cnt1++) {
                    	febstocks[cnt1] = rs.getInt(cnt1+1);
                    }
                 
                    energyData.setFebstock(febstocks);
           
                    list.add(energyData);
                }
                return list;
            }
            
        });

        return list;
    }
    // 각 공정별 불량
    public List<StockVO> getFebfal(String startDate, String endDate) {
        String sql = "SELECT  ROUND(SUM(feb1), 2) AS feb1,"
        		+ "        ROUND(SUM(feb2), 2) AS feb2,"
        		+ "        ROUND(SUM(feb3), 2) AS feb3,"
        		+ "        ROUND(SUM(feb4), 2) AS feb4,"
        		+ "        ROUND(SUM(feb5), 2) AS feb5,"
        		+ "        ROUND(SUM(feb6), 2) AS feb6,"
        		+ "        ROUND(SUM(feb7), 2) AS feb7,"
        		+ "        ROUND(SUM(feb8), 2) AS feb8 "
        		+ "FROM FEB_FAL "
        		+ "WHERE hiredate BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD')";

        List<StockVO> list = jdbcTemplate.query(sql, new Object[]{startDate, endDate}, new ResultSetExtractor<List<StockVO>>() {
            @Override
            public List<StockVO> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<StockVO> list = new ArrayList<StockVO>();
                while (rs.next()) {
                    StockVO energyData = new StockVO();
                    int[] febfals = new int[8];
                    for(int cnt1=0; cnt1 < febfals.length; cnt1++) {
                    	febfals[cnt1] = rs.getInt(cnt1+1);
                    }
                 
                    energyData.setFebfal(febfals);
           
                    list.add(energyData);
                }
                return list;
            }
            
        });

        return list;
    }

}	
	

       