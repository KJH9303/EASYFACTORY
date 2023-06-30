package com.energy.service;

import java.util.List;

import org.json.simple.JSONArray;

import com.energy.dao.EnergyDao;
import com.energy.vo.EnergyVO;

public class EnergyService {
    private EnergyDao energyDao;

    public EnergyService(EnergyDao energyDao) {
        this.energyDao = energyDao;
    }
    
    // DB에 날짜 검색 확인 반환
    public List<EnergyVO> getSelectDay(String startDate, String endDate) {
        return energyDao.getSelectDay(startDate, endDate);
    }
    // DB에서 받은 데이터 Json으로 변환
    public JSONArray JSONChange(List<EnergyVO> energyDataList) {
        JSONArray jsonArray = new JSONArray();
        for (EnergyVO energyData : energyDataList) {
            jsonArray.add(energyData.getOpratio());
        }
        return jsonArray;
    }
}
