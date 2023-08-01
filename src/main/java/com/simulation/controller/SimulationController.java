package com.simulation.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simulation.service.SimulationService;
import com.simulation.vo.FebIndexVO;

@Controller
@RequestMapping("/simulation")
public class SimulationController {
    
    @Autowired
    private SimulationService simulationService;
    
    public void setSimulationService(SimulationService simulationService) {
		this.simulationService = simulationService;
	}
    
    // Energy Analysis Simulation
    @RequestMapping(value="/searchSm", method=RequestMethod.POST)
    @ResponseBody
    public String searchSm(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
    	String production = request.getParameter("production") == null ? "feb1" : request.getParameter("production");
    	double elec = simulationService.simulation_Elec_VO(production);
    	double cost = simulationService.simulation_Cost_VO(production);
    	
    	List<Double> smList = new ArrayList<>();
    	smList.add(elec);
    	smList.add(cost);
    	
    	model.addAttribute("smList", smList);
    	
    	System.out.println(smList);
    	
    	return "success";
    }
    
 // 댓글 출력 ajax
    @RequestMapping(value="/viewSm", method=RequestMethod.POST)
    public String viewsm(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
    	String production = request.getParameter("production") == null ? "feb1" : request.getParameter("production");
    	double elec = simulationService.simulation_Elec_VO(production);
    	double cost = simulationService.simulation_Cost_VO(production);
    	
    	List<Double> smList = new ArrayList<>();
    	smList.add(elec);
    	smList.add(cost);
    	
    	model.addAttribute("smList", smList);
    	
    	System.out.println(smList);
    	return "analysis/viewsm";
    }
}