<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Dashboard</title>
  <link rel="stylesheet" href="/../resources/feb/css/feb3.css" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="js/echarts.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5.4.2/dist/echarts.min.js"></script> 
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
  <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
   <script type="text/javascript">
	// 각 공정별 재고량 차트
	   function FebStockChart(vals) {
	     var dom = document.getElementById('Feb_StockChart');
	     var myChart = echarts.init(dom, null, {
	       renderer: 'canvas',
	       useDirtyRect: false
	     });
	       var option = {
	               xAxis: {
	                 type: 'category',
	                 data: ['1공정','2공정','3공정','4공정','5공정','6공정','7공정','8공정']
	               },
	       yAxis: {type: 'value'},
	       series: [{
	           data: vals,
	           type: 'bar',
	           showBackground: true,
	           backgroundStyle: {color: 'rgba(180, 180, 180, 0.2)'}
	       }]
	     };
	     if (option && typeof option === 'object') {
	       myChart.setOption(option);
	     }
	     window.addEventListener('resize', myChart.resize);
	   }   
   </script>
  <script type="text/javascript">
  	// 각 공정별 불량 차트
    function FebFalChart(vals) {
      var dom = document.getElementById('FebFal_Chart');
      var myChart = echarts.init(dom, null, {
        renderer: 'canvas',
        useDirtyRect: false
      });
        var option = {
                xAxis: {
                  type: 'category',
                  data: ['1공정','2공정','3공정','4공정','5공정','6공정','7공정','8공정']
                },
        yAxis: {type: 'value'},
        series: [{
            data: vals,
            type: 'bar',
            showBackground: true,
            backgroundStyle: {color: 'rgba(180, 180, 180, 0.2)'}
        }]
      };
      if (option && typeof option === 'object') {
        myChart.setOption(option);
      }
      window.addEventListener('resize', myChart.resize);
    }
   </script>
    <script type="text/javascript">
 	// 각 공정별 안전재고 대비 총 재고량 차트
   function SFStockStockChart(chartData) {
	   console.log("SFStock_StockChart([" + chartData + "])");
	   var myChart = echarts.init(document.getElementById('SFStock_StockChart'));
	   var option = {
	       title: {
	           text: '총 비용 대비 총 생산량',
	           subtext: '총비용 단위 (천원)'
	       },
	       tooltip: {
	           trigger: 'axis'
	       },
	       legend: {
	           data: ['안전재고량', '재고량']
	       },
	       toolbox: {
	           show: true,
	           feature: {
	               dataView: {show: true,readOnly: false},
	               magicType: {show: true, type: ['line', 'bar']},
	               restore: {show: true},
	               saveAsImage: {show: true}
	           }
	       },
	       calculable: true,
	       xAxis: [{
	           type: 'category',
	           data: ['1공정', '2공정', '3공정', '4공정', '5공정', '6공정', '7공정', '8공정']
	       }],
	       yAxis: [{
	           type: 'value'
	       }],
	       series: [{
	               name: '안전재고량',
	               type: 'bar',
	               data: [],
	               markPoint: {
	                   data: [{ type: 'max',name: '최대값'},
	                       {type: 'min',name: '최소값'}]},
	               markLine: {
	                   data: [{type: 'average',name: '평균값'}]
	               }
	           },
	           {
	               name: '재고량',
	               type: 'bar',
	               data: [],
	               markPoint: {
	                   data: [{type: 'max',name: '최대값'},
	                       {type: 'min',name: '최소값'}]},
	               markLine: {
	                   data: [{type: 'average',name: '평균값'}]
	               }
	           }
	       ]
	   }; // option
	   myChart.setOption(option);
	   window.addEventListener('resize', myChart.resize);
	   var xAxisData = ['1공정', '2공정', '3공정', '4공정', '5공정', '6공정', '7공정', '8공정'];
	   myChart.setOption({
	         xAxis: {
	             data: xAxisData
	         },
	         series: [{
	                 name: '안전재고량', // 하드 코딩 안전재고는 일정하기 때문에 
	                 data: [5000,8000,3000,7000,10000,6000,2000,8000],
	             },
	             {
	                 name: '재고량',
	                 data: chartData,
	             }
	         ],
	 	    grid: {
		        top: 80, // 상단 여백
		        bottom: 20, // 하단 여백
		        left: 30, // 좌측 여백
		        right: 10 // 우측 여백
		    }
	     });
	}  // function CostsTrChart
   </script> 
   
  
  
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
            <h6 class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              총 재고량
            </h6>
            <span id="value1" class="text-xl font-semibold">0</span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : EA)
            </span>
          </div>
          <div>
            <!-- 달력 아이콘 추가 -->
            <i id="energyCostIcon1" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
            <!-- 데이트피커 -->
            <input type="text" id="energyCostStartDate1" class="datepicker" name="energyCostStartDate"  style="display: none;" />
            <input type="text" id="energyCostEndDate1" class="datepicker" name="energyCostEndDate"   style="display: none;" />
            <button id="applyEnergyCost1" style="display: none;">제출</button>
          </div>
        </div>
        <!-- Users card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6 class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              총 안전재고량
            </h6>
            <span id="value2" class="text-xl font-semibold">40,000</span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : EA)
            </span>
          </div>
          <div>
            <!-- 달력 아이콘 추가 -->
            <i id="energyCostIcon2" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
            <!-- 데이트피커 -->
            <input type="text" id="energyCostStartDate2" class="datepicker" name="energyCostStartDate" style="display: none;" />
            <input type="text" id="energyCostEndDate2" class="datepicker" name="energyCostEndDate" style="display: none;" />
            <button id="applyEnergyCost2" style="display: none;">제출</button>
          </div>
        </div>
        <!-- Orders card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6 class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
             총 불량재고량 
            </h6>
            <span id="value3" class="text-xl font-semibold"></span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : EA)
            </span>
          </div>
          <div>
            <!-- 달력 아이콘 추가 -->
            <i id="energyCostIcon3" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
            <!-- 데이트피커 -->
            <input type="text" id="energyCostStartDate3" class="datepicker" name="energyCostStartDate" style="display: none;" />
            <input type="text" id="energyCostEndDate3" class="datepicker" name="energyCostEndDate" style="display: none;" />
            <button id="applyEnergyCost3" style="display: none;">제출</button>
          </div>
        </div>
      </div>
      
      <!-- Charts -->
      <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정 별 재고 현황</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon4" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <!-- 데이트피커 -->
              <input type="text" id="energyCostStartDate4" class="datepicker" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate4" class="datepicker" name="energyCostEndDate" style="display: none;" />
              <button id="applyEnergyCost4" style="display: none;">제출</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <div id="Feb_StockChart" style="height: 350px"></div>
          </div>
        </div>
        
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
           <h4 class="text-lg font-semibold text-gray-500">공정별 총 불량</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon5" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <!-- 데이트피커 -->
              <input type="text" id="energyCostStartDate5" class="datepicker" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate5" class="datepicker" name="energyCostEndDate" style="display: none;" />
               <button id="applyEnergyCost5" style="display: none;">제출</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
      		<div id="FebFal_Chart" style="height: 350px"></div>
          </div>
        </div>
      </div>
      
        <!-- Charts -->
      <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정 별 안전재고 대비 총 재고 현황</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon6" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <!-- 데이트피커 -->
              <input type="text" id="energyCostStartDate6" class="datepicker" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate6" class="datepicker" name="energyCostEndDate" style="display: none;" />
               <button id="applyEnergyCost6" style="display: none;">제출</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <div id="SFStock_StockChart" style="height: 350px"></div>
          </div>
        </div>
        
      <script>
      // JS 날짜 변환 쿼리 
      let today = new Date(); // 시작일자
      let year = today.getFullYear(); // 년도
      let month = today.getMonth() + 1;  // 월
      let date = today.getDate();  // 날짜
    //각 차트 날짜 지정을 위한 배열 쿼리
      var startDate = new Array(5);
      var endDate = new Array(5);
      for(var cnt=0; cnt <= 5; cnt++) {
      	startDate[cnt] = year + '-' + month + '-' + date;
      	endDate[cnt] = year + '-' + month + '-' + date;
      }
        $(document).ready(function () {
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
        
          // 데이터 피커의 기본 설정을 정의합니다.
          $(".datepicker").datepicker({ dateFormat: "yy-mm-dd" });
       	  // 서버연동을 위한 Ajax쿼리
          // 총 재고량 
          window.applyDateRange1 = function (event, url, targetValueId, valueKey) {
    	   		if(event !== null) {
	     			let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					  startDate[0] = parent.find("input[name='energyCostStartDate']").val();
					  endDate[0] = parent.find("input[name='energyCostEndDate']").val();
       			}
       			  $.ajax({
			    url: "/energy/chart10",
			    method: "POST",
			    data: {
			      startDate: startDate[0],
			      endDate: endDate[0]
			    },
			    success: function (response) {
			      let data = JSON.parse(response);
			      if (data["SUM_STOCK"] !== undefined) {
			        const value = data["SUM_STOCK"];
			        $("#value1").text((value).toLocaleString());
			      } else {
			        console.error("'SUM_STOCK' not found in received data.", response);
			      }
			    }
			  });
			}  
          /*
    		// 안전재고 사용량 (혹시몰라서 남겨둠)
			window.applyDateRange2 = function (event, url, targetValueId, valueKey) {
    	   		if(event !== null) {
				  let parent = $(event.target).parent();
				  parent.find(".datepicker").hide();
				  $(event.target).hide();
				  startDate[1] = parent.find("input[name='energyCostStartDate']").val();
				  endDate[1] = parent.find("input[name='energyCostEndDate']").val();
    	   		}
			  $.ajax({
			    url: "/energy/chart2",
			    method: "POST",
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
			        console.error("'SUM_USINGRATIO' not found in received data.", response);
			      }
			    }
			  });
			};
			*/
			  // 총 불량재고량
			 window.applyDateRange3 = function (event, url, targetValueId, valueKey) {
				  if(event !== null) {
					  let parent = $(event.target).parent();
					  parent.find(".datepicker").hide();
					  $(event.target).hide();
					  startDate[2] = parent.find("input[name='energyCostStartDate']").val();
					  endDate[2] = parent.find("input[name='energyCostEndDate']").val();
				  }
				  $.ajax({
				    url: "/energy/chart11",
				    method: "POST",
				    data: {
				      startDate: startDate[2],
				      endDate: endDate[2]
				    },
				    success: function (response) {
				      let data = JSON.parse(response);
				      if (data["SUM_FAL"] !== undefined) {
				        const value = data["SUM_FAL"];
				        $("#value3").text((value).toLocaleString());
				      } else {
				        console.error("'SUM_FAL' not found in received data.", response);
				      }
				    }
				  });
	          }
			  // 각 공정별 총 재고량
	          window.applyDateRange4 = function (event, url, targetValueId) {
	        	  if(event !== null) {
	     			let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					  startDate[3] = parent.find("input[name='energyCostStartDate']").val();
					  endDate[3] = parent.find("input[name='energyCostEndDate']").val();
	        	  }
					  $.ajax({
				          url: "/energy/chart12",
				          type: "POST",
				          data: { 
			        	  startDate: startDate[3], 
			        	  endDate: endDate[3]
					  },
				          success: function(data) {
				            console.log('Raw Data:', data);
				            var chartData = JSON.parse(data);
				            FebStockChart(chartData);
				            console.log('chartData:', chartData);
				          },
				          error: function(err) {
				            console.log(err);
				          }
				        });
				      }
			// 각 공정별 총 불량 
	          window.applyDateRange5 = function (event, url, targetValueId) {
	        	  if(event !== null) {
	     			let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					  startDate[4] = parent.find("input[name='energyCostStartDate']").val();
					  endDate[4] = parent.find("input[name='energyCostEndDate']").val();
	        	  }
					  $.ajax({
				          url: "/energy/chart13",
				          type: "POST",
				          data: { 
			        	  startDate: startDate[4], 
			        	  endDate: endDate[4]
					  },
				          success: function(data) {
				            console.log('Raw Data:', data);
				            var chartData = JSON.parse(data);
				            FebFalChart(chartData);
				            console.log('chartData:', chartData);
				          },
				          error: function(err) {
				            console.log(err);
				          }
				        });
				      }
			
	       window.applyDateRange6 = function (event, url, targetValueId) {
	        	  if(event !== null) {
	     			let parent = $(event.target).parent();
					parent.find(".datepicker").hide();
					$(event.target).hide();
					  startDate[5] = parent.find("input[name='energyCostStartDate']").val();
					  endDate[5] = parent.find("input[name='energyCostEndDate']").val();
	        	  }
					  $.ajax({
				          url: "/energy/chart14",
				          type: "POST",
				          data: { 
			        	  startDate: startDate[5], 
			        	  endDate: endDate[5]
					  },
				           success: function(data) {
				               console.log("Raw Data:", data);
				               var chartData = JSON.parse(data);
				               SFStockStockChart(chartData);
				          },
				          error: function(err) {
				            console.log(err);
				          }
				        });
				      }
	       
	        
			// 각 "제출" 버튼에 클릭 이벤트를 설정합니다.
			$("#applyEnergyCost1").click(function (event) {
			  applyDateRange1(event, "/energy/chart10", "#value1", "SUM_STOCK");
			});	
			//$("#applyEnergyCost2").click(function (event) {
			//  applyDateRange2(event, "/energy/chart2", "#value2", "SUM_USINGRATIO");
			//});
			$("#applyEnergyCost3").click(function (event) {
			  applyDateRange3(event, "/energy/chart11", "#value3", "SUM_FAL");
			});
			$("#applyEnergyCost4").click(function (event) {
			  applyDateRange4(event, "/energy/chart12", "Feb_StockChart");
			});
			$("#applyEnergyCost5").click(function (event) {
			  applyDateRange5(event, "/energy/char13", "FebFal_Chart");
			});
			$("#applyEnergyCost6").click(function (event) {
			  applyDateRange6(event, "/energy/char14", "SFStock_StockChart");
			});
			
        });  
          // 새로운 interval 실행
        setInterval(() => {
            applyDateRange1(null,"/energy/chart10", "#value1", "SUM_STOCK");
           // applyDateRange2(null,"/energy/chart2", "#value2", "SUM_USINGRATIO");
            applyDateRange3(null,"/energy/chart11", "#value3", "SUM_FAL");
            applyDateRange4(null,"/energy/chart12", "#value4", "Feb_StockChart");
            applyDateRange5(null,"/energy/chart13", "#value5", "FebFal_Chart");
            applyDateRange6(null,"/energy/chart14", "#value6", "SFStock_StockChart");
           
        }, 3000);
      </script>
    </div>
  </main>
</div>
</body>
</html>