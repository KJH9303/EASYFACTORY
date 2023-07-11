<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Dashboard</title>
  <link rel="stylesheet" href="febTest.css" />
  <script src="https://cdn.jsdelivr.net/gh/alpine-collective/alpine-magic-helpers@0.5.x/dist/component.min.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.7.3/dist/alpine.min.js" defer></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.1.2/echarts.min.js"></script>
</head>
<body>
<div id="headerContainer"></div>
<div class="flex-1 h-full">
  
  <!-- Main content -->
  <main>
    
    <!-- Content header -->
    <div class="flex items-center justify-between px-4 py-4 border-b lg:py-6">
    </div>
    
    <!-- Content -->
    <div class="mt-2">
      
      <!-- State cards -->
      <div class="grid grid-cols-1 gap-8 p-4 lg:grid-cols-2 xl:grid-cols-4">
        
        <!-- Value card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6
              class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              Value
            </h6>
            <span class="text-xl font-semibold">$30,000</span>
            <!-- <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              +4.4%
            </span> -->
          </div>
        </div>

        <!-- Users card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6
              class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              Users
            </h6>
            <span class="text-xl font-semibold">50,021</span>
            <!-- <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              +2.6%
            </span> -->
          </div>
        </div>

        <!-- Orders card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6
              class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              Orders
            </h6>
            <span class="text-xl font-semibold">45,021</span>
            <!-- <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              +3.1%
            </span> -->
          </div>
        </div>

        <!-- Tickets card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6
              class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              Tickets
            </h6>
            <span class="text-xl font-semibold">20,516</span>
            <!-- <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              +3.1%
            </span> -->
          </div>
        </div>
      </div>

      <!-- Charts -->
      <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">Utilization Rate Chart</h4>
            <div class="flex items-center space-x-2">
              <span class="text-sm text-gray-500">DatePicker</span>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
             <div id="opratioChart"></div>
          </div>
        </div>

        <!-- Doughnut chart card -->
        <div class="bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">Doughnut Chart</h4>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72" style= "overflow: auto">
            <table>
	            <tr>
	           		<th>실시간 불량 현황</th>
	           	</tr>
           		<tr>
	        		<td id="previousDefects"></td>
	        	</tr>
            </table>
          </div>
        </div>
      </div>

      <!-- Two grid columns -->
      <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
        <!-- Doughnut chart card -->
        <div class="bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">Doughnut Chart</h4>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <div id="gaugeChart"></div>
          </div>
        </div>

        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">Bar Chart</h4>
            <div class="flex items-center space-x-2">
              <span class="text-sm text-gray-500">DatePicker</span>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <div id="usingratioChart"></div>
          </div>
        </div>
      </div>
    </div>
  </main>
</div>

<!-- All javascript code in this project for now is just for demo DON'T RELY ON IT  -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.bundle.min.js"></script>
<script>
let opratioChart, gaugeChart, usingratioChart, costsChart;

function fetchChartData(type) {
    var startDateInputId, endDateInputId, uri, updateChartFunc;

    switch (type) {
        case "opratio":
            startDateInputId = "startDate_opratio";
            endDateInputId = "endDate_opratio";
            uri = "/feb/select-data";
            updateChartFunc = updateOpratioChart;
            break;

        case "usingratio":
            startDateInputId = "startDate_usingratio";
            endDateInputId = "endDate_usingratio";
            uri = "/feb/select-data";
            updateChartFunc = updateUsingratioChart;
            break;
            
        case "costs":
            startDateInputId = "startDate_costs";
            endDateInputId = "endDate_costs";
            uri = "/feb/select-data";
            updateChartFunc = updateCostsChart;
            break;
    }

    var startDate = $("#" + startDateInputId).val();
    var endDate = $("#" + endDateInputId).val();
    
    alert("Data요청 확인: [" + type + "] : " + startDateInputId + "=" + startDate + ", " + endDateInputId + "=" + endDate);

    $.ajax({
        type: "GET",
        url: "/feb/select-data",
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
            alert(`에러 발생:(/feb/feb1) ${errorThrown}`);
        }
    });
}

