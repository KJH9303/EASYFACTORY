package com.feb.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.feb.service.FebService;
import com.feb.service.PoorService;
import com.feb.vo.FebVO;

@RestController
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
    public String selectData(HttpServletRequest request, HttpServletResponse response) {
    	List<FebVO> dataList = febService.getTableData("tableName");

        request.setAttribute("tableName", "테이블 이름");
        request.setAttribute("resultList", dataList); // 데이터를 JSP에 전달
        //request.getRequestDispatcher("resultList.jsp").forward(request, response); // JSP 페이지로 forwarding
        return "/resultList";
    }
    
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
