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
	
	public JSONArray downloadData(String tableName) {
        return febDAO.downloadData(tableName);
    }
        
    public String getRandomDefect() throws Exception {
		String result = febDAO.getRandomDefect();
		return result;
	}
    
	public JSONArray getFebIndexViewData(String feb_index_view_elec, String feb_index_view_cost) {
        return febDAO.getFebIndexViewData(feb_index_view_elec, feb_index_view_cost);
    }
}