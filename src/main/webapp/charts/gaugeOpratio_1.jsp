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
    	      min: 0,
    	      max: 100,
    	      splitNumber: 10,
    	      radius: '80%',
    	      axisLine: {
    	        lineStyle: {
    	          color: [[1, '#f00']],
    	          width: 3
    	        }
    	      },
    	      splitLine: {
    	        distance: -18,
    	        length: 18,
    	        lineStyle: {
    	          color: '#f00'
    	        }
    	      },
    	      axisTick: {
    	        distance: -12,
    	        length: 10,
    	        lineStyle: {
    	          color: '#f00'
    	        }
    	      },
    	      axisLabel: {
    	        distance: -50,
    	        color: '#f00',
    	        fontSize: 25
    	      },
    	      anchor: {
    	        show: true,
    	        size: 20,
    	        itemStyle: {
    	          borderColor: '#000',
    	          borderWidth: 2
    	        }
    	      },
    	      pointer: {
    	        offsetCenter: [0, '10%'],
    	        icon: 'path://M2090.36389,615.30999 L2090.36389,615.30999 C2091.48372,615.30999 2092.40383,616.194028 2092.44859,617.312956 L2096.90698,728.755929 C2097.05155,732.369577 2094.2393,735.416212 2090.62566,735.56078 C2090.53845,735.564269 2090.45117,735.566014 2090.36389,735.566014 L2090.36389,735.566014 C2086.74736,735.566014 2083.81557,732.63423 2083.81557,729.017692 C2083.81557,728.930412 2083.81732,728.84314 2083.82081,728.755929 L2088.2792,617.312956 C2088.32396,616.194028 2089.24407,615.30999 2090.36389,615.30999 Z',
    	        length: '115%',
    	        itemStyle: {
    	          color: '#000'
    	        }
    	      },
    	      detail: {
    	        valueAnimation: true,
    	        precision: 1
    	      },
    	      title: {
    	        offsetCenter: [0, '-50%']
    	      },
    	      data: [
    	        {
    	          value: vals,
    	          name: '기계가동률'
    	        }
    	      ]
    	    },
    	    {
    	      type: 'gauge',
    	      min: 0,
    	      max: 60,
    	      splitNumber: 6,
    	      axisLine: {
    	        lineStyle: {
    	          color: [[1, '#000']],
    	          width: 3
    	        }
    	      },
    	      splitLine: {
    	        distance: -3,
    	        length: 18,
    	        lineStyle: {
    	          color: '#000'
    	        }
    	      },
    	      axisTick: {
    	        distance: 0,
    	        length: 10,
    	        lineStyle: {
    	          color: '#000'
    	        }
    	      },
    	      axisLabel: {
    	        distance: 10,
    	        fontSize: 25,
    	        color: '#000'
    	      },
    	      pointer: {
    	        show: false
    	      },
    	      title: {
    	        show: false
    	      },
    	      anchor: {
    	        show: true,
    	        size: 14,
    	        itemStyle: {
    	          color: '#000'
    	        }
    	      }
    	    }
    	  ]
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
        url: "/energy/chart1",
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
