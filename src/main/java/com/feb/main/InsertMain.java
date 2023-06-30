package com.feb.main;

import javax.sql.DataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.feb.config.AppConfig;
import com.feb.dao.InsertDao;

public class InsertMain {
    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(AppConfig.class);
        DataSource dataSource = ctx.getBean(DataSource.class);
    	
        InsertDao insertDAO = new InsertDao(dataSource);

        // 테이블 업데이트 실행
        insertDAO.insertTable("feb1");
        insertDAO.insertTable("feb2");
        insertDAO.insertTable("feb3");
        insertDAO.insertTable("feb4");
        insertDAO.insertTable("feb5");
        insertDAO.insertTable("feb6");
        insertDAO.insertTable("feb7");
        insertDAO.insertTable("feb8");

        System.out.println("■■■■■■■■■■모든 공정의 데이터 INSERT작업이 완료되었습니다.■■■■■■■■■■");
    }
}

