<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Process Table</title>
</head>
<body>
    <h1>Process Table</h1>

    <%-- JDBC 연결 정보 --%>
    <%@ page import="java.sql.*" %>
    <% String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
       String username = "EASYFACTORY";
       String password = "1234";

       String selectQuery = "SELECT * FROM PROCESS";

       try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
            PreparedStatement selectStatement = connection.prepareStatement(selectQuery);
            ResultSet resultSet = selectStatement.executeQuery()) {
    %>
        <table border="1">
            <tr>
                <th>opratio</th>
                <th>tr</th>
                <th>fal</th>
                <th>stock</th>
                <th>costs</th>
                <th>usingratio</th>
                <th>hiredate</th>
            </tr>
            <% while (resultSet.next()) { %>
                <tr>
                    <td><%= resultSet.getDouble("opratio") %></td>
                    <td><%= resultSet.getInt("tr") %></td>
                    <td><%= resultSet.getInt("fal") %></td>
                    <td><%= resultSet.getInt("stock") %></td>
                    <td><%= resultSet.getInt("costs") %></td>
                    <td><%= resultSet.getDouble("usingratio") %></td>
                    <td><%= resultSet.getDate("hiredate") %></td>
                </tr>
            <% } %>
        </table>
    <% } catch (SQLException e) {
           e.printStackTrace();
       }
    %>
</body>
</html>
