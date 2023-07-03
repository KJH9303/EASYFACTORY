package com.feb.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.Random;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

import com.feb.vo.FebVO;

public class InsertDao {

    private JdbcTemplate jdbcTemplate;

    public InsertDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public FebVO mapRow(ResultSet rs, int rowNum) throws SQLException {
        FebVO processVO = new FebVO(
                rs.getDouble("opratio"),
                rs.getInt("temp"),
                rs.getInt("tr"),
                rs.getInt("fal"),
                rs.getInt("stock"),
                rs.getInt("costs"),
                rs.getDouble("usingratio"),
                rs.getDate("hiredate"));
        return processVO;
    }

    /*
     * 테이블에 데이터 insert 작업 수행
     * 
     * tableName : 데이터를 삽입할 테이블
     */
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
                // 예외 처리
                e.printStackTrace();
                System.out.println(">>> 날짜 " + currentDate + " INSERT 작업 중 예외가 발생하였습니다: " + e.getMessage());
            }
        }
    }

    /*
     * 여러 개의 테이블에 대한 insertTable() 메소드 호출 (update 작업 수행)
     */
    public void updateTables() {
        insertTable("feb1");
        insertTable("feb2");
        insertTable("feb3");
        insertTable("feb4");
        insertTable("feb5");
        insertTable("feb6");
        insertTable("feb7");
        insertTable("feb8");
    }
}
