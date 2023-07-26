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
<link rel="stylesheet" href="../../../resources/issue/css/view.css?After">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
</script>
</head>
<body>
		<c:if test="${empty replyList}">
			<div class="tac fs-20">등록된 댓글이 없습니다.</div>
		</c:if>
		<c:if test="${not empty replyList}">
			<div class="fs-20">등록된 댓글 : ${replyCnt}</div>
			<br />
			<c:forEach items="${replyList}" var="replyList">
				<div class="replyListArea">
					<span class="mr-15 fs-20 m-b10">${replyList.author}</span>
					<input type="hidden" name="reno" value="${replyList.reno}" readonly>
					<textarea name="reply_content" class="ta2 border-none" readonly>${replyList.content}</textarea>
					
					<div>
						<c:if test="${member.id == replyList.author || member.id eq 'ADMIN'}">
							<button type="button" name="reply_button_edit" class="custom-btn2 btn-1">수정</button>
							<button type="button" name="reply_button_delete" class="custom-btn2 btn-1">삭제</button>
							<button type="button" name="reply_button_update" style="display: none;" class="custom-btn2 btn-1">수정 완료</button>
							<button type="button" name="reply_button_cancel" style="display: none;" class="custom-btn2 btn-1">수정 취소</button>
						</c:if>
					</div>

					<span class="mr-5 fs-20">작성일 : </span>
					<span class="mr-15 fs-20">${replyList.regDate}</span>
						
					<c:if test="${replyList.modDate != null}">
						<span class="mr-5 fs-20">수정일 : </span>
						<span class="mr-15 fs-20">${replyList.modDate}</span>
					</c:if>
					
					<br />
					<br />
					<br />
				</div>
			</c:forEach>
		</c:if>
</body>
</body>
</html>