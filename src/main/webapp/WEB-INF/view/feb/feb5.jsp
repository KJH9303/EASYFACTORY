<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>5공정: 이온주입(Implant) 공정</title>
  <link href="../../resources/img/logoicon.jpg" rel="shortcut icon" type="image/x-icon">
  <link rel="stylesheet" href="../../../resources/feb/css/feb.css">
  <script src="../../../resources/feb/js/chartOption.js"></script>
  <script src="../../../resources/feb/js/time.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/alpine-collective/alpine-magic-helpers@0.5.x/dist/component.min.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.7.3/dist/alpine.min.js" defer></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.1.2/echarts.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
  <script src="../../../resources/feb/js/download.js"></script>
 
</head>
<body>
<div id="headerContainer"></div>
<div class="flex-1 h-full">
  
  <!-- Main content -->
  <main>
    
    <!-- Content header -->
	<div class="flex items-center flex-start px-4 py-4 border-b lg:py-6">
	    <h1>Implant</h1>
	    <button class="bg-white2" onclick="showConfirmationAndDownload(dataList)">
	        <img src="/resources/img/filedown.png" id="downloadBtnFeb5" class="down">(파일 다운로드)
	    </button>
	</div>   
	 
    <!-- Content -->
    <div class="mt-2">
      
      <!-- Stock cards -->
      <div class="grid grid-cols-1 gap-8 p-4 lg:grid-cols-2 xl:grid-cols-4">
        
        <!-- Stock card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6
              class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              총재고
            </h6>
            <span class="text-xl font-semibold stock-total"></span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : EA)
            </span>
          </div>
        </div>

        <!-- Tr card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6 
            class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              생산량
            </h6>
            <span class="text-xl font-semibold tr-total"></span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : EA)
            </span>
          </div>
        </div>

        <!-- Fal card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6 
            class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              불량
            </h6>
            <span class="text-xl font-semibold fal-total"></span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : EA)
            </span>            
          </div>
        </div>

        <!-- Usingratio card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6 
            class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              장비가동율
            </h6>
            <span class="text-xl font-semibold opratio-avg"></span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : %)
            </span>
          </div>
        </div>
      </div>

      <!-- gauge Chart -->
      <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
        <!-- Doughnut chart card -->
        <div class="bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">온도</h4>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : ℃)</span>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <div id="gaugeChart"></div>
          </div>
        </div>

        <!-- opratioChart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">장비 가동율</h4>
            <!-- DatePicker -->
            <div class="flex items-center space-x-2">
              <div>
                <input type="date" id="startDate_opratio" name="startDate" class="datepicker">
                <input type="date" id="endDate_opratio" name="endDate" class="datepicker">
                <button onClick="fetchChartData('opratio')" class="custom-btn btn-1">GET</button>
                <button onClick="clearDatePicker('opratio')" class="custom-btn btn-1">CLEAR</button>
              </div>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <div id="opratioChart"></div>
          </div>
        </div>

        <!-- Defect monitoring -->
        <div class="bg-white rounded-md border">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b border-color red">
            <h4 class="text-lg font-semibold-defect text-gray-500s white">DEFECT MONITORING</h4>
          </div>
          <!-- Card -->
          <div class="relative p-4 h-72 table-container-scroll overflow-auto">
            <table class="dashboard-table">
              <tr class="dashboard-tr"> 
                <td id="previousDefects" class="dashboard-td defect-font-size"></td>
              </tr>
            </table>
          </div>
        </div>
      </div>

      <!-- Two grid columns -->
      <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">전기 사용량</h4>
            <!-- DatePicker -->
            <div class="flex items-center space-x-2">
              <div>
                <input type="date" id="startDate_usingratio" name="startDate" class="datepicker">
                <input type="date" id="endDate_usingratio" name="endDate" class="datepicker">
                <button onClick="fetchChartData('usingratio')" class="custom-btn btn-1">GET</button>
                <button onClick="clearDatePicker('usingratio')" class="custom-btn btn-1">CLEAR</button>
              </div>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <div id="usingratioChart"></div>
          </div>
        </div>

        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">전기사용 비용</h4>
            <!-- DatePicker -->
            <div class="flex items-center space-x-2">
              <div>
                <input type="date" id="startDate_costs" name="startDate" class="datepicker">
                <input type="date" id="endDate_costs" name="endDate" class="datepicker">
                <button onClick="fetchChartData('costs')" class="custom-btn btn-1">GET</button>
                <button onClick="clearDatePicker('costs')" class="custom-btn btn-1">CLEAR</button>
              </div>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <div id="costsChart"></div>
          </div>
        </div> 
      </div>

      <!-- Two grid columns -->
      <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
        <!-- Line chart card -->
        <div class="col-span-4 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">생산지표</h4>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <div id="lineChart"  style="height: 100%; width: 100%;"></div>
          </div>
        </div>
      </div>
    </div>
  </main>
