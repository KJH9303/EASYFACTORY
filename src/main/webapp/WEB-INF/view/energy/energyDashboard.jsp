<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Dashboard</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="shortcut icon" href="#">
  <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5.4.2/dist/echarts.min.js"></script> 
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
  <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <!-- css, js -->
  <link rel="stylesheet" href="../../../resources/energy/css/energy.css" />
  <script src="../../../resources/energy/js/energy.js?after" ></script>
  <!-- css, js -->
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
	  
	  window.addEventListener('load', updateTime);
  </script>
</head>
<body>
<div class="flex-1 h-full">
  <!-- Main content -->
  <main>
    <!-- Content header -->
    <div class="flex items-center justify-between px-4 py-4 border-b lg:py-6">
    	<h1>Energy</h1>
    </div>
    <!-- Content -->
    <div class="mt-2">
      <!-- State cards -->
      <div class="grid grid-cols-1 gap-8 p-4 lg:grid-cols-2 xl:grid-cols-4">
        <!-- Value card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6 class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              총 에너지 사용 비용
            </h6>
            <span id="value1" class="text-xl font-semibold">0</span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : 천원)
            </span>
          </div>
          <div class="date">
            <!-- 달력 아이콘 추가 -->
            <img src="/resources/img/calendar-100s-200px.png" id="energyCostIcon1">
             <!-- 데이터 피커 -->
            <input type="text" id="energyCostStartDate1" class="datepicker" name="energyCostStartDate"/>
            <input type="text" id="energyCostEndDate1" class="datepicker" name="energyCostEndDate"/>
            <button id="applyEnergyCost1" class="custom-btn btn-1">Submit</button>
          </div>
        </div>
        <!-- Users card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6 class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              총 에너지 사용량
            </h6>
            <span id="value2" class="text-xl font-semibold"></span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : Kwh)
            </span>
          </div>
          <div class="date">
            <!-- 달력 아이콘 추가 -->
            <img src="/resources/img/calendar-100s-200px.png" id="energyCostIcon2">
            <!-- 데이터 피커 -->
            <input type="text" id="energyCostStartDate2" class="datepicker" name="energyCostStartDate"/>
            <input type="text" id="energyCostEndDate2" class="datepicker" name="energyCostEndDate"/>
             <button id="applyEnergyCost2" class="custom-btn btn-1">Submit</button>
          </div>
        </div>
        <!-- Orders card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6 class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              총 공정 가동률 평균(%)
            </h6>
            <span id="value3" class="text-xl font-semibold"></span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : %)
            </span>
          </div>
          <div class="date">
            <!-- 달력 아이콘 추가 -->
            <img src="/resources/img/calendar-100s-200px.png" id="energyCostIcon3">
             <!-- 데이터 피커 -->
            <input type="text" id="energyCostStartDate3" class="datepicker" name="energyCostStartDate"/>
            <input type="text" id="energyCostEndDate3" class="datepicker" name="energyCostEndDate"/>
             <button id="applyEnergyCost3" class="custom-btn btn-1">Submit</button>
          </div>
        </div>
      </div>
      <!-- Charts -->
      <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 가동률 평균</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <img src="/resources/img/calendar-100s-200px.png" id="energyCostIcon4">
               <!-- 데이터 피커 -->
              <input type="text" id="energyCostStartDate4" class="datepicker" name="energyCostStartDate"/>
              <input type="text" id="energyCostEndDate4" class="datepicker" name="energyCostEndDate"/>
               <button id="applyEnergyCost4" class="custom-btn btn-1">Submit</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <div id="FebOpratio_Chart" style="height: 100%"></div>
          </div>
        </div>
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
           <h4 class="text-lg font-semibold text-gray-500">공정별 총 생산량</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <img src="/resources/img/calendar-100s-200px.png" id="energyCostIcon5">
               <!-- 데이터 피커 -->
              <input type="text" id="energyCostStartDate5" class="datepicker" name="energyCostStartDate"/>
              <input type="text" id="energyCostEndDate5" class="datepicker" name="energyCostEndDate"/>
                <button id="applyEnergyCost5" class="custom-btn btn-1">Submit</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
      		<div id="FebTr_Chart" style="height: 100%"></div>
          </div>
        </div>
      </div>
        <!-- Charts -->
      <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 총 에너지사용비용</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <img src="/resources/img/calendar-100s-200px.png" id="energyCostIcon6">
               <!-- 데이터 피커 -->
              <input type="text" id="energyCostStartDate6" class="datepicker" name="energyCostStartDate"/>
              <input type="text" id="energyCostEndDate6" class="datepicker" name="energyCostEndDate"/>
                <button id="applyEnergyCost6" class="custom-btn btn-1">Submit</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <div id="FebCost_Chart" style="height: 100%"></div>
          </div>
        </div>
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 총 에너지 사용량</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <img src="/resources/img/calendar-100s-200px.png" id="energyCostIcon7">
               <!-- 데이터 피커 -->
             <input type="text" id="energyCostStartDate7" class="datepicker" name="energyCostStartDate" />
              <input type="text" id="energyCostEndDate7" class="datepicker" name="energyCostEndDate"/>
                <button id="applyEnergyCost7" class="custom-btn btn-1">Submit</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
             <div id="FebUsingratio_Chart" style="height: 100%"></div>
          </div>
        </div>
      </div>
        <!-- Charts -->
      <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 총 에너지사용 비용 대비 총 생산량</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <img src="/resources/img/calendar-100s-200px.png" id="energyCostIcon8">
               <!-- 데이터 피커 -->
              <input type="text" id="energyCostStartDate8" class="datepicker" name="energyCostStartDate"/>
              <input type="text" id="energyCostEndDate8" class="datepicker" name="energyCostEndDate"/>
                <button id="applyEnergyCost8" class="custom-btn btn-1">Submit</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
             <div id="Costs_Tr_Chart" style="height: 100%"></div>
          </div>
        </div>
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 총 에너지사용 비용 대비 총 에너지 사용량</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <img src="/resources/img/calendar-100s-200px.png" id="energyCostIcon9">
               <!-- 데이터 피커 -->
             <input type="text" id="energyCostStartDate9" class="datepicker" name="energyCostStartDate" />
              <input type="text" id="energyCostEndDate9" class="datepicker" name="energyCostEndDate" />
                <button id="applyEnergyCost9" class="custom-btn btn-1">Submit</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
           <div id="Costs_Usingratio_Chart" style="height: 100%"></div>
          </div>
        </div>
      </div>
      <script>
      // JS 날짜 변환 쿼리 
      let today = new Date(); // 시작일자
      let year = today.getFullYear(); // 년도
      let month = today.getMonth() + 1;  // 월
      let date = today.getDate();  // 날짜
      //각 차트 날짜 지정을 위한 배열 쿼리
      var startDate = new Array(9);
      var endDate = new Array(9);
      for(var cnt=0; cnt < 9; cnt++) {
      	startDate[cnt] = year + '-' + month + '-' + date;
      	endDate[cnt] = year + '-' + month + '-' + date;
      }
     
      $(document).ready(function () {
    	 // 데이트피커 기본 디폴트값
    	 $("input[name='energyCostStartDate']").val(startDate[0]);
    	 $("input[name='energyCostEndDate']").val(endDate[0]);
    	  
        // 달력 아이콘 클릭 시 데이터 피커를 토글합니다.
			$("#energyCostIcon1").click(function () {
				$("#energyCostStartDate1").toggle();
				$("#energyCostEndDate1").toggle();
				$("#applyEnergyCost1").toggle();
			});
			$("#energyCostIcon2").click(function () {
				$("#energyCostStartDate2").toggle();
				$("#energyCostEndDate2").toggle();
				$("#applyEnergyCost2").toggle();
			});
			$("#energyCostIcon3").click(function () {
				$("#energyCostStartDate3").toggle();
				$("#energyCostEndDate3").toggle();
				$("#applyEnergyCost3").toggle();
			});
			$("#energyCostIcon4").click(function () {
				$("#energyCostStartDate4").toggle();
				$("#energyCostEndDate4").toggle();
				$("#applyEnergyCost4").toggle();
			});
			$("#energyCostIcon5").click(function () {
				$("#energyCostStartDate5").toggle();
				$("#energyCostEndDate5").toggle();
				$("#applyEnergyCost5").toggle();
			});
			$("#energyCostIcon6").click(function () {
				$("#energyCostStartDate6").toggle();
				$("#energyCostEndDate6").toggle();
				$("#applyEnergyCost6").toggle();
			});
			$("#energyCostIcon7").click(function () {
				$("#energyCostStartDate7").toggle();
				$("#energyCostEndDate7").toggle();
				$("#applyEnergyCost7").toggle();
			});
			$("#energyCostIcon8").click(function () {
				$("#energyCostStartDate8").toggle();
				$("#energyCostEndDate8").toggle();
				$("#applyEnergyCost8").toggle();
			});
			$("#energyCostIcon9").click(function () {
				$("#energyCostStartDate9").toggle();
				$("#energyCostEndDate9").toggle();
				$("#applyEnergyCost9").toggle();
			});
			// 데이터 피커의 기본 설정을 정의합니다.
			$(".datepicker").datepicker({ dateFormat: "yy-mm-dd" });

			// 서버연동을 위한 Ajax쿼리
			// 총 에너지 사용 비용 
			window.applyDateRange1 = function (event, url, targetValueId, valueKey) {

				if(event !== null) {
					let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					startDate[0] = parent.find("input[name='energyCostStartDate']").val();
					endDate[0] = parent.find("input[name='energyCostEndDate']").val();
				}
				if (new Date(startDate[0]) > new Date(endDate[0])) {
					alert("시작일이 종료일보다 큽니다.");

					let todayDate = new Date();
					let formattedTodayDate = todayDate.toJSON().substring(0, 10);
					startDate[0] = endDate[0] = formattedTodayDate;
				}
				$.ajax({
					url: "/energy/chart/1",
					method: "GET",
					data: {
						startDate: startDate[0],
						endDate: endDate[0]
					},
					success: function (response) {
						let data = JSON.parse(response);
						if (data["SUM_COSTS"] !== undefined) {
							const value = data["SUM_COSTS"];
							$("#value1").text((value).toLocaleString());
						} else {
							console.error(err);
						}
					}
				});
			}  
			// 총 에너지 사용량
			window.applyDateRange2 = function (event, url, targetValueId, valueKey) {
				if(event !== null) {
					let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					startDate[1] = parent.find("input[name='energyCostStartDate']").val();
					endDate[1] = parent.find("input[name='energyCostEndDate']").val();
				}
				if (new Date(startDate[1]) > new Date(endDate[1])) {
					alert("시작일이 종료일보다 큽니다.");

					let todayDate = new Date();
					let formattedTodayDate = todayDate.toJSON().substring(0, 10);
					startDate[1] = endDate[1] = formattedTodayDate;
				}
				$.ajax({
					url: "/energy/chart/2",
					method: "GET",
					data: {
						startDate: startDate[1],
						endDate: endDate[1]
					},
					success: function (response) {
						let data = JSON.parse(response);
						if (data["SUM_USINGRATIO"] !== undefined) {
							const value = data["SUM_USINGRATIO"];
							$("#value2").text((value).toLocaleString());
						} else {
							console.error(err);
						}
					}
				});
			};
			// 총 공정 가동률 평균
			window.applyDateRange3 = function (event, url, targetValueId, valueKey) {
				if(event !== null) {
					let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					startDate[2] = parent.find("input[name='energyCostStartDate']").val();
					endDate[2] = parent.find("input[name='energyCostEndDate']").val();
				}
				if (new Date(startDate[2]) > new Date(endDate[2])) {
					alert("시작일이 종료일보다 큽니다.");

					let todayDate = new Date();
					let formattedTodayDate = todayDate.toJSON().substring(0, 10);
					startDate[2] = endDate[2] = formattedTodayDate;
				}
				$.ajax({
					url: "/energy/chart/3",
					method: "GET",
					data: {
						startDate: startDate[2],
						endDate: endDate[2]
					},
					success: function (response) {
						let data = JSON.parse(response);
						if (data["AVERAGE_OPRATIO"] !== undefined) {
							const value = data["AVERAGE_OPRATIO"];
							$("#value3").text((value).toLocaleString());
						} else {
							console.error(err);
						}
					}
				});
			};

			// 각 공정별 가동률 평균
			window.applyDateRange4 = function (event, url, targetValueId) {
				if(event !== null) {
					let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					startDate[3] = parent.find("input[name='energyCostStartDate']").val();
					endDate[3] = parent.find("input[name='energyCostEndDate']").val();
				}
				if (new Date(startDate[3]) > new Date(endDate[3])) {
					alert("시작일이 종료일보다 큽니다.");

					let todayDate = new Date();
					let formattedTodayDate = todayDate.toJSON().substring(0, 10);
					startDate[3] = endDate[3] = formattedTodayDate;
				}
				$.ajax({
					url: "/energy/chart/4",
					type: "GET",
					data: { 
						startDate: startDate[3], 
						endDate: endDate[3]
					},
					success: function(data) {
						var chartData = JSON.parse(data);
						FebOpratioChart(chartData);
					},
					error: function(err) {

					}
				});
			}

			// 각 공정별 총 생산량 합계
			window.applyDateRange5 = function (event, url, targetValueId) {
				if(event !== null) {
					let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					startDate[4] = parent.find("input[name='energyCostStartDate']").val();
					endDate[4] = parent.find("input[name='energyCostEndDate']").val();
				}
				if (new Date(startDate[4]) > new Date(endDate[4])) {
					alert("시작일이 종료일보다 큽니다.");

					let todayDate = new Date();
					let formattedTodayDate = todayDate.toJSON().substring(0, 10);
					startDate[4] = endDate[4] = formattedTodayDate;
				}
				$.ajax({
					url: "/energy/chart/5",
					type: "GET",
					data: { 
						startDate: startDate[4], 
						endDate: endDate[4]
					},
					success: function(data) {
						var chartData = JSON.parse(data);
						FebTrChart(chartData);
					},
					error: function(err) {
	
					}
				});
			}

			// 각 공정별 총 비용 합계
			window.applyDateRange6 = function (event, url, targetValueId) {
				if(event !== null) {
					let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					startDate[5] = parent.find("input[name='energyCostStartDate']").val();
					endDate[5] = parent.find("input[name='energyCostEndDate']").val();
				}
				if (new Date(startDate[5]) > new Date(endDate[5])) {
					alert("시작일이 종료일보다 큽니다.");

					let todayDate = new Date();
					let formattedTodayDate = todayDate.toJSON().substring(0, 10);
					startDate[5] = endDate[5] = formattedTodayDate;
				}
				$.ajax({
					url: "/energy/chart/6",
					type: "GET",
					data: { 
						startDate: startDate[5], 
						endDate: endDate[5]
					},
					success: function(data) {
						var chartData = JSON.parse(data);
						FebCostChart(chartData);
					},
					error: function(err) {

					}
				});
			}

			// 각 공정별 총 에너지사용량 합계
			window.applyDateRange7 = function (event, url, targetValueId) {
				if(event !== null) {
					let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					startDate[6] = parent.find("input[name='energyCostStartDate']").val();
					endDate[6] = parent.find("input[name='energyCostEndDate']").val();
				}
				if (new Date(startDate[6]) > new Date(endDate[6])) {
					alert("시작일이 종료일보다 큽니다.");

					let todayDate = new Date();
					let formattedTodayDate = todayDate.toJSON().substring(0, 10);
					startDate[6] = endDate[6] = formattedTodayDate;
				}
				$.ajax({
					url: "/energy/chart/7",
					type: "GET",
					data: { 
						startDate: startDate[6], 
						endDate: endDate[6]
					},
					success: function(data) {
						var chartData = JSON.parse(data);
						FebUsingratioChart(chartData);
					},
					error: function(err) {

					}
				});
			}

			// 총 비용 대비 총 생산량
			window.applyDateRange8 = function (event, url, targetValueId) {
				if(event !== null) {
					let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					startDate[7] = parent.find("input[name='energyCostStartDate']").val();
					endDate[7] = parent.find("input[name='energyCostEndDate']").val();
				}
				if (new Date(startDate[7]) > new Date(endDate[7])) {
					alert("시작일이 종료일보다 큽니다.");

					let todayDate = new Date();
					let formattedTodayDate = todayDate.toJSON().substring(0, 10);
					startDate[7] = endDate[7] = formattedTodayDate;
				}
				$.ajax({
					url: "/energy/chart/8",
					type: "GET",
					data: { 
						startDate: startDate[7], 
						endDate: endDate[7]
					},
					success: function(data) {
						var chartData = JSON.parse(data);
						var febcosts = chartData.febcosts;
						var febtr = chartData.febtr;
						CostsTrChart(febcosts, febtr);
					},
					error: function(err) {

					}
				});
			}

			// 총 비용 대비 에너지 사용량
			window.applyDateRange9 = function (event, url, targetValueId) {
				if(event !== null) {
					let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					startDate[8] = parent.find("input[name='energyCostStartDate']").val();
					endDate[8] = parent.find("input[name='energyCostEndDate']").val();
				}
				if (new Date(startDate[8]) > new Date(endDate[8])) {
					alert("시작일이 종료일보다 큽니다.");

					let todayDate = new Date();
					let formattedTodayDate = todayDate.toJSON().substring(0, 10);
					startDate[8] = endDate[8] = formattedTodayDate;
				}
				$.ajax({
					url: "/energy/chart/9",
					type: "GET",
					data: { 
						startDate: startDate[8], 
						endDate: endDate[8]
					},
					success: function(data) {
						var chartData = JSON.parse(data);
						var febcosts = chartData.febcosts;
						var febcvusingratio = chartData.febcvusingratio;
						CostsUsingratioChart(febcosts, febcvusingratio);
					},
					error: function(err) {

					}
				});
			}

			// 각 "제출" 버튼에 클릭 이벤트를 설정합니다.
			$("#applyEnergyCost1").click(function (event) {
				applyDateRange1(event, "/energy/chart1", "#value1", "SUM_COSTS");
			});	
			$("#applyEnergyCost2").click(function (event) {
				applyDateRange2(event, "/energy/chart2", "#value2", "SUM_USINGRATIO");
			});
			$("#applyEnergyCost3").click(function (event) {
				applyDateRange3(event, "/energy/chart3", "#value3", "AVERAGE_OPRATIO");
			});
			$("#applyEnergyCost4").click(function (event) {
				applyDateRange4(event, "/energy/chart4", "FebOpratio_Chart");
			});
			$("#applyEnergyCost5").click(function (event) {
				applyDateRange5(event, "/energy/char5", "FebTr_Chart");
			});
			$("#applyEnergyCost6").click(function (event) {
				applyDateRange6(event, "/energy/char6", "FebCost_Chart");
			});
			$("#applyEnergyCost7").click(function (event) {
				applyDateRange7(event, "/energy/char7", "FebUsingratio_Chart");
			});
			$("#applyEnergyCost8").click(function (event) {
				applyDateRange8(event, "/energy/char8", "Costs_Tr_Chart");
			});
			$("#applyEnergyCost9").click(function (event) {
				applyDateRange9(event, "/energy/char9", "Costs_Usingratio_Chart");
			});
			
			drawCharts();

			// 그리고 설정한 시간 간격으로 차트를 업데이트 합니다.
			setInterval(drawCharts, 5000); // 5초 간격
    });  
      
     
      // 페이지 delfault값 (Sysdate기준) setinterval
	   function drawCharts() {
	  applyDateRange1(null, "/energy/chart/1", "#value1", "SUM_COSTS");
	  applyDateRange2(null, "/energy/chart/2", "#value2", "SUM_USINGRATIO");
	  applyDateRange3(null, "/energy/chart/3", "#value3", "AVERAGE_OPRATIO");
	  applyDateRange4(null, "/energy/chart/4");
	  applyDateRange5(null, "/energy/chart/5");
	  applyDateRange6(null, "/energy/chart/6");
	  applyDateRange7(null, "/energy/chart/7");
	  applyDateRange8(null, "/energy/chart/8");
	  applyDateRange9(null, "/energy/chart/9");
	}
  </script>
</div>
