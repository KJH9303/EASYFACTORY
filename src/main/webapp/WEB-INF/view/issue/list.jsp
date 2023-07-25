<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link rel="stylesheet" href="../../../resources/issue/css/list.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
    $(document).ready(function() {
    	
    	var id = $("#id").val();
    	
    	// 페이지 진입 시
		if (id == '' || id == null) {
			alert("로그인 후 이용해 주세요.");
			location.href="/member/login";
		}
    	
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
			$("#keyword").attr("type", "text");
			$("#searchDate").hide();
			$("#startDate").val("");
			$("#endDate").val("");
		}
		
		// 검색 분류, 검색 창
		$("#searchType").on('change', function() {
			var searchType = $("#searchType").val();
			var keyword = $("#keyword").val();
			
			if(searchType == 'regDate') {
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
				$("#startDate").val("");
				$("#endDate").val("");
			}
		});
		
		// 검색
		$("#searchBtn").on('click', function() {
			var searchType = $("#searchType").val();
			var startDate = $("#startDate").val();
			var endDate = $("#endDate").val();
			if(searchType == 'regDate') {
				$("#keyword").val("");
			} else {
				$("#startDate").val("");
				$("#endDate").val("");
			}
			if (startDate > endDate) {
	        	alert("시작일이 종료일보다 큽니다. 날짜를 다시 지정하세요.");
	        	return false;
	        }
			$("#searchForm").submit();
		});
		
    	// 글 작성 버튼 클릭 시
    	$("#writeBtn").on('click', function() {
       		if(id == null || id == "") {
       			var result = confirm("로그인 후 이용해 주세요.");
       			if(result){
       			    location.href="/member/login";
       			}else{
       			    alert("취소하였습니다.");
       			    location.href="/main";
       			}
       		} else if(id != null || id != "") {
       			location.href="/issue/write";
       		}
    	});
    });
    
    // 현재 날짜, 현재 시간 
    // yyyy/mm/dd 
    // hh/mm/ss
    function updateTime() {
        var currentTime = new Date();
        var hours = currentTime.getHours();
        var minutes = currentTime.getMinutes();
        var seconds = currentTime.getSeconds();
        var year = currentTime.getFullYear();
        var month = ("0" + (currentTime.getMonth() + 1)).slice(-2);
        var day = ("0" + currentTime.getDate()).slice(-2);

        hours = ("0" + hours).slice(-2);
        minutes = ("0" + minutes).slice(-2);
        seconds = ("0" + seconds).slice(-2);

        var timeString = hours + ":" + minutes + ":" + seconds;
        var dateString = year + "/" + month + "/" + day;

        document.getElementById("time").innerHTML = timeString;
        document.getElementById("date").innerHTML = dateString;
    }

    setInterval(updateTime, 1000)

function loadHTMLFile(targetSelector, url, callback) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.querySelector(targetSelector).innerHTML = this.responseText;
            if (typeof callback === 'function') {
                callback();
            }
        }
    };
    xhttp.open("GET", url, true);
    xhttp.send();
}

    // 메인콘텐츠
    document.addEventListener('DOMContentLoaded', function () {
        const frontSlideItems = document.querySelectorAll('.front-slide-item');
        let delay = 0;
    
        frontSlideItems.forEach((item) => {
            setTimeout(() => {
                item.classList.add('active');
            }, delay);
            delay += 500;
        });
    });

/*
function loadHeaderAndSidebar() {
    loadHTMLFile("#headerContainer", updateTime);
}
*/


// 페이지가 로드될 때 헤더와 사이드바 파일을 불러와 삽입
window.addEventListener('load', updateTime);
    </script>
</head>
<body>
    <div class="container">
        <h1>Table</h1>      
        <form id="searchForm" action="/issue/list/search" method="get">
        	<select id="searchType" name="searchType" size="1" >
   				<option value="title"<c:if test="${searchType == 'title'}">selected</c:if>>제 목</option>
   				<option value="content" <c:if test="${searchType == 'content'}">selected</c:if>>내 용</option>
   				<option value="author" <c:if test="${searchType == 'author'}">selected</c:if>>작성자</option>
   				<option value="regDate" <c:if test="${searchType == 'regDate'}">selected</c:if>>작성일</option>
			</select>
			<input type="text" id="keyword" name="keyword" value="${keyword}" placeholder="검색어 입력" <c:if test="${searchType == 'regDate'}">style="display:'none;'"</c:if>>
			<div id="searchDate">
				<input type="text" id="startDate" name="startDate" value="${startDate}" placeholder="검색 시작 날짜"/> ~ 
				<input type="text" id="endDate" name="endDate" value="${endDate}" placeholder="검색 종료 날짜"/>
            </div>
            <button type="button" id="searchBtn" class="custom-btn btn-1">검색</button>
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
           		<c:if test="${not empty issueList}">
           			<c:forEach items="${issueList}" var="issueList">
           				<tr>
	                		<td>${issueList.no}</td>
	                		<td>
	                			<a href="/issue/view?no=${issueList.no}&page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}">${issueList.title}</a>
	                		</td>
	                		<td>${issueList.author}</td>
	                		<td>${issueList.regDate}</td>
                		</tr>
               		</c:forEach>
               		<input type="hidden" id="page" value="${cri.page}" readonly>
               		<input type="hidden" id="perPageNum" value="${cri.perPageNum}" readonly>
               		<input type="hidden" id="searchType" value="${searchType}" readonly>
               		<input type="hidden" id="keyword" value="${keyword}" readonly>
               	</c:if>
               	<c:if test="${empty issueList}">
               		<tr>
               			<td> 작성된 게시물이 없습니다. </td>
               		</tr>
               	</c:if>
            </tbody>
        </table>
        
        <!-- <div id="paginationInfo"> -->
        	<%@ include file="paginationInfo.jsp" %>
       	<!-- <div id="paginationInfo"> -->
       	<button type="button" id="writeBtn" class="custom-btn btn-1">새 글 작성</button>  
        <hr>
    </div>
</body>
</html>
