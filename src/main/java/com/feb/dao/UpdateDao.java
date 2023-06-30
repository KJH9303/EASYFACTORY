package com.feb.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.Random;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

import com.feb.vo.FebVO;

public class UpdateDao {

    private JdbcTemplate jdbcTemplate;

    public UpdateDao(DataSource dataSource) {
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
                // 예외 처리
                e.printStackTrace();
                System.out.println(">>> 날짜 " + currentDate + " 업데이트 작업 중 예외가 발생하였습니다: " + e.getMessage());
            }
        }
    }

    public void updateTables() {
        updateTable("feb1");
        updateTable("feb2");
        updateTable("feb3");
        updateTable("feb4");
        updateTable("feb5");
        updateTable("feb6");
        updateTable("feb7");
        updateTable("feb8");
    }
}
