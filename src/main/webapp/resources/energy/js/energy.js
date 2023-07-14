  	// 각 공정별 가동률 평균 차트
    function FebOpratioChart(vals) {
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
            data: vals,
            type: 'bar',
            showBackground: true,
            backgroundStyle: {color: 'rgba(180, 180, 180, 0.2)'}
        }],
	    grid: {
	        top: 20, // 상단 여백
	        bottom: 20, // 하단 여백
	        left: 30, // 좌측 여백
	        right: 10 // 우측 여백
	    }
      };
      if (option && typeof option === 'object') {
        myChart.setOption(option);
      }
      window.addEventListener('resize', myChart.resize);
    }
	// 각 공정별 총생산량 합계 차트
	   function FebTrChart(vals) {
	     var dom = document.getElementById('FebTr_Chart');
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
	       }],
		    grid: {
		        top: 20, // 상단 여백
		        bottom: 20, // 하단 여백
		        left: 30, // 좌측 여백
		        right: 10 // 우측 여백
		    }
	     };
	     if (option && typeof option === 'object') {
	       myChart.setOption(option);
	     }
	     window.addEventListener('resize', myChart.resize);
	   }   
	// 각 공정별 총 전기사용 비용 합계 차트
	   function FebCostChart(vals) {
	     var dom = document.getElementById('FebCost_Chart');
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
	       }],
		    grid: {
		        top: 20, // 상단 여백
		        bottom: 20, // 하단 여백
		        left: 30, // 좌측 여백
		        right: 10 // 우측 여백
		    }
	     };
	     if (option && typeof option === 'object') {
	       myChart.setOption(option);
	     }
	     window.addEventListener('resize', myChart.resize);
	   }   
   
   
	// 각 공정별 총 전기사용량 합계 차트
	   function FebUsingratioChart(vals) {
	     var dom = document.getElementById('FebUsingratio_Chart');
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
	       }],
		    grid: {
		        top: 20, // 상단 여백
		        bottom: 20, // 하단 여백
		        left: 30, // 좌측 여백
		        right: 10 // 우측 여백
		    }
	     };
	     if (option && typeof option === 'object') {
	       myChart.setOption(option);
	     }
	     window.addEventListener('resize', myChart.resize);
	   }   
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
		        left: 30, // 좌측 여백
		        right: 10 // 우측 여백
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
		        left: 30, // 좌측 여백
		        right: 10 // 우측 여백
		    }
	     });
	}  // function CostsUsingratioChart
