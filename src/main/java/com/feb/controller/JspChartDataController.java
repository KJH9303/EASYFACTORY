package com.feb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.feb.dao.FebDAO;
import com.feb.vo.FebVO;

import java.util.List;

@Controller
@RequestMapping("/Chart")
public class JspChartDataController {

    @Autowired
    private FebDAO febDAO;

    @RequestMapping(value = "/indexChart", method = RequestMethod.GET)
    public String getChartData1(Model model) {
        List<FebVO> feb1 = febDAO.getChartData1();
        model.addAttribute("feb1", feb1);
        return "/TableFeb1";
    }
    
    @RequestMapping(value = "/indexChart", method = RequestMethod.GET)
    public String getChartData2(Model model) {
        List<FebVO> feb2 = febDAO.getChartData2();
        model.addAttribute("feb2", feb2);
        return "/TableFeb2";
    }
    
    @RequestMapping(value = "/indexChart", method = RequestMethod.GET)
    public String getChartData3(Model model) {
        List<FebVO> feb3 = febDAO.getChartData3();
        model.addAttribute("feb3", feb3);
        return "/TableFeb3";
    }
    
    @RequestMapping(value = "/indexChart", method = RequestMethod.GET)
    public String getChartData4(Model model) {
        List<FebVO> feb4 = febDAO.getChartData4();
        model.addAttribute("feb4", feb4);
        return "/TableFeb4";
    }
    
    @RequestMapping(value = "/indexChart", method = RequestMethod.GET)
    public String getChartData5(Model model) {
        List<FebVO> feb5 = febDAO.getChartData5();
        model.addAttribute("feb5", feb5);
        return "/TableFeb5";
    }
    
    @RequestMapping(value = "/indexChart", method = RequestMethod.GET)
    public String getChartData6(Model model) {
        List<FebVO> feb6 = febDAO.getChartData6();
        model.addAttribute("feb6", feb6);
        return "/TableFeb6";
    }
    
    @RequestMapping(value = "/indexChart", method = RequestMethod.GET)
    public String getChartData7(Model model) {
        List<FebVO> feb7 = febDAO.getChartData7();
        model.addAttribute("feb7", feb7);
        return "/TableFeb7";
    }
    
    @RequestMapping(value = "/indexChart", method = RequestMethod.GET)
    public String getChartData8(Model model) {
        List<FebVO> feb8 = febDAO.getChartData8();
        model.addAttribute("feb8", feb8);
        return "/TableFeb8";
        
    }
}
