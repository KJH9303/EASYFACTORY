package com.feb.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChartController {
	final static int MAX_WEEK = 7;
	
	private com.feb.dao.SelectDao selectDAO;
	
	public ChartController(com.feb.dao.SelectDao selectDao) {
		this.selectDAO = selectDao;
	}

	@GetMapping("/chart2")
	@ResponseBody
	public List<Integer> chart2(@RequestParam int num, @RequestParam int max) {
	    List<Integer> data = new ArrayList<>();
	    for (int i = 0; i < num; i++) {
	        data.add((int) (Math.random() * max));
	    }
	    return data;
	}

}
	

