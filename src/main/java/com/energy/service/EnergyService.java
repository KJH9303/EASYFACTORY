package com.energy.service;

import java.util.List;

import org.json.simple.JSONArray;

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
    
    // DB에서 받은 데이터 Json으로 변환
    public JSONArray JSONOpratioChange(List<EnergyVO> energyOpratioList) {
        JSONArray jsonArray = new JSONArray();
        for (EnergyVO energyData : energyOpratioList) {
            jsonArray.add(energyData.getOpratio());
        }
        return jsonArray;
    }
    
    public JSONArray JSONTempChange(List<EnergyVO> energyTempList) {
        JSONArray jsonArray = new JSONArray();
        for (EnergyVO energyData : energyTempList) {
            jsonArray.add(energyData.getTemp());
        }
        return jsonArray;
    }
    

    public JSONArray JSONAllOpratioChange(List<EnergyVO> energyAllopratioList) {
        JSONArray jsonArray = new JSONArray();
        for (EnergyVO energyData : energyAllopratioList) {
            
        	double[] vals =  energyData.getAllopratio();
        	for( double val : vals) {
        		jsonArray.add(val);
        	}
            
        }
        return jsonArray;
    }

}
