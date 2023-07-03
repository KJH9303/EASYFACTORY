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
    	// JdbcTemplate을 초기화
    	this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public void printMonthlyAvgOperationalRate() {
    	// 데이터베이스에서 월별 평균 가동률을 구하는 SQL
        String sql = "SELECT EXTRACT(MONTH FROM hiredate) AS \"월\", AVG(opratio) AS \"가동률 평균\" FROM feb1 GROUP BY EXTRACT(MONTH FROM hiredate) ORDER BY EXTRACT(MONTH FROM hiredate)";
        // SQL을 실행하고 결과를 List<Map> 형태로 받아옴
        List<Map<String, Object>> resultList = jdbcTemplate.queryForList(sql);
        // 소수점 2자리까지만 출력하기 위한 DecimalFormat을 정의
        DecimalFormat decimalFormat = new DecimalFormat("0.00");

        // 출력
        System.out.println("월별 가동률 평균값");
        for (Map<String, Object> row : resultList) {
        	// 한달간 평균 가동률
        	BigDecimal avgOpratio = (BigDecimal) row.get("가동률 평균");
            System.out.println("월: " + row.get("월") + ", 가동률 평균: " + decimalFormat.format(avgOpratio));
        }
    }

    public void printYearlyAvgTemperature() {
    	// 데이터베이스에서 연도별 평균 온도를 구하는 SQL
        String sql = "SELECT TO_CHAR(hiredate, 'YYYY') AS \"당해\", AVG(TEMP) AS \"온도 평균\" FROM feb1 GROUP BY TO_CHAR(hiredate, 'YYYY')";
        // SQL을 실행하고 결과를 List<Map> 형태로 받아옴
        List<Map<String, Object>> resultList = jdbcTemplate.queryForList(sql);
        // 소수점 2자리까지만 출력하기 위한 DecimalFormat을 정의
        DecimalFormat decimalFormat = new DecimalFormat("0.00");
        // 출력
        System.out.println("온도 평균값");
        for (Map<String, Object> row : resultList) {
        	// 연간 평균 온도
            BigDecimal avgTemp = (BigDecimal) row.get("온도 평균");
            System.out.println("당해: " + row.get("당해") + ", 온도 평균: " + decimalFormat.format(avgTemp));
        }
    }

    public void printMonthlyElectricityUsage() {
    	// 데이터베이스에서 월별 전기 사용량을 구하는 SQL
        String sql = "SELECT EXTRACT(MONTH FROM hiredate) AS \"월\", SUM(usingratio) AS \"월별 전기사용량\" FROM feb1 GROUP BY EXTRACT(MONTH FROM HIREDATE) ORDER BY EXTRACT(MONTH FROM HIREDATE)";
        // SQL을 실행하고 결과를 List<Map> 형태로 받아옴
        List<Map<String, Object>> resultList = jdbcTemplate.queryForList(sql);
        // 출력
        System.out.println("월별 전기사용량");
        for (Map<String, Object> row : resultList) {
            System.out.println("월: " + row.get("월") + ", 월별 전기사용량: " + row.get("월별 전기사용량"));
        }
    }

    public void printMonthlyCost() {
    	// 데이터베이스에서 월별 비용을 구하는 SQL
        String sql = "SELECT EXTRACT(MONTH FROM hiredate) AS \"월\", SUM(costs) AS \"월별 비용\" FROM feb1 GROUP BY EXTRACT(MONTH FROM HIREDATE) ORDER BY EXTRACT(MONTH FROM HIREDATE)";
        // SQL을 실행하고 결과를 List<Map> 형태로 받아옴
        List<Map<String, Object>> resultList = jdbcTemplate.queryForList(sql);

        // 출력
        System.out.println("월별 비용");
        for (Map<String, Object> row : resultList) {
            System.out.println("월: " + row.get("월") + ", 월별 비용: " + row.get("월별 비용"));
        }
    }
}
