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
    	
    	// 로그아웃
    	$("#cancelBtn").on('click', function() {
			location.href="/main";
		});
    	
    	// 로그인
		$("#loginBtn").on('click', function() {
			var id = $("#id").val();
			var pw = $("#pw").val();
			var idRegExp = /[^A-Za-z0-9]/gi;
			
			if (pw == '') {
				$("#message").text("비밀번호를 입력하세요");
		        $('#pw').focus();
		        return;
		    }
			
			if (id.trim().length != 0 && pw.trim().length != 0) {
				$.ajax({
			        url: "/updateCheck",
			        type: "POST",
			        data: {
			        	id: id
			        	, pw: pw
			        	},
			        success: function (result) {
			            if (result === "exist") {
			                alert("확인되었습니다.")
			                $("#updateForm").submit();
			            } else {
			                $("#message").text("아이디 또는 비밀번호가 틀립니다.");
			            	return;
			            }
			        },
			        error: function (xhr, status, error) {
			            console.error(error);
			        }
			    });
			}else {
				alert('입력값을 다시 확인하세요');
		        $('#id').focus();
		    }
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
	<div class="formContainer">
		<div class="signin">
			<form id="updateForm" name="updateForm" action="updateSubmit" method="post">
				<div class="input-group">
					<i class="fa fa-envelope"></i> 
					<input type="text" id="id" name="id" placeholder="id">
				</div>
				<div class="input-group">
					<i class="fa fa-unlock-alt"></i>
					<input type="password" id="pw" name="pw" placeholder="Password">
				</div>
					<div id="message"></div>
				
				
				<button type="button" id="updateBtn" style="text-decoration-line: none;">Confirm</button>
				<button type="button" id="cancelBtn" style="text-decoration-line: none;">Cancel</button>
			</form>
		</div>
	</div>
	<div class="main">
	    <div class="mainInner">
	        <div>
	        	<input type="text" name="id" value="${member.id}" readonly>
	        </div>
	        <div>
	        	<input type="text" name="pw">
        	</div>
	    </div>
	</div>
</body>
</html>
