<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../../resources/feb/css/guideLines.css">
<title>Energy Simulation</title>
<link href="../../resources/img/logoicon.jpg" rel="shortcut icon" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	// 현재 날짜, 현재 시간 
	// yyyy/mm/dd 
	// hh/mm/ss
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

	setInterval(updateTime, 1000)

	function loadHTMLFile(targetSelector, url, callback) {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				document.querySelector(targetSelector).innerHTML = this.responseText;
				if (typeof callback === 'function') {
					callback();
				}
			}
		};
		xhttp.open("GET", url, true);
		xhttp.send();
	}
	
	// 데이터 가져오기 기능
	function GetData() {
	    var startTime = $("#startTime").val();
        // 유효성 검사
	    if (startTime === '') {
	        alert('작업 내용을 입력하세요.');
	        return; 
	    }

</script>
</head>
<body>
	<div class="container">
		<h2>T.A.T(Time Around Time) Analysis System</h2>
		
		<label for="startTime">작업 시작:</label> 
		<input type="text" id="startTime" name="startTime" placeholder="작업 내용" required>
		
		<button type="button" id="calculateBtn" onclick="GetData()">Start</button>
		<button type="button" id="calculateBtn" onclick="GetData()">End</button>
		
	</div>
</body>
</html>
