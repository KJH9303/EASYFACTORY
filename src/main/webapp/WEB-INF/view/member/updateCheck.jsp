<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <title>MainPage</title>
    <link rel="stylesheet" href="../../../resources/member/css/update.css?after">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
    	var id = $("#id").val();
    	
    	// 페이지 진입 시
    	if(id == null || id == "") {
    		alert("잘못된 접근입니다.");
    		location.href="/main";
    	}
    	
    	// 취소
    	$("#cancelBtn").on('click', function() {
			location.href="/main";
		});
    	
    	// Enter키를 눌렀을 때 회원 정보 확인 함수 실행
		$("#id, #pw").on('keyup', function(event) {
		    if (event.keyCode === 13) {
		    	updateChk();
		    }
		});
		
		// 로그인 버튼을 눌렀을 때 회원 정보 확인 함수 실행
		$("#updateChkBtn").on('click', function() {
			updateChk();
		});
		
    	// 회원 정보 확인
		function updateChk() {
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
		};
    	
		$("#deleteBtn").on('click', function() {
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
			            	var result = confirm("회원 탈퇴를 진행합니다.");
			    			if(result){
			    			    alert("정상적으로 탈퇴되었습니다.");
			    			    location.href="/member/delete";
			    			}else{
			    			    alert("취소하였습니다.");
			    			    return;
			    			}
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
					<input type="text" id="id" name="id" value="${member.id}" readonly style="border: none; background-color: rgba(180, 196, 255, 0.303);">
				</div>
				<div class="input-group">
					<i class="fa fa-unlock-alt"></i>
					<input type="password" id="pw" name="pw" placeholder="Password">
				</div>
					<div id="message"></div>
				<input type="hidden" id="code" name="code" value="${member.code}" readonly>
				<input type="hidden" id="department" name="department" value="${member.department}" readonly>
				<input type="hidden" id="name" name="name" value="${member.name}" readonly>
				<input type="hidden" id="phone" name="phone" value="${member.phone}" readonly>
				<input type="hidden" id="email" name="email" value="${member.email}" readonly>
				
				<button type="button" id="updateChkBtn" style="color: white; text-decoration-line: none;">Confirm</button>
				<button type="button" id="deleteBtn" style="color: white; text-decoration-line: none;">Leave Us</button>
				<button type="button" id="cancelBtn" style="color: white; text-decoration-line: none;">Cancel</button>
			</form>
		</div>
	</div>
</body>
</html>
