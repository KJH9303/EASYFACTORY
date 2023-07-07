package com.feb.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.feb.service.FebService;
import com.feb.vo.FebVO;

@Controller
@RequestMapping("/feb")
public class FebController {
    
    @Autowired
    private FebService febService;
    
    public void setFebService(FebService febService) {
		this.febService = febService;
	}

    @GetMapping("/fetch-data")
    public List<FebVO> fetchData(@RequestParam("start_date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
                             @RequestParam("end_date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate) {
        List<FebVO> data = febService.getDatePickerData(startDate, endDate);
        return data;
    }
    
    @GetMapping("/select-data")
    @ResponseBody
    public void selectData(HttpServletResponse response) {
        try {
            JSONArray jsonArray = febService.selectData();

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
    @GetMapping("/select-data")
    public String getTableData(HttpServletRequest request, HttpServletResponse response) {
    	String feb = "feb1";
    	List<FebVO> dataList = febService.getTableData(feb);
    	System.out.println("[ChartController] /chart2");

        request.setAttribute("feb1", "feb1");
        request.setAttribute("resultList", dataList); 
        //request.getRequestDispatcher("indexChart.jsp").forward(request, response); // JSP 페이지로 forwarding
        return "/indexChart";
    }
    */
    
    @RequestMapping("/datepicker")
    public String index() {
        return "datepicker";
    }
    
    
    ////////////////////////
    @RequestMapping(value="/febUpdateTest", method=RequestMethod.POST)
    public String index(HttpServletRequest request) {
    	System.out.println("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
    	String run = request.getParameter("run");
    	febService.startUpdateFeb(run);
		return "";
    }
    /////////////////////////
	
    @RequestMapping(value="/Defect", produces="application/text;charset=UTF-8", method=RequestMethod.GET)
    @ResponseBody
    public String DefectService(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
    	String result = febService.getRandomDefect();
        System.out.println("result: " + result);
        
        return result;
    }
}
