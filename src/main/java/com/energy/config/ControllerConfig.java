package com.energy.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.energy.controller.EnChartController;
import com.energy.dao.EnergyDao;


@Configuration
public class ControllerConfig {
	
	
	@Autowired
	private EnergyDao energyDao;


	@Bean
	public EnChartController enchartController() {
		return new EnChartController(energyDao);
	}
	
}
