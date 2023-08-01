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
$(document).ready(function() {
	// 댓글등록 버튼을 눌렀을 때 댓글 작성 함수 실행
	$("#calculateBtn").on('click', function() {
		searchSm();
	});

	// 생산량 작성
	function searchSm() {
		const production = $('#production').val();

		if (production == '') {
			alert('예상 생산량을 입력하세요');
			return;
		}

		$.ajax({
			type : 'post',
			url : '/simulation/searchSm',
			data : {
				"production" : production,
			},

			success : function(data) {
				if (data === 'success') {
					viewSm();
				} else {
					alert('로그인 이후 이용해주시기 바랍니다.');
					location.href = "/member/login";
				}
			}
		}); // $.ajax
	}; // writeReply()
	
	
    function viewSm() {
        var production = $("#production").val();
        $.ajax({
            url: '/simulation/viewSm',
            type: 'post',
            data: {
            	"production" : production // 게시물 번호를 Ajax 요청 파라미터로 전달
            },
            success: function(simulationHtml) {
                $('#smListArea').html(simulationHtml);
            }
        });
    }
	
    viewSm();
    
});

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
</script>
</head>
<body>
	<div class="container">
		<h2>Energy Analysis Simulation</h2>
		<label for="production">예상 생산량:</label> 
		<input type="text" id="production" name="production" placeholder="예상 생산량 입력" required>

		<button type="button" id="calculateBtn">Go</button>
		<div id="smListArea"></div>
	</div>
</body>
</html>
