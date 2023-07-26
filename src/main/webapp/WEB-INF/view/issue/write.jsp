<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Write</title>
    <link rel="stylesheet" href="../../../resources/issue/css/write.css?after">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1 minimum-scale=1" />        
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            //viewFileList();
            
            var author = $("#author").val();
            if (author == '' || author == null) {
                alert("로그인 후 이용해 주세요.");
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
            
            $('input:checkbox[id="notice"]').on('change', function() {
            	
            	var selectNotice = $('input:checkbox[id="notice"]').is(":checked")
            	if (selectNotice != true) {
            		$("#noticeYN").val("N");
            	} else {
            		$("#noticeYN").val("Y");
            	}
            });
            
            // 글 작성
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
                
                if (title.trim() === '') {
                    alert('제목을 입력해 주세요.');
                    $("#title").focus();
                    return false;
                }
                
                if (content.trim() === '') {
                    alert('내용을 입력해 주세요.');
                    $("#content").focus();
                    return false;
                }
                
                alert("글 작성 완료.");
                console.log($("#noticeYN").val());
                $("#writeForm").submit();
            });
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
    <div id="headerContainer"></div>
    <div class="container">
        <h1>새 글 작성</h1>
        <div id="jqxFileUpload"></div>
        
        <form id="writeForm" action="/issue/writeSubmit" method="post" enctype="multipart/form-data">
        	<select id="process" name="process" size="1" >
        		<option value="" >Select Process</option>
        		<option value="Fabrication">Fabrication</option>
        		<option value="Oxidation">Oxidation</option>
        		<option value="Photo">Photo</option>
        		<option value="Etching">Etching</option>
        		<option value="Implant">Implant</option>
        		<option value="Metallization">Metallization</option>
        		<option value="EDS">EDS</option>
        		<option value="Packaging">Packaging</option>
        		<option value="etc">etc</option>
        	</select>
        	
        	<c:if test="${member.id == 'ADMIN'}">
            	<span>공지사항</span>
            	<input type="checkbox" id="notice">
            </c:if>
            <input type="hidden" id="noticeYN" name="noticeYN" value="N">
            
            <input type="text" id="title" name="title" class="ta2 m-b10" placeholder="제목을 입력해 주세요.">
            
            <input type="hidden" id="author" class="border-none" name="author" value="${member.id}" readonly>
            
            <input type="file" id="file-input" name="originalname" multiple />
			<h3>업로드된 파일</h3>
			
			<div id="preview">
			</div>
            <textarea id="content" name="content" class="ta" placeholder="내용을 입력해 주세요."></textarea>
            <div class="right">
            	<input type="button" id="submitBtn" value="글 쓰기" class="custom-btn btn-1 m-b30">
            </div>
        </form>

        <hr>
		<div class="right">
        	<button onclick="location.href='/issue/list'" class="custom-btn btn-1 m-b40">돌아가기</button>
        </div>
    </div>
    
</body>
</html>