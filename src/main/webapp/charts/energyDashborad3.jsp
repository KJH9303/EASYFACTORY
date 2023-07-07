<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Dashboard</title>
  <link rel="stylesheet" href="/../resources/feb/css/feb2.css" />
  <script src="https://cdn.jsdelivr.net/gh/alpine-collective/alpine-magic-helpers@0.5.x/dist/component.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.7.3/dist/alpine.min.js" defer></script>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
            <i id="energyCostIcon" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate" name="energyCostEndDate" style="display: none;" />
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
            <i id="energyCostIcon" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate" name="energyCostEndDate" style="display: none;" />
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
            <i id="energyCostIcon" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate" name="energyCostEndDate" style="display: none;" />
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
              <i id="energyCostIcon" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate" name="energyCostEndDate" style="display: none;" />
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <canvas id="barChart"></canvas>
          </div>
        </div>

        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 총 생산량</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate" name="energyCostEndDate" style="display: none;" />
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <canvas id="barChart"></canvas>
          </div>
        </div>
      </div>

      <!-- Two grid columns -->
      <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 총 에너지 사용 비용</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate" name="energyCostEndDate" style="display: none;" />
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <canvas id="barChart"></canvas>
          </div>
        </div>

        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 총 에너지 사용량</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate" name="energyCostEndDate" style="display: none;" />
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <canvas id="barChart"></canvas>
          </div>
        </div>
      </div>

      <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-0 lg:grid-cols-3">
        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 총 비용 대비 총 생산량</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate" name="energyCostEndDate" style="display: none;" />
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <canvas id="barChart"></canvas>
          </div>
        </div>

        <!-- Bar chart card -->
        <div class="col-span-2 bg-white rounded-md">
          <!-- Card header -->
          <div class="flex items-center justify-between p-4 border-b">
            <h4 class="text-lg font-semibold text-gray-500">공정별 총 비용 대비 총 에너지사용량</h4>
            <!-- 달력 아이콘 추가 -->
            <div class="flex items-center space-x-2">
              <i id="energyCostIcon" class="fas fa-calendar-alt" style="cursor: pointer;"></i>
              <input type="text" id="energyCostStartDate" name="energyCostStartDate" style="display: none;" />
              <input type="text" id="energyCostEndDate" name="energyCostEndDate" style="display: none;" />
            </div>
          </div>
          <!-- Chart -->
          <div class="relative p-4 h-72">
            <canvas id="barChart"></canvas>
          </div>
        </div>
      </div>
    </div>
  </main>
</div>
<script>
		// 아래 스크립트는 jQuery를 사용하여 달력 아이콘을 클릭하면 데이터 피커를 보여주고, 데이터 피커를 설정합니다.
		$(document).ready(function () {
      // 달력 아이콘 클릭 시 데이터 피커를 토글합니다.
      $("#energyCostIcon").click(function () {
        $("#energyCostStartDate").toggle();
        $("#energyCostEndDate").toggle();
      });
    
      $("#energyUsingratioIcon").click(function () {
        $("#energyUsingratioStartDate").toggle();
        $("#energyUsingratioEndDate").toggle();
      });
    
      $("#energyOpratioIcon").click(function () {
        $("#energyOpratioStartDate").toggle();
        $("#energyOpratioEndDate").toggle();
      });
    
      // 데이터 피커의 기본 설정을 정의합니다.
      $(".datepicker").datepicker({ dateFormat: "yy-mm-dd" });
    
      // 날짜를 선택하고 '적용'을 클릭할 때 실행할 함수를 정의합니다.
      function onApplyDateRange() {
        // 여기에서 각 차트 작성을 위해 loadData 등의 함수를 호출하고,
        // 선택한 날짜 범위를 사용하여 각 차트 데이터를 제공합니다.
      }
    
      // 각 "적용" 버튼에 클릭 이벤트를 설정합니다.
      $("#applyEnergyCost").click(onApplyDateRange);
      $("#applyEnergyUsingratio").click(onApplyDateRange);
      $("#applyEnergyOpratio").click(onApplyDateRange);
    });
</script>
</body>
</html>
