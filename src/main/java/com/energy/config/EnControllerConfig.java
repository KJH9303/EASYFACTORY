package com.energy.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.energy.dao.EnergyDao;
import com.energy.dao.EnergyDao1;
import com.energy.controller.OpratioController;
import com.energy.controller.TempController;



@Configuration
public class EnControllerConfig {
	
	@Autowired
	private EnergyDao1 energyDao1;
	
	@Bean
	public OpratioController opratioController() {
		return new OpratioController(energyDao1);
		
	}
	@Bean
	public TempController tempController() {
		return new TempController(energyDao1);
		
	}
}
