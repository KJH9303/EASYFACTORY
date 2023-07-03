package com.energy.service;

import java.util.List;

import org.json.simple.JSONArray;

import com.energy.dao.EnergyDao;
import com.energy.dao.EnergyDao1;
import com.energy.vo.EnergyVO;

public class EnergyService {
    //private EnergyDao energyDao;
    private EnergyDao1 energyDao1;
    /*
    public EnergyService(EnergyDao energyDao) {
        this.energyDao = energyDao;
    }
    */
    public EnergyService(EnergyDao1 energyDao1) {
        this.energyDao1 = energyDao1;
    }
    /*
    // DB에 날짜 검색 확인 반환
    public List<EnergyVO> getSelectDay(String startDate, String endDate) {
        return energyDao.getSelectDay(startDate, endDate);
    }
    */
    public List<EnergyVO> getTemp(String startDate, String endDate) {
        return energyDao1.getTemp(startDate, endDate);
    }
    public List<EnergyVO> getOpratio(String startDate, String endDate) {
        return energyDao1.getOpratio(startDate, endDate);
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
}
