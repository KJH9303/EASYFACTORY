package com.energy.config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import  com.energy.dao.EnergyDao;
import com.energy.dao.EnergyDao1;

@Configuration
@EnableTransactionManagement
public class EnergyConfig {

	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
		DataSource ds = new DataSource();
		ds.setDriverClassName(OracleInfo.driver);
		ds.setUrl(OracleInfo.url);
		ds.setUsername(OracleInfo.username);
		ds.setPassword(OracleInfo.password);
		ds.setInitialSize(5);							// 커넥션 풀을 초기화 할 때 생성할 초기 커넥션 갯수
		ds.setMaxActive(10);							// 커넥션 풀에서 가져올 수 있는 최대 커넥션 갯수
		ds.setMaxIdle(10);								// 커넥션 풀에 유지할 수 있는 최대 커넥션 갯수
		ds.setTestWhileIdle(true);						// 커넥션 풀이 유휴 상태로 있는 동안에 검사할지 여부
		ds.setMinEvictableIdleTimeMillis(60000 * 3);	// 커넥션 풀에 유휴 상태로 유지할 최소 시간(밀리초)	: 3분
		ds.setTimeBetweenEvictionRunsMillis(10 * 1000);	// 커넥션 풀에 유휴 커넥션을 검사할 주기(밀리초) : 10초
		return ds;		
	}

	@Bean
	public PlatformTransactionManager transactionManager() {
		DataSourceTransactionManager tm = new DataSourceTransactionManager();
		tm.setDataSource(dataSource());
		return tm;
	}

	@Bean
	public EnergyDao energyDao() {
		return new EnergyDao(dataSource());
		
	}
	@Bean
	public EnergyDao1 energyDao1() {
		return new EnergyDao1(dataSource());
		
	}

}
