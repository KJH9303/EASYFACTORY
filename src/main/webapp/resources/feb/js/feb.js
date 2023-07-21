	// 가동률 바차트 ===================================================================================================================
	var chartOptions = {
	  toolbox: {
	    show: true,
	    feature: {
	      dataView: { show: true, readOnly: false },
	      magicType: { show: true, type: ['line', 'bar'] },
	      saveAsImage: { show: true }
	    }
	  },
	  tooltip: {
	    trigger: "axis",
	    axisPointer: {
	      type: "shadow"
	    },
	    borderWidth: 1,
	    formatter: function (params) {
	      if (params.length > 0) {
	        var value = params[0].value.toFixed(2) + "(%)";
	        var xLabel = params[0].axisValue; // x축 레이블 값
	        var day = xLabel.slice(xLabel.indexOf(" ") + 1, xLabel.indexOf("일")); // 일 값 추출
	        var month = xLabel.slice(0, xLabel.indexOf("월")); // 월 값 추출
	        return month + "월 " + day + "일<br/>" + value;
	      }
	      return "-";
	    }
	  },
	  xAxis: {
	    type: "category",
	    data: [],
	    axisLabel: {
	      formatter: function (value) {
	        var day = value.slice(value.indexOf(" ") + 1, value.indexOf("일")); // 일 값 추출
	        var month = value.slice(0, value.indexOf("월")); // 월 값 추출
	        return month + "월 " + day + "일";
	      },
	      show: false // 레이블 숨김 처리
	    }
	  },
	  yAxis: {
	    type: "value",
	    axisLine: {
	      lineStyle: {
	        color: "#999", // y축 선 색상
	      },
	    },
	    splitLine: {
	      lineStyle: {
	        color: "#ccc", // y축 분할 선 색상
	      },
	    },
	    axisLabel: {
	      fontStyle: "normal", // 폰트 기울기 설정 제거
	    },
	  },
	  series: [
	    {
	      name: '가동율',
	      data: [],
	      type: "bar",

	      itemStyle: {
	        color: "#93b7e3", // 막대 색상
	      },
	    },
	  ],
	  // grid 옵션 추가
	  grid: {
	    top: 40, // 상단 여백
	    bottom: 20, // 하단 여백
	    left: 30, // 좌측 여백
	    right: 10 // 우측 여백
	  }
	};

	// 게이지 차트 ===================================================================================================================
	var gaugeChartOptions = {
	  toolbox: {
	    show: true,
	    feature: {
	      dataView: { show: true, readOnly: false },
	      saveAsImage: { show: true }
	    }
	  },
	  series: [{
	    type: 'gauge',
	    min: 0,
	    max: 15,
	    radius: '100%',
	    splitNumber: 2,
	    startAngle: 210,
	    endAngle: -30,
	    axisLine: {
	      lineStyle: {
	        width: 15,
	        color: [
	          [0.3, '#a5e7f0'],
	          [0.7, '#59c4e6'],
	          [1, '#516b91']
	        ]
	      }
	    },
	    axisTick: {
	      length: 10,
	      lineStyle: {
	        color: 'auto'
	      }
	    },
	    splitLine: {
	      length: 25,
	      lineStyle: {
	        color: 'auto'
	      }
	    },
	    axisLabel: {
	      distance: 20,
	      color: '#aaa',
	      fontSize: 10,
	      fontFamily: 'Arial, sans-serif'
	    },
	    pointer: {
	      width: 7,
	      length: "70%",
	    },
	    detail: {
	      valueAnimation: true,
	      color: 'auto',
	      fontSize: 30,
	      fontFamily: 'Arial, sans-serif',
	      fontWeight: 'bold'
	    },
	    data: [],
	  }],
	};

	// 전기사용량 바차트 ===================================================================================================================
	var usingratioChartOptions = {
	  toolbox: {
	    show: true,
	    feature: {
	      dataView: { show: true, readOnly: false },
	      magicType: { show: true, type: ['line', 'bar'] },
	      saveAsImage: { show: true }
	    }
	  },
	  tooltip: {
	    trigger: "axis",
	    axisPointer: {
	      type: "shadow"
	    },
	    borderWidth: 1,
	    formatter: function (params) {
	      if (params.length > 0) {
	        var value = params[0].value.toFixed(2) + "(kWh)";
	        var xLabel = params[0].axisValue; // x축 레이블 값
	        var day = xLabel.slice(xLabel.indexOf(" ") + 1, xLabel.indexOf("일")); // 일 값 추출
	        var month = xLabel.slice(0, xLabel.indexOf("월")); // 월 값 추출
	        return month + "월 " + day + "일<br/>" + value;
	      }
	      return "-";
	    }
	  },
	  xAxis: {
	    type: "category",
	    data: [],
	    axisLabel: {
	      formatter: function (value) {
	        var day = value.slice(value.indexOf(" ") + 1, value.indexOf("일")); // 일 값 추출
	        var month = value.slice(0, value.indexOf("월")); // 월 값 추출
	        return month + "월 " + day + "일";
	      },
	      show: false // 레이블 숨김 처리
	    }
	  },
	  yAxis: {
	    type: "value",
	    axisLine: {
	      lineStyle: {
	        color: "#999", // y축 선 색상
	      },
	    },
	    splitLine: {
	      lineStyle: {
	        color: "#ccc", // y축 분할 선 색상
	      },
	    },
	    axisLabel: {
	      fontStyle: "normal", // 폰트 기울기 설정 제거
	    },
	  },
	  series: [
	    {
	      name: '전기사용량',
	      data: [],
	      type: "bar",

	      itemStyle: {
	        color: "#edafda", // 막대 색상
	      },
	    },
	  ],
	
	  // grid 옵션 추가
	  grid: {
	    top: 40, // 상단 여백
	    bottom: 20, // 하단 여백
	    left: 30, // 좌측 여백
	    right: 10 // 우측 여백
	  }
	};
	
	// 전기사용비용 바차트 ===================================================================================================================
	var costschartOptions = {
	  toolbox: {
	    show: true,
	    feature: {
	      dataView: { show: true, readOnly: false },
	      magicType: { show: true, type: ['line', 'bar'] },
	      saveAsImage: { show: true }
	    }
	  },
	  tooltip: {
	    trigger: "axis",
	    axisPointer: {
	      type: "shadow"
	    },
	    borderWidth: 1,
	    formatter: function (params) {
	      if (params.length > 0) {
	        var value = params[0].value.toFixed(0) + "(천원)";
	        var xLabel = params[0].axisValue; // x축 레이블 값
	        var day = xLabel.slice(xLabel.indexOf(" ") + 1, xLabel.indexOf("일")); // 일 값 추출
	        var month = xLabel.slice(0, xLabel.indexOf("월")); // 월 값 추출
	        return month + "월 " + day + "일<br/>" + value;
	      }
	      return "-";
	    }
	  },
	  xAxis: {
	    type: "category",
	    data: [],
	    axisLabel: {
	      formatter: function (value) {
	        var day = value.slice(value.indexOf(" ") + 1, value.indexOf("일")); // 일 값 추출
	        var month = value.slice(0, value.indexOf("월")); // 월 값 추출
	        return month + "월 " + day + "일";
	      },
	      show: false // 레이블 숨김 처리
	    }
	  },
	  yAxis: {
	    type: "value",
	    axisLine: {
	      lineStyle: {
	        color: "#999", // y축 선 색상
	      },
	    },
	    splitLine: {
	      lineStyle: {
	        color: "#ccc", // y축 분할 선 색상
	      },
	    },
	    axisLabel: {
	      fontStyle: "normal", // 폰트 기울기 설정 제거
	    },
	  },
	  series: [
	    {
	      name: '비용',
	      data: [],
	      type: "bar",

	      itemStyle: {
	        color: "#cbb0e3", // 막대 색상
	      },
	    },
	  ],
	  // grid 옵션 추가
	  grid: {
	    top: 40, // 상단 여백
	    bottom: 20, // 하단 여백
	    left: 55, // 좌측 여백
	    right: 10 // 우측 여백
	  }
	};
	
	// test======================================================================
	function getChartOption() {
	  const colors = [
	    '#edafda', '#59c4e6', '#516b91', '#93b7e3', '#66CC66', '#ff9999'
	  ];
	
	  const option = {
	    color: colors,
	    tooltip: {
	      trigger: 'axis',
	      axisPointer: {
	        type: 'cross'
	      }
	    },
		  grid: {
		    top: 70, // 상단 여백
		    bottom: 20, // 하단 여백
		    left: 140, // 좌측 여백
		    right: 140 // 우측 여백
		  },
	    toolbox: {
	      feature: {
	        dataView: { show: true, readOnly: false },
	        restore: { show: true },
	        saveAsImage: { show: true }
	      }
	    },
	    legend: {
	      data: ['전기사용량', '생산량', '불량', '장비가동율']
	    },
	    xAxis: [
	      {
	        type: 'category',
	        axisTick: {
	          alignWithLabel: true
	        },
	        data: []
	      }
	    ],
	    yAxis: [
	      {
	        type: 'value',
	        name: '전기사용량',
	        position: 'left',
	        alignTicks: true,
	        offset: 80,
	        axisLine: {
	          show: true,
	          lineStyle: {
	            color: colors[0]
	          }
	        },
	        axisLabel: {
	          formatter: '{value} kWh'
	        }
	      },
	      {
	        type: 'value',
	        name: '생산량',
	        position: 'right',
	        alignTicks: true,
	        axisLine: {
	          show: true,
	          lineStyle: {
	            color: colors[1]
	          }
	        },
	        axisLabel: {
	          formatter: '{value} EA'
	        }
	      },
	      {
	        type: 'value',
	        name: '불량',
	        position: 'right',
	        alignTicks: true,
	        offset: 80,
	        axisLine: {
	          show: true,
	          lineStyle: {
	            color: colors[2]
	          }
	        },
	        axisLabel: {
	          formatter: '{value} EA'
	        }
	      },
	      {
	        type: 'value',
	        name: '장비가동율',
	        position: 'left',
	        alignTicks: true,
	        axisLine: {
	          show: true,
	          lineStyle: {
	            color: colors[3]
	          }
	        },
	        axisLabel: {
	          formatter: '{value} %'
	        }
	      }
	    ],
	    series: [
	      {
	        name: '전기사용량',
	        type: 'line',
	        yAxisIndex: 0,
	        data: []
	      },
	      {
	        name: '생산량',
	        type: 'line',
	        yAxisIndex: 1,
	        data: []
	      },
	      {
	        name: '불량',
	        type: 'line',
	        yAxisIndex: 2,
	        data: []
	      },
	      {
	        name: '장비가동율',
	        type: 'line',
	        yAxisIndex: 3,
	        data: []
	      },
	    ]
	  };
	  return option;
	}