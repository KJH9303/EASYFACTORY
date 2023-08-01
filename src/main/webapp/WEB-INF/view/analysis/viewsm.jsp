<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../../resources/feb/css/guideLines.css">
<title>Energy Simulation</title>
<link href="../../resources/img/logoicon.jpg" rel="shortcut icon" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
</script>
</head>
<body>
		<c:if test="${empty smList}">
			<div class="tac fs-20">데이터가 없습니다.</div>
		</c:if>
		<c:if test="${not empty smList}">
			<c:forEach items="${smList}" var="smList">
				<div class="smListArea">
					<!-- <span class="mr-15 fs-20 m-b10">${smList}</span> -->
					
					<span class="mr-5 fs-20">전기 : ${smList}</span>
					<span class="mr-15 fs-20">비용 : ${smList}</span>
				</div>
			</c:forEach>
		</c:if>
	</div>
</body>
</html>
