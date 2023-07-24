<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp" %>
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
		var isProcessing = false; 
		
		var id = $("#id").val();
		
		// 로그인하지 않은 상태일 경우
		if (id == '' || id == null) {
			alert("로그인 후 이용해주세요.");
			location.href="/member/login";
		}
		
		// 글 수정 페이지
		$("#updateBtn").on('click', function() {
			var no = $("#no").val();
			
			var result = confirm("내용을 수정하면 기존에 업로드된 파일은 모두 삭제됩니다.");
			if(result){
			    location.href="/issue/update?no=${issue.no}&page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}";
			}else{
			    alert("취소하였습니다.");
			    return;
			}
			
			location.href="/issue/update?no=${issue.no}&page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}";
		});
		
		// 파일 목록 출력
        function viewFileList() {
            var no = $("#no").val(); // 게시물 번호를 JSP 변수로 전달
            $.ajax({
                url: '/issue/viewFileList',
                type: 'GET',
                data: {
                    no: no // 게시물 번호를 Ajax 요청 파라미터로 전달
                },
                success: function(fileHtml) {
                    $('#fileList').html(fileHtml);
                }
            });
        }
		
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
		
		$(document).on('click', "button[name='toListBtn']", function() {
			self.location = "/issue/list/search?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}"
		});

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
		
     	// 댓글 textarea영역 줄바꿈 제한
        $("#reply_content").keydown(function (event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                return false;
            }
        });
        
        // 댓글등록 버튼을 눌렀을 때 댓글 작성 함수 실행
        $("#replyWriteBtn").on('click',function() {
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
                url:'/issue/writeReply',
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
        
        // 댓글 수정 버튼 클릭 시
        $(document).on('click', "button[name='reply_button_edit']", function() {
            if (isProcessing) {
                // 중복 클릭 방지: 이미 처리 중인 경우 무시
                return;
            }

            var replyDiv = $(this).closest("div");
            var reContent = replyDiv.find("textarea[name='reply_content']");
            var reno = replyDiv.find("input[name='reno']").val();
            var prevContent = reContent.val();
            var updateBtn = replyDiv.find("button[name='reply_button_update']");
            var cancelBtn = replyDiv.find("button[name='reply_button_cancel']");

            // 수정 버튼 클릭 시
            replyDiv.data("prev-content", prevContent);
            reContent.removeAttr("readonly");
            replyDiv.find("button[name^='reply_button']").hide();
            updateBtn.show();
            cancelBtn.show();
        });

        // 댓글 수정 완료 버튼 클릭 시
        $(document).on('click', "button[name='reply_button_update']", function() {
            if (isProcessing) {
                // 중복 클릭 방지: 이미 처리 중인 경우 무시
                return;
            }

            var replyDiv = $(this).closest("div");
            var reContent = replyDiv.find("textarea[name='reply_content']");
            var reno = replyDiv.find("input[name='reno']").val();
            var content = reContent.val();

            // 중복 클릭 방지: 처리 중 상태로 설정
            isProcessing = true;

            $.ajax({
                url : '/issue/updateReply',
                type : 'POST',
                data : {
                    reno : reno,
                    content : content
                },
                success : function(result) {
                    reContent.attr("readonly", true);
                    replyDiv.find("button[name='reply_button_edit'], button[name='reply_button_delete']").show();
                    replyDiv.find("button[name='reply_button_update'], button[name='reply_button_cancel']").hide();
                    replyDiv.find("span.reply_content_text").text(content);
                    alert("등록된 댓글을 수정했습니다.");
                    viewReply();
                },
                complete : function() {
                    // 중복 클릭 방지: 처리 완료 상태로 설정
                    isProcessing = false;
                }
            }); // $.ajax({
        });

        // 댓글 수정 취소 버튼 클릭 시
        $(document).on('click', "button[name='reply_button_cancel']", function() {
            var replyDiv = $(this).closest("div");
            var reContent = replyDiv.find("textarea[name='reply_content']");
            var prevContent = replyDiv.data("prev-content");

            reContent.val(prevContent);
            reContent.attr("readonly", true);
            replyDiv.find("button[name^='reply_button']").show();
            replyDiv.find("button[name='reply_button_update'], button[name='reply_button_cancel']").hide();
        });

        // 댓글 삭제 버튼 클릭 시
        $(document).on('click', "button[name='reply_button_delete']", function() {
            if (isProcessing) {
                // 중복 클릭 방지: 이미 처리 중인 경우 무시
                return;
            }

            var replyDiv = $(this).closest("div");
            var reno = replyDiv.find("input[name='reno']").val();
            var answer = confirm("등록된 댓글을 삭제합니다.");

            if (answer) {
                // 중복 클릭 방지: 처리 중 상태로 설정
                isProcessing = true;

                $.ajax({
                    url : '/issue/deleteReply',
                    type : 'POST',
                    data : {
                        reno : reno
                    },
                    success : function(result) {
                        replyDiv.remove();
                        alert("등록된 댓글을 삭제했습니다.");
                        viewReply();
                    },
                    complete : function() {
                        // 중복 클릭 방지: 처리 완료 상태로 설정
                        isProcessing = false;
                    }
                });
            } else {
                alert("취소하였습니다.");
            }
        });

        // 페이지 로드 시 댓글 목록 호출
        viewReply();
     	// 페이지 로드 시 파일 목록 호출
        viewFileList();
    });
</script>
</head>
<body>

	<input type="hidden" id="page" value="${cri.page}" readonly>
	<input type="hidden" id="perPageNum" value="${cri.perPageNum}" readonly>
	<input type="hidden" id="searchType" value="${searchType}" readonly>
	<input type="hidden" id="keyword" value="${keyword}" readonly>
	<input type="hidden" id="startDate" value="${startDate}" readonly>
	<input type="hidden" id="endDate" value="${endDate}" readonly>
	
    <!-- 게시물 영역 -->
    <div class="container">
        <h1>글 보기</h1>
        	<input type="hidden" id="no" name="no" value="${issue.no}" readonly><br><br>
        	<input type="hidden" id="id" name="id" value="${member.id}" readonly><br><br>
            <label for="title">제목:</label><br>
            <input type="text" id="title" name="title" value="${issue.title}" readonly><br><br>
            <label for="author">작성자:</label><br>
            <input type="text" id="author" name="author" value="${issue.author}" readonly><br><br>
            
		    <!-- 파일 목록 ajax -->
			<div id="fileList"></div>
			
            <label for="content">내용:</label><br>
            <textarea id="content" name="content" rows="10" cols="50" readonly>${issue.content}</textarea><br><br>
            
            <c:if test="${member.id == issue.author || member.id eq 'ADMIN'}">
            	<input type="button" id=updateBtn value="수정">
            	<input type="button" id=deleteBtn value="삭제">
           	</c:if>
        <hr>
	</div>
	<button type="button" name="toListBtn">글 목록</button>
	
	<!-- 댓글 목록 ajax -->
	<div id="replyList"></div>
	
	<!-- 댓글 입력 영역 -->
	<div id="replyContainer">
    <h2>댓글 입력</h2>
    <form id="replyForm">
        <input type="text" id="reply_author" name="author" value="${member.id}" readonly>
        <textarea class="reply-content" id="reply_content" cols="80" rows="2" name="content"></textarea>
        <button type="button" id="replyWriteBtn">댓글 작성</button>
    </form>
    
    <button type="button" name="toListBtn">글 목록</button>
</div>
</body>
</html>
