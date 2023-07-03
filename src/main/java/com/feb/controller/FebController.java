package com.feb.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.feb.service.FebService;
import com.feb.vo.FebVO;

@RestController
public class FebController {
    
    @Autowired
    private FebService febService;
    
    public void setFebService(FebService febService) {
		this.febService = febService;
	}
    
    /*
     * startDate와 endDate는 필수적으로 입력을 받아야함.
     * yyyy-MM-dd 형태로 입력받도록 요청파라미터를 어노테이션을 활용하여 변환함.
     */
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
}
