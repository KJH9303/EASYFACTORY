<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../../resources/feb/css/guideLines.css">
<title>Energy Simulation</title>
<link href="../../resources/img/logoicon.jpg" rel="shortcut icon" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../../../resources/feb/js/time.js"></script>
<script>

	// 데이터 가져오기 기능
	function GetData() {
	    var production = $("#production").val();
        // 유효성 검사
	    if (production === '') {
	        alert('예상 생산량을 입력하세요');
	        return; 
	    }
        if (isNaN(production)) {
	        alert("숫자를 입력해주세요.");
	        return; // 함수 종료
    	}

	    var feb_index_view_elec = "feb_index_view_elec";
	    var feb_index_view_cost = "feb_index_view_cost";
	    var process_feb = "process_feb";

	    $.ajax({
	        type: "GET",
	        url: "/analysis/simulation",
	        dataType: "json",
	        data: {
	            feb_index_view_elec: feb_index_view_elec,
	            feb_index_view_cost: feb_index_view_cost,
	            process_feb: process_feb
	        },
	        success: function(response) {
	            if (response.Error) {
	                alert(response.Error);
	            } else {
	                // 가져온 데이터를 화면에 표시
	                var dataList = response;
	                console.log(dataList);
	                var html = '<table>';
	                html += '<tr><th>공정</th><th>전기 사용량(kWh)</th><th>비용(원)</th></tr>';
	                
	                // 통화 포맷
	                var formatter = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' });

	                var febTextMapping = {
	                	    "feb1": "WATER FABRICATION",
	                	    "feb2": "OXIDATION",
	                	    "feb3": "PHOTO LITHOGRAPHY",
	                	    "feb4": "ETCHING",
	                	    "feb5": "IMPLANT",
	                	    "feb6": "METALLIZATION",
	                	    "feb7": "EDS",
	                	    "feb8": "PACKAGING",
	                	};
	                
				    for (var i = 0; i < dataList.length; i++) {
				        var elecUsing = parseFloat(dataList[i].ELEC_USING);
				        var indexCost = parseFloat(dataList[i].INDEX_COST);
				        var process_feb = dataList[i].PROCESS_FEB;
				
				        var elecUsingMultiplied = elecUsing + parseFloat(production);
				        var indexCostMultiplied = indexCost * elecUsingMultiplied;
				
				        // 통화 포맷 적용 (formattedIndexCostMultiplied에만 적용)
				        var formattedIndexCostMultiplied = indexCostMultiplied.toLocaleString('ko-KR', { style: 'currency', currency: 'KRW' });
				        
				        var febText = febTextMapping[process_feb] || process_feb;
				
				        html += '<tr><td>' + febText + '</td><td>' + elecUsingMultiplied + '</td><td>' + formattedIndexCostMultiplied + '</td></tr>';
				    }
	                html += '</table>';
	                $('#smListArea').html(html);
	            }
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.log(`에러 발생:(/feb/simulation) ${errorThrown}`);
	        }
	    });
	}

</script>
</head>
<body>
	<div class="container">
		<h2>Energy Analysis Simulation</h2>
		
		<label for="production">예상 생산량:</label> 
		<input type="text" id="production" name="production" placeholder="예상 생산량 입력" required>
		
		<button type="button" id="calculateBtn" onclick="GetData()">Go</button>
		<div id="smListArea"></div>
		
	</div>
</body>
</html>
