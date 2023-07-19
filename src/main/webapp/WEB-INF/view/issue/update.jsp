<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update</title>
<link rel="stylesheet" href="../../../resources/issue/css/board.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		var author = $("#author").val();
		var id = $("#id").val();
		if (id == '' || id == null) {
			alert("로그인 후 이용해주세요.");
			location.href="/member/login";
		// 글 작성자가 아닌 사용자가 url로 접근했을 경우
		} else if (id != author) {
			alert("잘못된 접근입니다.");
			location.href="/main";
		}
		
		$("#cancelBtn").on('click', function() {
			location.href="/issue/view?no=${issue.no}&page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}";
		});
		
		// 파일 목록 출력
        function viewFileList() {
            var no = $("#no").val(); // 게시물 번호를 JSP 변수로 전달
            $.ajax({
                url: '/issue/viewFileList',
                type: 'GET',
                data: {
                    no: no // 게시물 번호를 Ajax 요청 파라미터로 전달
                },
                success: function(fileHtml) {
                    $('#viewFileList').html(fileHtml);
                }
            });
        }
		
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
			alert("수정 완료.");
			$("#updateForm").submit();
		});
		
		$("#toListBtn").on('click', function() {
			self.location = "/issue/list/search?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}"
		});
		viewFileList();
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
            <input type="text" id="author" name="author" value="${issue.author}" readonly><br><br>
            <input type="hidden" id="id" name="id" value="${member.id}" readonly>
            
            <!-- 파일 목록 ajax -->
			<div id="viewFileList"></div>
			
			
            <label for="content">내용:</label><br>
            <textarea id="content" name="content" rows="10" cols="50">${issue.content}</textarea><br><br>
            
            <input type="button" id=cancelBtn value="취소">
            <input type="button" id=submitBtn value="수정 완료">
            
            <input type="hidden" id="page" value="${cri.page}" readonly>
        	<input type="hidden" id="perPageNum" value="${cri.perPageNum}" readonly>
            <input type="hidden" id="searchType" value="${searchType}" readonly>
            <input type="hidden" id="keyword" value="${keyword}" readonly>
            <input type="hidden" id="startDate" value="${startDate}" readonly>
            <input type="hidden" id="endDate" value="${endDate}" readonly>
        </form>

        <hr>

        <button type="button" id="toListBtn">목록</button>
    </div>
    
    
    
    
<input type="file" id="file-input" multiple />
<h3>업로드된 파일</h3>
<div id="preview">
    <c:forEach items="${fileList}" var="fileList">
        <p id="${fileList.fileno}">
            ${fileList.savename}
            <button data-index="${fileList.fileno}" class="file-remove">${fileList.fileno}</button>
        </p>
    </c:forEach>
</div>
<script src="../../../resources/write.js"></script>



</body>
</html>
