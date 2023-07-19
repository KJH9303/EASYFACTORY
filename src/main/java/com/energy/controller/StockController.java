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
    public void doChart10(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        List<StockVO> StockList = stockService.getStock(startDate, endDate);
        JSONArray jsonArray = stockService.JsonStockChange(StockList);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("SUM_STOCK", jsonArray);
        writer.print(jsonObject.toJSONString());
    }
    // 불량 
    @PostMapping("/chart11")
    public void doChart11(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        List<StockVO> FalList = stockService.getFal(startDate, endDate);
        JSONArray jsonArray = stockService.JsonFalChange(FalList);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("SUM_FAL", jsonArray);
        writer.print(jsonObject.toJSONString());
    }
    // 각 공정 별 재고량
    @PostMapping("/chart12")
    public void doChart12(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        List<StockVO> energyFebstockList = stockService.getFebStock(startDate, endDate);
        
        JSONArray jsonArray = stockService.JsonFebStockChange(energyFebstockList);
         writer.print(jsonArray.toJSONString());
    }
    // 각 공정 별 불량
    @PostMapping("/chart13")
    public void doChart13(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        List<StockVO> energyFebfalList = stockService.getFebFal(startDate, endDate);
        
        JSONArray jsonArray = stockService.JsonFebFalChange(energyFebfalList);
         writer.print(jsonArray.toJSONString());
    }
    // 안전재고 대비  총 재고량차트 
    @PostMapping("/chart14")
    public void doChart14(HttpServletRequest request, HttpServletResponse response, Model model) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        PrintWriter writer = response.getWriter();
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        List<StockVO> energyFebStockList = stockService.getFebStock(startDate, endDate);

        JSONArray jsonArray = stockService.JsonFebStockChange(energyFebStockList);

        writer.print(jsonArray.toJSONString());
    }
}
   
