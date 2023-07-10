<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View</title>
<link rel="stylesheet" href="../../../resources/issue/css/board.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		var id = $("#id").val();
		if (id == '' || id == null) {
			alert("잘못된 접근입니다.");
			alert("로그인 후 이용해주세요.");
			location.href="/member/login";
		}
		
		// 글 수정 페이지
		$("#updateBtn").on('click', function() {
			var no = $("#no").val();
			location.href="/issue/update?no="+no;
		});
		
		// 글 삭제
		$("#deleteBtn").on('click', function() {
			var no = $("#no").val();
			var result = confirm("삭제하시겠습니까?");
			if(result){
			    alert("정상적으로 삭제되었습니다.");
			    location.href="/issue/delete?no="+no;
			}else{
			    alert("취소하였습니다.");
			    location.href="/issue/list";
			}
		});
		
		$("#goBackBtn").on('click', function() {
			self.location = "/issue/list/search?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}"
		});
	});
</script>
</head>
<body>

    <div id="headerContainer"></div>
    <div class="container">
        <h1>글 보기</h1>
        	<input type="hidden" id="no" name="no" value="${issue.no}" readonly><br><br>
        	<input type="hidden" id="id" name="id" value="${member.id}" readonly><br><br>
            <label for="title">제목:</label><br>
            <input type="text" id="title" name="title" value="${issue.title}" readonly><br><br>
            
            <label for="author">작성자:</label><br>
            <input type="text" id="author" name="author" value="${issue.author}" readonly><br><br>
            
            <label for="content">내용:</label><br>
            <textarea id="content" name="content" rows="10" cols="50" readonly>${issue.content}</textarea><br><br>
            <c:if test="${member.id == issue.author}">
            	<input type="button" id=updateBtn value="수정">
            	<input type="button" id=deleteBtn value="삭제">
           	</c:if>
           	<input type="hidden" id="page" value="${cri.page}" readonly>
        	<input type="hidden" id="perPageNum" value="${cri.perPageNum}" readonly>
            <input type="hidden" id="searchType" value="${searchType}" readonly>
            <input type="hidden" id="keyword" value="${keyword}" readonly>
            <input type="hidden" id="startDate" value="${startDate}" readonly>
            <input type="hidden" id="endDate" value="${endDate}" readonly>
        <hr>
			<textarea id="reply" name="reply" rows="2" cols="50" placeholder="댓글 작성"></textarea><br><br>
		<hr>
        <button type="button" id="goBackBtn">목록</button>
    </div>
</body>
</html>