package com.feb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.feb.service.UpdateFebService;

@Controller
public class SchedulerController {
	final static int MAX_WEEK = 7;
	
	UpdateFebService febService;
	
	private com.feb.dao.SelectDao selectDAO;
	
	
	public SchedulerController(UpdateFebService febService) {
		this.febService = febService;
	}
	
	public SchedulerController(com.feb.dao.SelectDao selectDao) {
		this.selectDAO = selectDao;
	}

	@GetMapping("/febstart")
	public void startFeb(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if(session != null) {
			febService.startUpdateFeb();
		}
	}

	@GetMapping("/febstop")
	public void stopeb() {
		febService.stopUpdateFeb();
	}

}
	

