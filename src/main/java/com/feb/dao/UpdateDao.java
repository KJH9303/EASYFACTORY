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

    // 데이터베이스 연결을 위한 JdbcTemplate 객체를 생성.
    public UpdateDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    // ResultSet에서 데이터를 추출하여 VO 객체에 저장하는 함수.
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

    // 특정 테이블에서 랜덤한 값을 업데이트하는 메서드.
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
                // SQL UPDATE 쿼리문을 작성하여 실행.
                String SQL = "UPDATE " + tableName + " SET opratio = ?, temp = ?, tr = ?, fal = ?, stock = ?, costs = ?, usingratio = ? WHERE hiredate = ?";
                int result = jdbcTemplate.update(SQL, opratio, temp, tr, fal, stock, costs, usingratio, currentDate);

                System.out.println("[" + tableName.toUpperCase() + " 테이블의 업데이트 작업이 완료되었습니다.]");

            } catch (Exception e) {
                // 예외 처리.
                e.printStackTrace();
                System.out.println(">>> 날짜 " + currentDate + " 업데이트 작업 중 예외가 발생하였습니다: " + e.getMessage());
            }
        }
    }

    // 모든 테이블에 대하여 updateTable 메서드를 실행.
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
