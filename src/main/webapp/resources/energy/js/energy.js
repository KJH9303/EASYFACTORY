  	// 각 공정별 가동률 평균 차트
 function FebOpratioChart(chartData) {
	   console.log("FebOpratio_Chart([" + chartData + "])");
	   var myChart = echarts.init(document.getElementById('FebOpratio_Chart'));
	   var option = {
	       title: {
	           text: '각 공정별 가동률 평균',
	           subtext: '단위 (%)'
	       },
	       tooltip: {
	           trigger: 'axis'
	       },
	       legend: {
	           data: ['가동률']
	       },
	       animationDelay: (idx) => idx * 150,
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
	       series: [
	           {
	               name: '가동률',
	               type: 'bar',
	               data: [],
	                itemStyle: {
            		color: '#37a2da' // 바(bar) 색상 변경, 예를 들어, #ff3333(빨간색)
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
	                 name: '가동률',
	                 data: chartData,
	                 
	                 
	             }
	             
	         ],
	 	    grid: {
		        top: 80, // 상단 여백
		        bottom: 20, // 하단 여백
		        left: 70, // 좌측 여백
		        right: 70 // 우측 여백
		    }
	     });
	}  // function FebOpratio_Chart
	
	// 각 공정별 총생산량 합계 차트
	   function FebTrChart(chartData) {
	    	   console.log("FebTr_Chart([" + chartData + "])");
	   var myChart = echarts.init(document.getElementById('FebTr_Chart'));
	   var option = {
	       title: {
	           text: '각 공정별 생산량 합계',
	           subtext: '단위 (EA)'
	       },
	       tooltip: {
	           trigger: 'axis'
	       },
	       legend: {
	           data: ['생산량']
	       },
	       animationDelay: (idx) => idx * 150,
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
	       series: [
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
	                 name: '생산량',
	                 data: chartData,
	                  itemStyle: {
            		color: '#ff3333' // 바(bar) 색상 변경, 예를 들어, #ff3333(빨간색)
        			},
	                 
	             }
	             
	         ],
	 	    grid: {
		        top: 80, // 상단 여백
		        bottom: 20, // 하단 여백
		        left: 70, // 좌측 여백
		        right: 70 // 우측 여백
		    }
	     });
	}  // function FebTr_Chart
	
	// 각 공정별 총 에너지사용 비용 합계 차트
	   function FebCostChart(chartData) {
	        	   console.log("FebCost_Chart([" + chartData + "])");
	   var myChart = echarts.init(document.getElementById('FebCost_Chart'));
	   var option = {
	       title: {
	           text: '각 공정별 에너지 사용 비용 합계',
	           subtext: '단위 (EA)'
	       },
	       tooltip: {
	           trigger: 'axis'
	       },
	       legend: {
	           data: ['에너지 사용 비용']
	       },
	       animationDelay: (idx) => idx * 150,
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
	       series: [
	           {
	               name: '에너지 사용 비용',
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
	                 name: '에너지 사용 비용',
	                 data: chartData,
	                  itemStyle: {
            		color: '#008120' // 바(bar) 색상 변경, 예를 들어, #ff3333(빨간색)
        			},
	                 
	             }
	             
	         ],
	 	    grid: {
		        top: 80, // 상단 여백
		        bottom: 20, // 하단 여백
		        left: 70, // 좌측 여백
		        right: 70 // 우측 여백
		    }
	     });
	}  // function FebTr_Chart
   
	// 각 공정별 총 에너지사용량 합계 차트
	   function FebUsingratioChart(chartData) {
	    	        	   console.log("FebUsingratio_Chart([" + chartData + "])");
	   var myChart = echarts.init(document.getElementById('FebUsingratio_Chart'));
	   var option = {
	       title: {
	           text: '각 공정별 에너지 사용량 합계',
	           subtext: '단위 (kWh)'
	       },
	       tooltip: {
	           trigger: 'axis'
	       },
	       legend: {
	           data: ['에너지 사용량']
	       },
	       animationDelay: (idx) => idx * 150,
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
	       series: [
	           {
	               name: '에너지 사용량',
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
	                 name: '에너지 사용량',
	                 data: chartData,
	                  itemStyle: {
            		color: '#ffbf00' // 바(bar) 색상 변경, 예를 들어, #ff3333(빨간색)
        			},
	                 
	             }
	             
	         ],
	 	    grid: {
		        top: 80, // 상단 여백
		        bottom: 20, // 하단 여백
		        left: 70, // 좌측 여백
		        right: 70 // 우측 여백
		    }
	     });
	}  // function FebUsingratio_Chart
	
   // 에너지 사용비용 대비 총 생산량 차트
   function CostsTrChart(febcosts, febtr) {
	   console.log("CostsTrChart([" + febcosts + "], [" + febtr + "])");
	   var myChart = echarts.init(document.getElementById('Costs_Tr_Chart'));
	   var option = {
	       title: {
	           text: '에너지사용비용 대비 총 생산량',
	           subtext: '총비용 단위 (천원)'
	       },
	       tooltip: {
	           trigger: 'axis'
	       },
	       legend: {
	           data: ['비용', '생산량']
	       },
	       animationDelay: (idx) => idx * 150,
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
	                itemStyle: {
            		color: '#008120' // 바(bar) 색상 변경, 예를 들어, #ff3333(빨간색)
        			},
	               
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
	                itemStyle: {
            		color: '#ff3333' // 바(bar) 색상 변경, 예를 들어, #ff3333(빨간색)
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
	                 name: '비용',
	                 data: febcosts,
	             },
	             {
	                 name: '생산량',
	                 data: febtr,
	             }
	         ],
	 	    grid: {
		        top: 80, // 상단 여백
		        bottom: 20, // 하단 여백
		        left: 60, // 좌측 여백
		        right: 60 // 우측 여백
		    }
	     });
	}  // function CostsTrChart
    
   
   // 에너지 사용비용 대비 총 에너지 사용량
   function CostsUsingratioChart(febcosts, febcvusingratio) {
	   console.log("CostsUsingratioChart([" + febcosts + "], [" + febcvusingratio + "])");
	   var myChart = echarts.init(document.getElementById('Costs_Usingratio_Chart'));
	
	   var option = {
	       title: {
	           text: '에너지사용비용 대비 총 에너지사용량',
	           subtext: '에너지사용량 단위 (Wh)\n총 비용 단위(천원)'
	       },
	       tooltip: {
	           trigger: 'axis'
	       },
	       legend: {
	           data: ['비용', '에너지 사용량']
	       },
	       animationDelay: (idx) => idx * 150,
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
	                itemStyle: {
            		color: '#008120' 
        			},
	               markPoint: {
	                   data: [{ type: 'max',name: '최대값'},
	                       {type: 'min',name: '최소값'}]},
	               markLine: {
	                   data: [{type: 'average',name: '평균값'}]
	               }
	           },
	           {
	               name: '에너지 사용량',
	               type: 'bar',
	               data: [],
	               itemStyle: {
            		color: '#ffbf00' 
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
	                 name: '비용',
	                 data: febcosts,
	             },
	             {
	                 name: '에너지 사용량',
	                 data: febcvusingratio,
	             }
	         ],
	 	    grid: {
		        top: 80, // 상단 여백
		        bottom: 20, // 하단 여백
		        left: 60, // 좌측 여백
		        right: 60 // 우측 여백
		    }
	     });
	}  // function CostsUsingratioChart
