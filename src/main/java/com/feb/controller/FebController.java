package com.feb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.feb.service.FebService;

@Controller
@RequestMapping("/feb")
public class FebController {
    
    @Autowired
    private FebService febService;
    
    public void setFebService(FebService febService) {
		this.febService = febService;
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
