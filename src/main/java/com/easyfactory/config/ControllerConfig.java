package com.easyfactory.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.member.controller.MemberController;
import com.member.dao.MemberDAO;
import com.member.service.MemberService;

@Configuration
public class ControllerConfig {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberDAO memberDAO;

	@Bean
	public MemberController memberController() {
		MemberController memberController = new MemberController();
		memberController.setMemberService(memberService);
		return memberController;
	}

}
