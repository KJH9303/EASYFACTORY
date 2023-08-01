<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  	<link rel="stylesheet" href="../../../resources/feb/css/guideLines.css">
	<title>Energy Simulation</title>
  	<link href="../../resources/img/logoicon.jpg" rel="shortcut icon" type="image/x-icon">
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
	  
	  window.addEventListener('load', updateTime);
  	</script>
</head> 
<body>
	<div class="container">
	    <table>
	        <thead>
	            <tr>
	                <th>공정 명</th>
	                <th>난이도</th>
	                <th>전기사용량 (kWh)</th>
	                <th>생산량</th>
	                <th>전기사용 비용</th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td>1공정: 웨이퍼 제조</td>
	                <td>20</td>
	                <td>40</td>
	                <td>90</td>
	                <td>200</td>
	            </tr>
	            <tr>
	                <td>2공정: 산화 공정</td>
	                <td>30</td>
	                <td>50</td>
	                <td>90</td>
	                <td>300</td>
	            </tr>
	            <tr>
	                <td>3공정: 포토(Photo)공정</td>
	                <td>40</td>
	                <td>80</td>
	                <td>80</td>
	                <td>400</td>
	            </tr>
	            <tr>
	                <td>4공정: 식각(Etch)공정</td>
	                <td>70</td>
	                <td>80</td>
	                <td>80</td>
	                <td>700</td>
	            </tr>
	            <tr>
	                <td>5공정: 이온주입(Implant) 공정</td>
	                <td>60</td>
	                <td>80</td>
	                <td>80</td>
	                <td>600</td>
	            </tr>
	            <tr>
	                <td>6공정: 금속배선 공정</td>
	                <td>100</td>
	                <td>60</td>
	                <td>70</td>
	                <td>1000</td>
	            </tr>
	            <tr>
	                <td>7공정: EDS 공정</td>
	                <td>80</td>
	                <td>50</td>
	                <td>80</td>
	                <td>800</td>
	            </tr>
	            <tr>
	                <td>8공정: 패키징(Packaging) 공정</td>
	                <td>50</td>
	                <td>70</td>
	                <td>90</td>
	                <td>500</td>
	            </tr>
	        </tbody>
	    </table>
    </div>
</body>
</html>
