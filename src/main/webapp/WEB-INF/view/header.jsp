<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>EASY FACTORY</title>
    <link href="../../../resources/main/css/header.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            
            // 회원정보 수정
            $("#memUpdateBtn").on('click', function() {
                location.href="/member/updateCheck";
            });
            
            // 로그아웃
            $("#logoutBtn").on('click', function() {
                alert("로그아웃 되었습니다.")
                location.href="/member/logout";
            });
            
            // 클릭 이벤트 바인딩
            $("a[id^='feb']").on('click', function() {
                var id = $("#id").val();
                var code = $("#code").val();
                var num = $(this).attr('id').replace('feb', '');
                var url = "/feb/feb" + num;
                checkAccess(id, code, url);
            });

            $("#guideLines").on('click', function() {
                var id = $("#id").val();
                var code = $("#code").val();
                checkAccess(id, code, "/feb/guideLines");
            });

            $("#energy").on('click', function() {
                var id = $("#id").val();
                var code = $("#code").val();
                checkAccess(id, code, "/energy/energyDashboard");
            });

            $("#stock").on('click', function() {
                var id = $("#id").val();
                var code = $("#code").val();
                checkAccess(id, code, "/stock/stockDashboard");
            });
            
            $("#EnergySimulation").on('click', function() {
                var id = $("#id").val();
                var code = $("#code").val();
                checkAccess(id, code, "/analysis/energySimulation");
            });
            
            $("#tat").on('click', function() {
                var id = $("#id").val();
                var code = $("#code").val();
                checkAccess(id, code, "/tat/tat");
            });

            $("#issueList").on('click', function() {
                var id = $("#id").val();
                if (id == null || id === "") {
                    var result = confirm("로그인 하세요.");
                    if (result) {
                        location.href = "/member/login";
                    } else {
                        alert("취소하였습니다.");
                        location.href = "/main";
                    }
                } else {
                    location.href = "/issue/list";
                }
            });

         // 공통 함수: 로그인 여부 및 접근 권한 체크
            function checkAccess(id, code, url) {
                if (id == null || id === "") {
                    var result = confirm("로그인 하세요.");
                    if (result) {
                        location.href = "/member/login";
                    } else {
                        alert("취소하였습니다.");
                        location.href = "/main";
                    }
                } else if (id !== null && id !== "" && code === 'EXTERNAL') {
                    alert("외부인 회원은 해당 페이지에 접근할 수 없습니다.");
                    return;
                } else if (id !== null && id !== "" && (code === 'INTERNAL' || code === 'ADMIN')) {
                    location.href = url;
                }
            }
            
            $("#writeBtn").on('click', function() {
                location.href = "/issue/write";
            });
        });
    </script>
    <script type="text/javascript">
	$(document).ready(function() {
		setTimeout(function (){
			$('#load').hide();
		}, 1500)
	});
	</script>
</head>
<body>
<div class= "load" id="load">
	<img src="/resources/img/Ripple-1s-200px (1).gif" alt="loading">
</div>
<!-- 헤더 -->
<div class="header">
    <table class="current-time">
        <tr>
            <c:if test="${member.id != null}">
                <td rowspan="2">
                    <b>${member.name}</b> 
                    님 환영합니다.
                </td>
                <td rowspan="2">
                    <button type="button" id="memUpdateBtn" class="pointer">
                        <img src="/resources/img/gear-100s-200px.png">
                    </button>
                    <button type="button" id="logoutBtn" class="pointer">
                        <img src="/resources/img/login-100s-200px.png">
                    </button>
                </td>
            </c:if>
            <c:if test="${member.id == null}">
                <td rowspan="2">
                    <a href="/member/login" style="text-decoration-line: none; color: white; text-align:center;"><b>Login</b></a>
                </td>
                <td rowspan="2">
                    <a href="/member/signup" style="text-decoration-line: none; color: white; text-align:center;"><b>SignUp</b></a>
                </td>
            </c:if>
            <td id="date"></td>
        </tr>
        <tr>
            <td id="time"></td>
        </tr>
    </table>
</div>
<!-- 사이드바 메뉴 -->
<div id="sidebarMenu">
    <div class="logo">
        <a href="/main"><img src="/resources/img/logo2.jpeg"></a>
        <h2><a id="main" style="text-decoration-line: none; color: black; text-align:center;" href="/main">Easy Factory</a></h2>
    </div>
	<input type="hidden" id="id" value="${member.id}">
	<input type="hidden" id="code" value="${member.code}">
    <ul class="sidebarMenuInner">
        <li>
            <a href="#" class="ha">process<span>dashboard</span></a>
            <ul class="submenu">
                <li><a id="feb1">Wafer<br>Fabrication</a></li>
                <li><a id="feb2">Oxidation</a></li>
                <li><a id="feb3">Photo<br>Lithography</a></li>
                <li><a id="feb4">Etching</a></li>
                <li><a id="feb5">Implant</a></li>
                <li><a id="feb6">Metallization</a></li>
                <li><a id="feb7">EDS</a></li>
                <li><a id="feb8">Packaging</a></li>
            </ul>
        </li>
        <li>
            <a id="energy" class="ha">energy<span>dashboard</span></a>
        </li>
        <li>
            <a id="stock" class="ha">inventory<span>management</span></a>
        </li>
        <li>
            <a href="#" class="ha">smart<span>analysis</span></a>
            <ul class="submenu">
                <li><a id="EnergySimulation">Energy<br>Simulation</a></li>
            </ul>
        </li>
         <li>
            <a id="tat" class="ha">작업관리<span>tat Management</span></a>
        </li>
         <li>
            <a id="issueList" class="ha">issue<span>board</span></a>
        </li>
        <li>
            <a id="guideLines" class="ha">guide<span>line</span></a>
        </li>
    </ul>
</div>
</body>
</html>