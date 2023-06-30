package com.feb.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.feb.dao.SelectDao;
import com.feb.vo.FebVO;

public class SelectController {

	@WebServlet("/select")
	public class YourController extends HttpServlet {
	    private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // 처리할 로직 및 데이터 요청
	        // 예: selectDAO 객체에서 getTableData 메서드를 호출하는 경우
	        List<FebVO> dataList = SelectDao.getTableData("tableName");

	        request.setAttribute("tableName", "테이블 이름");
	        request.setAttribute("resultList", dataList); // 데이터를 JSP에 전달
	        request.getRequestDispatcher("resultList.jsp").forward(request, response); // JSP 페이지로 forwarding
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        doGet(request, response);
	    }
	}

}
