<%@ page import="java.sql.*" %>
<%@ page import="org.json.*" %>
<%@ page import="org.json.simple.*"%>
<%@ page import="com.easyfactory.config.OracleInfo" %>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet resultSet = null;

    try {
        Class.forName(OracleInfo.driver);
        conn = DriverManager.getConnection(OracleInfo.url, OracleInfo.username, OracleInfo.password);

        String query = "SELECT * FROM feb1";
        pstmt = conn.prepareStatement(query);
        resultSet = pstmt.executeQuery();

        JSONArray jsonArray = new JSONArray();
        while (resultSet.next()) {
            JSONObject row = new JSONObject();
            row.put("opratio", resultSet.getDouble("opratio"));
            row.put("temp", resultSet.getInt("temp"));
            row.put("tr", resultSet.getInt("tr"));
            row.put("fal", resultSet.getInt("fal"));
            row.put("stock", resultSet.getInt("stock"));
            row.put("costs", resultSet.getInt("costs"));
            row.put("usingratio", resultSet.getDouble("usingratio"));
            row.put("hiredate", resultSet.getDate("hiredate").toString());
            jsonArray.add(row);
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonArray.toString());
    }
    catch (Exception e) {
        e.printStackTrace();
    }
    finally {
        if (resultSet != null) resultSet.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
