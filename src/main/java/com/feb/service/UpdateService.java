package com.feb.service;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Service;

import com.feb.dao.FebDAO;

@Service
public class UpdateService {
	
	public static void RunUpdate() {
		
	        ApplicationContext ctx = new AnnotationConfigApplicationContext(com.easyfactory.config.AppCtx.class);
	        DataSource dataSource = ctx.getBean(DataSource.class);
	    	
	        FebDAO febDAO = new FebDAO(dataSource);
	
	        while (true) {
	        	febDAO.updateTable("feb1");
	        	febDAO.updateTable("feb2");
	        	febDAO.updateTable("feb3");
	        	febDAO.updateTable("feb4");
	        	febDAO.updateTable("feb5");
	        	febDAO.updateTable("feb6");
	        	febDAO.updateTable("feb7");
	        	febDAO.updateTable("feb8");
	
	        System.out.println("■■■■■■■■■■ 모든 공정의 데이터 UPDATE작업이 완료되었습니다. ■■■■■■■■■■");
	        
	        try {
	            Thread.sleep(3000);
	        } catch (InterruptedException e) {
	            e.printStackTrace();
	        }
	    }
	}
}
