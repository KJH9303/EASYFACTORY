package com.feb.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.HashMap;
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

 	/* Select    
    public JSONArray selectData() {
        String query = "SELECT * FROM feb1";
        return jdbcTemplate.query(query, rs -> {
            JSONArray jsonArray = new JSONArray();
            while (rs.next()) {
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
            }
            return jsonArray;
        });
    }
    */
    
 	// Select    
    public JSONArray selectDataHiredate(String tableName, String startDate, String endDate) {
    	final HashMap<String, String> tables = new HashMap<>();
    	tables.put("feb1", "SELECT * FROM feb1 WHERE hiredate BETWEEN ? AND ?");
    	tables.put("feb2", "SELECT * FROM feb2 WHERE hiredate BETWEEN ? AND ?");
    	tables.put("feb3", "SELECT * FROM feb3 WHERE hiredate BETWEEN ? AND ?");
    	tables.put("feb4", "SELECT * FROM feb4 WHERE hiredate BETWEEN ? AND ?");
    	tables.put("feb5", "SELECT * FROM feb5 WHERE hiredate BETWEEN ? AND ?");
    	tables.put("feb6", "SELECT * FROM feb6 WHERE hiredate BETWEEN ? AND ?");
    	tables.put("feb7", "SELECT * FROM feb7 WHERE hiredate BETWEEN ? AND ?");
    	tables.put("feb8", "SELECT * FROM feb8 WHERE hiredate BETWEEN ? AND ?");
    	
    	String sql = tables.get(tableName);
    	if(sql == null) {
    		System.out.println("해당하는 테이블이 없습니다. table=" + tableName);
    		return null;
    	}
    	
    	System.out.println("[selectDataHiredate]");
    	System.out.println("       - sql : " + sql);
    	System.out.println(" - tableName : " + tableName);
    	System.out.println(" - startDate : " + startDate);
    	System.out.println(" -   endDate : " + endDate);

    	
        return jdbcTemplate.query(sql, new Object[]{startDate, endDate}, rs -> {
            JSONArray jsonArray = new JSONArray();
            while (rs.next()) {
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
            }
            return jsonArray;
        });
    }

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
                String SQL = "UPDATE " + tableName + " SET opratio = ?, temp = ?, tr = ?, fal = ?, stock = ?, costs = ?, usingratio = ? WHERE hiredate = ?";
                int result = jdbcTemplate.update(SQL, opratio, temp, tr, fal, stock, costs, usingratio, currentDate);

                System.out.println("[" + tableName.toUpperCase() + " 테이블의 업데이트 작업이 완료되었습니다.]");

            } catch (Exception e) {
                e.printStackTrace();
                System.out.println(">>> 날짜 " + currentDate + " 업데이트 작업 중 예외가 발생하였습니다: " + e.getMessage());
            }
        }
    }

	public static String getRandomDefect() {
		while (true) {
		    LocalDate nowdate = LocalDate.now();
		    LocalTime nowtime = LocalTime.now();
	
		    int num = (int)(Math.random()*8) +1;
		    String result = "";
		    
		    if (num == 1) {
		        result = "Wafer 결함 발생.　　" + " " + nowdate + " " + nowtime;
		    } else if (num == 2) {
		        result = "Pattern  손상.　　　" + " " + nowdate + " " + nowtime;
		    } else if (num == 3) {
		        result = "공정 무너짐.　　　　" + " " + nowdate + " " + nowtime;
		    } else if (num == 4) {
		        result = "particle 불량.　　　" + " " + nowdate + " " + nowtime;
		    } else if (num == 5) {
		        result = "Crack  발생.　　　　" + " " + nowdate + " " + nowtime;
		    } else if (num == 6) {
		        result = "Parameter  뒤틀림.　" + " " + nowdate + " " + nowtime;    
		    } else {
		        result = "공정불량.　　　　　" + " "  + nowdate + " " + nowtime;
		    }
		    System.out.println("●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●● Defect 작동 ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●");
		    System.out.println("●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●Random defect: " + result); 
		    
		    return result;
		}
	}
}
