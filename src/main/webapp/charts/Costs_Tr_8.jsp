<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html> 
<html lang="ko" style="height: 100%"> 
<head> 
	<meta charset="utf-8"> 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5.4.2/dist/echarts.min.js"></script> 
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
</head> 
<body style="height: 80%; margin: 0"> 
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
  
  
   <script type="text/javascript">
    var myChart = echarts.init(document.getElementById('container'));

    var option = {
        title: {
            text: '총 비용 대비 총 생산량',
            subtext: '총비용 단위 (천원)'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['비용', '생산량']
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
                name: '비용',
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
                name: '생산량',
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
    };

    myChart.setOption(option);
    window.addEventListener('resize', myChart.resize);

    function requestData() {
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();

        $.ajax({
            url: "/energy/chart8",
            type: "POST",
            data: {startDate: startDate,endDate: endDate},
            success: function(data) {
                console.log("Raw Data:", data);
                var chartData = JSON.parse(data);
                var febcosts = chartData.febcosts;
                var febtr = chartData.febtr;

                var xAxisData = ['1공정', '2공정', '3공정', '4공정', '5공정', '6공정', '7공정', '8공정'];

                myChart.setOption({
                    xAxis: {
                        data: xAxisData
                    },
                    series: [{
                            name: '비용',
                            data: febcosts,
                        },
                        {
                            name: '생산량',
                            data: febtr,
                        }
                    ],
                });
                console.log("chartData:", chartData);
            },
            error: function(err) {
                console.log(err);
            }
        });
    }

    $(document).ready(function() {
        $("#startDate, #endDate").datepicker({
            dateFormat: "yy-mm-dd",
        });

        $("#searchData").click(function() {
            requestData();
        });

        setInterval(requestData, 3000);
    });
</script>
</body> 
</html>