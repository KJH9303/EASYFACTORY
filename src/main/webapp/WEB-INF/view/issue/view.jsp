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
		viewReply();
		
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
		
		// Enter키를 눌렀을 때 댓글 작성 함수 실행
		$("#reply_content").on('keyup', function(event) {
		    if (event.keyCode === 13) {
		    	writeReply();
		    }
		});
		
		// 댓글등록 버튼을 눌렀을 때 댓글 작성 함수 실행
		$("#writeReplyBtn").on('click', function() {
			writeReplyBtn();
		});
		
		// 댓글 작성
		function writeReply() {
   			const reply_no = ${issue.no};
   			const reply_author = $('#reply_author').val();
   			const reply_content = $('#reply_content').val();
   			
   			var page = $('#page').val();
   			var perPageNum = $('#perPageNum').val();
   			var searchType = $('#searchType').val();
   			var keyword = $('#keyword').val();
   			var startDate = $('#startDate').val();
   			var endDate = $('#endDate').val();
   		
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
   					if(data === 'InsertSuccess') {
   						alert('댓글 등록이 완료되었습니다.');
   						$('#reply_author').val(reply_author);
   	   					$('#reply_content').val('');
   	   					viewReply();
   	   					//location.href="/issue/view?no="+reply_no+"&page="+page+"&perPageNum="+perPageNum+"&searchType="+searchType+"&keyword="+keyword+"&startDate="+startDate+"&endDate="+endDate;
   					} else {
   						alert('로그인 이후 이용해주시기 바랍니다.');
   						location.href="/member/login";
   					}
   				},
   				error:function(){
   					alert("Error");
   				}
			});// 댓글 비동기 끝
		}; // writeReply()
		
		/*
		//댓글 목록 
		function commentList(){
			var no = $('#no').val();
		    $.ajax({
		        url : '/issue/viewReply',
		        type : 'get',
		        data : {'no':no},
		        success : function(data) {
		            var a =''; 
		            $.each(data, function(key, value){ 
		                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
		                a += '<div class="commentInfo'+value.no+'">'+'댓글번호 : '+value.no+' / 작성자 : '+value.author;
		                a += '<a onclick="commentUpdate('+value.no+',\''+value.content+'\');"> 수정 </a>';
		                a += '<a onclick="commentDelete('+value.no+');"> 삭제 </a> </div>';
		                a += '<div class="commentContent'+value.no+'"> <p> 내용 : '+value.content +'</p>';
		                a += '</div></div>';
		            });
		            
		            $(".output").html(a);
		        }
		    });
		}
		*/
		
		// 댓글 보기
		
		function viewReply() {
			var no = $('#no').val();
			$.ajax({
	        	type : "post",
	        	async : false, 
	           	url : "/issue/viewReply",
	           	data: {no: no},
	           	success : function (data,textStatus) {
	           		
	           	var jsonInfo = JSON.parse(data);
	           	
	           	var replyInfo = "";
	           	replyInfo += "<hr>";
	        
	        	if (jsonInfo.replylist == null || jsonInfo.replylist == 'undefined') {
	        		replyInfo += "<div>"
	        		replyInfo += "<span> 등록된 댓글이 없습니다. </span>";
        			replyInfo += "</div>"
	        	} else {
	        		for (var i = 1; i < jsonInfo.replylist.length; i ++) {
		        		replyInfo += "<div>"
		        		replyInfo += "<input type='hidden' value='" + jsonInfo.replylist[1].reno + "'>";
		        		replyInfo += "<input type='text' value='" + jsonInfo.replylist[i].author + "'>";
		        		replyInfo += "<span> : </span>";
		        		replyInfo += "<textarea rows='1' cols='100' style='margin-bottom:-6px'>" + jsonInfo.replylist[i].content + "</textarea>";
		        		replyInfo += "<button type='button' id='updateReplyBtn'>댓글수정</button>";
		        		replyInfo += "<button type='button' id='deleteReplyBtn'>댓글삭제</button>";
		        		replyInfo += "</div>";
		        	}
	        	}
	        	replyInfo += "<hr>"
	        	
	        	$("#output").html(replyInfo);
	       	},
	       	error : function(data,textStatus) {
	        		alert("에러가 발생했습니다.");
	      	},
	      	complete:function(data,textStatus) {
	       	}
	   		
			}); 
		}
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
		<div id="output"></div>
		<!--
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
         -->
	        <div class="comment-box">
		        <div class="reply-author">
		        	<span>작성자 : ${member.id}</span>
		        </div>
		        <input type="hidden" id="reply_author" name="author" value="${member.id}">
	        </div>
	        <div>
	        	<textarea class="reply-content" id="reply_content" cols="80" rows="2" name="content"></textarea>
	        </div>
	        <div class="regBtn">
	        	<button id="writeReplyBtn"> 댓글등록</button>
	        </div>
	        <button type="button" id="toListBtn">목록</button>
</body>
</html>
