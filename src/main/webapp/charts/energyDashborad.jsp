<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Dashboard</title>
  <link rel="stylesheet" href="/../resources/feb/css/feb2.css" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
              총 에너지 사용 비용
            </h6>
            <span id="value1" class="text-xl font-semibold"></span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              (단위 : 천원)
            </span>
          </div>
          <div>
            <!-- 달력 아이콘 추가 -->
            <i id="energyCostIcon1" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
            <input type="text" id="energyCostStartDate1" class="datepicker" name="energyCostStartDate"  style="display: none;" />
            <input type="text" id="energyCostEndDate1" class="datepicker" name="energyCostEndDate"   style="display: none;" />
            <button id="applyEnergyCost1" style="display: none;">제출</button>
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
          <div>
            <!-- 달력 아이콘 추가 -->
            <i id="energyCostIcon2" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
            <input type="text" id="energyCostStartDate2" class="datepicker" name="energyCostStartDate" style="display: none;" />
            <input type="text" id="energyCostEndDate2" class="datepicker" name="energyCostEndDate" style="display: none;" />
            <button id="applyEnergyCost2" style="display: none;">제출</button>
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
          <div>
            <!-- 달력 아이콘 추가 -->
            <i id="energyCostIcon3" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
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
            <h4 class="text-lg font-semibold text-gray-500">공정별 가동률 평균</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon4" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate4" class="datepicker" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate4" class="datepicker" name="energyCostEndDate" style="display: none;" />
              <button id="applyEnergyCost4" style="display: none;">제출</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <canvas id="barChart1"></canvas>
          </div>
        </div>

        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
           <h4 class="text-lg font-semibold text-gray-500">공정별 총 생산량</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon5" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate5" class="datepicker" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate5" class="datepicker" name="energyCostEndDate" style="display: none;" />
               <button id="applyEnergyCost5" style="display: none;">제출</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <canvas id="barChart2"></canvas>
          </div>
        </div>
      </div>
        <!-- Charts -->
      <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 총 비용</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon6" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate6" class="datepicker" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate6" class="datepicker" name="energyCostEndDate" style="display: none;" />
               <button id="applyEnergyCost6" style="display: none;">제출</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <canvas id="barChart3"></canvas>
          </div>
        </div>

        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 총 에너지 사용량</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon7" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
             <input type="text" id="energyCostStartDate7" class="datepicker" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate7" class="datepicker" name="energyCostEndDate" style="display: none;" />
               <button id="applyEnergyCost7" style="display: none;">제출</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <canvas id="barChart4"></canvas>
          </div>
        </div>
      </div>
        <!-- Charts -->
      <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 총비용 대비 총 생산량</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon8" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate8" class="datepicker" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate8" class="datepicker" name="energyCostEndDate" style="display: none;" />
               <button id="applyEnergyCost8" style="display: none;">제출</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <canvas id="barChart5"></canvas>
          </div>
        </div>

        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 총 비용대비 총 에너지 사용량</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon9" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
             <input type="text" id="energyCostStartDate9" class="datepicker" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate9" class="datepicker" name="energyCostEndDate" style="display: none;" />
               <button id="applyEnergyCost9" style="display: none;">제출</button>
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <canvas id="barChart6"></canvas>
          </div>
        </div>
      </div>
      <script>
      
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

          // 날짜를 선택하고 '제출'을 클릭할 때 실행할 함수를 정의합니다.
     
          window.applyDateRange1 = function (event, url, targetValueId, valueKey) {
     			let parent = $(event.target).parent();
				parent.find(".datepicker").hide();
				$(event.target).hide();
				
				  let startDate = parent.find("input[name='energyCostStartDate']").val();
				  let endDate = parent.find("input[name='energyCostEndDate']").val();
				
			  // 전기사용비용 합계
			  $.ajax({
			    url: "/energy/chart2",
			    method: "POST",
			    data: {
			      startDate: startDate,
			      endDate: endDate
			    },
			    success: function (response) {
			      let data = JSON.parse(response);
			      if (data["SUM_COSTS"] !== undefined) {
			        const value = data["SUM_COSTS"];
			        $("#value1").text((value).toLocaleString());
			      } else {
			        console.error("'SUM_COSTS' not found in received data.", response);
			      }
			    }
			  });
			}  
          // 전기사용비용 합계 디폴트 값 
          window.applyDateRange1_1 = function (url, targetValueId, valueKey) {
			  $.ajax({
			    url: "/energy/cost",
			    method: "POST",
			    data: {
			    },
			    success: function (response) {
			      let data = JSON.parse(response);
			      if (data["SUM_COSTS"] !== undefined) {
			        const value = data["SUM_COSTS"];
			        $(targetValueId).text((value).toLocaleString());
			      } else {
			        console.error("'SUM_COSTS' not found in received data.", response);
			      }
			    }
			  });
			}
    		// 전기사용량 합계
			window.applyDateRange2 = function (event, url, targetValueId, valueKey) {
				  let parent = $(event.target).parent();
				  parent.find(".datepicker").hide();
				  $(event.target).hide();
				  let startDate = parent.find("input[name='energyCostStartDate']").val();
				  let endDate = parent.find("input[name='energyCostEndDate']").val();
			  $.ajax({
			    url: "/energy/chart10",
			    method: "POST",
			    data: {
			      startDate: startDate,
			      endDate: endDate
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
			  // 전기사용량 합계 디폴트 값 
	          window.applyDateRange2_1 = function (url, targetValueId, valueKey) {
				  $.ajax({
				    url: "/energy/usingratio",
				    method: "POST",
				    data: {
				    },
				    success: function (response) {
				      let data = JSON.parse(response);
				      if (data["SUM_USINGRATIO"] !== undefined) {
				        const value = data["SUM_USINGRATIO"];
				        $(targetValueId).text((value).toLocaleString());
				      } else {
				        console.error("'SUM_USINGRATIO' not found in received data.", response);
				      }
				    }
				  });
				}
			  
			 window.applyDateRange3 = function (event, url, targetValueId, valueKey) {
				  let parent = $(event.target).parent();
				  parent.find(".datepicker").hide();
				  $(event.target).hide();
				
				  let startDate = parent.find("input[name='energyCostStartDate']").val();
				  let endDate = parent.find("input[name='energyCostEndDate']").val();
				
				  // 평균 가동률
				  $.ajax({
				    url: "/energy/chart1",
				    method: "POST",
				    data: {
				      startDate: startDate,
				      endDate: endDate
				    },
				    success: function (response) {
				      let data = JSON.parse(response);
				      if (data["AVERAGE_OPRATIO"] !== undefined) {
				        const value = data["AVERAGE_OPRATIO"];
				        $("#value3").text((value).toLocaleString());
				      } else {
				        console.error("'AVERAGE_OPRATIO' not found in received data.", response);
				      }
				    }
				  });
	          }
			// 전기사용량 합계 디폴트 값 
	          window.applyDateRange3_1 = function (url, targetValueId, valueKey) {
				  $.ajax({
				    url: "/energy/opratio",
				    method: "POST",
				    data: {
				    },
				    success: function (response) {
				      let data = JSON.parse(response);
				      if (data["AVERAGE_OPRATIO"] !== undefined) {
				        const value = data["AVERAGE_OPRATIO"];
				        $(targetValueId).text((value).toLocaleString());
				      } else {
				        console.error("'AVERAGE_OPRATIO' not found in received data.", response);
				      }
				    }
				  });
				}
			// 각 "제출" 버튼에 클릭 이벤트를 설정합니다.
			$("#applyEnergyCost1").click(function (event) {
			  applyDateRange1(event, "/energy/chart2", "#value1", "SUM_COSTS");
			});	
			$("#applyEnergyCost2").click(function (event) {
			  applyDateRange2(event, "/energy/chart10", "#value2", "SUM_USINGRATIO");
			});
			$("#applyEnergyCost3").click(function (event) {
			  applyDateRange3(event, "/energy/chart1", "#value3", "AVERAGE_OPRATIO");
			});

          $("#applyEnergyCost4").click((event) => applyDateRange(event, "/energy/chart3"));
          $("#applyEnergyCost5").click((event) => applyDateRange(event, "/energy/chart4"));
          $("#applyEnergyCost6").click((event) => applyDateRange(event, "/energy/chart5"));
          $("#applyEnergyCost7").click((event) => applyDateRange(event, "/energy/chart6"));
          $("#applyEnergyCost8").click((event) => applyDateRange(event, "/energy/chart8"));
          $("#applyEnergyCost9").click((event) => applyDateRange(event, "/energy/chart9"));
          applyDateRange1_1("/energy/cost", "#value1", "SUM_COSTS");
          applyDateRange2_1("/energy/usingratio", "#value2", "SUM_USINGRATIO");
          applyDateRange3_1("/energy/opratio", "#value3", "AVERAGE_OPRATIO");
        });     
        

      </script>
    </div>
  </main>
</div>
</body>
</html>