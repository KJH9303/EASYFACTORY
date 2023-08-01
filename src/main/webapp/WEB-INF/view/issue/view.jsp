<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View</title>
<link rel="stylesheet" href="../../../resources/issue/css/view.css?after">
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
			    location.href="/issue/update?no=${issue.no}&page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}&selectProcess=${selectProcess}";
			}else{
			    alert("취소하였습니다.");
			    return;
			}
			
			location.href="/issue/update?no=${issue.no}&page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}&selectProcess=${selectProcess}";
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
			    location.href="/issue/delete?no=${issue.no}&page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}&selectProcess=${selectProcess}";
			}else{
			    alert("취소하였습니다.");
			}
		});
		
		$(document).on('click', "button[name='toListBtn']", function() {
			self.location = "/issue/list/search?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}&selectProcess=${selectProcess}";
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
                console.log(isProcessing);
                return;
            }

            var replyDiv = $(this).closest(".replyListArea");
            var reContent = replyDiv.find("textarea[name='reply_content']");
            var reno = replyDiv.find("input[name='reno']").val();
            console.log(replyDiv.val());
            console.log(reno);
            var prevContent = reContent.val();
            var updateBtn = replyDiv.find("button[name='reply_button_update']");
            var cancelBtn = replyDiv.find("button[name='reply_button_cancel']");

            replyDiv.data("prev-content", prevContent);
            
            reContent.removeAttr("readonly");
            reContent.attr("style", "border: solid 1px rgba(0, 0, 0, 0.300); border-radius: 5px; width: 98%; font-size: 15px; box-shadow: 1px 1px 1px 0px rgba(255, 255, 255, 0.317), 5px 5px 15px 0px rgba(0, 0, 0, 0.080) 2px 2px 5px 0px rgba(0, 0, 0, 0.080); resize: none;");
            
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

            var replyDiv = $(this).closest(".replyListArea");
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
            var replyDiv = $(this).closest(".replyListArea");
            var reContent = replyDiv.find("textarea[name='reply_content']");
            var prevContent = replyDiv.data("prev-content");

            reContent.val(prevContent);
            reContent.attr("style", " border: 1px white solid; width: 98%; font-size: 15px; resize: none; text-align: left;");
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

            var replyDiv = $(this).closest(".replyListArea");
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

	<input type="hidden" id="page" value="${cri.page}" readonly>
	<input type="hidden" id="perPageNum" value="${cri.perPageNum}" readonly>
	<input type="hidden" id="searchType" value="${searchType}" readonly>
	<input type="hidden" id="keyword" value="${keyword}" readonly>
	<input type="hidden" id="startDate" value="${startDate}" readonly>
	<input type="hidden" id="endDate" value="${endDate}" readonly>
 
	<!-- 게시물 영역 -->
	<div class="container">
	
		<input type="hidden" id="no" name="no" value="${issue.no}" readonly><br>
		<input type="hidden" id="id" name="id" value="${member.id}" readonly><br>

		<hr>
		
		<h1 id="title" class="fs-40">
			<c:if test = "${issue.noticeYN eq 'Y'}">[공지]</c:if> ${issue.title}
		</h1>

		<div class="left">
			<label for="process" class="mr-5 fs-20"><b>공정</b></label>
			<span id="process" class="mr-15 fs-20">${issue.process}</span>
			
			<label for="author" class="mr-5 fs-20"><b>작성자</b></label>
			<span id="author" class="mr-15 fs-20">${issue.author}</span>
			
			<label for="regDate" class="mr-5 fs-20"><b>작성일</b></label>
			<span id="regDate" class="mr-15 fs-20">${issue.regDate}</span>

			<c:if test="${issue.modDate != null}">
				<label for="modDate" class="mr-5 fs-20"><b>수정일</b></label>
				<span id="modDate" class="mr-15 fs-20">${issue.modDate}</span>
			</c:if>

			<label for="viewCnt" class="mr-5 fs-20"><b>조회수</b></label>
			<span id="viewCnt" class="mr-15 fs-20">${issue.viewCnt}</span>
		</div>
		<hr>

		<!-- 파일 목록 ajax -->
		<div id="fileList" class="right"></div>
		
		<h3 class="m-b40">${issue.content}</h3>
		<div class="right" style="gap: 5px;">
			<c:if test="${member.id == issue.author}">
				<input type="button" id=updateBtn class="custom-btn btn-1 fs-15" value="수정">
			</c:if>
			<c:if test="${member.id == issue.author || member.id eq 'ADMIN'}">
				<input type="button" id=deleteBtn class="custom-btn btn-1 fs-15" value="삭제">
			</c:if>
		</div>
		<hr>

		<!-- 댓글 목록 ajax -->
		<div id="replyList"></div>

		<!-- 댓글 입력 영역 -->
		<div id="replyContainer">
			<h2>댓글 입력</h2>
			<form id="replyForm">
				<input type="hidden" id="reply_author" name="author" class="border-none w-70" value="${member.id}" readonly>
				<%-- <span class="mr-15 fs-20 m-b10">${member.id}</span> --%>
				
				<textarea class="reply-content ta3 m-b20" id="reply_content" name="content"></textarea>
				
				<div class="right">
					<button type="button" id="replyWriteBtn" class="custom-btn btn-1 m-b20">댓글 작성</button>
				</div>
			</form>
			<hr>
			<div class="right">
				<button type="button" name="toListBtn" class="custom-btn btn-1 m-b40">글 목록</button>
			</div>
		</div>
	</div>
</body>
</html>
