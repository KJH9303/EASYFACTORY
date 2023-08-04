package com.simulation.service;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Service;

import com.simulation.dao.SimulationDAO;

@Service
public class SimulationService {
	
	private SimulationDAO simulationDAO;

	public SimulationService(SimulationDAO simulationDAO) {
		this.simulationDAO = simulationDAO;
	}
	
	public JSONArray getSimulationIndexViewData(String feb_index_view_elec, String feb_index_view_cost) {
        return simulationDAO.getSimulationIndexViewData(feb_index_view_elec, feb_index_view_cost);
    }
}