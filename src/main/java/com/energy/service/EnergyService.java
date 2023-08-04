package com.energy.service;

import java.util.List;
import java.util.function.Function;

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
    
    public JSONArray convertEnergyDataToJsonArray(List<EnergyVO> energyDataList, String fieldName, double conversionFactor) {
        JSONArray jsonArray = new JSONArray();
        for (EnergyVO energyData : energyDataList) {
            if ("costs".equals(fieldName)) {
                jsonArray.add((int) (energyData.getCosts() / conversionFactor));
            } else if ("usingratio".equals(fieldName)) {
                jsonArray.add(energyData.getUsingratio() / conversionFactor);
            } else if ("opratio".equals(fieldName)) {
                jsonArray.add(energyData.getOpratio() / conversionFactor);
            }
        }
        return jsonArray;
    }

    // 에너지 사용 비용
    public JSONArray JsonCostsChange(List<EnergyVO> energyCostsList) {
        return convertEnergyDataToJsonArray(energyCostsList, "costs", 10.0);
    }

    // 에너지 사용량
    public JSONArray JsonUsingratioChange(List<EnergyVO> energyUsingtioList) {
        return convertEnergyDataToJsonArray(energyUsingtioList, "usingratio", 1.0);
    }

    // 가동률
    public JSONArray JsonOpratioChange(List<EnergyVO> energyOpratioList) {
        return convertEnergyDataToJsonArray(energyOpratioList, "opratio", 1.0);
    }
    private JSONArray intValuesToArray(List<EnergyVO> energyDataList,
        Function<EnergyVO, int[]> valueExtractor,
        Function<Integer, Number> converter) {
			JSONArray jsonArray = new JSONArray();
			for (EnergyVO energyData : energyDataList) {
				int[] values = valueExtractor.apply(energyData);
				for (int value : values) {
					jsonArray.add(converter.apply(value));
					}
				
				}
				return jsonArray;
				}
			
	private JSONArray doubleValuesToArray(List<EnergyVO> energyDataList,
       Function<EnergyVO, double[]> valueExtractor,
       Function<Double, Number> converter) {
			JSONArray jsonArray = new JSONArray();
				for (EnergyVO energyData : energyDataList) {
				double[] values = valueExtractor.apply(energyData);
				for (double value : values) {
					jsonArray.add(converter.apply(value));
				}
				
			}
			return jsonArray;
			}
			// 각 공정별 가동률
			public JSONArray JsonFebOpratioChange(List<EnergyVO> energyFebopratioList) {
			return doubleValuesToArray(energyFebopratioList, EnergyVO::getFebopratio, val -> val);
			}
			// 각 공정별 생산량
			public JSONArray JsonFebtrChange(List<EnergyVO> energyFebtrList) {
			return intValuesToArray(energyFebtrList, EnergyVO::getFebtr, val -> val);
			}
			// 각 공정별 비용
			public JSONArray JsonFebCostsChange(List<EnergyVO> energyFebCostsList) {
			return intValuesToArray(energyFebCostsList, EnergyVO::getFebcosts, val -> val / 10);
			}
			// 각 공정별 비용 승급
			public JSONArray JsonCVUsingratioChange(List<EnergyVO> energyFebCVUsingratioList) {
			return doubleValuesToArray(energyFebCVUsingratioList, EnergyVO::getFebcvusingratio, val -> val * 1000);
			}
			
			public JSONArray JsonFebUsingratioChange(List<EnergyVO> energyFebUsingratioList) {
			return intValuesToArray(energyFebUsingratioList, EnergyVO::getFebusingratio, val -> val);
			}
	
}

