<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="height: 100%">

<head>
  <meta charset="utf-8">
  <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
  <script type="text/javascript" src="js/echarts.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

  <script type="text/javascript">
    $(document).ready(function () {
      function barChart(vals) {
        var dom = document.getElementById('Feb_Costs_Chart');
        var myChart = echarts.init(dom, null, {
          renderer: 'canvas',
          useDirtyRect: false
        });

        var option = {
          xAxis: {
            type: 'category',
            data: ['1공정', '2공정', '3공정', '4공정', '5공정', '6공정', '7공정', '8공정']
          },
          yAxis: { type: 'value' },
          series: [{
            data: vals,
            type: 'bar',
            showBackground: true,
            backgroundStyle: { color: 'rgba(180, 180, 180, 0.2)' }
          }]
        };

        if (option && typeof option === 'object') {
          myChart.setOption(option);
        }
        window.addEventListener('resize', myChart.resize);
      }

      function loadData(startDate, endDate) {
        $.ajax({
          url: "/energy/chart5",
          type: "POST",
          data: { startDate: startDate, endDate: endDate },
          success: function (data) {
            console.log('Raw Data:', data);
            var chartData = JSON.parse(data);
            barChart(chartData);
            console.log('chartData:', chartData);
          },
          error: function (err) {
            console.log(err);
          }
        });
      }

      // 임의의 초기 데이터로 차트 표시
      var initialData = [100, 200, 300, 400, 500, 600, 700, 800];
      barChart(initialData);

      function toggleDatePickers() {
        $("#datePickers").toggle();
      }

      $("#searchIcon").click(toggleDatePickers);

      $("#startDate").datepicker({
        dateFormat: "yy-mm-dd",
      });

      $("#endDate").datepicker({
        dateFormat: "yy-mm-dd",
      });

      $("#submitDates").click(function () {
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();
        loadData(startDate, endDate);

        // Hide the date pickers and display the search icon
        $("#datePickers").hide();
        $("#searchIcon").show();
      });
    });
  </script>
</head>

<body>
  <!-- 아이콘을 클릭하면 표시되는 데이터 피커와 제출 버튼 구성 -->
  <i id="searchIcon" class="fas fa-search" style="cursor: pointer;"></i>
  <div id="datePickers" style="display: none;">
    <label>
      시작 날짜:<input type="text" id="startDate" name="startDate" />
    </label>
    <br />
    <label>
      종료 날짜:<input type="text" id="endDate" name="endDate" />
    </label>
    <br />
    <button type="button" id="submitDates">제출</button>
  </div>
  <div id="Feb_Costs_Chart" style="height: 500px"></div>
</body>

</html>