</div>

<!-- All javascript code in this project for now is just for demo DON'T RELY ON IT  -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.bundle.min.js"></script>
	<script>
	let opratioChart, gaugeChart, usingratioChart, costsChart, lineChart;
	
	var opratio = null;
	var usingratio = null;
	var costs = null;
	
	function fetchChartData(type) {
	    var startDateInputId, endDateInputId, uri, updateChartFunc;

	    switch (type) {
	        case "opratio":
	            startDateInputId = "startDate_opratio";
	            endDateInputId = "endDate_opratio";
	            uri = "/feb/select-data-feb5";
	            updateChartFunc = updateOpratioChart;
	            if($("#" + startDateInputId).val() == null && $("#" + endDateInputId).val() == null) {
	            	opratio = false;
	            }
	            opratio = true;
	            break;

	        case "usingratio":
	            startDateInputId = "startDate_usingratio";
	            endDateInputId = "endDate_usingratio";
	            uri = "/feb/select-data-feb5";
	            updateChartFunc = updateUsingratioChart;
	            if($("#" + startDateInputId).val() == null && $("#" + endDateInputId).val() == null) {
	            	usingratio = false;
	            }
	            usingratio = true;
	            break;
	            
	        case "costs":
	            startDateInputId = "startDate_costs";
	            endDateInputId = "endDate_costs";
	            uri = "/feb/select-data-feb5";
	            updateChartFunc = updateCostsChart;
	            if($("#" + startDateInputId).val() == null && $("#" + endDateInputId).val() == null) {
	            	costs = false;
	            }
	            costs = true;
	            break;
	    }

	    var startDate = $("#" + startDateInputId).val();
	    var endDate = $("#" + endDateInputId).val();
	    
	    if (!startDate || !endDate) {
	        alert("날짜가 지정되지 않았습니다.");
	        return;
	    }

	    if (startDate > endDate) {
	        alert("시작일이 종료일보다 큽니다.");
	        return;
	    }
 
	    $.ajax({
	        type: "GET",
	        url: "/feb/select-data-feb5",
	        data: {
	        	startDate: startDate,
	        	endDate: endDate
	        },
	        dataType: "json",
	        success: function(response) {
	            if (response.Error) {
	                alert(response.Error);
	            } else {
	                var dataList = response;
	                
	                updateChartFunc(dataList);
	            }
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	        	console.log(`에러 발생:(/feb/feb1) ${errorThrown}`);
	        }
	    });
	}

	function clearDatePicker(type) {
		var startDateInputId, endDateInputId, uri, updateChartFunc;

	    switch (type) {
	        case "opratio":
	            startDateInputId = "startDate_opratio";
	            endDateInputId = "endDate_opratio";
	            opratio = false;
	            break;

	        case "usingratio":
	            startDateInputId = "startDate_usingratio";
	            endDateInputId = "endDate_usingratio";
	            usingratio = false;
	            break;
	            
	        case "costs":
	            startDateInputId = "startDate_costs";
	            endDateInputId = "endDate_costs";
	            costs = false;
	            break;
	    }
	    $("#" + startDateInputId).val("");
	    $("#" + endDateInputId).val("");
	}
	// ajax
	function fetchData() {
		$.ajax({
			type: "GET",
			url: "/feb/select-data-feb5",
			dataType: "json",
			data: {
		        	startDate: "2023-01-01",
		        	endDate: "2023-12-31"
		    },
			success: function(response) {
				if (response.Error) {
					alert(response.Error);
				} else {
					let dataList = response;
					let tbody = $("table tbody");

					updateTableData(dataList); 			// 테이블 업데이트
					
					if(opratio != true) {
						updateOpratioChart(dataList); 		// 가동율 바차트 업데이트
					}
					
					updateGaugeChart(dataList); 		// 게이지 차트 업데이트

					if(usingratio != true) {
						updateUsingratioChart(dataList);	// 전기사용량 바차트 업데이트
					}
					
					if(costs != true) {
						updateCostsChart(dataList)			// 전기사용비용 바차트 업데이트
					}
					
					updateLineChart(dataList);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log(`에러 발생:(/feb/select-data-feb5) ${errorThrown}`);
			}
		});
		setTimeout(fetchData, 3000); // 3초마다 데이터 새로 고침
	}
	
	function updateTableData(dataList) {
		  const today = new Date().toISOString().split('T')[0];
		  let total = {
		    stock: 0,
		    tr: 0,
		    fal: 0,
		    opratio: 0,
		    usingratio: 0,
		    temp: 0,
		    hiredate: 0,
		  };

		  let rowCount = 0;

		  dataList.forEach(function (data) {
		    if (data.hiredate === today) {
		      rowCount++;
		      const stock = parseInt(data.stock);
		      const tr = parseInt(data.tr);
		      const fal = parseInt(data.fal);
		      const opratio = parseFloat(data.opratio);
		      const usingratio = parseFloat(data.usingratio);
		      const temp = parseFloat(data.temp);
		      const hiredate = parseFloat(data.hiredate);

		      total.stock = stock;
		      total.tr = tr;
		      total.fal = fal;
		      total.opratio = opratio;
		    }
		  });

		  const opratioDecimal = total.opratio.toFixed(1);

		  document.querySelector('.stock-total').textContent = total.stock.toLocaleString();
		  document.querySelector('.tr-total').textContent = total.tr.toLocaleString();
		  document.querySelector('.fal-total').textContent = total.fal.toLocaleString();
		  document.querySelector('.opratio-avg').textContent = opratioDecimal;
		}

	// 가동율 바차트 ===================================================================================================================
	function updateOpratioChart(dataList, dateRange = null) {
	  if (!opratioChart) {
	    opratioChart = echarts.init(document.getElementById("opratioChart"));
	  }
	  let displayData, dateList;
	
	  if (!dateRange) {
	    dateList = [];
	    displayData = [];
	    dataList.forEach((data) => {
	      let hireDate = new Date(data.hiredate);
	      let month = hireDate.getMonth() + 1;
	      let day = hireDate.getDate();
	      let dateString = month + "월 " + day + "일";
	      dateList.push(dateString);
	      displayData.push(data.opratio);
	    });
	  } else {
	    dateList = [];
	    displayData = [];
	    dataList.forEach((data) => {
	      let hireDate = new Date(data.hiredate);
	      let month = hireDate.getMonth() + 1;
	      let day = hireDate.getDate();
	      let dateString = month + "월 " + day + "일";
	      if (hireDate >= dateRange[0] && hireDate <= dateRange[1]) {
	        dateList.push(dateString);
	        displayData.push(data.opratio);
	      }
	    });
	  }
	
	  // 차트 옵션에 데이터 설정
	  chartOptions.xAxis.data = dateList;
	  chartOptions.series[0].data = displayData;
	
	  opratioChart.setOption(chartOptions);
	}
	// 게이지 차트 ===================================================================================================================
	function updateGaugeChart(dataList) {
	  const today = new Date().toISOString().split('T')[0]; // 오늘 날짜를 yyyy-mm-dd 형식으로 가져옴
	  const todayData = dataList.find(data => data.hiredate === today); // 오늘의 데이터를 찾음
	  const todayTemp = parseFloat(todayData.temp); // 오늘의 온도값을 가져옴
	
	  if (!gaugeChart) {
	    gaugeChart = echarts.init(document.getElementById('gaugeChart'));
	  }
	
	  // 차트 옵션에 데이터 설정
	  gaugeChartOptions.series[0].data = [{ value: todayTemp, itemStyle: { color: "auto" } }];
	
	  gaugeChart.setOption(gaugeChartOptions);
	}
	// 전기사용량 바차트 ===================================================================================================================
	function updateUsingratioChart(dataList, dateRange = null) {
	  if (!usingratioChart) {
	    usingratioChart = echarts.init(document.getElementById("usingratioChart"));
	  }
	  let displayData, dateList;
	
	  if (!dateRange) {
	    dateList = [];
	    displayData = [];
	    dataList.forEach((data) => {
	      let hireDate = new Date(data.hiredate);
	      let month = hireDate.getMonth() + 1;
	      let day = hireDate.getDate();
	      let dateString = month + "월 " + day + "일";
	      dateList.push(dateString);
	      displayData.push(data.usingratio);
	    });
	  } else {
	    dateList = [];
	    displayData = [];
	    dataList.forEach((data) => {
	      let hireDate = new Date(data.hiredate);
	      let month = hireDate.getMonth() + 1;
	      let day = hireDate.getDate();
	      let dateString = month + "월 " + day + "일";
	      if (hireDate >= dateRange[0] && hireDate <= dateRange[1]) {
	        dateList.push(dateString);
	        displayData.push(data.usingratio);
	      }
	    });
	  }
	
	  // 차트 옵션에 데이터 설정
	  usingratioChartOptions.xAxis.data = dateList;
	  usingratioChartOptions.series[0].data = displayData;
	
	  usingratioChart.setOption(usingratioChartOptions);
	}
	// 불량현황 리스트 ===================================================================================================================	
	$(document).ready(function() {
	    function updateRandomDefect() {
	        $.ajax({ 
	            url: "/feb/Defect",
	            type: 'GET',
	            success: function(result) {
	                $('#previousDefects').prepend('<li>' + result + '</li>');
	            },
	            complete: function() {
	                setTimeout(updateRandomDefect, 2000);
	            }
	        });
	    }
	    updateRandomDefect();
	});

	// 전기사용비용 바차트 ===================================================================================================================
	function updateCostsChart(dataList, dateRange = null) {
	  if (!costsChart) {
	    costsChart = echarts.init(document.getElementById("costsChart"));
	  }
	  let displayData, dateList;
	
	  if (!dateRange) {
	    dateList = [];
	    displayData = [];
	    dataList.forEach((data) => {
	      let hireDate = new Date(data.hiredate);
	      let month = hireDate.getMonth() + 1;
	      let day = hireDate.getDate();
	      let dateString = month + "월 " + day + "일";
	      dateList.push(dateString);
	      displayData.push(data.costs);
	    });
	  } else {
	    dateList = [];
	    displayData = [];
	    dataList.forEach((data) => {
	      let hireDate = new Date(data.hiredate);
	      let month = hireDate.getMonth() + 1;
	      let day = hireDate.getDate();
	      let dateString = month + "월 " + day + "일";
	      if (hireDate >= dateRange[0] && hireDate <= dateRange[1]) {
	        dateList.push(dateString);
	        displayData.push(data.costs);
	      }
	    });
	  }
	
	  var option = costschartOptions;
	  option.xAxis.data = dateList;
	  option.series[0].data = displayData;

	  costsChart.setOption(option);
	}
	$(document).ready(function(){
		fetchData();
	});
	window.addEventListener('resize', function () {
	    opratioChart.resize();
	    usingratioChart.resize();
	    costsChart.resize();
	    gaugeChart.resize();
	    lineChart.resize();
	});
	
	// lineChart 설정=============================================================================================
	function updateLineChart(dataList) {
	  if (!lineChart) {
	    lineChart = echarts.init(document.getElementById("lineChart"));
	  }
	
	  let usingRatioData = [];
	  let trData = [];
	  let falData = [];
	  let opratioData = [];
	  let xAxisData = [];
	  
	  dataList.forEach((data) => {
   		xAxisData.push(data.hiredate);  
	    usingRatioData.push(data.usingratio);
	    trData.push(data.tr);
	    falData.push(data.fal);
	    opratioData.push(data.opratio);
	  });

	  const option = getChartOption(); // 차트 옵션 가져오기
	  
	  option.xAxis[0].data = xAxisData;
	  option.series[0].data = usingRatioData; // 전기사용량 데이터 설정
	  option.series[1].data = trData; // 생산량 데이터 설정
	  option.series[2].data = falData; // 불량 데이터 설정
	  option.series[3].data = opratioData; // 장비가동율 데이터 설정
	  
	  if (lineChart) {
	    lineChart.setOption(option);
	  }
	}
	</script>
</body>
</html>
