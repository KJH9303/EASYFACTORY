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
            viewFileList();
            
            var author = $("#author").val();
            if (author == '' || author == null) {
                alert("로그인 후 이용해주세요.");
                location.href="/member/login";
            }
            
         	// 파일 선택 시 파일 목록에 추가
//            $("#fileUploadBtn").on('click', function() {
//            	$("input[name='originalname']").attr("style", "display:inline");
//            });
         	
            $("input[name='originalname']").on('change', function() {
		        var fileList = this.files;
		        var fileCount = fileList.length;
		
		        $("#fileList").empty(); // 파일 목록 초기화
		
		        for (var i = 0; i < fileCount; i++) {
		            var file = fileList[i];
		            var fileId = 'file-' + i; // 파일에 부여할 고유한 ID 생성
		
		            // 파일 목록에 추가
		            $("#fileList").append('<li id="' + fileId + '">' + file.name + '</li>');
		        }
		    });

         	// 파일 업로드
            function uploadFiles() {
                var formData = new FormData();
                var files = $('#files')[0].files;

                for (var i = 0; i < files.length; i++) {
                    formData.append('originalname', files[i]);
                }

                $.ajax({
                    type: 'POST',
                    url: '/issue/uploadFile',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(data) {
                        console.log(data);
                        if (data === 'UploadSuccess') {
                            viewFileList();
                        } else {
                            // 실패 처리
                        }
                    }
                });
            }

            // 파일 목록 출력
            function viewFileList() {
                var no = $("#no").val();
                if(no == null){
                	no = 0;
                }
                console.log("no : " + no);
                $.ajax({
                    url: '/issue/viewFileList',
                    type: 'GET',
                    data: {
                        no: no
                    },
                    success: function(fileHtml) {
                        $('#viewFileList').html(fileHtml);
                    }
                });
            }
            
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
                uploadFiles();
                alert("글 작성 완료.");
                $("#writeForm").submit();
            });
        });
    </script>
</head>
<body>
    <div id="headerContainer"></div>
    <div class="container">
        <h1>새 글 작성</h1>
        
        <div id="jqxFileUpload"></div>
        <form method="post" action="/issue/uploadFile" enctype="multipart/form-data">
			<input type="file" id="files" name="originalname"/>
			<ul id="fileList"></ul>
		</form>
		
            <!-- 파일 목록 출력 영역 -->
            <ul id="fileList"></ul>
            
        <form id="writeForm" action="/issue/writeSubmit" method="post">
            <label for="title">제목:</label><br>
            <input type="text" id="title" name="title"><br><br>
            
            <label for="author">작성자:</label><br>
            <input type="text" id="author" name="author" value="${member.id}" readonly><br><br>
            
            <label for="content">내용:</label><br>
            <textarea id="content" name="content" rows="10" cols="50"></textarea><br><br>
            
            <input type="button" id="submitBtn" value="글 쓰기">
        </form>

        <hr>

        <button onclick="location.href='/issue/list'">돌아가기</button>
    </div>
</body>
</html>