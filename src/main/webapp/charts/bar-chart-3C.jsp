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
	    function gaugeChart(vals) {
	        var dom = document.getElementById('container');
	        var myChart = echarts.init(dom, null, {
	          renderer: 'canvas',
	          useDirtyRect: false
	        });
	        var app = {};
	        
	        var option;
	
	        option = {
	      series: [
	        {
	          type: 'gauge',
	          max: 15, 
	          axisLine: {
	            lineStyle: {
	              width: 30,
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
	          axisTick: {
	            distance: -30,
	            length: 8,
	            lineStyle: {
	              color: '#fff',
	              width: 2
	            }
	          },
	          splitLine: {
	            distance: -30,
	            length: 30,
	            lineStyle: {
	              color: '#fff',
	              width: 4
	            }
	          },
	          axisLabel: {
	            color: 'inherit',
	            distance: 40,
	            fontSize: 20,
	            formatter: function(value) {
	                return value.toFixed(0); // Added formatter to show only integers
	            }
	          },
	          detail: {
	            valueAnimation: true,
	            formatter: '{value} ℃',
	            color: 'inherit'
	          },
	          data: [
	            {
	              value: 0
	            }
	          ]
	        }
	      ]
	    };
	    setInterval(function () {
	      myChart.setOption({
	        series: [
	          {
	            data: [
	              {
	                value: vals
	              }
	            ]
	          }
	        ]
	      });
	    }, 2000);


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
        url: "/EASYFACTORY/chart4",
        type: "POST",
        data: { startDate: startDate, endDate: endDate },
        success: function(data) {
          console.log('Raw Data:', data);
          var chartData = JSON.parse(data);
          gaugeChart(chartData);
          console.log('chartData:', chartData);
        },
        error: function(err) {
          console.log(err);
        }
      });
    }

    $("#searchData").click(function() {
      loadData();
      setInterval(loadData, 3000);
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
