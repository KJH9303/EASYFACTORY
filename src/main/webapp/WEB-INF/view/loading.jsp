<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>load</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	.load {
		width: 100%;
		height: 100%;
		top: 0;
		left: 0;
		position: fixed;
		display: block;
		opacity: 0.8;
		background: white;
		z-index: 99;
		text-align: center;
	}
	
	.load > img {
		margin: 55% auto;
		z-index: 100;
	}
</style>
</head>
<body>
	<div class= "load" id="load">
		<img src="/resources/img/Pulse-1s-200px.gif" alt="loading">
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		setTimeout(function (){
			$('#load').hide();
		}, 2000)
	});
</script>
</html>