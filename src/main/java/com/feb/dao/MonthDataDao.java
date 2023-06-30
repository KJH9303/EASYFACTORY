package com.feb.dao;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

public class MonthDataDao {

    private JdbcTemplate jdbcTemplate;

    public MonthDataDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public void printMonthlyAvgOperationalRate() {
        String sql = "SELECT EXTRACT(MONTH FROM hiredate) AS \"월\", AVG(opratio) AS \"가동률 평균\" FROM feb1 GROUP BY EXTRACT(MONTH FROM hiredate) ORDER BY EXTRACT(MONTH FROM hiredate)";
        List<Map<String, Object>> resultList = jdbcTemplate.queryForList(sql);
        DecimalFormat decimalFormat = new DecimalFormat("0.00");

        System.out.println("월별 가동률 평균값");
        for (Map<String, Object> row : resultList) {
            BigDecimal avgOpratio = (BigDecimal) row.get("가동률 평균");
            System.out.println("월: " + row.get("월") + ", 가동률 평균: " + decimalFormat.format(avgOpratio));
        }
    }

    public void printYearlyAvgTemperature() {
        String sql = "SELECT TO_CHAR(hiredate, 'YYYY') AS \"당해\", AVG(TEMP) AS \"온도 평균\" FROM feb1 GROUP BY TO_CHAR(hiredate, 'YYYY')";
        List<Map<String, Object>> resultList = jdbcTemplate.queryForList(sql);
        DecimalFormat decimalFormat = new DecimalFormat("0.00");

        System.out.println("온도 평균값");
        for (Map<String, Object> row : resultList) {
            BigDecimal avgTemp = (BigDecimal) row.get("온도 평균");
            System.out.println("당해: " + row.get("당해") + ", 온도 평균: " + decimalFormat.format(avgTemp));
        }
    }

    public void printMonthlyElectricityUsage() {
        String sql = "SELECT EXTRACT(MONTH FROM hiredate) AS \"월\", SUM(usingratio) AS \"월별 전기사용량\" FROM feb1 GROUP BY EXTRACT(MONTH FROM HIREDATE) ORDER BY EXTRACT(MONTH FROM HIREDATE)";
        List<Map<String, Object>> resultList = jdbcTemplate.queryForList(sql);

        System.out.println("월별 전기사용량");
        for (Map<String, Object> row : resultList) {
            System.out.println("월: " + row.get("월") + ", 월별 전기사용량: " + row.get("월별 전기사용량"));
        }
    }

    public void printMonthlyCost() {
        String sql = "SELECT EXTRACT(MONTH FROM hiredate) AS \"월\", SUM(costs) AS \"월별 비용\" FROM feb1 GROUP BY EXTRACT(MONTH FROM HIREDATE) ORDER BY EXTRACT(MONTH FROM HIREDATE)";
        List<Map<String, Object>> resultList = jdbcTemplate.queryForList(sql);

        System.out.println("월별 비용");
        for (Map<String, Object> row : resultList) {
            System.out.println("월: " + row.get("월") + ", 월별 비용: " + row.get("월별 비용"));
        }
    }
}