// ajax
function fetchData() {
	$.ajax({
		type: "GET",
		url: "/feb/select-data",
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
				updateOpratioChart(dataList); 		// 가동률 바차트 업데이트
				updateGaugeChart(dataList); 		// 게이지 차트 업데이트
				updateUsingratioChart(dataList);	// 전기사용량 바차트 업데이트
				updateCostsChart(dataList)			// 전기사용비용 바차트 업데이트
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert(`에러 발생:(/feb/select-data) ${errorThrown}`);
		}
	});
	setTimeout(fetchData, 3000); // 10초마다 데이터 새로 고침
	}

function updateTableData(dataList) {
	let total = {
		stock: 0,
		tr: 0,
		fal: 0,
	};
	let avg = {
		opratio: 0,
	};

	let rowCount = dataList.length;

dataList.forEach(function(data) {
	const stock = parseInt(data.stock);
	const tr = parseInt(data.tr);
	const fal = parseInt(data.fal);
	const opratio = parseInt(data.opratio);

	total.stock += stock;
	total.tr += tr;
	total.fal += fal;
	avg.opratio += opratio;
});

const avgOpRatio = avg.opratio / rowCount;

$("table .stock-total").text(total.stock);
$("table .tr-total").text(total.tr);
$("table .fal-total").text(total.fal);
$("table .opratio-avg").text(avgOpRatio.toFixed(2));
}

// 가동률 바차트 ===================================================================================================================
function updateOpratioChart(dataList, dateRange = null) {
  if (!opratioChart) {
    opratioChart = echarts.init(document.getElementById("opratioChart"));
  }
  let displayData, dateList;
  let currentDate = new Date();
  let currentMonth = currentDate.getMonth();
  let currentYear = currentDate.getFullYear();
  
  if (!dateRange) {
    dateList = [];
    displayData = [];
    dataList.forEach((data) => {
      let hireDate = new Date(data.hiredate);
      let dateString = data.hiredate.split('-')[2];
      if (hireDate.getMonth() === currentMonth && hireDate.getFullYear() === currentYear) {
        dateList.push(dateString);
        displayData.push(data.opratio);
      }
    });
  } else {
    dateList = [];
    displayData = [];
    dataList.forEach((data) => {
      let hireDate = new Date(data.hiredate);
      let dateString = data.hiredate.split('-')[2];
      if (hireDate >= dateRange[0] && hireDate <= dateRange[1]) {
        dateList.push(dateString);
        displayData.push(data.opratio);
      }
    });
    /*  */
    window.addEventListener('resize', function () {
        opratioChart.resize();
    });
  }
  
  var option = {
    tooltip: {
      trigger: "axis",
      axisPointer: {
        type: "shadow",
      },
      borderWidth: 1,
      formatter: function (params) {
        if (params.length > 0) {
          return params[0].value.toFixed(2);
        }
        return "-";
      },
    },
    xAxis: {
      type: "category",
      data: dateList,
    },
    yAxis: {
      type: "value",
    },
    series: [
      {
        data: displayData,
        type: "bar",
        animationDelay: (idx) => idx * 10,
      },
    ],
    // grid 옵션 추가
    grid: {
        top: 20, // 상단 여백
        bottom: 20, // 하단 여백
        left: 30, // 좌측 여백
        right: 10 // 우측 여백
    }
  };
  opratioChart.setOption(option);
}

// 게이지 차트 ===================================================================================================================
function updateGaugeChart(dataList) {
    let totalTemp = 0;
    const rowCount = dataList.length;

    dataList.forEach(function(data) {
        totalTemp += parseFloat(data.temp); 
    });

    const avgTemp = parseFloat((totalTemp / rowCount).toFixed(2));

	if (!gaugeChart) {
        gaugeChart = echarts.init(document.getElementById('gaugeChart'));
        
        window.addEventListener('resize', function () {
            gaugeChart.resize();
        });
	}

    const option = {
    	series: [{
    		type: 'gauge',
    		min: 0,
    		max: 15, 
    		axisLine: {
    			lineStyle: {
    				width: 10,
    				color: [
    					[0.3, '#67e0e3'],
    					[0.7, '#37a2da'],
    					[1, '#fd666d']
    				]
    			}
    		},
    		pointer: {
    			itemStyle: {
    				color: 'auto'
    			}
    		},
    		data: [{value: avgTemp, name: 'Temp'}]
    	}]
    };
    // 차트 옵션 설정 및 렌더링
    gaugeChart.setOption(option);
	}

