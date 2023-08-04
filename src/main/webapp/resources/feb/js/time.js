	// 현재 날짜, 현재 시간 
	// yyyy/mm/dd 
	// hh/mm/ss
	function updateTime() {
		var currentTime = new Date();
		var hours = currentTime.getHours();
		var minutes = currentTime.getMinutes();
		var seconds = currentTime.getSeconds();
		var year = currentTime.getFullYear();
		var month = ("0" + (currentTime.getMonth() + 1)).slice(-2);
		var day = ("0" + currentTime.getDate()).slice(-2);

		hours = ("0" + hours).slice(-2);
		minutes = ("0" + minutes).slice(-2);
		seconds = ("0" + seconds).slice(-2);

		var timeString = hours + ":" + minutes + ":" + seconds;
		var dateString = year + "/" + month + "/" + day;

		document.getElementById("time").innerHTML = timeString;
		document.getElementById("date").innerHTML = dateString;
	}

	setInterval(updateTime, 1000)

	function loadHTMLFile(targetSelector, url, callback) {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				document.querySelector(targetSelector).innerHTML = this.responseText;
				if (typeof callback === 'function') {
					callback();
				}
			}
		};
		xhttp.open("GET", url, true);
		xhttp.send();
	}
	  window.addEventListener('load', updateTime);	
	