package com.feb.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.stereotype.Repository;

import com.feb.vo.FebVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

@Repository
public class DataDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public DataDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

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
}
