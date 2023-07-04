<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="../../../resources/member/css/login.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#mainBtn").on('click', function() {
			$("#run").val("tttttttttttttttttttttttttttt");
			alert($("#run").val());
			$("#febForm").submit();
		});
		
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
			<form id="febForm" name="febForm" action="/feb/febUpdateTest" method="post">
				<div class="logo">
					<img src="../../resources/img/logo.jpeg">
				</div>
				<div class="input-group">
					<input type="text" id="id" name="id" placeholder="id">
				</div>
				<div class="input-group">
					<input type="password" id="pw" name="pw" placeholder="Password">
				</div>
				<div class="input-group">
					<input type="text" id="feb1" name="feb1" value="feb1">
					<input type="text" id="feb2" name="feb2" value="feb2">
					<input type="text" id="feb3" name="feb3" value="feb3">
					<input type="text" id="feb4" name="feb4" value="feb4">
					<input type="text" id="feb5" name="feb5" value="feb5">
					<input type="text" id="feb6" name="feb6" value="feb6">
					<input type="text" id="feb7" name="feb7" value="feb7">
					<input type="text" id="feb8" name="feb8" value="feb8">
				</div>
				<input type="text" id="run" name="run" value="dddddddddddddd">
				<div id="message"></div>
				
				<button type="button" class="main" id="mainBtn" style="color: white; text-decoration-line: none;">Run</button>
			</form>
		</div>
	</div>
</body>
</html>
