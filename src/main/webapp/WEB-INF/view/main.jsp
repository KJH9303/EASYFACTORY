<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <title>MainPage</title>
    <link rel="stylesheet" href="../../../resources/main/css/main.css" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
    	/*
    	var code = $("#code").val();
    	if(code == 'INTERNAL'){
    		alert("내부인입니다.");
    	}
    	if(code == 'EXTERNAL'){
    		alert("외부인입니다. 해당 페이지에 접근할 수 없습니다.");
    	}*/
    	
    	// 회원정보 수정
    	$("#memUpdateBtn").on('click', function() {
			location.href="/member/updateCheck";
		});
    	
    	// 로그아웃
    	$("#logoutBtn").on('click', function() {
    		alert("로그아웃 되었습니다.")
			location.href="/member/logout";
		});
    	
    	// febTest2
    	$("#febTestBtn").on('click', function() {
			location.href="/feb/febTest2";
		});
    	
    	$("#issueList").on('click', function() {
    		var id = $("#id").val();
    		if(id == null || id == "") {
    			var result = confirm("로그인 하세요.");
    			if(result){
    			    location.href="/member/login";
    			}else{
    			    alert("취소하였습니다.");
    			    location.href="/main";
    			}
    		} else if(id != null || id != "") {
    			location.href="/issue/list";
    		}
		});
    	
    	$("#writeBtn").on('click', function() {
			location.href="/issue/write";
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
        <li>
        	<a id="issueList">ISSUE</a>
        	<input type="text" id="id" value="${member.id}">
        </li>
    </ul>
</div>
<div class="main">
	<c:if test="${member.id == null}">
		<p><a href="/member/login"> 로그인 </a></p>
		<p><a href="/member/signup"> 회원가입 </a></p>
	</c:if>
	<c:if test="${member.id != null}">
		<p>${member.id} 님 환영합니다.</p>
		<p>${member.name} 님 환영합니다.</p>
		<p>내/외부인 : ${member.code}</p>
		<p>부서/거래처명 : ${member.department}</p>
		<p>이메일 : ${member.email}</p>
		<p>연락처 : ${member.phone}</p>
		<button type="button" id="memUpdateBtn">회원정보 수정</button>
		<button type="button" id="logoutBtn">로그아웃</button>
	</c:if>
	<c:if test="${member.code == 'INTERNAL'}">
		<p>${member.code} 내부인입니다.</p>
		<input type="text" id="code" value="${member.code}">
	</c:if>
	<c:if test="${member.code == 'EXTERNAL'}">
		<p>${member.code} 외부인입니다.</p>
		<input type="text" id="code" value="${member.code}">
	</c:if>
	<button type="button" id="febTestBtn">feb 테스트</button>
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
