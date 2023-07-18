<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>1공정: 웨이퍼 제조</title>
  <link href="../../resources/img/logoicon.jpg" rel="shortcut icon" type="image/x-icon">
  <link rel="stylesheet" href="../../../resources/feb/css/feb.css?after">
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
      
      <!-- Stock cards -->
      <div class="grid grid-cols-1 gap-8 p-4 lg:grid-cols-2 xl:grid-cols-4">
        
        <!-- Stock card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6 class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              총 재고
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
            <h6 class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              정상품 수
            </h6>
   			<span class="text-xl font-semibold tr-total"></span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : EA)</span>
          </div>
        </div>

        <!-- Fal card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6 class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              불량품 수
            </h6>
            <span class="text-xl font-semibold fal-total"></span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : EA)</span>            
          </div>
        </div>

        <!-- Usingratio card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6 class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              장비가동율
            </h6>
            <span class="text-xl font-semibold opratio-avg"></span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : %)</span>
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
		        <input type="date" id="startDate_opratio" name="startDate">
		        <input type="date" id="endDate_opratio" name="endDate">
		        <button onClick="fetchChartData('opratio')" style="background-color: black; color: white;">GET</button>
		        <button onClick="clearDatePicker('opratio')" style="background-color: white;">CLEAR</button>
	   		</div>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
             <div id="opratioChart"></div>
          </div>
        </div>

        <!-- Defect monitoring -->
        <div class="bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b border-color ">
            <h4 class="text-lg font-semibold-defect text-gray-500s">DEFECT MONITORING</h4>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72 table-container-scroll" style= "overflow: auto">
            <table>
	            <tr>
	           	</tr>
           		<tr>
        			<td id="previousDefects" style="font-size: 15px;"></td>
	        	</tr>
            </table>
          </div>
        </div>
      </div>

    <!-- Chart -->
    <div class="relative p-4 h-72 table-container">
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
		        <input type="date" id="startDate_usingratio" name="startDate">
		        <input type="date" id="endDate_usingratio" name="endDate">
		        <button onClick="fetchChartData('usingratio')" style="background-color: black; color: white;">GET</button>
		        <button onClick="clearDatePicker('usingratio')" style="background-color: white;">CLEAR</button>
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
		        <input type="date" id="startDate_costs" name="startDate">
		        <input type="date" id="endDate_costs" name="endDate">
		        <button onClick="fetchChartData('costs')" style="background-color: black; color: white;">GET</button>
		        <button onClick="clearDatePicker('costs')" style="background-color: white;">CLEAR</button>
	   		</div>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <div id="costsChart"></div>
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
		setTimeout(fetchData, 3000); // 3초마다 데이터 새로 고침
	}
	
	function updateTableData(dataList) {
		  const today = new Date().toISOString().split('T')[0];
		  let total = {
		    stock: 0,
		    tr: 0,
		    fal: 0,
		    opratio: 0,
		  };

		  let rowCount = 0;

		  dataList.forEach(function (data) {
		    if (data.hiredate === today) {
		      rowCount++;
		      const stock = parseInt(data.stock);
		      const tr = parseInt(data.tr);
		      const fal = parseInt(data.fal);
		      const opratio = parseFloat(data.opratio);

		      total.stock += stock;
		      total.tr += tr;
		      total.fal += fal;
		      total.opratio += opratio;
		    }
		  });

		  const opratioDecimal = total.opratio.toFixed(1);

		  document.querySelector('.stock-total').textContent = total.stock.toLocaleString();
		  document.querySelector('.tr-total').textContent = total.tr.toLocaleString();
		  document.querySelector('.fal-total').textContent = total.fal.toLocaleString();
		  document.querySelector('.opratio-avg').textContent = opratioDecimal;
		}

	// 가동률 바차트 ===================================================================================================================
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
	
	    window.addEventListener('resize', function () {
	      opratioChart.resize();
	    });
	  }
	  
	  var option = {
		       toolbox: {
		           show: true,
		           feature: {
		               dataView: {show: true,readOnly: false},
		               magicType: {show: true, type: ['line', 'bar']},
		               saveAsImage: {show: true}
		           }
		       },
		       tooltip: {
		    	   trigger: "axis",
		    	   axisPointer: {
		    	     type: "shadow"
		    	   },
		    	   borderWidth: 1,
		    	   formatter: function(params) {
		    	     if (params.length > 0) {
		    	       var value = params[0].value.toFixed(2) + "(%)";
		    	       var xLabel = params[0].axisValue; // x축 레이블 값
		    	       var day = xLabel.slice(xLabel.indexOf(" ") + 1, xLabel.indexOf("일")); // 일 값 추출
		    	       var month = xLabel.slice(0, xLabel.indexOf("월")); // 월 값 추출
		    	       return month + "월 " + day + "일<br/>" + value;
		    	     }
		    	     return "-";
		    	   }
		    	 },
		    	 xAxis: {
		    		  type: "category",
		    		  data: dateList,
		    		  axisLabel: {
		    		    formatter: function(value) {
		    		      var day = value.slice(value.indexOf(" ") + 1, value.indexOf("일")); // 일 값 추출
		    		      var month = value.slice(0, value.indexOf("월")); // 월 값 추출
		    		      return month + "월 " + day + "일";
		    		    },
		    		    show: false // 레이블 숨김 처리
		    		  }
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
				      name: '가동율',		
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
	        top: 40, // 상단 여백
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

	    }
	
	    const option = {
	 	       toolbox: {
		           show: true,
		           feature: {
		               dataView: {show: true,readOnly: false},
		               saveAsImage: {show: true}
		           }
		       },
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
	                    length: "70%",
	                  },
	                detail: {
	                    valueAnimation: true,
	                    color: 'auto',
	                    fontSize: 30,
	                    fontFamily: 'Arial, sans-serif',
	                    fontWeight: 'bold'
	                },
	                  data: [{ value: todayTemp, itemStyle: { color: "auto" } }],
	            }],
	
	    	};
	    	gaugeChart.setOption(option);
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
	
	    window.addEventListener('resize', function () {
	      opratioChart.resize();
	    });
	  }
	  
	  var option = {
		       toolbox: {
		           show: true,
		           feature: {
		               dataView: {show: true,readOnly: false},
		               magicType: {show: true, type: ['line', 'bar']},
		               saveAsImage: {show: true}
		           }
		       },
		       tooltip: {
		    	   trigger: "axis",
		    	   axisPointer: {
		    	     type: "shadow"
		    	   },
		    	   borderWidth: 1,
		    	   formatter: function(params) {
		    	     if (params.length > 0) {
		    	       var value = params[0].value.toFixed(2) + "(kWh)";
		    	       var xLabel = params[0].axisValue; // x축 레이블 값
		    	       var day = xLabel.slice(xLabel.indexOf(" ") + 1, xLabel.indexOf("일")); // 일 값 추출
		    	       var month = xLabel.slice(0, xLabel.indexOf("월")); // 월 값 추출
		    	       return month + "월 " + day + "일<br/>" + value;
		    	     }
		    	     return "-";
		    	   }
		    	 },
		    	 xAxis: {
		    		  type: "category",
		    		  data: dateList,
		    		  axisLabel: {
		    		    formatter: function(value) {
		    		      var day = value.slice(value.indexOf(" ") + 1, value.indexOf("일")); // 일 값 추출
		    		      var month = value.slice(0, value.indexOf("월")); // 월 값 추출
		    		      return month + "월 " + day + "일";
		    		    },
		    		    show: false // 레이블 숨김 처리
		    		  }
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
				      name: '전기사용량',		
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
	        top: 40, // 상단 여백
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
	                setTimeout(updateRandomDefect, 1000);
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
	
	    window.addEventListener('resize', function () {
	      opratioChart.resize();
	    });
	  }
	  
	  var option = {
		       toolbox: {
		           show: true,
		           feature: {
		               dataView: {show: true,readOnly: false},
		               magicType: {show: true, type: ['line', 'bar']},
		               saveAsImage: {show: true}
		           }
		       },
		       tooltip: {
		    	   trigger: "axis",
		    	   axisPointer: {
		    	     type: "shadow"
		    	   },
		    	   borderWidth: 1,
		    	   formatter: function(params) {
		    	     if (params.length > 0) {
		    	       var value = params[0].value.toFixed(0) + "(천원)";
		    	       var xLabel = params[0].axisValue; // x축 레이블 값
		    	       var day = xLabel.slice(xLabel.indexOf(" ") + 1, xLabel.indexOf("일")); // 일 값 추출
		    	       var month = xLabel.slice(0, xLabel.indexOf("월")); // 월 값 추출
		    	       return month + "월 " + day + "일<br/>" + value;
		    	     }
		    	     return "-";
		    	   }
		    	 },
		    	 xAxis: {
		    		  type: "category",
		    		  data: dateList,
		    		  axisLabel: {
		    		    formatter: function(value) {
		    		      var day = value.slice(value.indexOf(" ") + 1, value.indexOf("일")); // 일 값 추출
		    		      var month = value.slice(0, value.indexOf("월")); // 월 값 추출
		    		      return month + "월 " + day + "일";
		    		    },
		    		    show: false // 레이블 숨김 처리
		    		  }
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
			          name: '비용',	
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
	        top: 40, // 상단 여백
	        bottom: 20, // 하단 여백
	        left: 55, // 좌측 여백
	        right: 10 // 우측 여백
	    }
	  };
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
	});
	</script>
</body>
</html>
