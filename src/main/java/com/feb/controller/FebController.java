package com.feb.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easyfactory.config.OracleInfo;
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
    public String selectData(HttpServletRequest request, HttpServletResponse response) throws SQLException {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet resultSet = null;
        try {

            Class.forName(OracleInfo.driver);
            conn = DriverManager.getConnection(OracleInfo.url, OracleInfo.username, OracleInfo.password);

            String query = "SELECT * FROM feb1";
            pstmt = conn.prepareStatement(query);
            resultSet = pstmt.executeQuery();

            JSONArray jsonArray = new JSONArray();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
            while (resultSet.next()) {
                JSONObject row = new JSONObject();
                row.put("opratio", resultSet.getDouble("opratio"));
                row.put("temp", resultSet.getInt("temp"));
                row.put("tr", resultSet.getInt("tr"));
                row.put("fal", resultSet.getInt("fal"));
                row.put("stock", resultSet.getInt("stock"));
                row.put("costs", resultSet.getInt("costs"));
                row.put("usingratio", resultSet.getDouble("usingratio"));
                row.put("hiredate", resultSet.getDate("hiredate").toString());
                jsonArray.add(row);
            }

        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if (resultSet != null) resultSet.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
        return "/feb/indexChart";
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
