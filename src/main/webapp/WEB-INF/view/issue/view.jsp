<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		/*
		if (id == '' || id == null) {
			alert("잘못된 접근입니다.");
			alert("로그인 후 이용해주세요.");
			location.href="/member/login";
		}*/
		
		// 글 수정 페이지
		$("#updateBtn").on('click', function() {
			location.href="/issue/update?no=${issue.no}&page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}";
		});
		
		// 글 삭제
		$("#deleteBtn").on('click', function() {
			var result = confirm("삭제하시겠습니까?");
			if(result){
			    alert("정상적으로 삭제되었습니다.");
			    location.href="/issue/delete?no=${issue.no}&page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}";
			}else{
			    alert("취소하였습니다.");
			}
		});
		
		$("#toListBtn").on('click', function() {
			self.location = "/issue/list/search?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}"
		});
		
		$('#Comment_regist').on('click', function() {
			
   			//Json으로 전달할 파라미터 변수선언
   			const reply_no = ${issue.no};
   			const reply_author = $('#reply_author').val();
   			const reply_content = $('#reply_content').val();
   			
   			console.log(reply_no);
   			console.log(reply_author);
   			console.log(reply_content);
   		
   			if(reply_author == ''){
   				alert('로그인 후 이용해주세요');
   				location.href="/member/login";
   			}else if(reply_content == '') {
   				alert('내용을 입력하세요');
   				$('#reply_content').focus();
   			}
   			
   			$.ajax({
   				type:'post',
   				url:'<c:url value="/issue/writeReply"/>',
   				data:  {
   						"no":reply_no,
   						"author":reply_author,
   						"content":reply_content
   						},
   						
   				success:function(data){
   					console.log('통신성공' + data);
   					if(data === 'InsertSuccess') {
   						alert('댓글 등록이 완료되었습니다.');
   						console.log('댓글 등록 완료');
   						$('#reply_author').val(reply_author);
   	   					$('#reply_content').val('');
   	   					getReplyList();
   					} else {
   						alert('로그인 이후 이용해주시기 바랍니다.');
   						location.href="/member/login";
   						console.log('댓글 등록 실패');
   					}
   				},
   				error:function(){
   					alert("Error");
   				}
			});// 댓글 비동기 끝
		});
	});
</script>
</head>
<body>

    <div id="headerContainer">
    	<%@ include file="../header.jsp" %>
    </div>
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
           	<input type="text" id="page" value="${cri.page}" readonly>
        	<input type="text" id="perPageNum" value="${cri.perPageNum}" readonly>
            <input type="text" id="searchType" value="${searchType}" readonly>
            <input type="text" id="keyword" value="${keyword}" readonly>
            <input type="text" id="startDate" value="${startDate}" readonly>
            <input type="text" id="endDate" value="${endDate}" readonly>
        <hr>
	</div>
		<!-- 게시물 끝 -->
		<c:if test="${replylist != null}">
			<span>등록된 댓글 : ${replyCnt}</span>
        	<c:forEach items="${replylist}" var="replylist">
   				<div>
	         		<div>
	         			<input type="text" value="${replylist.content}">
	         			<input type="text" value="${replylist.author}">
	         			<input type="text" value="${replylist.regDate}">
	        		</div>
        		</div>
       		</c:forEach>
       	</c:if>
       	<c:if test="${replylist == null}">
       		<div>
       			<div> 작성된 게시물이 없습니다. </div>
       		</div>
       	</c:if>
        <hr>
        <div class="comment-box">
	        <div class="reply-author">
	        	<span>작성자 : ${member.id}</span>
	        </div>   
        <div>
        	<textarea class="reply-content" id="reply_content" cols="80" rows="2" name="content"></textarea>
        </div>
        <div class="regBtn">
        	<button id="Comment_regist"> 댓글등록</button>
        </div>
        <button type="button" id="toListBtn">목록</button>
    </div>
</body>
</html>
