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
<script src="../../../resources/feb/js/time.js"></script>
<script>

    // 타임스탬프를 저장할 변수
        var startTimeStamp;
        var startButtonClickTime;

        function onStartClick() {
            var startTime = document.getElementById("startTime").value;
            if (!startTime) {
                alert("작업 내용을 입력하세요.");
                return;
            }
            var currentDate = new Date();
            startTimeStamp = currentDate.getTime();
            startButtonClickTime = startTimeStamp;
            document.getElementById("workDetails").innerHTML = "작업 내용: " + startTime + "    ,시작 시간: " + (currentDate.toLocaleTimeString());
            
        }

        function onEndClick() {
            var endTime = document.getElementById("endTime").value; // "startTime" 대신 "endTime" 사용
            if (!endTime) {
                alert("작업 내용을 입력하세요.");
                return;
            }
            var currentDate = new Date();
            var endTimeStamp = currentDate.getTime();
            document.getElementById("workDetails").innerHTML += "<br>작업 종료: " + endTime + "    ,종료 시간: " + (currentDate.toLocaleTimeString());
            var duration = endTimeStamp - startTimeStamp;
            var durationInSeconds = duration / 1000;
            document.getElementById("workDetails").innerHTML += "<br>작업 소요 시간: " + durationInSeconds + "초";
        }

        // 함수를 추가하여 화면에 시간과 날짜를 출력합니다.
        function updateDateTime() {
            var currentDate = new Date();
            var dateElement = document.getElementById("date");
            var timeElement = document.getElementById("time");

            var dateString = currentDate.toLocaleDateString();
            var timeString = currentDate.toLocaleTimeString();

            dateElement.textContent = dateString;
            timeElement.textContent = timeString;
        }

</script>
</head>
<body>
    <p>Date: <span id="date"></span></p>
    <p>Time: <span id="time"></span></p>
    
    <div class="container">
        <h2>TAT(Time Around Time) Analysis System</h2>
    
        <label for="startTime">작업 시작:</label>
        <input type="text" id="startTime" name="startTime" placeholder="내용을 입력하세요." required>
        <button type="button" id="startBtn" onclick="onStartClick()">Start</button>
    
	    <label for="endTime">작업 종료:</label>
		<input type="text" id="endTime" name="endTime" placeholder="내용을 입력하세요." required>
		<button type="button" id="endBtn" onclick="onEndClick()">End</button>

        <!-- 작업 내용을 표시할 요소를 추가합니다 -->
        <p id="workDetails"></p>
    </div>
</body>
</html>
