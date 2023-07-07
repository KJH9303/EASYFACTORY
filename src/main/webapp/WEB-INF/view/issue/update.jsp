<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Write</title>
<link rel="stylesheet" href="../../../resources/issue/css/board.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		var author = $("#author").val();
		if (author == '' || author == null) {
			alert("잘못된 접근입니다.");
			alert("로그인 후 이용해주세요.");
			location.href="/member/login";
		}
		
		$("#cancelBtn").on('click', function() {
			var no = $("#no").val();
			location.href="/issue/view?no="+no;
		});
		
		$("#submitBtn").on('click', function() {
			var title = $("#title").val();
			var content = $("#content").val();
			
			if( title == '' || title == null) {
			    alert( '제목를 입력해주세요' );
			    $("#title").focus();
			    return false;
			}
			
			if( content == '' || content == null) {
			    alert( '내용을 입력해주세요' );
			    $("#content").focus();
			    return false;
			}
			alert("글 작성 완료.");
			$("#updateForm").submit();
		});
	});
</script>
</head>
<body>
    <div id="headerContainer"></div>
    <div class="container">
        <h1>글 수정</h1>
        
        <form id="updateForm" action="/issue/updateSubmit" method="post">
        	<input type="hidden" id="no" name="no" value="${issue.no}" readonly>
            <label for="title">제목:</label><br>
            <input type="text" id="title" name="title" value="${issue.title}"><br><br>
            
            <label for="author">작성자:</label><br>
            <input type="text" id="author" name="author" value="${member.id}" readonly><br><br>
            
            <label for="content">내용:</label><br>
            <textarea id="content" name="content" rows="10" cols="50">${issue.content}</textarea><br><br>
            
            <input type="button" id=cancelBtn value="취소">
            <input type="button" id=submitBtn value="수정 완료">
        </form>

        <hr>

        <button onclick="location.href='/issue/list'">돌아가기</button>
    </div>
</body>
</html>
