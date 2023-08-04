package com.easyfactory.config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.energy.dao.EnergyDAO;
import com.energy.dao.StockDAO;
import com.energy.service.EnergyService;
import com.energy.service.StockService;
import com.feb.dao.FebDAO;
import com.feb.service.FebService;
import com.issue.dao.EzFileDAO;
import com.issue.dao.IssueDAO;
import com.issue.dao.ReplyIssueDAO;
import com.issue.service.EzFileService;
import com.issue.service.IssueService;
import com.issue.service.ReplyIssueService;
import com.member.dao.MemberDAO;
import com.member.service.MemberService;
import com.simulation.dao.SimulationDAO;
import com.simulation.service.SimulationService;

@Configuration
@EnableTransactionManagement
public class AppCtx {

	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
		DataSource ds = new DataSource();
		System.out.println("[DataSource] dataSource()");
		ds.setDriverClassName(OracleInfo.driver);
		ds.setUrl(OracleInfo.url);
		ds.setUsername(OracleInfo.username);
		ds.setPassword(OracleInfo.password);
		ds.setInitialSize(10);							// 커넥션 풀을 초기화할 때 생성할 초기 커넥션 갯수
		ds.setMaxActive(10);							// 커넥션 풀에서 가져올 수 있는 최대 커넥션 갯수
		ds.setMaxIdle(10);								// 커넥션 풀에 유지할 수 있는 최대 커넥션 갯수
		ds.setTestWhileIdle(true);						// 커넥션 풀이 유휴 상태로 있는 동안에 검사할지 여부
		ds.setMinEvictableIdleTimeMillis(60000 * 3);	// 커넥션 풀에 유휴 상태로 유지할 최소 시간(밀리초) : 3분
		ds.setTimeBetweenEvictionRunsMillis(10 * 1000);	// 커넥션 풀에 유휴 커넥션을 검사할 주기(밀리초) : 10초
		return ds;
	}

	// 플랫폼 트랜잭션 매니저
	// @EnableTransactionManagement
	@Bean
	public PlatformTransactionManager transactionManager() {
		DataSourceTransactionManager tm = new DataSourceTransactionManager();
		tm.setDataSource(dataSource());
		return tm;
	}

	// com.member.*
	@Bean
	public MemberDAO memberDAO() {
		return new MemberDAO(dataSource());
	}

	@Bean
	public MemberService memberService() {
		return new MemberService(memberDAO());
	}
	
	// com.feb.*
	@Bean
	public FebDAO febDAO() {
		return new FebDAO(dataSource());
	}
	
	@Bean
	public FebService febService() {
		return new FebService(febDAO());
	}
	
	// com.energy.*
	@Bean
	public EnergyDAO energyDAO() {
		return new EnergyDAO(dataSource());
	}
	
	@Bean
	public EnergyService energyService() {
		return new EnergyService(energyDAO());
	}
	// com.stock.*
	@Bean
	public StockDAO stockDAO() {
		return new StockDAO(dataSource());
	}
	
	@Bean
	public StockService stockService() {
		return new StockService(stockDAO());
	}
	
	// com.issue.*
	@Bean
	public IssueDAO issueDAO() {
		return new IssueDAO(dataSource());
	}
	
	@Bean
	public IssueService issueService() {
		return new IssueService(issueDAO());
	}
	
	@Bean
	public ReplyIssueDAO replyIssueDAO() {
		return new ReplyIssueDAO(dataSource());
	}
	
	@Bean
	public SimulationDAO simulationDAO() {
		return new SimulationDAO(dataSource());
	}
	
	@Bean
	public ReplyIssueService replyIssueService() {
		return new ReplyIssueService(replyIssueDAO());
	}
	
	@Bean
	public EzFileDAO ezFileDAO() {
		return new EzFileDAO(dataSource());
	}
	   
	@Bean
	public EzFileService ezFileService() {
		return new EzFileService(ezFileDAO());
	}
	
	@Bean
	public SimulationService simulationService() {
		return new SimulationService(simulationDAO());
	}
	
}
