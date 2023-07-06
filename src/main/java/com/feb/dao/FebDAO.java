package com.feb.dao;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.feb.vo.FebVO;

@Repository
public class FebDAO {
	
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public FebDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
/*
    public List<FebVO> getTableData(Date startDate, Date endDate) {
        // 여기에 쿼리를 작성하고, 데이터베이스에서 데이터를 가져오는 작업을 수행
        String SQL = "SELECT * FROM + your_table_name WHERE hiredate BETWEEN ? AND ?;";

        List<FebVO> resultList = jdbcTemplate.query(SQL, 
                                                        new Object[]{startDate, endDate}, 
                                                        new RowMapper<FebVO>() {
            @Override
            public FebVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                return new FebVO(
                    rs.getDouble("opratio"),
                    rs.getInt("temp"),
                    rs.getInt("tr"),
                    rs.getInt("fal"),
                    rs.getInt("stock"),
                    rs.getInt("costs"),
                    rs.getDouble("usingratio"),
                    rs.getDate("hiredate")
                );
            }
        });

        return resultList;
    }
*/    
    // Feb mapper
 	private static class FebMapper implements RowMapper<FebVO> {
         @Override
         public FebVO mapRow(ResultSet rs, int rowNum) throws SQLException {
        	 FebVO febVO = new FebVO();
        	 febVO.setOpratio(rs.getDouble("opratio"));
        	 febVO.setTemp(rs.getInt("temp"));
        	 febVO.setTr(rs.getInt("tr"));
        	 febVO.setFal(rs.getInt("fal"));
        	 febVO.setStock(rs.getInt("stock"));
        	 febVO.setCosts(rs.getInt("costs"));
        	 febVO.setUsingratio(rs.getDouble("usingratio"));
        	 febVO.setHiredate(rs.getDate("hiredate"));
             return febVO;
         }
    }
 	
    
// SelectDAO    
 	// 특정 테이블에서 데이터를 가져오는 메서드.
    public List<FebVO> getTableData(String feb) {
    	
    	String SQL = "SELECT * FROM " + feb;
    	List<FebVO> resultList = jdbcTemplate.query(SQL, new FebMapper());
    	ResultSet rs = (ResultSet) jdbcTemplate.query(SQL, new FebMapper());
    	JSONArray jsonArray = new JSONArray();
    	try {
	    	while (resultList != null) {
	            JSONObject row = new JSONObject();
	            row.put("opratio", rs.getDouble("opratio"));
	            row.put("temp", rs.getInt("temp"));
	            row.put("tr", rs.getInt("tr"));
	            row.put("fal", rs.getInt("fal"));
	            row.put("stock", rs.getInt("stock"));
	            row.put("costs", rs.getInt("costs"));
	            row.put("usingratio", rs.getDouble("usingratio"));
	            row.put("hiredate", rs.getDate("hiredate").toString());
	            jsonArray.add(row);
	            
	            
	            return (List<FebVO>) rs;
	    	}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return resultList;
    }
 	
    public JSONArray getTableData() {
        String query = "SELECT * FROM feb1";

        List<JSONObject> jsonList = jdbcTemplate.query(query, new RowMapper<JSONObject>() {
            @Override
            public JSONObject mapRow(ResultSet resultSet, int rowNum) throws SQLException {
                JSONObject row = new JSONObject();
                row.put("opratio", resultSet.getDouble("opratio"));
                row.put("temp", resultSet.getInt("temp"));
                row.put("tr", resultSet.getInt("tr"));
                row.put("fal", resultSet.getInt("fal"));
                row.put("stock", resultSet.getInt("stock"));
                row.put("costs", resultSet.getInt("costs"));
                row.put("usingratio", resultSet.getDouble("usingratio"));
                row.put("hiredate", resultSet.getDate("hiredate").toString());
                return row;
            }
        });

        JSONArray jsonArray = new JSONArray();
        jsonArray.addAll(jsonList);
        return jsonArray;
    }
    
// Author : kj9303
 	// Feb 데이터 가져오기
 	public List<FebVO> getDatePickerData(Date startDate, Date endDate) {
 		String SQL = "SELECT * FROM + your_table_name WHERE hiredate BETWEEN ? AND ?";
 		List<FebVO> datepickerList = jdbcTemplate.query(SQL, new Object[]{startDate, endDate}, new FebMapper());
 		return datepickerList;
 	}
// Author : kj9303
 	
// insertDAO
 	public void insertTable(String tableName) {
        Random random = new Random();

        LocalDateTime dateTime = LocalDateTime.of(2023, 1, 1, 0, 0, 0);
        for (int i = 0; i < 365; i++) {
            double opratio = Math.round((70 + random.nextDouble() * (100 - 70)) * 100.0) / 100.0;
            int temp = random.nextInt(15) + 1;
            int tr = random.nextInt(10000) + 1;
            int fal = random.nextInt(100) + 1;
            int stock = random.nextInt(1000) + 1;
            int costs = random.nextInt(1000) + 1;
            double usingratio = Math.round(random.nextDouble() * 100 * 100.0) / 100.0;

            temp = Math.max(0, Math.min(15, temp));

            LocalDateTime currentDateTime = dateTime.plusDays(i);
            java.sql.Date currentDate = java.sql.Date.valueOf(currentDateTime.toLocalDate());

            try {
                String SQL = "INSERT INTO " + tableName + " (opratio, temp, tr, fal, stock, costs, usingratio, hiredate) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                int result = jdbcTemplate.update(SQL, opratio, temp, tr, fal, stock, costs, usingratio, currentDate);
                
                System.out.println("[" + tableName.toUpperCase() + " 테이블의 INSERT 작업이 완료되었습니다.]");

            } catch (Exception e) {
                e.printStackTrace();
                System.out.println(">>> 날짜 " + currentDate + " INSERT 작업 중 예외가 발생하였습니다: " + e.getMessage());
            }
        }
    }
 	
    public void updateTable(String tableName) {
        Random random = new Random();

        // 2023년 1월 1일부터 365일간의 데이터를 생성.
        LocalDateTime dateTime = LocalDateTime.of(2023, 1, 1, 0, 0, 0);
        for (int i = 0; i < 365; i++) {

            // 랜덤한 값을 생성.
            double opratio = Math.round((70 + random.nextDouble() * (100 - 70)) * 100.0) / 100.0;
            int temp = random.nextInt(15) + 1;
            int tr = random.nextInt(10000) + 1;
            int fal = random.nextInt(100) + 1;
            int stock = random.nextInt(1000) + 1;
            int costs = random.nextInt(1000) + 1;
            double usingratio = Math.round(random.nextDouble() * 100 * 100.0) / 100.0;

            // 온도 값이 0 미만일 경우 0으로, 15 초과할 경우 15로 맞춰줌.
            temp = Math.max(0, Math.min(15, temp));

            LocalDateTime currentDateTime = dateTime.plusDays(i);
            java.sql.Date currentDate = java.sql.Date.valueOf(currentDateTime.toLocalDate());

            try {
                String SQL = "UPDATE " + tableName + " SET opratio = ?, temp = ?, tr = ?, fal = ?, stock = ?, costs = ?, usingratio = ? WHERE hiredate = ?";
                int result = jdbcTemplate.update(SQL, opratio, temp, tr, fal, stock, costs, usingratio, currentDate);

                System.out.println("[" + tableName.toUpperCase() + " 테이블의 업데이트 작업이 완료되었습니다.]");

            } catch (Exception e) {
                e.printStackTrace();
                System.out.println(">>> 날짜 " + currentDate + " 업데이트 작업 중 예외가 발생하였습니다: " + e.getMessage());
            }
        }
    }
// insertDAO    
 
// 임시 (추후 삭제예정)
// MonthDataDao
    public void printMonthlyAvgOperationalRate() {
        String sql = "SELECT EXTRACT(MONTH FROM hiredate) AS \"월\", AVG(opratio) AS \"가동률 평균\" FROM feb1 GROUP BY EXTRACT(MONTH FROM hiredate) ORDER BY EXTRACT(MONTH FROM hiredate)";
        List<Map<String, Object>> resultList = jdbcTemplate.queryForList(sql);
        DecimalFormat decimalFormat = new DecimalFormat("0.00");

        for (Map<String, Object> row : resultList) {
        	BigDecimal avgOpratio = (BigDecimal) row.get("가동률 평균");
            System.out.println("월: " + row.get("월") + ", 가동률 평균: " + decimalFormat.format(avgOpratio));
        }
    }

    public void printYearlyAvgTemperature() {
        String sql = "SELECT TO_CHAR(hiredate, 'YYYY') AS \"당해\", AVG(TEMP) AS \"온도 평균\" FROM feb1 GROUP BY TO_CHAR(hiredate, 'YYYY')";
        List<Map<String, Object>> resultList = jdbcTemplate.queryForList(sql);
        DecimalFormat decimalFormat = new DecimalFormat("0.00");
        
        for (Map<String, Object> row : resultList) {
            BigDecimal avgTemp = (BigDecimal) row.get("온도 평균");
            System.out.println("당해: " + row.get("당해") + ", 온도 평균: " + decimalFormat.format(avgTemp));
        }
    }

    public void printMonthlyElectricityUsage() {
        String sql = "SELECT EXTRACT(MONTH FROM hiredate) AS \"월\", SUM(usingratio) AS \"월별 전기사용량\" FROM feb1 GROUP BY EXTRACT(MONTH FROM HIREDATE) ORDER BY EXTRACT(MONTH FROM HIREDATE)";
        List<Map<String, Object>> resultList = jdbcTemplate.queryForList(sql);

        for (Map<String, Object> row : resultList) {
            System.out.println("월: " + row.get("월") + ", 월별 전기사용량: " + row.get("월별 전기사용량"));
        }
    }

	public static String getRandomDefect() {
		while (true) {
		    LocalDate nowdate = LocalDate.now();
		    LocalTime nowtime = LocalTime.now();
	
		    int num = (int)(Math.random()*8) +1;
		    String result = "";
		    
		    if (num == 1) {
		        result = "Wafer에 결함이 발생했습니다." + nowdate + " " + nowtime;
		    } else if (num == 2) {
		        result = "Pattern이 손상 되었습니다." + nowdate + " " + nowtime;
		    } else if (num == 3) {
		        result = "공정이 무너졌습니다." + nowdate + " " + nowtime;
		    } else if (num == 4) {
		        result = "particle불량 입니다." + nowdate + " " + nowtime;
		    } else if (num == 5) {
		        result = "Crack이 발생했습니다." + nowdate + " " + nowtime;
		    } else if (num == 6) {
		        result = "Parameter 뒤틀림이 발생했습니다." + nowdate + " " + nowtime;    
		    } else {
		        result = "공정불량 입니다." + nowdate + " " + nowtime;
		    }
		    System.out.println("●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●● Defect 작동 ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●");
		    System.out.println("●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●Random defect: " + result); 
		    
		    return result;
		}
	}
}
