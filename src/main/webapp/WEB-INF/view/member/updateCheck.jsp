<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <title>MainPage</title>
    <link rel="stylesheet" href="../../../resources/member/css/signup.css" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
    	var id = $("#id").val();
    	if(id == null || id == "") {
    		alert("잘못된 접근입니다.");
    		location.href="/main";
    		// window.history.back();
    	}
    	
    	// 취소
    	$("#cancelBtn").on('click', function() {
			location.href="/main";
		});
    	
    	// 회원 정보 수정
		$("#updateBtn").on('click', function() {
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
			        url: "/member/idAndPwCheck",
			        type: "POST",
			        data: {
			        	id: id
			        	, pw: pw
			        	},
			        success: function (result) {
			            if (result === "exist") {
			                alert("확인되었습니다.")
			                location.href="/member/update";
			            } else {
			                $("#message").text("비밀번호가 틀립니다.");
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
    });
    </script>
</head>
<body>
	<div class="formContainer">
		<div class="signin">
			<form id="updateForm" name="updateForm" action="memberUpdateSubmit" method="post">
				<div class="input-group">
					<i class="fa fa-envelope"></i> 
					<input type="text" id="id" name="id" value="${member.id}" readonly>
				</div>
				<div class="input-group">
					<i class="fa fa-unlock-alt"></i>
					<input type="password" id="pw" name="pw" placeholder="Password">
				</div>
					<div id="message"></div>
				
				<button type="button" id="updateBtn" style="text-decoration-line: none;">Confirm</button>
				<button type="button" id="cancelBtn" style="text-decoration-line: none;">Cancel</button>
				
				<input type="text" id="code" name="code" value="${member.code}" readonly>
				<input type="text" id="department" name="department" value="${member.department}" readonly>
				<input type="text" id="name" name="name" value="${member.name}" readonly>
				<input type="text" id="phone" name="phone" value="${member.phone}" readonly>
				<input type="text" id="email" name="email" value="${member.email}" readonly>
			</form>
		</div>
	</div>
</body>
</html>
