<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update</title>
<link rel="stylesheet" href="../../../resources/issue/css/write.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		var author = $("#author").val();
		var id = $("#id").val();
		
		if (id == '' || id == null) {
			alert("로그인 후 이용해 주세요.");
			location.href="/member/login";
		// 글 작성자가 아닌 사용자가 url로 접근했을 경우
		} else if (id != author) {
			alert("잘못된 접근입니다.");
			location.href="/main";
		}
		
		// 파일 입력 변경 핸들러
        $('#file-input').on('change', function() {
            const preview = $('#preview');
            const files = Array.from($('#file-input')[0].files);
            const maxSizeInBytes = 50 * 1024 * 1024; // 50MB

            // 파일 크기 체크
            for (let i = 0; i < files.length; i++) {
                if (files[i].size > maxSizeInBytes) {
                	alert(files[i].name + ' : 크기는 50MB 이하여야 합니다.');
                    // 파일 선택을 막음
                    $(this).val('');
                    return;
                }
            }
            
            files.forEach(function(file) {
                const fileId = 'file-' + file.lastModified; // 파일에 부여할 고유한 ID 생성
                preview.append('<p id="' + fileId + '">' + file.name + '<button data-index="' + fileId + '" class="file-remove">X</button></p>');
            });
        });

        // 파일 제거 핸들러
        $(document).on('click', '.file-remove', function() {
            const removeTargetId = $(this).data('index');
            const removeTarget = $('#' + removeTargetId)[0];
            const fileInput = $('#file-input')[0];
            const dataTransfer = new DataTransfer();

            for (let i = 0; i < fileInput.files.length; i++) {
                const file = fileInput.files[i];
                if ('file-' + file.lastModified != removeTargetId) {
                    dataTransfer.items.add(file);
                }
            }

            fileInput.files = dataTransfer.files;
            removeTarget.remove();
        });
		
		$("#submitBtn").on('click', function() {
			var process = $("#process").val();
			var title = $("#title").val();
			var content = $("#content").val();
			var selectNotice = $('input:checkbox[id="notice"]').is(":checked")
			
			if (process === '') {
            	alert('관련 공정을 입력해 주세요.');
            	return false;
            }
            
            if (selectNotice === true) {
            	$("#noticeYN").val("Y");
            } else if (selectNotice === false) {
            	$("#noticeYN").val("N");
            }
            
			if( title == '' || title == null) {
			    alert( '제목를 입력해 주세요' );
			    $("#title").focus();
			    return false;
			}
			
			if( content == '' || content == null) {
			    alert( '내용을 입력해 주세요' );
			    $("#content").focus();
			    return false;
			}
			alert("수정 완료.");
			$("#updateForm").submit();
		});
		
		$("#cancelBtn").on('click', function() {
			location.href="/issue/view?no=${issue.no}&page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}&selectProcess=${selectProcess}";
		});
		
		$("#toListBtn").on('click', function() {
			self.location = "/issue/list/search?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}&selectProcess=${selectProcess}"
		});
	});
	
</script>
</head>
<body>
    <div class="container">
        <h1>글 수정</h1>
        
        <form id="updateForm" action="/issue/updateSubmit" method="post" enctype="multipart/form-data">
        	<input type="hidden" id="no" name="no" value="${issue.no}" readonly>
            <select id="process" name="process" size="1">
        		<option value="" >Select Process</option>
        		<option value="Fabrication"<c:if test="${issue.process == 'Fabrication'}">selected</c:if>>Fabrication</option>
        		<option value="Oxidation"<c:if test="${issue.process == 'Oxidation'}">selected</c:if>>Oxidation</option>
        		<option value="Photo"<c:if test="${issue.process == 'Photo'}">selected</c:if>>Photo</option>
        		<option value="Etching"<c:if test="${issue.process == 'Etching'}">selected</c:if>>Etching</option>
        		<option value="Implant"<c:if test="${issue.process == 'Implant'}">selected</c:if>>Implant</option>
        		<option value="Metallization"<c:if test="${issue.process == 'Metallization'}">selected</c:if>>Metallization</option>
        		<option value="EDS"<c:if test="${issue.process == 'EDS'}">selected</c:if>>EDS</option>
        		<option value="Packaging"<c:if test="${issue.process == 'Packaging'}">selected</c:if>>Packaging</option>
        		<option value="etc"<c:if test="${issue.process == 'etc'}">selected</c:if>>etc</option>
        	</select>
        	
        	<c:if test="${member.id == 'ADMIN'}">
            	<span>공지사항</span>
            	<input type="checkbox" id="notice" <c:if test="${issue.noticeYN == 'Y'}">checked</c:if>>
            </c:if>
            <input type="hidden" id="noticeYN" name="noticeYN" value="${issue.noticeYN}"><br>
            
            <label for="title">제목:</label><br>
            <input type="text" id="title" name="title" class="ta2 m-b10" value="${issue.title}">
            
            <label for="author">작성자:</label><br>
            <input type="text" id="author" name="author" class="ta2 m-b10" value="${issue.author}" readonly><br><br>
            <input type="hidden" id="id" name="id" value="${member.id}" readonly>
            
            <input type="file" id="file-input" name="originalname" multiple />
			<h3>업로드된 파일</h3>
			
			<div id="preview">
			</div>
			
            <label for="content">내용:</label><br>
            <textarea id="content" name="content" class="ta">${issue.content}</textarea><br><br>
            <div class="right" style="gap: 10px;">
	            <input type="button" id="cancelBtn" class="custom-btn btn-1 m-b20" value="취소">
	            <input type="button" id="submitBtn" class="custom-btn btn-1 m-b20" value="수정 완료">
            </div>
            <input type="hidden" id="page" value="${cri.page}" readonly>
        	<input type="hidden" id="perPageNum" value="${cri.perPageNum}" readonly>
            <input type="hidden" id="searchType" value="${searchType}" readonly>
            <input type="hidden" id="keyword" value="${keyword}" readonly>
            <input type="hidden" id="startDate" value="${startDate}" readonly>
            <input type="hidden" id="endDate" value="${endDate}" readonly>
        </form>

        <hr>
		<div class="right">
        	<button type="button" id="toListBtn" class="custom-btn btn-1 m-b40">목록</button>
        </div>
    </div>
</body>
</html>
