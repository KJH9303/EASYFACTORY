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
    
    // 에너지 사용비용 :Costs 
    @PostMapping("/chart1")
    public void doChart2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("[ChartController] /chart1");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        System.out.printf("Parameter: startDate(%s), endDate(%s)\n", startDate, endDate);
        List<EnergyVO> energyCostsList = energyService.getCosts(startDate, endDate);
        JSONArray jsonArray = energyService.JsonCostsChange(energyCostsList);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("SUM_COSTS", jsonArray);
        writer.print(jsonObject.toJSONString());
        System.out.println(jsonObject.toJSONString());
    }
   
    
  // 총 에너지 사용량 Usingratio
    @PostMapping("/chart2")
    public void doChart10(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("[ChartController] /chart2");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        System.out.printf("Parameter: startDate(%s), endDate(%s)\n", startDate, endDate);
        List<EnergyVO> energyUsingratioList = energyService.getUsingratio(startDate, endDate);
        
        JSONArray jsonArray = energyService.JsonUsingratioChange(energyUsingratioList);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("SUM_USINGRATIO", jsonArray);
        writer.print(jsonObject.toJSONString());
        System.out.println(jsonObject.toJSONString());
    }
 
    // 가동률:Opratio datepicker
    @PostMapping("/chart3")
    public void doChart1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("[ChartController] /chart3");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        System.out.printf("Parameter: startDate(%s), endDate(%s)\n", startDate, endDate);
        List<EnergyVO> energyOpratioList = energyService.getOpratio(startDate, endDate);
            
        JSONArray jsonArray = energyService.JsonOpratioChange(energyOpratioList);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("AVERAGE_OPRATIO", jsonArray);
        writer.print(jsonObject.toJSONString());
        System.out.println(jsonObject.toJSONString());   
    }
   
    // 각 공정 가동률
    @PostMapping("/chart4")
    public void doChart3(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("[ChartController] /chart4");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        System.out.printf("Parameter: startDate(%s), endDate(%s)\n", startDate, endDate);
        List<EnergyVO> energyAllopratioList = energyService.getFebOpratio(startDate, endDate);
        
        JSONArray jsonArray = energyService.JsonFebOpratioChange(energyAllopratioList);
         writer.print(jsonArray.toJSONString());
         System.out.println(jsonArray.toJSONString());   
    }
    // 각 공정 총 생산량
    @PostMapping("/chart5")
    public void doChart4(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("[ChartController] /chart5");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        System.out.printf("Parameter: startDate(%s), endDate(%s)\n", startDate, endDate);
        List<EnergyVO> energyFebtrList = energyService.getFebTr(startDate, endDate);
        
        JSONArray jsonArray = energyService.JsonFebtrChange(energyFebtrList);
         writer.print(jsonArray.toJSONString());
    }
    // 각 공정 총 비용
    @PostMapping("/chart6")
    public void doChart5(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("[ChartController] /chart6");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        System.out.printf("Parameter: startDate(%s), endDate(%s)\n", startDate, endDate);
        List<EnergyVO> energyFebcostsList = energyService.getFebCosts(startDate, endDate);
        
        JSONArray jsonArray2 = energyService.JsonFebCostsChange(energyFebcostsList);
         writer.print(jsonArray2.toJSONString());
    }
    // 각 공정 총 전기사용량
    @PostMapping("/chart7")
    public void doChart6(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("[ChartController] /chart7");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        System.out.printf("Parameter: startDate(%s), endDate(%s)\n", startDate, endDate);
        List<EnergyVO> energyFebusingratoList = energyService.getFebUsingratio(startDate, endDate);
        
        JSONArray jsonArray3 = energyService.JsonFebUsingratioChange(energyFebusingratoList);
         writer.print(jsonArray3.toJSONString());
    }
    // 총 비용대비 총생산량 차트 연결
    @PostMapping("/chart8")
    public void doChart8(HttpServletRequest request, HttpServletResponse response, Model model) throws ServletException, IOException {
        System.out.println("[ChartController] /chart");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        System.out.printf("Parameters: startDate(%s), endDate(%s)", startDate, endDate);

        List<EnergyVO> energyFebcostsList = energyService.getFebCosts(startDate, endDate);
        List<EnergyVO> energyFebtrList = energyService.getFebTr(startDate, endDate);

        JSONArray jsonArray2 = energyService.JsonFebCostsChange(energyFebcostsList);
        JSONArray jsonArray = energyService.JsonFebtrChange(energyFebtrList);

        
        String responseJson = String.format("{\"febcosts\": %s, \"febtr\": %s}", jsonArray2.toJSONString(), jsonArray.toJSONString());
        System.out.println("[ChartController] responseJson: " + responseJson); // 추가되어야 하는 코드
        writer.print(responseJson);
    }
    // 총 비용 대비 총 에너지 사용량 차트연결
    @PostMapping("/chart9")
    public void doChart9(HttpServletRequest request, HttpServletResponse response, Model model) throws ServletException, IOException {
        System.out.println("[ChartController] /chart");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        System.out.printf("Parameters: startDate(%s), endDate(%s)", startDate, endDate);

        List<EnergyVO> energyFebcostsList = energyService.getFebCosts(startDate, endDate);
        List<EnergyVO> energyFebCVusingratioList = energyService.getFebcvusingratio(startDate, endDate);

        JSONArray jsonArray2 = energyService.JsonFebCostsChange(energyFebcostsList);
        JSONArray jsonArray = energyService.JsonCVUsingratioChange(energyFebCVusingratioList);

        
        String responseJson = String.format("{\"febcosts\": %s, \"febcvusingratio\": %s}", jsonArray2.toJSONString(), jsonArray.toJSONString());
        System.out.println("[ChartController] responseJson: " + responseJson); // 추가되어야 하는 코드
        writer.print(responseJson);
    }
    

}
   
