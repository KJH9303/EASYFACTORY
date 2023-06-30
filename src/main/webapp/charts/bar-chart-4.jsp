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
	// jQuery tag 호출
	// $("#태그아이디")
	// $(".태그클래스")
	// $(“input[name=태그이름]“)
	
	$(document).ready(function() {
		var beforeStart = $("#beforeStart").val();
		$("#startBtn").on("click", function() {
			$("#beforeStart").datepicker();
			$("#afterStart").val(beforeStart);
		});
		$("#endDate").on("click", function() {
			$("#startDate").datepicker();
		});
	});
</script>

</head>
<body style="height: 90%; margin: 10px">
	<div>
		<p>
			<label>
				시작 날짜:
				<button type="button" id="startBtn">날짜 선택</button>
				<input type="text" id="beforeStart" name="hiredate" value="2020-01-01">
				<input type="text" id="afterStart" name="hiredate" value="2023-11-22">
			</label><br>
			
			<label>
				종료 날짜:
			<input type="button" id="endDate" value="날짜 선택"/>
			</label><br>
		</p>
	</div>
</body>
</html>