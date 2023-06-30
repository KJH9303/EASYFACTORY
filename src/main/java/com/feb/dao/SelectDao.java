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

    public SelectDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public static List<FebVO> getTableData(String tableName) {
        String SQL = "SELECT * FROM " + tableName;
        List<FebVO> resultList = jdbcTemplate.query(SQL, new RowMapper<FebVO>() {
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
}