// 전기사용량 바차트 ===================================================================================================================
function updateUsingratioChart(dataList, dateRange = null) {
  if (!usingratioChart) {
	  usingratioChart = echarts.init(document.getElementById("usingratioChart"));
  }
  let displayData, dateList;
  let currentDate = new Date();
  let currentMonth = currentDate.getMonth();
  let currentYear = currentDate.getFullYear();
  
  if (!dateRange) {
    dateList = [];
    displayData = [];
    dataList.forEach((data) => {
      let hireDate = new Date(data.hiredate);
      let dateString = data.hiredate.split('-')[2];
      if (hireDate.getMonth() === currentMonth && hireDate.getFullYear() === currentYear) {
        dateList.push(dateString);
        displayData.push(data.usingratio);
      }
    });
  } else {
    dateList = [];
    displayData = [];
    dataList.forEach((data) => {
      let hireDate = new Date(data.hiredate);
      let dateString = data.hiredate.split('-')[2];
      if (hireDate >= dateRange[0] && hireDate <= dateRange[1]) {
        dateList.push(dateString);
        displayData.push(data.usingratio);
      }
    });
    
	window.addEventListener('resize', function () {
	    usingratioChart.resize();
	});
  }
  
  var option = {
    tooltip: {
      trigger: "axis",
      axisPointer: {
        type: "shadow",
      },
      borderWidth: 1,
      formatter: function (params) {
        if (params.length > 0) {
          return params[0].value.toFixed(2);
        }
        return "-";
      },
    },
    xAxis: {
      type: "category",
      data: dateList,
    },
    yAxis: {
      type: "value",
    },
    series: [
      {
        data: displayData,
        type: "bar",
        animationDelay: (idx) => idx * 10,
      },
    ],
    
    //grid 옵션 추가
    grid: {
        top: 20, // 상단 여백
        bottom: 20, // 하단 여백
        left: 30, // 좌측 여백
        right: 10 // 우측 여백
    }
  };
  usingratioChart.setOption(option);
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
  let currentDate = new Date();
  let currentMonth = currentDate.getMonth();
  let currentYear = currentDate.getFullYear();
  
  if (!dateRange) {
    dateList = [];
    displayData = [];
    dataList.forEach((data) => {
      let hireDate = new Date(data.hiredate);
      let dateString = data.hiredate.split('-')[2];
      if (hireDate.getMonth() === currentMonth && hireDate.getFullYear() === currentYear) {
        dateList.push(dateString);
        displayData.push(data.costs);
      }
    });
  } else {
    dateList = [];
    displayData = [];
    dataList.forEach((data) => {
      let hireDate = new Date(data.hiredate);
      let dateString = data.hiredate.split('-')[2];
      if (hireDate >= dateRange[0] && hireDate <= dateRange[1]) {
        dateList.push(dateString);
        displayData.push(data.costs);
      }
    });
    
	window.addEventListener('resize', function () {
		costsChart.resize();
	});
  }
  
  var option = {
    tooltip: {
      trigger: "axis",
      axisPointer: {
        type: "shadow",
      },
      borderWidth: 1,
      formatter: function (params) {
        if (params.length > 0) {
          return params[0].value.toFixed(2);
        }
        return "-";
      },
    },
    xAxis: {
      type: "category",
      data: dateList,
    },
    yAxis: {
      type: "value",
    },
    series: [
      {
        data: displayData,
        type: "bar",
        animationDelay: (idx) => idx * 10,
      },
    ],
    
    // grid 옵션 추가
    grid: {
        top: 20, // 상단 여백
        bottom: 20, // 하단 여백
        left: 30, // 좌측 여백
        right: 10 // 우측 여백
    }
  };
  costsChart.setOption(option);
}
$(document).ready(function(){
	fetchData();
});
</script>
</body>
</html>
