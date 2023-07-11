<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Dashboard</title>
  <link rel="stylesheet" href="/../resources/feb/css/feb2.css" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="js/echarts.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <script type="text/javascript">
  
    function barChart(vals) {
    	alert(vals);
      var dom = document.getElementById('FebOpratio_Chart');
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
            data: [10,20,30,40,50,60,70,80],
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
  
</head>
<body>
      <div id="FebOpratio_Chart" style="height: 500px"></div>
            
            

<script>barChart(10);</script>
</body>
</html>