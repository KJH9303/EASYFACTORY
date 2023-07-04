<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<title>Update</title>
<link rel="stylesheet" href="../../../resources/member/css/signup.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		var id = $("#id").val();
		var codeValue = $("#codeValue").val();
		
		if(codeValue == "INTERNAL") {
			$("#inCode").prop("checked", true);
			$("#exCode").prop("checked", false);
		} else if(codeValue == "EXTERNAL") {
			$("#inCode").prop("checked", false);
			$("#exCode").prop("checked", true);
		}
		
		if(id == null || id == "") {
			alert("잘못된 접근입니다.");
			location.href="/main";
		}
		
		$("#mainBtn").on('click', function() {
			location.href="/main";
		});
		$("#signupBtn").on('click', function() {
			location.href="/member/signup";
		});
		
		$("#repw").on("propertychange change keyup paste input", function() {
			var pw = $("#pw").val();
			var repw = $("#repw").val();
			
			if(pw === repw) {
				$("#pwCheckMsg").text("두 값이 일치합니다.");
			} else {
				$("#pwCheckMsg").text("비밀번호와 비밀번호 확인 값이 다릅니다.");
			}
		});
		
		$("#submitBtn").on('click', function() {
			var code = $(":input:radio[name=code]:checked").val();
			var department = $("#department").val();
			var idDupChk = $("#idDupChk").val();
			var name = $("#name").val();
			var phone = $("#phone").val();
			var phoneRegExp = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			var email = $("#email").val();
			var emailRegExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			var pw = $("#pw").val();
			var repw = $("#repw").val();
			
			$('input:radio[name=code]:input[value=' + code + ']').attr("checked", true);
			
			if( department == '' || department == null ){
			    alert( '부서명을 입력해주세요' );
			    $("#department").focus();
			    return false;
			}
			
			if( name == '' || name == null ){
			    alert( '이름을 입력해주세요' );
			    $("#name").focus();
			    return false;
			}
			
			if( phone == '' || phone == null ){
			    alert( '전화번호를 입력해주세요' );
			    $("#phone").focus();
			    return false;
			}
			
			if (!phoneRegExp.test(phone)) {
		        alert('전화번호 형식에 맞춰주세요. (하이픈 "-" 없이 입력)');
		        $("#phone").focus();
		        return false;
		    }
			
			if( email == '' || email == null ){
			    alert( '이메일을 입력해주세요' );
			    $("#email").focus();
			    return false;
			}
			
			if (!emailRegExp.test(email)) {
		        alert('이메일 형식에 맞춰주세요.');
		        $("#email").focus();
		        return false;
		    }
			
			if( pw == '' || pw == null ){
			    alert( '비밀번호를 입력해주세요' );
			    $("#pw").focus();
			    return false;
			}
			
			if( repw == '' || repw == null ){
			    alert( '비밀번호 확인 값을 입력해주세요' );
			    $("#repw").focus();
			    return false;
			}
			
			if( pw != repw){
			    alert( '입력한 비밀번호 값이 다릅니다.' );
			    $("#repw").focus();
			    return false;
			
			}
			
			if( idDupChk == 'unChecked'){
			    alert( '중복확인 해주세요' );
			    $("#id").focus();
			    return false;
			} else {
				alert( '회원 정보가 수정되었습니다.');
				$("#updateForm").submit();
			}
		});
			
		$(".codeBtn").change(function(){
			if($(".codeBtn").val() == 'INTERNAL') {
				$('#department').attr("placeholder", "부서명");
			}
			if($(".codeBtn").val() == 'EXTERNAL') {
				$('#department').attr("placeholder", "거래처명");
			}
		});
	});
</script>
</head>
<body>
	<div class="formContainer">
		<div class="signin">
			<div class="signup">
				<div class="logo"></div>
				<div class="internal-form">
				<input type="hidden" id="codeValue" name="codeValue" value="${member.code}">
					<form id="updateForm" name="updateForm" action="/member/updateSubmit" method="post">
						<label><input type="radio" class="codeBtn" name="code" id="inCode" value="INTERNAL" /> INTERNAL</label>
    					<label><input type="radio" class="codeBtn" name="code" id="exCode" value="EXTERNAL" /> EXTERNAL</label>
						<div class="input-group" style="padding-top: 30px">
							UserID
							<input type="text" id="id" name="id" placeholder="UserID" value="${member.id}" readonly style="border: none; background-color: rgba(180, 196, 255, 0.303);">
						</div>
						<div class="input-group">
							부서명 / 거래처명
							<input type="text" id="department" name="department" value="${member.department}">
						</div>
						<div class="input-group">
							Name
							<input type="text" id="name" name="name" value="${member.name}">
						</div>
						<div class="input-group">
							Phone
							<input type="text" id="phone" name="phone" value="${member.phone}">
						</div>
						<div class="input-group">
							Email
							<input type="text" id="email" name="email" value="${member.email}">
						</div>
						<div class="input-group">
							Password
							<input type="password" id="pw" name="pw">
						</div>
						<div class="input-group">
							Retype-Password
							<input type="password" id="repw" name="repw">
						</div>
						<div id="pwCheckMsg"></div>
						<button type="button" id="mainBtn" style="color: white; text-decoration-line: none;">Main</button>
						<button type="button" id="backBtn" style="color: white; text-decoration-line: none;">Back</button>
						<button type="button" id="submitBtn" style="color: white; text-decoration-line: none;">Confirm</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>