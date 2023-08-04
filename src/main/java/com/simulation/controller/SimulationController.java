package com.simulation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.simulation.service.SimulationService;


@Controller
@RequestMapping("/analysis")
public class SimulationController {
    
    @Autowired
    private SimulationService simulationService;
    
    public void setSimulationService(SimulationService simulationService) {
		this.simulationService = simulationService;
	}
    
    @GetMapping("/simulation")
    public void getFebIndexViewData(HttpServletRequest request, HttpServletResponse response) 
    		 throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String feb_index_view_elec = request.getParameter("feb_index_view_elec");
        String feb_index_view_cost = request.getParameter("feb_index_view_cost");
        
        try {
            JSONArray jsonArray = simulationService.getSimulationIndexViewData(feb_index_view_elec, feb_index_view_cost);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
