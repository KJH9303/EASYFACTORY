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

		var row = document.createElement("tr");
		var cell1 = document.createElement("td");
		var cell2 = document.createElement("td");
		var cell3 = document.createElement("td");
		var cell4 = document.createElement("td");
		var cell5 = document.createElement("td");

		cell1.textContent = startTime;
		cell2.textContent = currentDate.toLocaleTimeString();
		cell3.textContent = "-";
		cell4.textContent = "-";
		cell5.textContent = "-";
		
		row.appendChild(cell1);
		row.appendChild(cell2);
		row.appendChild(cell3);
		row.appendChild(cell4);
		row.appendChild(cell5);
		document.getElementById("workDetails").appendChild(row);
	}

	function onEndClick() {
		var endTime = document.getElementById("endTime").value;
		if (!endTime) {
			alert("작업 내용을 입력하세요.");
			return;
		}
		var currentDate = new Date();
		var endTimeStamp = currentDate.getTime();
		endButtonClickTime = endTimeStamp; 

		var rows = document.getElementById("workDetails").getElementsByTagName(
				"tr");
		var lastRow = rows[rows.length - 1];
		var cells = lastRow.getElementsByTagName("td");

		cells[2].textContent = endTime;
		cells[3].textContent = currentDate.toLocaleTimeString();
		cells[4].textContent = getDuration(endTimeStamp - startTimeStamp);
		
		console.log(cells[4].textContent);
	}

	function getDuration(duration) {
		if (duration) {
			var hours = Math.floor(duration / 3600000);
			var minutes = Math.floor((duration % 3600000) / 60000);
			var seconds = Math.floor((duration % 60000) / 1000);
			return hours + "시 " + minutes + "분 " + seconds + "초";
		} else {
			return "-";
		}
	}

</script>
</head>
<body>
    
    <div class="container">
        <h2>TAT(Time Around Time) Management System</h2>
    
        <label for="startTime">작업 시작:</label>
        <input type="text" id="startTime" name="startTime" placeholder="내용을 입력하세요." required>
        <button type="button" id="startBtn" onclick="onStartClick()">Start</button>
    
	    <label for="endTime">작업 종료:</label>
		<input type="text" id="endTime" name="endTime" placeholder="내용을 입력하세요." required>
		<button type="button" id="endBtn" onclick="onEndClick()">End</button>

        <!-- 작업 내용을 표시할 요소를 추가합니다 -->
         <table id="workTable">
            <thead>
                <tr>
                    <th>작업 내용</th>
                    <th>시작 시간</th>
                    <th>작업 내용</th>
                    <th>종료 시간</th>
                    <th>작업 소요 시간</th>
                </tr>
            </thead>
            <tbody id="workDetails"></tbody>
        </table>
    </div>
</body>
</html>
