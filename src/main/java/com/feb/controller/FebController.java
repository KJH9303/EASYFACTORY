package com.feb.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

    // 엑셀 파일 다운로드
    @GetMapping("/download-data-feb1")
    public void downloadDatafeb1(HttpServletRequest request, HttpServletResponse response) 
    		 throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tableName = "feb1";
        
        try {
            JSONArray jsonArray = febService.downloadData(tableName);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
            
            // System.out.println(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @GetMapping("/download-data-feb2")
    public void downloadDatafeb2(HttpServletRequest request, HttpServletResponse response) 
    		 throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tableName = "feb2";

        try {
            JSONArray jsonArray = febService.downloadData(tableName);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
            
            System.out.println(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @GetMapping("/download-data-feb3")
    public void downloadDatafeb3(HttpServletRequest request, HttpServletResponse response) 
    		 throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tableName = "feb3";
        
        try {
            JSONArray jsonArray = febService.downloadData(tableName);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @GetMapping("/download-data-feb4")
    public void downloadDatafeb4(HttpServletRequest request, HttpServletResponse response) 
    		 throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tableName = "feb4";
        
        try {
            JSONArray jsonArray = febService.downloadData(tableName);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @GetMapping("/download-data-feb5")
    public void downloadDatafeb5(HttpServletRequest request, HttpServletResponse response) 
    		 throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tableName = "feb5";
        
        try {
            JSONArray jsonArray = febService.downloadData(tableName);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @GetMapping("/download-data-feb6")
    public void downloadDatafeb6(HttpServletRequest request, HttpServletResponse response) 
    		 throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tableName = "feb6";
        
        try {
            JSONArray jsonArray = febService.downloadData(tableName);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @GetMapping("/download-data-feb7")
    public void downloadDatafeb7(HttpServletRequest request, HttpServletResponse response) 
    		 throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tableName = "feb7";
        
        try {
            JSONArray jsonArray = febService.downloadData(tableName);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @GetMapping("/download-data-feb8")
    public void downloadDatafeb8(HttpServletRequest request, HttpServletResponse response) 
    		 throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tableName = "feb8";
        
        try {
            JSONArray jsonArray = febService.downloadData(tableName);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 데이터 가져오기
    @GetMapping("/select-data-feb1")
    public void selectDatafeb1(HttpServletRequest request, HttpServletResponse response) 
    		 throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tableName = "feb1";
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        System.out.println("### select-data: "+ startDate + " -> "+ endDate);

        try {
            JSONArray jsonArray = febService.selectDataHiredate(tableName, startDate, endDate);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
    @GetMapping("/select-data-feb2")
    public void selectDatafeb2(HttpServletRequest request, HttpServletResponse response) 
    		 throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tableName = "feb2";
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        System.out.println("### select-data: "+ startDate + " -> "+ endDate);

        try {
            JSONArray jsonArray = febService.selectDataHiredate(tableName, startDate, endDate);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @GetMapping("/select-data-feb3")
    public void selectDatafeb3(HttpServletRequest request, HttpServletResponse response) 
    		 throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tableName = "feb3";
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        System.out.println("### select-data: "+ startDate + " -> "+ endDate);

        try {
            JSONArray jsonArray = febService.selectDataHiredate(tableName, startDate, endDate);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @GetMapping("/select-data-feb4")
    public void selectDatafeb4(HttpServletRequest request, HttpServletResponse response) 
    		 throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tableName = "feb4";
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        System.out.println("### select-data: "+ startDate + " -> "+ endDate);

        try {
            JSONArray jsonArray = febService.selectDataHiredate(tableName, startDate, endDate);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @GetMapping("/select-data-feb5")
    public void selectDatafeb5(HttpServletRequest request, HttpServletResponse response) 
    		 throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tableName = "feb5";
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        System.out.println("### select-data: "+ startDate + " -> "+ endDate);

        try {
            JSONArray jsonArray = febService.selectDataHiredate(tableName, startDate, endDate);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @GetMapping("/select-data-feb6")
    public void selectDatafeb6(HttpServletRequest request, HttpServletResponse response) 
    		 throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tableName = "feb6";
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        System.out.println("### select-data: "+ startDate + " -> "+ endDate);

        try {
            JSONArray jsonArray = febService.selectDataHiredate(tableName, startDate, endDate);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @GetMapping("/select-data-feb7")
    public void selectDatafeb7(HttpServletRequest request, HttpServletResponse response) 
    		 throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tableName = "feb7";
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        System.out.println("### select-data: "+ startDate + " -> "+ endDate);

        try {
            JSONArray jsonArray = febService.selectDataHiredate(tableName, startDate, endDate);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @GetMapping("/select-data-feb8")
    public void selectDatafeb8(HttpServletRequest request, HttpServletResponse response) 
    		 throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String tableName = "feb8";
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        System.out.println("### select-data: "+ startDate + " -> "+ endDate);

        try {
            JSONArray jsonArray = febService.selectDataHiredate(tableName, startDate, endDate);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @RequestMapping(value="/Defect", produces="application/text;charset=UTF-8", method=RequestMethod.GET)
    @ResponseBody
    public String DefectService(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
    	String result = febService.getRandomDefect();
        
        return result;
    }
}
