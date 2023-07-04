package com.energy.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.energy.dao.EnergyDAO;
import com.energy.vo.EnergyVO;

public class EnergyService {

	private EnergyDAO energyDAO;
    
    public EnergyService(EnergyDAO energyDAO) {
        this.energyDAO = energyDAO;
    }
    /*
    // DB에 날짜 검색 확인 반환
    public List<EnergyVO> getSelectDay(String startDate, String endDate) {
        return energyDao.getSelectDay(startDate, endDate);
    }
    */
    public List<EnergyVO> getTemp(String startDate, String endDate) {
        return energyDAO.getTemp(startDate, endDate);
    }
    public List<EnergyVO> getOpratio(String startDate, String endDate) {
        return energyDAO.getOpratio(startDate, endDate);
    }
    public List<EnergyVO> getAllOpratio(String startDate, String endDate) {
        return energyDAO.getAllOpratio(startDate, endDate);
    }
    public List<EnergyVO> getMonthcosts(String startDate) {
        return energyDAO.getMonthlyCosts(startDate);
    }
    
    // DB에서 받은 데이터 Json으로 변환
    public JSONArray JsonOpratioChange(List<EnergyVO> energyOpratioList) {
        JSONArray jsonArray = new JSONArray();
        for (EnergyVO energyData : energyOpratioList) {
            jsonArray.add(energyData.getOpratio());
        }
        return jsonArray;
    }
    
    public JSONArray JsonTempChange(List<EnergyVO> energyTempList) {
        JSONArray jsonArray = new JSONArray();
        for (EnergyVO energyData : energyTempList) {
            jsonArray.add(energyData.getTemp());
        }
        return jsonArray;
    }
    

    public JSONArray JsonAllOpratioChange(List<EnergyVO> energyAllopratioList) {
        JSONArray jsonArray = new JSONArray();
        for (EnergyVO energyData : energyAllopratioList) {
            
        	double[] vals =  energyData.getAllopratio();
        	for( double val : vals) {
        		jsonArray.add(val);
        	}
            
        }
        return jsonArray;
    }
    
    public JSONArray JsonMonthcostsChange(List<EnergyVO> energyMonthcostsList) {
        JSONArray jsonArray = new JSONArray();

        for (EnergyVO energyData : energyMonthcostsList) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("month", energyData.getMonth());
            jsonObject.put("monthCost", energyData.getMonthCosts());

            jsonArray.add(jsonObject);
        }

        return jsonArray;
    }
}
