package com.energy.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


import com.energy.dao.StockDAO;
import com.energy.vo.StockVO;

public class StockService {

	private StockDAO stockDAO;
    
    public StockService(StockDAO stockDAO) {
        this.stockDAO = stockDAO;
    }
   
    public List<StockVO> getStock(String startDate, String endDate) {
        return stockDAO.getStock(startDate, endDate);
    }
    public List<StockVO> getFal(String startDate, String endDate) {
        return stockDAO.getFal(startDate, endDate);
    }
    public List<StockVO> getFebFal(String startDate, String endDate) {
        return stockDAO.getFebfal(startDate, endDate);
    }
    public List<StockVO> getFebStock(String startDate, String endDate) {
        return stockDAO.getFebstock(startDate, endDate);
    }
    
    // 재고량
    public JSONArray JsonStockChange(List<StockVO> StockList) {
        JSONArray jsonArray = new JSONArray();
        for (StockVO energyData : StockList) {
            jsonArray.add(energyData.getStock());
        }
        return jsonArray;
    }
    // 불량
    public JSONArray JsonFalChange(List<StockVO> FalList) {
        JSONArray jsonArray = new JSONArray();
        for (StockVO energyData : FalList) {
            jsonArray.add(energyData.getFal());
        }
        return jsonArray;
    }
    // 공정별 각 재고량
    public JSONArray JsonFebStockChange(List<StockVO> energyFebStockList) {
        JSONArray jsonArray = new JSONArray();
        
        for (StockVO energyData : energyFebStockList) {
            
        	int[] vals =  energyData.getFebstock();
        	for( int val : vals) {
        		jsonArray.add(val);
        	}
        }
        return jsonArray;
    }
    // 공정별 각 불량
    public JSONArray JsonFebFalChange(List<StockVO> energyFebFalList) {
        JSONArray jsonArray = new JSONArray();
        
        for (StockVO energyData : energyFebFalList) {
            
        	int[] vals =  energyData.getFebfal();
        	for( int val : vals) {
        		jsonArray.add(val);
        	}
        }
        return jsonArray;
    }
}

