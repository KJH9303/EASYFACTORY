package com.feb.service;

import java.util.Date;
import java.util.List;

import com.feb.dao.FebDAO;
import com.feb.vo.FebVO;

public class FebService {
	private FebDAO febDAO;

	public FebService(FebDAO febDAO) {
		this.febDAO = febDAO;
	}
	
	// feb 데이터 출력
	public List<FebVO> getTableData(String tableName) {
		List<FebVO> tableData = febDAO.getTableData(tableName);
		return tableData;
	}
		
	// feb 데이터 출력 (DatePicker)
	public List<FebVO> getDatePickerData(Date startDate, Date endDate) {
		List<FebVO> tableData = febDAO.getDatePickerData(startDate, endDate);
		return tableData;
	}
	
	public void updateTables() {
		febDAO.insertTable("feb1");
		febDAO.insertTable("feb2");
		febDAO.insertTable("feb3");
		febDAO.insertTable("feb4");
		febDAO.insertTable("feb5");
		febDAO.insertTable("feb6");
		febDAO.insertTable("feb7");
		febDAO.insertTable("feb8");
	}
	
	public void startUpdateFeb() {
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
        
    public void stopUpdateFeb() {
        System.out.println("■■■■■■■■■■ 모든 공정의 데이터 UPDATE작업이 멈춤 ■■■■■■■■■■");
    	
    }
}