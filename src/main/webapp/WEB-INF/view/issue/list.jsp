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
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
    $(document).ready(function() {
    	
    	var id = $("#id").val();
    	
    	// 페이지 진입 시
		/*if (id == '' || id == null) {
			alert("잘못된 접근입니다.");
			alert("로그인 후 이용해주세요.");
			location.href="/member/login";
		}*/
		
		// 검색 분류, 검색 창
		$("#searchType").on('change', function() {
			var searchType = $("#searchType").val();
			var keyword = $("#keyword").val();
			
			if(searchType == 'regDate'){
				$("#keyword").val("");
				$("#keyword").attr("type", "hidden");
				$("#searchDate").attr("style", "display:'inline'");
				$("#startDate, #endDate").datepicker({
			        dateFormat: "yy-mm-dd",
			    });
			} else {
				$("#keyword").val("");
				$("#startDate, #endDate").val("");
				$("#keyword").attr("type", "text");
				$("#searchDate").hide();
			}
		});
		
		// 검색
		$("#searchBtn").on('click', function() {
			var startDate = $("#startDate").val();
			var endDate = $("#endDate").val();
			$("#searchForm").submit();
		});
		
    	// 글 작성 버튼 클릭 시
    	$("#writeBtn").on('click', function() {
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
        <form id="searchForm" action="/issue/list/search" method="get">
        	<select id="searchType" name="searchType" size="1" >
   				<option value="title" <c:if test="${searchType == 'title'}">selected</c:if>>제 목</option>
   				<option value="content" <c:if test="${searchType == 'content'}">selected</c:if>>내 용</option>
   				<option value="author" <c:if test="${searchType == 'author'}">selected</c:if>>작성자</option>
   				<option value="regDate" <c:if test="${searchType == 'regDate'}">selected</c:if>>작성일</option>
			</select>
			<input type="text" id="keyword" name="keyword" placeholder="검색어 입력">
			<div id="searchDate" style="display:none;">
				<input type="text" id="startDate" name="startDate" placeholder="검색 시작 날짜"/> ~ 
				<input type="text" id="endDate" name="endDate" placeholder="검색 종료 날짜"/>
            </div>
            <button type="button" id="searchBtn">검색</button>
        </form>
        <input type="hidden" id="id" value="${member.id}">
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
               		<input type="text" id="page" value="${cri.page}" readonly>
               		<input type="text" id="perPageNum" value="${cri.perPageNum}" readonly>
               		<input type="text" id="searchType" value="${issue.searchType}" readonly>
               		<input type="text" id="keyword" value="${issue.keyword}" readonly>
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
       	<button type="button" id="writeBtn">새 글 작성</button>  
        <hr>
    </div>
</body>
</html>
