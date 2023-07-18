package com.feb.dao;

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
import org.springframework.stereotype.Repository;

@Repository
public class FebDAO {
	
    public Object updateTable;
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	FebIndexDAO febIndexDAO;

    public FebDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

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

    // 랜덤불량생성
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
