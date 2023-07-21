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
<link rel="stylesheet" href="../../../resources/issue/css/board.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
</script>
</head>
<body>
	<c:if test="${empty fileList}">
		<div>등록된 파일이 없습니다.</div>
	</c:if>
	<c:if test="${not empty fileList}">
		<div>등록된 파일 : ${fileCnt}</div>
		<c:forEach items="${fileList}" var="fileList">
			<div>
				<input type="text" name="savename" value="${fileList.originalname}" readonly> 
				<input type="text" name="fileno" value="${fileList.fileno}" readonly>
				<input type="text" name="filesize" value="${fileList.filesizeFormatted}" readonly>
				<c:if test="${member.id == replyList.author}">
					<button type="button" name="file_button_edit">수정</button>
					<button type="button" name="file_button_delete">삭제</button>
					<button type="button" name="file_button_update" style="display: none;">수정 완료</button>
					<button type="button" name="file_button_cancel" style="display: none;">수정 취소</button>
				</c:if>
			</div>
		</c:forEach>
	</c:if>
</body>
</html>