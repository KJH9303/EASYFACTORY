<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <title>MainPage</title>
    <link rel="stylesheet" href="../resources/css/Main.css" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
    	
    	// 회원정보 수정
    	$("#memUpdateBtn").on('click', function() {
			location.href="/update";
		});
    	
    	// 로그아웃
    	$("#logoutBtn").on('click', function() {
			location.href="/logout";
		});
    	
        function updateTime() {
            var currentTime = new Date();
            var hours = currentTime.getHours();
            var minutes = currentTime.getMinutes();
            var seconds = currentTime.getSeconds();
            var year = currentTime.getFullYear();
            var month = ("0" + (currentTime.getMonth() + 1)).slice(-2);
            var day = ("0" + currentTime.getDate()).slice(-2);
    
            hours = ("0" + hours).slice(-2);
            minutes = ("0" + minutes).slice(-2);
            seconds = ("0" + seconds).slice(-2);
    
            var timeString = hours + ":" + minutes + ":" + seconds;
            var dateString = year + "/" + month + "/" + day;
    
            document.getElementById("time").innerHTML = timeString;
            document.getElementById("date").innerHTML = dateString;
        }
        setInterval(updateTime, 1000);
    });
    </script>
</head>
<body>
	<div class="header">
	    <div class="header-left">
	        <h2>Easy Factory</h2>
	    </div>
	    <div class="header-right">
	        <div class="current-time">
	            <span id="date"></span>
	            <br>
	            <span id="time"></span>
	        </div>
	    </div>
	</div>
	<input type="checkbox" class="openSidebarMenu" id="openSidebarMenu">
	<label for="openSidebarMenu" class="sidebarIconToggle">
	    <div class="spinner diagonal part-1"></div>
	    <div class="spinner horizontal"></div>
	    <div class="spinner diagonal part-2"></div>
	</label>
	<div id="sidebarMenu">
	    <ul class="sidebarMenuInner">
	        <li>Main<span>page</span></li>
	        <li><a>1</a></li>
	        <li><a>2</a></li>
	        <li><a>3</a></li>
	        <li><a>4</a></li>
	        <li><a>5</a></li>
	    </ul>
	</div>
	<div class="main">
		<div>
			<table style="border:1px solid black">
				<tr style="border:1px solid black">
					<th style="border:1px solid black">
						아이디
					</th>
					<td style="border:1px solid black">
						${member.id}
					</td>
				</tr>
				<tr style="border:1px solid black">
					<td style="border:1px solid black">
						${member.id}
					</td>
					<td style="border:1px solid black">
						${member.name}
					</td>
				</tr>
			</table>
		</div>
		
	    <div class="mainInner">
	        <div>PURE CSS SIDEBAR TOGGLE MENU</div>
	    </div>
	    <div class="mainInner">
	        <div>PURE CSS SIDEBAR TOGGLE MENU</div>
	    </div>
	    <div class="mainInner">
	        <div>PURE CSS SIDEBAR TOGGLE MENU</div>
	    </div>
	</div>
</body>
</html>
