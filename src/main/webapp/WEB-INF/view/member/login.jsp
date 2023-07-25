<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="../../../resources/member/css/login.css?after">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script>
	$(document).ready(function() {
		// 메인 페이지
		$("#mainBtn").on('click', function() {
			location.href="/";
		});
		
		// 회원가입 페이지
		$("#signupBtn").on('click', function() {
			location.href="/member/signup";
		});
		
		// Enter키를 눌렀을 때 로그인 함수 실행
		$("#id, #pw").on('keyup', function(event) {
		    if (event.keyCode === 13) {
		        login();
		    }
		});
		
		// 로그인 버튼을 눌렀을 때 로그인 함수 실행
		$("#loginBtn").on('click', function() {
		    login();
		});
		
		// 로그인
		function login() {
			var id = $("#id").val();
			var pw = $("#pw").val();
			var idRegExp = /[^A-Za-z0-9]/gi;
			
			if (id == '') {
				$("#message").text("ID를 입력하세요");
		        $('#id').focus();
		        return;
		    }
			if (id.search(/\s/) != -1) {
				$("#message").text("아이디에는 공백이 삽입될 수 없습니다.");
		        return;
		    }
			if (idRegExp.test(id)) {
				$("#message").text("아이디에는 한글 또는 특수문자가 삽입될 수 없습니다.");
		        return;
			}
			if (pw == '') {
				$("#message").text("비밀번호를 입력하세요");
		        $('#pw').focus();
		        return;
		    }
			
			if (id.trim().length != 0 && pw.trim().length != 0) {
				$.ajax({
			        url: "/member/idAndPwCheck",
			        type: "POST",
			        data: {
			        		id: id
			        		, pw: pw
			        		},
			        success: function (result) {
			            if (result === "exist") {
			               	alert("로그인 성공")
			                $("#loginForm").submit();
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
		};
	});
</script>
</head>
<body>
  <!-- 배경이미지 -->
  <ul class="slideshow">
    <li><span></span></li>
    <li><span></span></li>
    <li><span></span></li>
    <li><span></span></li>
    <li><span></span></li>
  </ul>
  <!-- 로그인 컨테이너 -->
	<div class="formContainer">
		<div class="signin">
			<form id="loginForm" name="loginForm" action="/member/loginSubmit" method="post">
				<input type="hidden" name="prevPage" value="${prevPage}" />
				<div class="logo">
					<img src="../../resources/img/logo.jpeg">
				</div>
				<div class="input-group">
					<input type="text" id="id" name="id" placeholder="id">
				</div>
				<div class="input-group">
					<input type="password" id="pw" name="pw" placeholder="Password">
				</div>
				<div id="message"></div>
				
				<!-- 로그인 버튼 -->
				<button type="button" id="loginBtn" style="color: white; text-decoration-line: none;">Login</button>
        <!-- 회원가입 버튼 -->
				<button type="button" id="signupBtn" style="color: white; text-decoration-line: none;">Sign Up</button>
        <!-- 메인페이지로 이동 -->
				<button type="button" class="main" id="mainBtn" style="color: white; text-decoration-line: none;">Main</button>
			</form>
		</div>
	</div>
</body>
</html>
