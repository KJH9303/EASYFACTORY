package com.easyfactory.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.energy.controller.EnergyController;
import com.energy.controller.StockController;
import com.energy.service.EnergyService;
import com.energy.service.StockService;
import com.feb.controller.FebController;
import com.feb.service.FebService;
import com.issue.controller.IssueController;
import com.issue.service.IssueService;
import com.issue.service.ReplyIssueService;
import com.member.controller.MemberController;
import com.member.service.MemberService;

@Configuration
public class ControllerConfig {

	@Autowired
	private MemberService memberService;
/*
	@Autowired
	private MemberDAO memberDAO;
*/
	@Autowired
	private FebService febService;
	
	@Autowired
	private EnergyService energyService;
	
	@Autowired
	private StockService stockService;
	
	@Autowired
	private IssueService issueService;
	
	@Autowired
	private ReplyIssueService replyIssueService;
	
	@Bean
	public MemberController memberController() {
		MemberController memberController = new MemberController();
		memberController.setMemberService(memberService);
		return memberController;
	}
	
	@Bean
	public FebController febController() {
		FebController febController = new FebController();
		febController.setFebService(febService);
		return febController;
	}
	
	@Bean
	public EnergyController energyController() {
		EnergyController energyController = new EnergyController();
		energyController.setEnergyService(energyService);
		return energyController;
	}
	@Bean
	public StockController stockController() {
		StockController stockController = new StockController();
		stockController.setStockService(stockService);
		return stockController;
	}
	
	@Bean
	public IssueController issueController() {
		IssueController issueController = new IssueController();
		issueController.setIssueService(issueService);
		issueController.setReplyIssueService(replyIssueService);
		return issueController;
	}

}
