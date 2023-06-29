package com.ajaxEx.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.ajaxEx.controllers.AjaxController;
import com.ajaxEx.controllers.JsonController;
import com.ajaxEx.controllers.LoginController;
import com.ajaxEx.controllers.MemberController;
import com.ajaxEx.members.MemberDao;


@Configuration
public class ControllerConfig {
	
	@Autowired
	private MemberDao memberDao;

	@Bean
	public LoginController loginController() {
		return new LoginController();
	}

	
	@Bean
	public JsonController jsonController() {
		return new JsonController();
	}
	
	@Bean
	public AjaxController ajaxController() {
		return new AjaxController();
	}
	
	@Bean
	public MemberController memberController() {
		return new MemberController(memberDao);
	}

	
}
