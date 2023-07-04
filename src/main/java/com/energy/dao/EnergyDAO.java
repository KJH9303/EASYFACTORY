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
    public List<EnergyVO> getMonthlyCosts(String startDate) {
        String sql = "WITH "
                + "  date_input AS ("
                + "    SELECT TO_DATE('" + startDate + "', 'YYYY-MM-DD') AS input_date FROM DUAL "
                + "  ),"
                + "  month_range AS ("
                + "    SELECT EXTRACT(MONTH FROM ADD_MONTHS(input_date, LEVEL - 1)) AS mth "
                + "    FROM date_input, DUAL "
                + "    CONNECT BY LEVEL <= 12 - EXTRACT(MONTH FROM (SELECT input_date FROM date_input)) + 1 "
                + "  ), "
                + "  monthly_sum AS ("
                + "    SELECT"
                + "      EXTRACT(MONTH FROM HIREDATE) AS \"MONTH\","
                + "      SUM(SUM_COSTS) AS \"MONTH_COST\" "
                + "    FROM ("
                + "      SELECT HIREDATE, SUM_COSTS "
                + "      FROM FEB_DSUM, date_input "
                + "      WHERE TRUNC(HIREDATE, 'MONTH') >= TRUNC(input_date, 'MONTH') "
                + "        AND TRUNC(HIREDATE, 'MONTH') <= TRUNC(ADD_MONTHS(input_date, 12), 'YEAR') "
                + "    ) "
                + "    GROUP BY EXTRACT(YEAR FROM HIREDATE), EXTRACT(MONTH FROM HIREDATE) "
                + "  ) "
                + "SELECT "
                + "  LISTAGG(\"MONTH_COST\", ', ') WITHIN GROUP (ORDER BY mth) as monthly_costs "
                + "FROM   ("
                + "  SELECT mr.mth, NVL(ms.\"MONTH_COST\", 0) as \"MONTH_COST\" "
                + "  FROM month_range mr "
                + "  LEFT JOIN monthly_sum ms ON mr.mth = ms.\"MONTH\" "
                + ")";
        // ... 기존 코드를 유지하면서 ...
        
      

            List<EnergyVO> list = jdbcTemplate.query(sql,
                    new ResultSetExtractor<List<EnergyVO>>() {
                        public List<EnergyVO> extractData(ResultSet rs) throws SQLException, DataAccessException {
                            List<EnergyVO> list = new ArrayList<>();

                            if (rs.next()) {
                                String monthly_costs_str = rs.getString(1);
                                String[] monthly_costs = monthly_costs_str.split(", ");

                                for (int i = 0; i < monthly_costs.length; i++) {
                                    EnergyVO energyData = new EnergyVO();
                                    energyData.setMonth(i + 1);
                                    energyData.setMonthCosts(Integer.parseInt(monthly_costs[i]));
                                    list.add(energyData);
                                }
                            }
                            return list;
                        }
                    });

            return list;
        }
    }
       