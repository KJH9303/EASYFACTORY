package com.feb.service;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.feb.config.AppConfig;
import com.feb.dao.UpdateDao;

public class UpdateFebService {
	
	@Autowired
	UpdateDao updatedao;
	
	
    public void startUpdateFeb() {
        // ApplicationContext ctx = new AnnotationConfigApplicationContext(AppConfig.class);
        // DataSource dataSource = ctx.getBean(DataSource.class);
    	
        //updateDao updateDAO = new updateDao(dataSource);

        while (true) {
        	updatedao.updateTable("feb1");
        	updatedao.updateTable("feb2");
        	updatedao.updateTable("feb3");
        	updatedao.updateTable("feb4");
        	updatedao.updateTable("feb5");
        	updatedao.updateTable("feb6");
        	updatedao.updateTable("feb7");
        	updatedao.updateTable("feb8");
	
	        System.out.println("■■■■■■■■■■ 모든 공정의 데이터 UPDATE작업이 완료되었습니다. ■■■■■■■■■■");
	        
	        try {
	            Thread.sleep(3000);
	        } catch (InterruptedException e) {
	            e.printStackTrace();
	        }
        }
    }
        
    public void stopUpdateFeb() {
        System.out.println("■■■■■■■■■■ 모든 공정의 데이터 UPDATE작업이 멈춤 ■■■■■■■■■■");
    	
    }

}

