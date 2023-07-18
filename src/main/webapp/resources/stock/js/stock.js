	// 각 공정별 재고량 차트
	   function FebStockChart(chartData) {
	      console.log("Feb_StockChart([" + chartData + "])");
	   var myChart = echarts.init(document.getElementById('Feb_StockChart'));
	   var option = {
	       title: {
	           text: '각 공정별 재고량 ',
	           subtext: '단위 (EA)'
	       },
	       tooltip: {
	           trigger: 'axis'
	       },
	       legend: {
	           data: ['재고량']
	       },
	       animationDelay: (idx) => idx * 150,
	       toolbox: {
	           show: true,
	           feature: {
	               dataView: {show: true,readOnly: false},
	               magicType: {show: true, type: ['line', 'bar']},
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
	       series: [
	           {
	               name: '재고량',
	               type: 'bar',
	               data: [],
	                itemStyle: {
            		color: '#C71585' // 바(bar) 색상 변경, 예를 들어, #ff3333(빨간색)
        			},
	                 
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
	         series: [
	             {
	                 name: '재고량',
	                 data: chartData,
	                 barWidth: 80
	             }
	             
	         ],
	         
	      	grid: {
		        top: 80, // 상단 여백
		        bottom: 120, // 하단 여백
		        left: 40, // 좌측 여백
		        right: 40 // 우측 여백
		    }
	
	     });
	}  // function FebOpratio_Chart
	
  	// 각 공정별 불량 차트
    function FebFalChart(chartData) {
         console.log("FebFal_Chart([" + chartData + "])");
	   var myChart = echarts.init(document.getElementById('FebFal_Chart'));
	   var option = {
	       title: {
	           text: '각 공정별 불량',
	           subtext: '단위 (EA)'
	       },
	       tooltip: {
	           trigger: 'axis'
	       },
	       legend: {
	           data: ['불량']
	       },
	       animationDelay: (idx) => idx * 150,
	       toolbox: {
	           show: true,
	           feature: {
	               dataView: {show: true,readOnly: false},
	               magicType: {show: true, type: ['line', 'bar']},
	               
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
	       series: [
	           {
	               name: '불량',
	               type: 'bar',
	               barWidth: 80,
	               data: [],
	                itemStyle: {
            		color: '#00008B' // 바(bar) 색상 변경, 예를 들어, #ff3333(빨간색)
        			},
        			
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
	         series: [
	             {
	                 name: '불량',
	                 data: chartData,
	             }
	             
	         ],
	      	grid: {
		        top: 80, // 상단 여백
		        bottom: 120, // 하단 여백
		        left: 40, // 좌측 여백
		        right: 40 // 우측 여백
		    }
	     });
	}  // function FebFal_Chart
	
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
	               itemStyle: {
            		color: '#228B22' // 바(bar) 색상 변경, 예를 들어, #ff3333(빨간색)
        			},
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
	                itemStyle: {
            		color: '#C71585' // 바(bar) 색상 변경, 예를 들어, #ff3333(빨간색)
        			},
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
		        bottom: 120, // 하단 여백
		        left: 40, // 좌측 여백
		        right: 40 // 우측 여백
		    }
	     });
	}  // function CostsTrChart
   