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
		// 댓글 수정/삭제/수정취소 버튼 클릭 시
		$(document).on("click", "button[name^='reply_button']", function() {
			var replyDiv = $(this).closest("div");
			var reContent = replyDiv.find("textarea[name='reply_content']");
			var reno = replyDiv.find("input[name='reno']").val();
			var prevContent = reContent.val();
			var updateBtn = replyDiv.find("button[name='reply_button_update']");
			var cancelBtn = replyDiv.find("button[name='reply_button_cancel']");
			
			if ($(this).attr("name") === "reply_button_edit") {
				// 수정 버튼 클릭 시
				replyDiv.data("prev-content", prevContent);
				reContent.removeAttr("readonly");
				replyDiv.find("button[name^='reply_button']").hide();
				updateBtn.show();
				cancelBtn.show();
			} else if ($(this).attr("name") === "reply_button_update") {
				// 수정 완료 버튼 클릭 시
				var content = reContent.val();
				
				$.ajax({
					url: '/issue/updateReply',
					type: 'POST',
					data: {
						reno: reno,
						content: content
					},
					success: function(result) {
						reContent.attr("readonly", true);
						replyDiv.find("button[name='reply_button_edit'], button[name='reply_button_delete']").show();
						updateBtn.hide();
						cancelBtn.hide();
						replyDiv.find("span.reply_content_text").text(content);
					}
				});
			} else if ($(this).attr("name") === "reply_button_cancel") {
				// 수정 취소 버튼 클릭 시
				reContent.val(replyDiv.data("prev-content"));
				reContent.attr("readonly", true);
				replyDiv.find("button[name^='reply_button']").show();
				updateBtn.hide();
				cancelBtn.hide();
			} else if ($(this).attr("name") === "reply_button_delete") {
				// 삭제 버튼 클릭 시
				var result = confirm("등록된 댓글을 삭제합니다.");
				if (result) {
					$.ajax({
						url: '/issue/deleteReply',
						type: 'POST',
						data: {
							reno: reno
						},
						success: function(result) {
							replyDiv.remove();
						}
					});
				} else {
					alert("취소하였습니다.");
				}
			}
		});
	});
</script>
</head>
<body>
	<div>등록된 댓글 : ${replyCnt}</div><br/>
	<div>
		<c:if test="${replyList != null}">
		    <c:forEach items="${replyList}" var="replyList">
		        <div>
		        	<input type="text" name="reply_author" value="${replyList.author}" readonly>
		        	<input type="hidden" name="reno" value="${replyList.reno}" readonly>
		        	<textarea name="reply_content" rows="1" cols="50" readonly>${replyList.content}</textarea>
		        	<c:if test="${member.id == replyList.author}">
			        	<button type="button" name="reply_button_edit">수정</button>
			        	<button type="button" name="reply_button_delete">삭제</button>
			        	<button type="button" name="reply_button_update" style="display: none;">수정 완료</button>
			        	<button type="button" name="reply_button_cancel" style="display: none;">수정 취소</button>
		        	</c:if>
		        	<br/>
		        	<c:if test="${replyList.modDate == null}">
			        	<span>작성일 : </span>
			        	<input type="text" name="regDate" value="${replyList.regDate}" readonly>
		        	</c:if>
		        	<c:if test="${replyList.modDate != null}">
			        	<span>수정일 : </span>
			        	<input type="text" name="modDate" value="${replyList.modDate}" readonly>
		        	</c:if>
		        	<br/><br/><br/>
		        </div>
		    </c:forEach>
	    </c:if>
    </div>
    <div>
	    <c:if test="${replyCnt == 0}">
    		<div>등록된 댓글이 없습니다.</div>
	    </c:if>
    </div>
</body>
</html>