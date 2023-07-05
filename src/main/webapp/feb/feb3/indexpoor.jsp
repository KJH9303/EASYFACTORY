<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ page import="com.feb.service.PoorService" %> 
<%@ page import="java.util.ArrayList" %>
<html> 
<head> 
    <title>랜덤 불량 현황</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            function updateRandomDefect() {
                $.ajax({
                    url: "getRandomPoor.jsp",
                    success: function(result) {
                        $('#currentDefect').text(result);
                        $('#previousDefects').prepend('<li>' + result + '</li>');
                    },
                    complete: function() {
                        setTimeout(updateRandomDefect, 2000);
                    }
                });
            }
            updateRandomDefect();
        });
    </script> 
</head> 
<body> 
    <h1>실시간 불량 현황</h1> 
    <p id="currentDefect"></p>
    <h2>이전 불량 현황</h2>
    <ul id="previousDefects">
    </ul>
</body> 
</html>
