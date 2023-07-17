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

import com.energy.vo.StockVO;
import com.energy.service.StockService;

@Controller
@RequestMapping("/stock")
public class StockController {
	
	@Autowired
    private StockService stockService;

    public void setStockService(StockService stockService) {
		this.stockService = stockService;
	}
    
    @GetMapping("/stockDashboard")
    public String stockDashboard() {
    	return "/stock/stockDashboard";
    	
    }
    // 재고량
    @PostMapping("/chart10")
    public void Stock(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("[ChartController] /chart10");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        System.out.printf("Parameter: startDate(%s), endDate(%s)\n", startDate, endDate);
        
        List<StockVO> StockList = stockService.getStock(startDate, endDate);
        JSONArray jsonArray = stockService.JsonStockChange(StockList);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("SUM_STOCK", jsonArray);
        writer.print(jsonObject.toJSONString());
        System.out.println(jsonObject.toJSONString());
    }
    // 불량 
    @PostMapping("/chart11")
    public void FAL(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("[ChartController] /chart11");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        System.out.printf("Parameter: startDate(%s), endDate(%s)\n", startDate, endDate);
        
        List<StockVO> FalList = stockService.getFal(startDate, endDate);
        JSONArray jsonArray = stockService.JsonFalChange(FalList);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("SUM_FAL", jsonArray);
        writer.print(jsonObject.toJSONString());
        System.out.println(jsonObject.toJSONString());
    }
    // 각 공정 별 재고량
    @PostMapping("/chart12")
    public void doChart12(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("[ChartController] /chart12");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        System.out.printf("Parameter: startDate(%s), endDate(%s)\n", startDate, endDate);
        List<StockVO> energyFebstockList = stockService.getFebStock(startDate, endDate);
        
        JSONArray jsonArray = stockService.JsonFebStockChange(energyFebstockList);
         writer.print(jsonArray.toJSONString());
         System.out.println(jsonArray.toJSONString());   
    }
    // 각 공정 별 불량
    @PostMapping("/chart13")
    public void doChart13(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("[ChartController] /chart12");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        System.out.printf("Parameter: startDate(%s), endDate(%s)\n", startDate, endDate);
        List<StockVO> energyFebfalList = stockService.getFebFal(startDate, endDate);
        
        JSONArray jsonArray = stockService.JsonFebFalChange(energyFebfalList);
         writer.print(jsonArray.toJSONString());
         System.out.println(jsonArray.toJSONString());   
    }
    // 안전재고 대비  총 재고량차트 
    @PostMapping("/chart14")
    public void doChart14(HttpServletRequest request, HttpServletResponse response, Model model) throws ServletException, IOException {
        System.out.println("[ChartController] /chart14");

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        System.out.printf("Parameters: startDate(%s), endDate(%s)", startDate, endDate);
        
        List<StockVO> energyFebStockList = stockService.getFebStock(startDate, endDate);

        JSONArray jsonArray = stockService.JsonFebStockChange(energyFebStockList);

        writer.print(jsonArray.toJSONString());
        System.out.println(jsonArray.toJSONString());   
    }
}
   
