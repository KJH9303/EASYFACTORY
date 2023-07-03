package com.feb.main;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.easyfactory.config.AppCtx;
import com.feb.dao.FebDAO;
import com.feb.vo.FebVO;

public class FebMain {

    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(AppCtx.class);
        DataSource dataSource = ctx.getBean(DataSource.class);

        FebDAO febDAO = new FebDAO(dataSource);

        // Get data from "feb1" table and print
        List<FebVO> feb1DataList = febDAO.getTableData("feb1");
        List<FebVO> feb2DataList = febDAO.getTableData("feb2");
        
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

