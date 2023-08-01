package com.simulation.service;

import org.springframework.stereotype.Service;

import com.simulation.dao.SimulationDAO;

@Service
public class SimulationService {
	
	private SimulationDAO simulationDAO;

	public SimulationService(SimulationDAO simulationDAO) {
		this.simulationDAO = simulationDAO;
	}

	// 전기사용량 가져오기
    public double simulation_Elec_VO(String production) {
        return simulationDAO.simulation_Elec_VO(production);
    }

    // 비용 가져오기
    public double simulation_Cost_VO(String production) {
        return simulationDAO.simulation_Cost_VO(production);
    }
}