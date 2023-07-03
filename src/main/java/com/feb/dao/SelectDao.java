package com.feb.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.feb.vo.FebVO;

public class SelectDao {

    private static JdbcTemplate jdbcTemplate;

    // 데이터베이스 연결을 위한 JdbcTemplate 객체를 생성.
    public SelectDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    // 특정 테이블에서 데이터를 가져오는 메서드.
    public static List<FebVO> getTableData(String tableName) {

        // SQL 쿼리문을 생성.
        String SQL = "SELECT * FROM " + tableName;

        // SQL 쿼리문을 실행하고 결과를 List 형태로 받아옴.
        List<FebVO> resultList = jdbcTemplate.query(SQL, new RowMapper<FebVO>() {
            @Override
            public FebVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                // 결과 데이터를 VO 객체에 매핑.
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
}
