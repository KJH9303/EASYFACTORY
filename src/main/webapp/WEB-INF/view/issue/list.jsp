<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link rel="stylesheet" href="../../../resources/issue/css/board.css">
    <script src="/resources/js/app.js"></script>
    <script defer src="/resources/js/pagination.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
    	
    	var id = $("#id").val();
    	
    	// 페이지 진입 시
		if (id == '' || id == null) {
			alert("잘못된 접근입니다.");
			alert("로그인 후 이용해주세요.");
			location.href="/member/login";
		}
		
    	// 글 작성 버튼 클릭 시
    	$("#writeBtn").on('click', function(){
       		if(id == null || id == "") {
       			var result = confirm("로그인 후 이용해주세요.");
       			if(result){
       			    location.href="/member/login";
       			}else{
       			    alert("취소하였습니다.");
       			    location.href="/main";
       			}
       		} else if(id != null || id != "") {
       			location.href="write";
       		}
    	});
    });
    </script>
</head>
<body>

    <div id="headerContainer"></div>
    <div class="container">
        <h1>Table</h1>      
        <form id="searchForm" action="/list" method="get">
            <label for="searchTerm">검색:</label>
            <input type="text" name="searchTerm" id="searchTerm">
            <button type="button">검색</button>
            <button type="button" id="writeBtn">새 글 작성</button>  
            <input type="hidden" id="id" value="${member.id}">
        </form>
        
		<c:if test="${totCnt != null}">
			<p> 총 ${totCnt} 건
		</c:if>
        <table>
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일자</th>
            </tr>
            <tbody id="posts">
           		<c:if test="${issueList != null}">
           			<c:forEach items="${issueList}" var="issueList">
           				<tr>
	                		<td>${issueList.no}</td>
	                		<td><a href="/issue/view?no=${issueList.no}">${issueList.title}</a></td>
	                		<td>${issueList.author}</td>
	                		<td>${issueList.regDate}</td>
                		</tr>
               		</c:forEach>
               	</c:if>
               	<c:if test="${issueList == null}">
               		<tr>
               			<td> 작성된 게시물이 없습니다. </td>
               		</tr>
               	</c:if>
            </tbody>
        </table>
        
        <!-- <div id="paginationInfo"> -->
        	<%@ include file="paginationInfo.jsp" %>
       	<!-- <div id="paginationInfo"> -->
        <hr>
    </div>
</body>
</html>
