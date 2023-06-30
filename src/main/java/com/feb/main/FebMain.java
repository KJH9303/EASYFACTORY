package com.feb.main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.feb.config.AppConfig;
import com.feb.dao.InsertDao;
import com.feb.dao.SelectDao;
import com.feb.vo.FebVO;

import javax.sql.DataSource;
import java.util.List;

public class FebMain {

    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(AppConfig.class);
        DataSource dataSource = ctx.getBean(DataSource.class);

        InsertDao insertDAO = new InsertDao(dataSource);
        SelectDao selectDAO = new SelectDao(dataSource);

        // Get data from "feb1" table and print
        List<FebVO> feb1DataList = selectDAO.getTableData("feb1");
        List<FebVO> feb2DataList = selectDAO.getTableData("feb2");
        
        for (FebVO data1 : feb1DataList) {
            System.out.println(data1);
        }
    	System.out.println("FEB1의 DATA를 가져왔습니다.■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
        for (FebVO data2 : feb2DataList) {
            System.out.println(data2);
        }
    	System.out.println("FEB2의 DATA를 가져왔습니다.■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
    }
}

