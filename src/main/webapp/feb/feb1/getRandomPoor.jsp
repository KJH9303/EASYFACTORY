<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.feb.dao.PoorDAO" %>
<%
    PoorDAO poorDAO = new PoorDAO();
    String result = poorDAO.getRandomDefect();
    out.print(result);
%>
