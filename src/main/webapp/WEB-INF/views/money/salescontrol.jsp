<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SimpleOrder-매출현황</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/basicBox.css?after">
<link rel="stylesheet" href="resources/css/calendar.css?afte" type="text/css">
<link rel="stylesheet" href="resources/css/clock.css?afte" type="text/css">
<style>
	#calendar {
	 width: 1450px;
	}
	td.dt {
	width: 110px;
	}
</style>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<div id="calendar">
				<div id="calendar_top">
					<div id="emp_codeList"></div>
					<div id="btn">
						<label id="prevMonth"><button class="moveButton"
								onclick="movePrevMonth()">◁</button></label> <span id="yearMonth"></span>
						<label id="nextMonth"><button class="moveButton"
								onclick="moveNextMonth()">▷</button></label>
					</div>
				</div>
				<div id="calendar_main"></div>

				<!-- 모달박스 -->
				<div id="view_layer">
					<div id="bg_layer"></div>
					<div id="main_layer"></div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		makeCalendar();
		resetDay();
		showDay();
	});

	//캘린더 생성
	function makeCalendar() {
		var table = "";
		table += "<table class='calendarTbl'>";
		table += "<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>";
		for (var i = 0; i < 6; i++) {
			table += "<tr height='109'>";
			for (var j = 0; j < 7; j++) {
				table += "<td class='dt' style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap'>";
				table += "<div class='day'></div>";
				table += "<pre class='text'></pre></td>";
				if(j==6){
					table += "<td style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap'>";
					table += "<pre width='100' class='slaesText' id='weekText"+j+"'></pre></td>";
				}
			}
			if(i==5){
				table += "<tr height='109'>";
				for (var j = 0; j < 7; j++) {
					table += "<td style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap'>";
					table += "<pre width='100' class='slaesText' id='dayText"+j+"'></pre></td>";
					if(j==6){
						table += "<td style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap'>";
						table += "<pre width='100' class='slaesText' id='allText'></pre></td>";
					}
				}
			}
			table += "</tr>";
		}
		table += "</table>"
		$("#calendar_main").html(table);
	}

	function resetDay() {
		today = new Date();
		year = today.getFullYear();
		month = today.getMonth() + 1;
		hour = today.getHours();
		minute = today.getMinutes();
		second = today.getSeconds();
		firstDay = new Date(year, month - 1, 1);
		lastDay = new Date(year, month, 0);
		$tdDay = $(".day");
		$tdText = $(".text");
		dayCount = 0;
	}

	function showDay() {
		if (month < 10) {
			month = String("0" + month);
		}
		$("#yearMonth").text(year + " " + month);

		//해당일을 표시
		for (var i = firstDay.getDay(); i < firstDay.getDay()
				+ lastDay.getDate(); i++) {
			++dayCount;

			$tdDay.eq(i).text(dayCount);
			$(".dt").eq(i).attr("onclick", "showWorkTime(" + dayCount + ")");

			if ($tdDay.eq(i).text() == today.getDate()) {
				if (month == today.getMonth() + 1) {
					if (year == today.getFullYear()) {
						$(".dt").eq(i).css("background-color", "#81d4fa");
					}
				}
			}
		}
			getDaySales(dayCount);
		$("#showAllWorkTime").attr("onclick",
				"showAllWorkTime(" + dayCount + ")");

		for (var i = 0; i < 42; i += 7) {
			$tdDay.eq(i).css("color", "red");
		}
		for (var i = 6; i < 42; i += 7) {
			$tdDay.eq(i).css("color", "blue");
		}
	}

	function movePrevMonth() {
		month--;
		if (month <= 0) {
			month = 12;
			year--;
		}
		showNewInfo();
	}

	function moveNextMonth() {
		month++;
		if (month > 12) {
			month = 1;
			year++;
		}
		showNewInfo();
	}

	function showNewInfo() {
		for (var i = 0; i < 56; i++) {
			$tdDay.eq(i).text("");
			$tdText.eq(i).text("");
			$(".dt").eq(i).css("background-color", "white");
		}
		$(".salesText").text("");
		dayCount = 0;
		firstDay = new Date(year, month - 1, 1);
		lastDay = new Date(year, month, 0);
		showDay();
	}
</script>

<script type="text/javascript">
	function getDaySales(day){
		$.ajax({
			type : "get",
			url : "rest/getdaysales",
			data : {
				'l_date' : year + "-" + month + "-" + day,
				'f_date' : year + "-" + month + "-" + 01
			},
			dataType : "json",
			success : function(data) {
				console.log(data);
			}
		})	
	}
</script>
</html>