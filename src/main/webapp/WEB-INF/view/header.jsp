<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>header</title>
    <link href="../../../resources/main/css/header.css" rel="stylesheet">
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
            
            $("#feb1").on('click', function() {
            	var id = $("#id").val();
            	var code = $("#code").val();
            	
            	if (id == null || id == "") {
            		
            		var result = confirm("로그인 하세요.");
            		if(result){
                        location.href="/member/login";
                    }else{
                        alert("취소하였습니다.");
                        location.href="/main";
                    }
            		
            	} else if (id != null && id != '' && code == 'EXTERNAL') {
            		alert("외부인 회원은 해당 페이지에 접근할 수 없습니다.");
            		return;
            		
            	} else if(id != null && id != '' && code == 'INTERNAL' || code == 'ADMIN') {
            		// 수정할 부분
            		location.href="/issue/list";
            	}
            	
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
        });
    </script>
</head>
<body>
<!-- 헤더 -->
<div class="header">
    <div class="logo">
        <h2><a id="main" style="text-decoration-line: none; color: black; text-align:center;">Easy Factory</a></h2>
    </div>
    <table class="current-time">
        <tr>
            <c:if test="${member.id != null}">
                <td rowspan="2">
                    <b>${member.name}</b> 
                    님 환영합니다.
                </td>
                <td rowspan="2">
                    <button type="button" id="memUpdateBtn">
                        <img src="https://cdn-icons-png.flaticon.com/512/1242/1242392.png?w=996&t=st=1688973131~exp=1688973731~hmac=1699a76ec2a49a747c93c92692569095bdb6c7f1b869ed5f73c996d0008ef727">
                    </button>
                    <button type="button" id="logoutBtn">
                        <img src="https://cdn-icons-png.flaticon.com/512/660/660350.png?w=996&t=st=1688973566~exp=1688974166~hmac=043164bc2d7a5e8ba1baefe683fef552a2dca43f61d9e7a0cf273eb1e80ba70a" >
                    </button>
                </td>
            </c:if>
            <c:if test="${member.id == null}">
               <td rowspan="2">
               		<a href="/member/login" style="text-decoration-line: none; color: black; text-align:center;"><b>로그인</b></a>
               </td>
               <td rowspan="2">
               		<a href="/member/signup" style="text-decoration-line: none; color: black; text-align:center;"><b>회원가입</b></a>
               </td>
            </c:if>
            <td id="date"></td>
        </tr>
        <tr>
            <td id="time"></td>
        </tr>
    </table>
</div>
<!-- 사이드바 메뉴 -->
<input type="checkbox" class="openSidebarMenu" id="openSidebarMenu">
<label for="openSidebarMenu" class="sidebarIconToggle">
    <div class="spinner diagonal part-1"></div>
    <div class="spinner horizontal"></div>
    <div class="spinner diagonal part-2"></div>
</label>
<div id="sidebarMenu">
	<input type="hidden" id="id" value="${member.id}">
	<input type="text" id="code" value="${member.code}">
    <ul class="sidebarMenuInner">
        <li>
            <a href="#">공정</a>
            <ul class="submenu">
                <li><a id="feb1">1공정</a></li>
                <li><a href="#">2공정</a></li>
                <li><a href="#">3공정</a></li>
                <li><a href="#">4공정</a></li>
                <li><a href="#">5공정</a></li>
                <li><a href="#">6공정</a></li>
                <li><a href="#">7공정</a></li>
                <li><a href="#">8공정</a></li>
            </ul>
        </li>
        <li><a href="#">에너지</a></li>
        <li><a href="#">재고관리</a></li>
        <li>
            <a id="issueList">게시판</a>
        </li>
    </ul>
</div>
</body>
</html>