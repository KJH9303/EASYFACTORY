package com.feb.service;

import java.util.List;
import java.util.Map;

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
	
	public JSONArray downloadData(String tableName) {
        return febDAO.downloadData(tableName);
    }
        
    public String getRandomDefect() throws Exception {
		String result = febDAO.getRandomDefect();
		return result;
	}
    
	public List<Map<String, Object>> getFebIndexViewElecData() {
        return febDAO.getFebIndexViewElecData();
    }
	
	public List<Map<String, Object>> getFebIndexViewCostData() {
        return febDAO.getFebIndexViewCostData();
    }
    
}