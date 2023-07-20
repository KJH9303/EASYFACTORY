<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Write</title>
    <link rel="stylesheet" href="../../../resources/issue/css/board.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1 minimum-scale=1" />        
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            //viewFileList();
            
            var author = $("#author").val();
            if (author == '' || author == null) {
                alert("로그인 후 이용해주세요.");
                location.href="/member/login";
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
            
            // 글 작성
            $("#submitBtn").on('click', function() {
                var title = $("#title").val();
                var content = $("#content").val();
                
                if (title.trim() === '') {
                    alert('제목을 입력해주세요.');
                    $("#title").focus();
                    return false;
                }
                
                if (content.trim() === '') {
                    alert('내용을 입력해주세요.');
                    $("#content").focus();
                    return false;
                }
                
                console.log(title);
                console.log(content);
                alert("글 작성 완료.");
                // uploadFiles();
                $("#writeForm").submit();
            });
        });
        
        sessionStorage.setItem('fileList', '${fileList}');
    </script>
</head>
<body>
    <div id="headerContainer"></div>
    <div class="container">
        <h1>새 글 작성</h1>
        <div id="jqxFileUpload"></div>
        
        <form id="writeForm" action="/issue/writeSubmit" method="post" enctype="multipart/form-data">
            <label for="title">제목:</label><br>
            <input type="text" id="title" name="title"><br><br>
            
            <label for="author">작성자:</label><br>
            <input type="text" id="author" name="author" value="${member.id}" readonly><br><br>
            
            <input type="file" id="file-input" name="originalname" multiple />
			<h3>업로드된 파일</h3>
			
			<div id="preview">
			    <c:forEach items="${fileList}" var="fileList">
			        <p id="${fileList.fileno}">
			            ${fileList.savename}
			            <button data-index="${fileList.fileno}" class="file-remove">X</button>
			        </p>
			    </c:forEach>
			</div>
            <label for="content">내용:</label><br>
            <textarea id="content" name="content" rows="10" cols="50"></textarea><br><br>
            
            <input type="button" id="submitBtn" value="글 쓰기">
        </form>

        <hr>

        <button onclick="location.href='/issue/list'">돌아가기</button>
    </div>
    
</body>
</html>