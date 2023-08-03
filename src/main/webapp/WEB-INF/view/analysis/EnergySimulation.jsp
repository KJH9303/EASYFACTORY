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
	
	// 데이터 가져오기
	function GetData() {
	    var production = $("#production").val();
	    if (production === '') {
	        alert('예상 생산량을 입력하세요');
	        return; 
	    }

	    // 사용자가 입력한 생산량 값을 elecData와 costData 변수에 저장합니다.
	    var feb_index_view_elec = "feb_index_view_elec";
	    var feb_index_view_cost = "feb_index_view_cost";
	    var process_feb = "process_feb";

	    $.ajax({
	        type: "GET",
	        url: "/feb/simulation",
	        dataType: "json",
	        data: {
	            feb_index_view_elec: feb_index_view_elec,
	            feb_index_view_cost: feb_index_view_cost,
	            process_feb: process_feb
	        },
	        success: function(response) {
	            if (response.Error) {
	                alert(response.Error);
	            } else {
	                // 가져온 데이터를 화면에 표시
	                var dataList = response;
	                console.log(dataList);
	                var html = '<table>';
	                html += '<tr><th>공정</th><th>전기 사용량(kWh)</th><th>비용(원)</th></tr>';
	                
	                for (var i = 0; i < dataList.length; i++) {
	                    var elecUsing = parseFloat(dataList[i].ELEC_USING);
	                    var indexCost = parseFloat(dataList[i].INDEX_COST);
	                    var process_feb = dataList[i].PROCESS_FEB;
	                    
	                    var elecUsingMultiplied = elecUsing * parseFloat(production);
	                    var indexCostMultiplied = indexCost * parseFloat(production);
	                    
	                    html += '<tr><td>' + process_feb + '</td><td>' + elecUsingMultiplied + '</td><td>' + indexCostMultiplied + '</td></tr>';
	                }
	                html += '</table>';
	                $('#smListArea').html(html);
	            }
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.log(`에러 발생:(/feb/simulation) ${errorThrown}`);
	        }
	    });
	}

</script>
</head>
<body>
	<div class="container">
		<h2>Energy Analysis Simulation</h2>
		
		<label for="production">예상 생산량:</label> 
		<input type="text" id="production" name="production" placeholder="예상 생산량 입력" required>
		
		<button type="button" id="calculateBtn" onclick="GetData()">Go</button>
		<div id="smListArea"></div>
		
	</div>
</body>
</html>
