package com.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.member.service.TestService;
import com.member.vo.TestVO;

@Controller
@RequestMapping("/")
public class TestController {
    private TestService testService;
    
    public void setTestService(TestService testService) {
		this.testService = testService;
	}
    
    @RequestMapping(value="/testSubmit", method=RequestMethod.POST)
    // public String postSignUp(@ModelAttribute CheckMemberVO checkMemberVO, Errors errors){
    public String postTest(@ModelAttribute TestVO testVO, Errors errors){
    	System.out.println("■■■■■■■■■■■■■■■■■ TestController : PostTest ■■■■■■■■■■■■■■■■■");
    	testService.check(testVO);
    	return "test";
    }

    @RequestMapping(value="/test", method=RequestMethod.GET)
    public String getTest(){
    	System.out.println("■■■■■■■■■■■■■■■■■ TestController : getTest ■■■■■■■■■■■■■■■■■");
        return "test";
    }
}