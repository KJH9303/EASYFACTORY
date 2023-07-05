<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="en" style="height: 100%">
<head>
<meta charset="utf-8">
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
   href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   
<script type="text/javascript">
  $(document).ready(function() {
    function barChart(vals) {
      var dom = document.getElementById('container');
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
    $(function() {
        $("#startDate").datepicker({
          dateFormat: "yy-mm-dd",
        });
        $("#endDate").datepicker({
          dateFormat: "yy-mm-dd",
        });
      });

      function loadData() {
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();

        $.ajax({
          url: "/energy/chart3",
          type: "POST",
          data: { startDate: startDate, endDate: endDate },
          success: function(data) {
            console.log('Raw Data:', data);
            var chartData = JSON.parse(data);
            barChart(chartData);
            console.log('chartData:', chartData);
          },
          error: function(err) {
            console.log(err);
          }
        });
      }

      $("#searchData").click(function() {
        loadData();
        setInterval(loadData, 5000);
      });
  });
  </script>
  </head>
  <body>
   	
   
   
      <div>
        <label>
          시작 날짜: <input type="text" id="startDate" name="startDate" />
        </label>
        <br />
        <label>
          종료 날짜: <input type="text" id="endDate" name="endDate" />
        </label>
        <br />
        <button type="button" id="searchData">데이터 검색</button>
    	</div>
      <div id="container" style="height: 500px"></div>
     
  </body>
  </html>
