<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<title>SignUp</title>
<link rel="stylesheet" href="../../../resources/member/css/signup.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {

    $("#mainBtn").on('click', function() {
        location.href="/main";
    });

    $("#btnDuplicate").on('click', function() {
        var id = $("#id").val();
        var idRegExp = /[^A-Za-z0-9]/gi;

        if (id == '') {
            $("#idCheckMsg").text("ID를 입력하세요.");
            $('#id').focus();
            return false;
        }
        if (id.search(/\s/) != -1) {
            $("#idCheckMsg").text("아이디에는 공백이 삽입될 수 없습니다.");
            return false;
        }
        if (idRegExp.test(id)) {
            $("#idCheckMsg").text("아이디에는 한글 또는 특수문자가 삽입될 수 없습니다.");
            return false;
        }
        if (id.trim().length != 0) {
            $.ajax({
                url: "/member/checkDuplicateId", // Spring 컨트롤러의 매핑 주소
                type: "POST",
                data: {id: id},
                success: function (result) {
                    if (result === "duplicate") {
                        // 중복된 ID가 존재하는 경우 처리
                        $("#idCheckMsg").text("중복된 ID입니다.");
                        $("#idDupChk").val("unChecked");
                    } else {
                        // 중복되지 않은 ID인 경우 처리
                        $("#idCheckMsg").text("사용 가능한 ID입니다.");
                        $("#idDupChk").val("Checked");
                    }
                },
                error: function (xhr, status, error) {
                    console.error(error);
                }
            });
        } else {
            $("#idCheckMsg").text("ID를 입력하세요.");
            $('#id').focus();
        }
    });

    $("input[name='code']").change(function(){
        $("#department").val('');
        if($(this).val() == 'INTERNAL') {
            $('#department').attr("placeholder", "부서명");
        }
        if($(this).val() == 'EXTERNAL') {
            $('#department').attr("placeholder", "거래처명");
        }
    });

    $("#repw, #pw").on("propertychange change keyup paste input", function() {
        var pw = $("#pw").val();
        var repw = $("#repw").val();

        if(pw === repw) {
            $("#pwCheckMsg").text("두 값이 일치합니다.");
        } else {
            $("#pwCheckMsg").text("비밀번호와 비밀번호 확인 값이 다릅니다.");
        }
    });

    // Enter키를 눌렀을 때 회원가입 함수 실행
    $("#repw").on('keyup', function(event) {
        if (event.keyCode === 13) {
            signup();
        }
    });

    // Sign Up 버튼을 눌렀을 때 회원가입 함수 실행
    $("#signupBtn").on('click', function(e) {
        var idDupChk = $("#idDupChk").val();

        if (idDupChk === 'unChecked') {
            alert('중복 확인을 해주세요.');
            return false;
        } else {
            signup();
        }
    });

    // 회원가입 함수
    function signup() {
        var code = $(":input:radio[name=code]:checked").val();
        var department = $("#department").val();
        var id = $("#id").val();
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
            if(code == 'INTERNAL') {
                alert( '부서명을 입력해 주세요.' );
            } else if(code == 'EXTERNAL') {
                alert( '거래처명을 입력해 주세요.' );
            }
            $("#department").focus();
            return false;
        }

        if( id == '' || id == null ){
            alert( '아이디를 입력해 주세요.' );
            $("#id").focus();
            return false;
        }

        if( name == '' || name == null ){
            alert( '이름을 입력해 주세요.' );
            $("#name").focus();
            return false;
        }

        if( phone == '' || phone == null ){
            alert( '전화번호를 입력해 주세요.' );
            $("#phone").focus();
            return false;
        }

        if (!phoneRegExp.test(phone)) {
            alert('전화번호 형식을 확인해 주세요. (하이픈 "-" 없이 입력)');
            $("#phone").focus();
            return false;
        }

        if( email == '' || email == null ){
            alert( '이메일을 입력해 주세요.' );
            $("#email").focus();
            return false;
        }

        if (!emailRegExp.test(email)) {
            alert('이메일 형식을 확인해 주세요.');
            $("#email").focus();
            return false;
        }

        if( pw == '' || pw == null ){
            alert( '비밀번호를 입력해 주세요.' );
            $("#pw").focus();
            return false;
        }

        if( repw == '' || repw == null ){
            alert( '비밀번호 확인 값을 입력해 주세요.' );
            $("#repw").focus();
            return false;
        }

        if( pw != repw){
            alert( '입력한 비밀번호 값이 다릅니다.' );
            $("#repw").focus();
            return false;
        }

        alert( '회원가입되었습니다.');
        $("#signupForm").submit();
    };
});
</script>
</head>
<body>
	<ul class="slideshow">
		<li><span></span></li>
		<li><span></span></li>
		<li><span></span></li>
		<li><span></span></li>
		<li><span></span></li>
	</ul>
	<div class="formContainer">
		<div class="signin">
			<div class="signup">
				<div class="logo"></div>
				<div class="internal-form">
					<form id="signupForm" name="signupForm" action="/member/signupSubmit" method="post">
						<label><input type="radio" class="codeBtn" name="code" id="inCode" value="INTERNAL" checked /> INTERNAL</label>
    					<label><input type="radio" class="codeBtn" name="code" id="exCode" value="EXTERNAL" /> EXTERNAL</label>
						<div class="input-group">
							<input type="text" id="department" name="department" value="" placeholder="부서명">
						</div>
						<div class="input-group2">
							<input type="text" id="id" name="id" placeholder="UserID">
							<input type="button" class="idcheck" id="btnDuplicate" value="중복체크"/>
							<input type="hidden" id="idDupChk" value="unChecked"/>
						</div>
                        <!-- 아이디 확인 메세지 -->
                        <div id="idCheckMsg"></div>
						<div class="input-group">
							<input type="text" id="name" name="name" placeholder="Name">
						</div>
						<div class="input-group">
							<input type="text" id="phone" name="phone" placeholder="Phone Number">
						</div>
						<div class="input-group">
							<input type="text" id="email" name="email" placeholder="Email">
						</div>
						<div class="input-group">
							<input type="password" id="pw" name="pw" placeholder="Password">
						</div>
						<div class="input-group">
							<input type="password" id="repw" name="repw" placeholder="Retype-Password">
						</div>
						<div id="pwCheckMsg"></div>
						<div class="space-between">
                        <!-- 회원가입 버튼 -->
							<button type="button" id="signupBtn" style="color: white; text-decoration-line: none;">Sign Up</button>
	                        <!-- 메인페이지 이동 -->
	                        <button type="button" class="main" id="mainBtn" style="color: white; text-decoration-line: none;">Main</button>
                        </div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>