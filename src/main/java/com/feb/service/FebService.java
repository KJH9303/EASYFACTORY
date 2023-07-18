package com.feb.service;

import org.json.simple.JSONArray;

import com.feb.dao.FebDAO;

public class FebService {
	
	private FebDAO febDAO;

	public FebService(FebDAO febDAO) {
		this.febDAO = febDAO;
	}

	public JSONArray selectDataHiredate(String tableName, String startDate, String endDate) {
        return febDAO.selectDataHiredate(tableName, startDate, endDate);
    }
        
    public String getRandomDefect() throws Exception {
		String result = febDAO.getRandomDefect();
		return result;
	}
}