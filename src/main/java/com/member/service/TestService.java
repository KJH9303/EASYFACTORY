package com.member.service;

import java.time.LocalDateTime;

import com.member.dao.TestDAO;
import com.member.vo.TestVO;


public class TestService {
	private TestDAO testDAO;
	
	public TestService(TestDAO testDAO) {
		System.out.println("■■■■■■■■■■■■■■■■■ TestService : TestDAO ■■■■■■■■■■■■■■■■■");
		this.testDAO = testDAO;
	}

	public TestVO check(TestVO testVO) {
		System.out.println("■■■■■■■■■■■■■■■■■ MemberService : check ■■■■■■■■■■■■■■■■■");
		LocalDateTime dateTime = LocalDateTime.now(); // Initialize with the current date and time
        int hiredate = dateTime.getYear();
    	System.out.println("hiredate : " + hiredate);
    	
		testDAO.insertIntofeb1(hiredate);
		return testVO;
	}
}
