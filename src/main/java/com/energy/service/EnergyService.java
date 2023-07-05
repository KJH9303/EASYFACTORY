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
   
    public List<EnergyVO> getTemp(String startDate, String endDate) {
        return energyDAO.getTemp(startDate, endDate);
    }
    public List<EnergyVO> getOpratio(String startDate, String endDate) {
        return energyDAO.getOpratio(startDate, endDate);
    }
    public List<EnergyVO> getFebOpratio(String startDate, String endDate) {
        return energyDAO.getFebOpratio(startDate, endDate);
    }
    public List<EnergyVO> getMonthcosts(String startDate) {
        return energyDAO.getMonthlyCosts(startDate);
    }
    public List<EnergyVO> getFebTr(String startDate, String endDate) {
        return energyDAO.getFebtr(startDate, endDate);
    }
    public List<EnergyVO> getFebCosts(String startDate, String endDate) {
        return energyDAO.getFebcosts(startDate, endDate);
    }
    public List<EnergyVO> getFebUsingratio(String startDate, String endDate) {
        return energyDAO.getFebusingratio(startDate, endDate);
    }
    
    // 가동률
    public JSONArray JsonOpratioChange(List<EnergyVO> energyOpratioList) {
        JSONArray jsonArray = new JSONArray();
        for (EnergyVO energyData : energyOpratioList) {
            jsonArray.add(energyData.getOpratio());
        }
        return jsonArray;
    }
    // 온도
    public JSONArray JsonTempChange(List<EnergyVO> energyTempList) {
        JSONArray jsonArray = new JSONArray();
        for (EnergyVO energyData : energyTempList) {
            jsonArray.add(energyData.getTemp());
        }
        return jsonArray;
    }
    // 공정별 가동률 각 평균
    public JSONArray JsonFebOpratioChange(List<EnergyVO> energyFebopratioList) {
        JSONArray jsonArray = new JSONArray();
        for (EnergyVO energyData : energyFebopratioList) {
            
        	double[] vals =  energyData.getFebopratio();
        	for( double val : vals) {
        		jsonArray.add(val);
        	}
            
        }
        return jsonArray;
    }
    // 공정별 각 총 생산량
    public JSONArray JsonFebtrChange(List<EnergyVO> energyFebtrList) {
        JSONArray jsonArray = new JSONArray();
        
        for (EnergyVO energyData : energyFebtrList) {
            
        	int[] vals =  energyData.getFebtr();
        	for( int val : vals) {
        		jsonArray.add(val);
        	}
            
        }
        return jsonArray;
    }
    
    
    // 공정별 각 총 전기비용
    public JSONArray JsonFebCostsChange(List<EnergyVO> energyFebCostsList) {
        JSONArray jsonArray2 = new JSONArray();
        for (EnergyVO energyData2 : energyFebCostsList) {
            
        	int[] vals =  energyData2.getFebcosts();
        	for( int val : vals) {
        		jsonArray2.add(val);
        	}
            
        }
        return jsonArray2;
    }
    // 공정별 각 총 생산량
    public JSONArray JsonFebUsingratioChange(List<EnergyVO> energyFebUsingratioList) {
        JSONArray jsonArray3 = new JSONArray();
        for (EnergyVO energyData3 : energyFebUsingratioList) {
            
        	int[] vals =  energyData3.getFebusingratio();
        	for( int val : vals) {
        		jsonArray3.add(val);
        	}
            
        }
        return jsonArray3;
    }
    
    // 비용별 월별 가변 전력비용
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
