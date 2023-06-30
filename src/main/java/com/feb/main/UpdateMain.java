package com.feb.main;

import javax.sql.DataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.feb.config.AppConfig;
import com.feb.dao.UpdateDao;

public class UpdateMain {
    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(AppConfig.class);
        DataSource dataSource = ctx.getBean(DataSource.class);
    	
        UpdateDao updateDAO = new UpdateDao(dataSource);

        while (true) {
        updateDAO.updateTable("feb1");
        updateDAO.updateTable("feb2");
        updateDAO.updateTable("feb3");
        updateDAO.updateTable("feb4");
        updateDAO.updateTable("feb5");
        updateDAO.updateTable("feb6");
        updateDAO.updateTable("feb7");
        updateDAO.updateTable("feb8");

        System.out.println("■■■■■■■■■■ 모든 공정의 데이터 UPDATE작업이 완료되었습니다. ■■■■■■■■■■");
        
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
}

