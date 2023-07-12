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
	
	var opratio = null;
	var usingratio = null;
	var costs = null;
	
	function fetchChartData(type) {
	    var startDateInputId, endDateInputId, uri, updateChartFunc;

	    switch (type) {
	        case "opratio":
	            startDateInputId = "startDate_opratio";
	            endDateInputId = "endDate_opratio";
	            uri = "/feb/select-data-feb1";
	            updateChartFunc = updateOpratioChart;
	            if($("#" + startDateInputId).val() == null && $("#" + endDateInputId).val() == null) {
	            	opratio = false;
	            }
	            opratio = true;
	            break;

	        case "usingratio":
	            startDateInputId = "startDate_usingratio";
	            endDateInputId = "endDate_usingratio";
	            uri = "/feb/select-data-feb1";
	            updateChartFunc = updateUsingratioChart;
	            if($("#" + startDateInputId).val() == null && $("#" + endDateInputId).val() == null) {
	            	usingratio = false;
	            }
	            usingratio = true;
	            break;
	            
	        case "costs":
	            startDateInputId = "startDate_costs";
	            endDateInputId = "endDate_costs";
	            uri = "/feb/select-data-feb1";
	            updateChartFunc = updateCostsChart;
	            if($("#" + startDateInputId).val() == null && $("#" + endDateInputId).val() == null) {
	            	costs = false;
	            }
	            costs = true;
	            break;
	    }

	    var startDate = $("#" + startDateInputId).val();
	    var endDate = $("#" + endDateInputId).val();
	    
	    //alert("Data 요청 확인: [" + type + "] : " + startDateInputId + "=" + startDate + ", " + endDateInputId + "=" + endDate);

	    $.ajax({
	        type: "GET",
	        url: "/feb/select-data-feb1",
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
			url: "/feb/select-data-feb1",
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
						updateOpratioChart(dataList); 		// 가동률 바차트 업데이트
					}
					
					updateGaugeChart(dataList); 		// 게이지 차트 업데이트

					if(usingratio != true) {
						updateUsingratioChart(dataList);	// 전기사용량 바차트 업데이트
					}
					
					if(costs != true) {
						updateCostsChart(dataList)			// 전기사용비용 바차트 업데이트
					}
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert(`에러 발생:(/feb/select-data-feb1) ${errorThrown}`);
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

		  dataList.forEach(function (data) {
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

		  document.querySelector('.stock-total').textContent = total.stock.toLocaleString();
		  document.querySelector('.tr-total').textContent = total.tr.toLocaleString();
		  document.querySelector('.fal-total').textContent = total.fal.toLocaleString();
		  document.querySelector('.opratio-avg').textContent = avgOpRatio.toFixed(2);
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
			        axisLabel: {
			          interval: 0, // 모든 레이블을 표시
			          textStyle: {
			            color: "#333", // x축 레이블 텍스트 색상
			            fontSize: 10, // x축 레이블 텍스트 크기
			          },
			        },
			      },
			      yAxis: {
			        type: "value",
			        axisLine: {
			          lineStyle: {
			            color: "#999", // y축 선 색상
			          },
			        },
			        splitLine: {
			          lineStyle: {
			            color: "#ccc", // y축 분할 선 색상
			          },
			        },
			        axisLabel: {
			            fontStyle: "normal", // 폰트 기울기 설정 제거
			          },
			      },
			      series: [
			        {
			          data: displayData,
			          type: "bar",
			          animationDelay: (idx) => idx * 10,
			          itemStyle: {
			            color: "#37a2da", // 막대 색상
			          },
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
	    const today = new Date().toISOString().split('T')[0]; // 오늘 날짜를 yyyy-mm-dd 형식으로 가져옴
	    const todayData = dataList.find(data => data.hiredate === today); // 오늘의 데이터를 찾음
	    const todayTemp = parseFloat(todayData.temp); // 오늘의 온도값을 가져옴
	
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
	                radius: '100%', 
	                splitNumber: 2,
	                startAngle: 210, 
	                endAngle: -30,
	                axisLine: {
	                    lineStyle: {
	                        width: 15, 
	                        color: [
	                            [0.3, '#67e0e3'],
	                            [0.7, '#37a2da'],
	                            [1, '#fd666d']
	                        ]
	                    }
	                },
	                axisTick: {
	                    length: 10, 
	                    lineStyle: {
	                        color: 'auto'
	                    }
	                },
	                splitLine: {
	                    length: 25, 
	                    lineStyle: {
	                        color: 'auto'
	                    }
	                },
	                axisLabel: {
	                    distance: 20,
	                    color: '#aaa',
	                    fontSize: 10,
	                    fontFamily: 'Arial, sans-serif'
	                },
	                pointer: {
	                    width: 7, 
	                    length: '70%', 
	                    color: 'rgba(255, 255, 255, 0.8)'
	                },
	                itemStyle: {
	                    color: 'auto'
	                },
	                detail: {
	                    valueAnimation: true,
	                    color: 'auto',
	                    fontSize: 30,
	                    fontFamily: 'Arial, sans-serif',
	                    fontWeight: 'bold'
	                },
	                data: [{ value: todayTemp }]
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
			        axisLabel: {
			          interval: 0, // 모든 레이블을 표시
			          textStyle: {
			            color: "#333", // x축 레이블 텍스트 색상
			            fontSize: 10, // x축 레이블 텍스트 크기
			          },
			        },
			      },
			      yAxis: {
			        type: "value",
			        axisLine: {
			          lineStyle: {
			            color: "#999", // y축 선 색상
			          },
			        },
			        splitLine: {
			          lineStyle: {
			            color: "#ccc", // y축 분할 선 색상
			          },
			        },
			        axisLabel: {
			            fontStyle: "normal", // 폰트 기울기 설정 제거
			          },
			      },
			      series: [
			        {
			          data: displayData,
			          type: "bar",
			          animationDelay: (idx) => idx * 10,
			          itemStyle: {
			            color: "#ffbf00", // 막대 색상
			          },
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
			        axisLabel: {
			          interval: 0, // 모든 레이블을 표시
			          textStyle: {
			            color: "#333", // x축 레이블 텍스트 색상
			            fontSize: 10, // x축 레이블 텍스트 크기
			          },
			        },
			      },
			      yAxis: {
			        type: "value",
			        axisLine: {
			          lineStyle: {
			            color: "#999", // y축 선 색상
			          },
			        },
			        splitLine: {
			          lineStyle: {
			            color: "#ccc", // y축 분할 선 색상
			          },
			        },
			        axisLabel: {
			            fontStyle: "normal", // 폰트 기울기 설정 제거
			          },
			      },
			      series: [
			        {
			          data: displayData,
			          type: "bar",
			          animationDelay: (idx) => idx * 10,
			          itemStyle: {
			            color: "#008120", // 막대 색상
			          },
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
	<button onClick="fetchData()">데이터 새로 고침</button>
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