<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.feb.service.PoorService" %>
<%
	PoorService poorService = new PoorService();
    String result = poorService.getRandomPoor();
    out.print(result);
%>
