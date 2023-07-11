<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko" style="height: 100%">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5.4.2/dist/echarts.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/echarts/5.2.1/echarts.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	table {
		width: 25%;
           justify-content: center;
		border-collapse: collapse;
	}
	tr:nth-child(2n) {
		background: #f0f0f0;
	}
	th, 
	td {
		border: 1px solid black;
		padding: 8px;
		text-align: center;
		border-color: #e0e0e0;
	}
	.totals-row {
		font-weight: bold;
	}

</style>
</head>
<body>
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
	  };
	  costsChart.setOption(option);
	}
	$(document).ready(function(){
		fetchData();
	});
	</script>

	<table>
		<thead>
			<tr>
				<th>재고</th>
				<th>정상품</th>
				<th>불량품</th>
				<th>장비가동률</th>
			</tr>
		</thead>
		
		<tbody>
			<tr class="totals-row">
				<td class="stock-total"></td>
				<td class="tr-total"></td>
				<td class="fal-total"></td>
				<td class="opratio-avg"></td>
			</tr>
		</tbody>
		
	</table>
		<h3>장비가동률</h3>
	    <div>
	        <span>시작 날짜: <input type="date" id="startDate_opratio" name="startDate"></span>
	        <span>종료 날짜: <input type="date" id="endDate_opratio" name="endDate"></span>
	        <button onClick="fetchChartData('opratio')">데이터 가져오기</button>
	    </div>
		  <div style="display: flex;">
	      <div id="opratioChart" style="width:50%; height:300px;"></div>
	    <h3>온도</h3>
	    <div id="gaugeChart" style="width:50%; height:300px;"></div>
	</div>

		<h3>전기사용량</h3>
	    <div>
	        <span>시작 날짜: <input type="date" id="startDate_usingratio" name="startDate"></span>
	        <span>종료 날짜: <input type="date" id="endDate_usingratio" name="endDate"></span>
	        <button onClick="fetchChartData('usingratio')">데이터 가져오기</button>
	    </div>
		  	<div style="display: flex;">
	    <div id="usingratioChart" style="width:50%; height:300px;"></div>
	    <div class="current-defect-container" style="width:50%; height:300px;">
	        <h2>실시간 불량 현황</h2>
	        <ul id="previousDefects"></ul>
    </div></div>

		<h3>비용</h3>
	    <div>
	        <span>시작 날짜: <input type="date" id="startDate_costs" name="startDate"></span>
	        <span>종료 날짜: <input type="date" id="endDate_costs" name="endDate"></span>
	        <button onClick="fetchChartData('costs')">데이터 가져오기</button>
	    </div>
		  <div style="display: flex; justify-content: left; width: 100%; height: 300px;">
	    <div id="costsChart" style="width:50%; height:100%;"></div>
	</div>
</body>
</html>