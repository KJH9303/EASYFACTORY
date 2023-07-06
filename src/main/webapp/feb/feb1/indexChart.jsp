<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko" style="height: 100%">
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5.4.2/dist/echarts.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
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
    .chart-container {
        display: flex;
        flex-flow: row wrap; 
        justify-content: center;
    }
</style>
</head>
<body>
	<h1>1공정의 모니터링</h1>
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
		    <label>
		      시작 날짜: <input type="text" id="startDate_opratio" name="startDate_opratio" />
		    </label>
		    <label>
		      종료 날짜: <input type="text" id="endDate_opratio" name="endDate_opratio" />
		    </label>
		    <button type="button" id="searchData_opratio">데이터 검색</button>
		  </div>
		  	<div style="display: flex;">
		  <div id="container" style="height: 500px"></div>
	    <div id="opratioChart" style="width:50%; height:300px;"></div>
	    <h3>온도</h3>
   		  <div>
		    <label>
		      시작 날짜: <input type="text" id="startDate_temp" name="startDate_temp" />
		    </label>
		    <label>
		      종료 날짜: <input type="text" id="endDate_temp" name="endDate_temp" />
		    </label>
		    <button type="button" id="searchData_temp">데이터 검색</button>
		  </div>
	    <div id="gaugeChart" style="width:50%; height:300px;"></div>
	</div>

		<h3>전기사용량</h3>
		  <div>
		    <label>
		      시작 날짜: <input type="text" id="startDate_usingratio" name="startDate_usingratio" />
		    </label>
		    <label>
		      종료 날짜: <input type="text" id="endDate_usingratio" name="endDate_usingratio" />
		    </label>
		    <button type="button" id="searchData_usingratio">데이터 검색</button>
		  </div>
		  	<div style="display: flex;">
	    <div id="usingratioChart" style="width:50%; height:300px;"></div>
	    <div class="current-defect-container" style="width:50%; height:300px;">
	        <h2>실시간 불량 현황</h2>
	        <ul id="previousDefects"></ul>
    </div></div>

		<h3>비용</h3>
		  <div>
		    <label>
		      시작 날짜: <input type="text" id="startDate_costs" name="startDate_costs" />
		    </label>
		    <label>
		      종료 날짜: <input type="text" id="endDate_costs" name="endDate_costs" />
		    </label>
		    <button type="button" id="searchData_costs">데이터 검색</button>
		  </div>
		  <div style="display: flex; justify-content: left; width: 100%; height: 300px;">
	    <div id="costsChart" style="width:50%; height:100%;"></div>
	</div>

	  <script>
    $(document).ready(function() {
      $("#startDate_opratio, #endDate_opratio").datepicker({
        dateFormat: "yy-mm-dd",
      });
      $("#startDate_temp, #endDate_temp").datepicker({
        dateFormat: "yy-mm-dd",
      });
      $("#startDate_usingratio, #endDate_usingratio").datepicker({
        dateFormat: "yy-mm-dd",
      });
      $("#startDate_costs, #endDate_costs").datepicker({
        dateFormat: "yy-mm-dd",
      });
      // 여기에 각각의 검색 버튼에 대한 클릭 이벤트를 정의합니다.
      // $('#searchData_opratio').click(...) 등
    });
  </script>
  
	<script>
	let opratioChart, gaugeChart, usingratioChart, costsChart;

	// ajax
	function fetchData() {
		$.ajax({
			type: "GET",
			url: "select1.jsp",
			dataType: "json",
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
				alert(`에러 발생: ${errorThrown}`);
			}
		});
		setTimeout(fetchData, 3000); // 3초마다 데이터 새로 고침
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
	
	// 월단위로 가동률,전기사용량,전기사용비용 데이터 평균값 가져오기
	function calculateMonthlyData(dataList, key) {
	    var monthlyData = {};
	
	    dataList.forEach(function (data) {
	        var date = new Date(data.hiredate);
	        var month = date.getMonth();
	
	        if (!monthlyData[month]) {
	            monthlyData[month] = {
	                count: 0,
	                sum: 0
	            };
	        }
	
	        monthlyData[month].count += 1;
	        monthlyData[month].sum += parseInt(data[key]);
	    });
	
	    return monthlyData;
	}
	
	function getMonthlyAverage(monthlyData) {
	    var monthlyAverage = [];
	
	    for (var month in monthlyData) {
	        var avg = monthlyData[month].sum / monthlyData[month].count;
	        monthlyAverage[month] = avg;
	    }
	
	    return monthlyAverage;
	}

	// 가동률 바차트 ===================================================================================================================
	function updateOpratioChart(dataList) {
		var monthlyOpratioData = calculateMonthlyData(dataList, 'opratio');
		var monthlyOpratioAverage = getMonthlyAverage(monthlyOpratioData);

	    // 차트가 없을 경우에만 새로운 차트 생성
	    if (!opratioChart) {
		    opratioChart = echarts.init(document.getElementById("opratioChart"));
		}

	    var option = {
	        tooltip: {
	            trigger: 'axis',
	            axisPointer: {
	                type: 'shadow'
	            },
	            borderWidth: 1,
	            formatter: function (params) {
	                if (params.length > 0) {
	                    return params[0].value.toFixed(2);
	                }
	                return '-';
	            }
	        },  	
	        xAxis: {
	            type: "category",
	            data: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
	        },
	        yAxis: {
	            type: "value"		
	        },
	        series: [
	            {
	                data: monthlyOpratioAverage,
	                type: "bar",
                	barWidth: "30%" 
	            }
	        ]
	    };
	
		    // 차트 옵션 설정 및 렌더링
		    opratioChart.setOption(option);
			}

	// 게이지 차트 ===================================================================================================================
	function updateGaugeChart(dataList) {
	    let totalTemp = 0;
	    const rowCount = dataList.length;
	
	    dataList.forEach(function(data) {
	        totalTemp += parseFloat(data.temp); // parseFloat로 변경
	    });
	
	    const avgTemp = parseFloat((totalTemp / rowCount).toFixed(2)); // 계산 시 소수점 두 자리로 표시하도록 변경
	
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
	function updateUsingratioChart(dataList) {
		var monthlyUsingratioData = calculateMonthlyData(dataList, 'usingratio');
		var monthlyUsingratioAverage = getMonthlyAverage(monthlyUsingratioData);

	 	// 차트가 없을 경우에만 새로운 차트 생성
	 	if (!usingratioChart) {
		    usingratioChart = echarts.init(document.getElementById("usingratioChart"));
		}

	    var option = {
	        tooltip: {
	            trigger: 'axis',
	            axisPointer: {
	                type: 'shadow'
	            },
	            borderWidth: 1,
	            formatter: function (params) {
	                if (params.length > 0) {
	                    return params[0].value.toFixed(2);
	                }
	                return '-';
	            }
	        },    				
	        xAxis: {
	            type: "category",
	            data: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
	        },
	        yAxis: {
	            type: "value"
	        },
		        series: [
	            {
                data: monthlyUsingratioAverage,
                type: "bar",
                barWidth: "33%" 
            }]
	    };
	    // 차트 옵션 설정 및 렌더링
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
	function updateCostsChart(dataList) {
		var monthlyCostsData = calculateMonthlyData(dataList, 'costs');
		var monthlyCostsAverage = getMonthlyAverage(monthlyCostsData);

	 	// 차트가 없을 경우에만 새로운 차트 생성
		if (!costsChart) {
		    costsChart = echarts.init(document.getElementById("costsChart"));
		}

	    var option = {
	        tooltip: {
	            trigger: 'axis',
	            axisPointer: {
	                type: 'shadow'
	            },
	            formatter: function (params) {
	                if (params.length > 0) {
	                    return params[0].value.toFixed(2);
	                }
	                return '-';
	            }
	        },
	        xAxis: {
	            type: "category",
	            data: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
	        },
	        yAxis: {
	            type: "value"
	        },
		        series: [
	            {
                data: monthlyCostsAverage,
                type: "bar",
                barWidth: "33%" 
            }]
	   	 };
		    // 차트 옵션 설정 및 렌더링
			costsChart.setOption(option);
			}
			$(document).ready(function(){
				fetchData();
			});
</script>
</body>
</html>
</head>
</html>