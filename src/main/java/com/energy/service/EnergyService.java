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
   
    public List<EnergyVO> getOpratio(String startDate, String endDate) {
        return energyDAO.getOpratio(startDate, endDate);
    }
    public List<EnergyVO> getUsingratio(String startDate, String endDate) {
        return energyDAO.getUsingratio(startDate, endDate);
    }

    public List<EnergyVO> getCosts(String startDate, String endDate) {
        return energyDAO.getCosts(startDate, endDate);
    }
   
    public List<EnergyVO> getFebOpratio(String startDate, String endDate) {
        return energyDAO.getFebOpratio(startDate, endDate);
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
    public List<EnergyVO> getFebcvusingratio(String startDate, String endDate) {
        return energyDAO.getFebCVusingratio(startDate, endDate);
    }

	 // 에너지 사용 비용
	    public JSONArray JsonCostsChange(List<EnergyVO> energyCostsList) {
	        JSONArray jsonArray = new JSONArray();
	        for (EnergyVO energyData : energyCostsList) {
	            int costs = energyData.getCosts();
	            jsonArray.add(costs);
	        }
	        return jsonArray;
	    }
	
	    // 에너지 사용량
	    public JSONArray JsonUsingratioChange(List<EnergyVO> energyUsingtioList) {
	        JSONArray jsonArray = new JSONArray();
	        for (EnergyVO energyData : energyUsingtioList) {
	            jsonArray.add(energyData.getUsingratio());
	        }
	        return jsonArray;
	    }
	   
	    // 가동률
	    public JSONArray JsonOpratioChange(List<EnergyVO> energyOpratioList) {
	        JSONArray jsonArray = new JSONArray();
	        for (EnergyVO energyData : energyOpratioList) {
	            jsonArray.add(energyData.getOpratio());
	        }
	        return jsonArray;
	    }
	  
    // 공정별 가동률  평균
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
    // 공정별  총 생산량
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
    // 공정별  총 전기비용
    public JSONArray JsonFebCostsChange(List<EnergyVO> energyFebCostsList) {
        JSONArray jsonArray = new JSONArray();
        for (EnergyVO energyData : energyFebCostsList) {
            
        	int[] vals =  energyData.getFebcosts();
        	for( int val : vals) {
        		jsonArray.add(val);
        	}
            
        }
        return jsonArray;
    }
    // 공정별  총생산대비 전력사용량 khw -> w로 변경 하는 쿼리
    public JSONArray JsonCVUsingratioChange(List<EnergyVO> energyFebCVUsingratioList) {
        JSONArray jsonArray = new JSONArray();
        for (EnergyVO energyData : energyFebCVUsingratioList) {
            
        	double[] vals =  energyData.getFebcvusingratio();
        	for( double val : vals) {
        		jsonArray.add(val);
        	}
            
        }
        return jsonArray;
    }
    // 공절별  전기사용량 
    public JSONArray JsonFebUsingratioChange(List<EnergyVO> energyFebUsingratioList) {
        JSONArray jsonArray = new JSONArray();
        for (EnergyVO energyData : energyFebUsingratioList) {
            
        	int[] vals =  energyData.getFebusingratio();
        	for( int val : vals) {
        		jsonArray.add(val);
        	}
            
        }
        return jsonArray;
    }
}

