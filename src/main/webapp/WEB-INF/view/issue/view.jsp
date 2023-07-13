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
		viewReply(); // 댓글 출력 함수 실행
		
		var id = $("#id").val();
		/*
		// 로그인하지 않은 상태일 경우
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
		
		// Enter키를 눌렀을 때 댓글 작성 함수 실행
		$("#reply_content").on('keyup', function(event) {
		    if (event.keyCode === 13) {
		    	writeReply();
		    }
		});
		
		// 댓글등록 버튼을 눌렀을 때 댓글 작성 함수 실행
		$('#replyForm').submit(function(e) {
            e.preventDefault();
            writeReply();
        });
		
		// 댓글 작성
		function writeReply() {
   			const reply_no = ${issue.no};
   			const reply_author = $('#reply_author').val();
   			const reply_content = $('#reply_content').val();
   		
   			if(reply_author == ''){
   				alert('로그인 후 이용해주세요');
   				location.href="/member/login";
   			}else if(reply_content == '') {
   				alert('내용을 입력하세요');
   				$('#reply_content').focus();
   				return;
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
   					if(data === 'InsertSuccess') {
   						$('#reply_author').val(reply_author);
   	   					$('#reply_content').val('');
   	   					viewReply();
   	   					//location.href="/issue/view?no="+reply_no+"&page="+page+"&perPageNum="+perPageNum+"&searchType="+searchType+"&keyword="+keyword+"&startDate="+startDate+"&endDate="+endDate;
   					} else {
   						alert('로그인 이후 이용해주시기 바랍니다.');
   						location.href="/member/login";
   					}
   				}
			}); // $.ajax
		}; // writeReply()
		
		// 댓글 출력
		function viewReply() {
            var no = $("#no").val(); // 게시물 번호를 JSP 변수로 전달
            $.ajax({
                url: '/issue/viewReply',
                type: 'GET',
                data: {
                	no: no // 게시물 번호를 Ajax 요청 파라미터로 전달
                },
                success: function(replyHtml) {
                    $('#replyList').html(replyHtml);
                }
            });
        }
		
	}); // document
</script>
</head>
<body>

	<input type="hidden" id="page" value="${cri.page}" readonly>
	<input type="hidden" id="perPageNum" value="${cri.perPageNum}" readonly>
	<input type="hidden" id="searchType" value="${searchType}" readonly>
	<input type="hidden" id="keyword" value="${keyword}" readonly>
	<input type="hidden" id="startDate" value="${startDate}" readonly>
	<input type="hidden" id="endDate" value="${endDate}" readonly>
	
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
        <hr>
	</div>
	<!-- 게시물 끝 -->
	<div id="replyList"></div>
	
    <h2>댓글 입력</h2>
    <form id="replyForm">
    	<input type="text" id="reply_author" name="author" value="${member.id}" readonly>
        <textarea class="reply-content" id="reply_content" cols="80" rows="2" name="content"></textarea>
        <input type="submit" value="등록">
    </form>
<!--      
	<div class="comment-box">
		<div class="reply-author">
			<span>작성자 : ${member.id}</span>
			<input type="hidden" id="reply_author" name="author" value="${member.id}">
		</div>
		<div>
			<textarea class="reply-content" id="reply_content" cols="80" rows="2" name="content"></textarea>
		</div>
		<div class="regBtn">
			<button id="writeReplyBtn">댓글등록</button>
		</div>
	</div>
-->	
    <button type="button" id="toListBtn">목록</button>

</body>
</html>
