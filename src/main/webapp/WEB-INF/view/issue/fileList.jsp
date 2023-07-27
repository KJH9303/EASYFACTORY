<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View</title>
<link rel="stylesheet" href="../../../resources/issue/css/file.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
</script>
</head>
<body>
	<c:if test="${empty fileList}">
		<div>등록된 파일이 없습니다.</div>
	</c:if>
	<c:if test="${not empty fileList}">
		<div class="white">${fileCnt}</div>
		<c:forEach items="${fileList}" var="file">
		    <div class="right">
		    	<a href="/issue/downloadFile?savename=${file.savename}"><img src="/resources/img/filedown.png" class="wh" alt="다운로드"></a>
		        <input type="text" class="file" name="originalname" value="${file.originalname}"readonly> 
		        <input type="hidden" name="savename" value="${file.savename}" readonly> 
		        <input type="hidden" name="fileno" value="${file.fileno}" readonly>
		        <input type="text" class="file2" name="filesize" value="${file.filesizeFormatted}" readonly>
		    </div>
		</c:forEach>
	</c:if>
</body>
</html>