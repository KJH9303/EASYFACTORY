package com.member.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.member.vo.TestVO;

public class TestDAO {

       private JdbcTemplate jdbcTemplate;

       public TestDAO(DataSource dataSource) {
          this.jdbcTemplate = new JdbcTemplate(dataSource);
          System.out.println("[MemberDao] " + this.toString());
       }

       private static DateTimeFormatter formatter = 
   			DateTimeFormatter.ofPattern("MMddHHmmss");
       
       private RowMapper<TestVO> memRowMapper = new RowMapper<TestVO>() {
   		@Override
   		public TestVO mapRow(ResultSet rs, int rowNum) throws SQLException {
   			String prefix = formatter.format(LocalDateTime.now());

   			Date date = new Date("Sat Dec 01 00:00:00 GMT 2012");
   			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");   // yyyy-MM-dd HH:mm:ss
   			String format = formatter.format(date);
   			System.out.println(format);
   			
   			TestVO testVO = new TestVO (
   					rs.getDouble("opratio")
   					, rs.getInt("temp")
   					, rs.getInt("tr")
   					, rs.getInt("fal")
   					, rs.getInt("stock")
   					, rs.getInt("costs")
   					, rs.getDouble("usingratio")
   					, rs.getDate("hiredate"));
   			System.out.println("■■■■■■■■■■■■■■ MemberDAO : RowMapper ■■■■■■■■■■■■■■");
   			return testVO;
   		}
   	};

    public void insertIntofeb1(int hiredate) {
    	
    	double opratio = Math.round((70 + Math.random() * (100 - 70)) * 100.0) / 100.0;
        int temp = (int) (1 + Math.random() * (15));
        int tr = (int) (1 + Math.random() * 10000);
        int fal = (int) (1 + Math.random() * 100);
        int stock = (int) (1 + Math.random() * 10000);
        int costs = (int) (1 + Math.random() * 10000);
        double usingratio = Math.round(Math.random() * 100 * 100.0) / 100.0;
        // temp 값 제한 (0에서 15 사이)
        temp = Math.max(0, Math.min(15, temp));
        
        try {
    	String SQL = "INSERT INTO feb1 ("
    			+ "			opratio"
    			+ "			, temp"
    			+ "			, tr"
    			+ "			, fal"
    			+ "			, stock"
    			+ "			, costs"
    			+ "			, usingratio"
    			+ "			, hiredate)"
    			+ "		VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    	int result = jdbcTemplate.update(SQL, opratio, temp, tr, fal, stock, costs, usingratio, hiredate);
       
        System.out.println("[ FEB1 TABLE의 INSERT작업이 완료되었습니다.]");
          
          // 날짜별 작업완료 메세지
          // System.out.println("날짜 " + hiredate + " 업데이트 작업이 완료되었습니다.");
       } 
       catch (Exception e) {
          // 예외 처리
    	   e.printStackTrace();
          System.out.println(" >>> 날짜 " + hiredate + " 업데이트 작업 중 예외가 발생하였습니다: " + e.getMessage());
       }
    }
}
    
    