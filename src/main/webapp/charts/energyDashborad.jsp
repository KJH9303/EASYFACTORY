<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">
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
            <h6
              class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              총 에너지 사용 비용(천원)
            </h6>
            <span class="text-xl font-semibold">$30,000</span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              +4.4%
            </span>
          </div>
          <div>
            <!-- 달력 아이콘 추가 -->
            <i id="energyCostIcon1" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate1" class="datepicker" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate1" class="datepicker" name="energyCostEndDate" style="display: none;" />
               <button id="applyEnergyCost1" style="display: none;">제출</button>
          </div>
        </div>

        <!-- Users card -->
        <div class="flex items-center justify-between p-4 bg-white">
          <div>
            <h6
              class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              총 에너지 사용량(Kwh)
            </h6>
            <span class="text-xl font-semibold">50,021</span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              +2.6%
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
            <h6
              class="text-xs font-medium leading-none tracking-wider text-gray-500 uppercase">
              총 공정 가동률 평균(%)
            </h6>
            <span class="text-xl font-semibold">45,021</span>
            <span class="inline-block px-2 py-px ml-2 text-xs text-green-500 bg-green-100 rounded-md">
              +3.1%
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
            <canvas id="barChart1"></canvas>
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
            <canvas id="barChart1"></canvas>
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
            <canvas id="barChart2"></canvas>
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
          function onApplyDateRange() {
        	  $(".datepicker").hide();
        	  $("button").hide();
        	  
        	  // 다음으로 선택한 날짜 범위를 서버에 전달할 수 있도록 작업을 진행합니다.
        	  var startDate = $(this).siblings("input[name='energyCostStartDate']").val();
        	  var endDate = $(this).siblings("input[name='energyCostEndDate']").val();
            
            // 서버에 선택한 날짜 범위를 전달하는 로직을 추가하세요.
            // 예시: Ajax 요청으로 서버에 전달
            $.ajax({
              url: "your-server-url",
              method: "POST",
              data: {
                startDate: startDate,
                endDate: endDate
              },
              success: function (response) {
                // 서버로부터의 응답을 처리하는 로직을 추가하세요.
              },
              error: function (error) {
                // 오류 처리 로직을 추가하세요.
              }
            });
          }
    
          // 각 "제출" 버튼에 클릭 이벤트를 설정합니다.
          $("#applyEnergyCost1").click(onApplyDateRange);
          $("#applyEnergyCost2").click(onApplyDateRange);
          $("#applyEnergyCost3").click(onApplyDateRange);
          $("#applyEnergyCost4").click(onApplyDateRange);
          $("#applyEnergyCost5").click(onApplyDateRange);
          $("#applyEnergyCost6").click(onApplyDateRange);
          $("#applyEnergyCost7").click(onApplyDateRange);
          $("#applyEnergyCost8").click(onApplyDateRange);
          $("#applyEnergyCost9").click(onApplyDateRange);
        });
      </script>
    </div>
  </main>
</div>
</body>
</html>
