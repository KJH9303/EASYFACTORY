<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <title>MainPage</title>
    <link rel="stylesheet" href="../../resources/main/css/main.css?after">
    <script>
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
<!-- 메인 이너 -->
    <div class="main">
        <section class="cover cover_fullpage">
            <div class="cover-background">
                <video class="cover-background-video" playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop" src="http://wizcore.co.kr/wp-content/uploads/sites/4/2020/10/video.mp4">
                </video>
            </div>
            <div class="cover-inside">
                <div class="l_wrapper">
                    <div class="front">
                        <div class="front-contents">
                            <div class="front-slide">
                                <div class="front-slide-item">
                                    <div class="front-box">
                                    <img class="front-box-cover" src="http://wizcore.co.kr/wp-content/themes/wizcore/statics/home/images/front-icon-03.png">
                                        <h2>Innovative</h2>
                                        <hr>
                                        <p>데이터 기반의 혁신적인 경험을 바탕으로 비즈니스 성장을 견인합니다.</p>
                                    </div>
                                </div>
                                <div class="front-slide-item">
                                    <div class="front-box">
                                        <img class="front-box-cover" src="http://wizcore.co.kr/wp-content/themes/wizcore/statics/home/images/front-icon-02.png">
                                        <h2>Intelligent</h2>
                                        <hr>
                                        <p>스마트한 데이터 분석으로 예측 가능한 결과를 제공합니다.</p>
                                    </div>
                                </div>
                                <div class="front-slide-item">
                                    <div class="front-box">
                                        <img class="front-box-cover" src="http://wizcore.co.kr/wp-content/themes/wizcore/statics/home/images/front-icon-01.png">
                                        <h2>Insightful</h2>
                                        <hr>
                                        <p>데이터로부터 얻은 의미있는 통찰력을 차별화 된 가치로 전환합니다.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>

