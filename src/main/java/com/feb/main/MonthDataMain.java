package com.feb.main;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.easyfactory.config.AppCtx;
import com.feb.dao.FebDAO;

public class MonthDataMain {

	public static void main(String[] args) {

        ApplicationContext ctx = new AnnotationConfigApplicationContext(AppCtx.class);
        DataSource dataSource = ctx.getBean(DataSource.class);
        
        FebDAO febDAO = new FebDAO(dataSource);
		
        System.out.println("■■■■■■■■■■■■■■■■■■■■월단위 공장 가동률 평균 데이터■■■■■■■■■■■■■■■■■■■■");
        febDAO.printMonthlyAvgOperationalRate();
        System.out.println("■■■■■■■■■■■■■■■■■■■■당해 연도 온도 평균 데이터■■■■■■■■■■■■■■■■■■■■");		
        febDAO.printYearlyAvgTemperature();
        System.out.println("■■■■■■■■■■■■■■■■■■■■월단위 전기 사용량 합계 데이터■■■■■■■■■■■■■■■■■■■■");
        febDAO.printMonthlyElectricityUsage();
        System.out.println("■■■■■■■■■■■■■■■■■■■■월단위 비용 합계 데이터■■■■■■■■■■■■■■■■■■■■");
        febDAO.printMonthlyCost();

	}

}
