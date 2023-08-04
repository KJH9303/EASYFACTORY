package com.energy.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.energy.vo.EnergyVO;


import com.energy.service.EnergyService;

@Controller
@RequestMapping("/energy")
public class EnergyController {
	
	@Autowired
    private EnergyService energyService;

    public void setEnergyService(EnergyService energyService) {
		this.energyService = energyService;
	}
    
    @GetMapping("/energyDashboard")
    public String energyDashboard() {
    	return "energy/energyDashboard";
    	
    }
    
    @GetMapping("/chart/{chartType}")
    public void doGetChart(HttpServletRequest request, HttpServletResponse response,
                       @PathVariable("chartType") String chartType) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        JSONArray jsonArray = null;
        JSONObject jsonObject = null;

        switch (chartType) {
            case "1":
                List<EnergyVO> energyCostsList = energyService.getCosts(startDate, endDate);
                jsonArray = energyService.JsonCostsChange(energyCostsList);
                jsonObject = new JSONObject();
                jsonObject.put("SUM_COSTS", jsonArray);
                break;
            case "2":
                List<EnergyVO> energyUsingratioList = energyService.getUsingratio(startDate, endDate);
                jsonArray = energyService.JsonUsingratioChange(energyUsingratioList);
                jsonObject = new JSONObject();
                jsonObject.put("SUM_USINGRATIO", jsonArray);
                break;
            case "3":
                List<EnergyVO> energyOpratioList = energyService.getOpratio(startDate, endDate);
                jsonArray = energyService.JsonOpratioChange(energyOpratioList);
                jsonObject = new JSONObject();
                jsonObject.put("AVERAGE_OPRATIO", jsonArray);
                break;
            case "4":
                List<EnergyVO> energyAllopratioList = energyService.getFebOpratio(startDate, endDate);   
                jsonArray = energyService.JsonFebOpratioChange(energyAllopratioList);
                writer.print(jsonArray.toJSONString());
                break;
            case "5":
                List<EnergyVO> energyFebtrList = energyService.getFebTr(startDate, endDate);
                jsonArray = energyService.JsonFebtrChange(energyFebtrList);
                writer.print(jsonArray.toJSONString());
                break;
            case "6":
                List<EnergyVO> energyFebcostsList = energyService.getFebCosts(startDate, endDate);
                jsonArray = energyService.JsonFebCostsChange(energyFebcostsList);
                writer.print(jsonArray.toJSONString());
                break;
            case "7":
                List<EnergyVO> energyFebusingratoList = energyService.getFebUsingratio(startDate, endDate);
                jsonArray = energyService.JsonFebUsingratioChange(energyFebusingratoList);
                writer.print(jsonArray.toJSONString());
                break;
            case "8":
                List<EnergyVO> energyFebcostsList8 = energyService.getFebCosts(startDate, endDate);
                List<EnergyVO> energyFebtrList8 = energyService.getFebTr(startDate, endDate);
                JSONArray jsonArrayCosts8 = energyService.JsonFebCostsChange(energyFebcostsList8);
                JSONArray jsonArrayTr8 = energyService.JsonFebtrChange(energyFebtrList8);
                String responseJson8 = String.format("{\"febcosts\": %s, \"febtr\": %s}",
                        jsonArrayCosts8.toJSONString(), jsonArrayTr8.toJSONString());
                writer.print(responseJson8);
                return;
            case "9":
                List<EnergyVO> energyFebcostsList9 = energyService.getFebCosts(startDate, endDate);
                List<EnergyVO> energyFebCVusingratioList9 = energyService.getFebcvusingratio(startDate, endDate);
                JSONArray jsonArrayCosts9 = energyService.JsonFebCostsChange(energyFebcostsList9);
                JSONArray jsonArrayCVUsingratio9 = energyService.JsonCVUsingratioChange(energyFebCVusingratioList9);
                String responseJson9 = String.format("{\"febcosts\": %s, \"febcvusingratio\": %s}",
                        jsonArrayCosts9.toJSONString(), jsonArrayCVUsingratio9.toJSONString());
                writer.print(responseJson9);
                return;
            default:
                // 처리할 수 없는 chartType에 대한 에러 처리
                break;
        }

        if (jsonObject != null) {
            writer.print(jsonObject.toJSONString());
        } else {
            // 에러 처리
        }
    }
}
   
