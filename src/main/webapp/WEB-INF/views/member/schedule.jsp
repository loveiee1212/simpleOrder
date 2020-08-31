<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Schedule</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/basicBox.css" type="text/css">
<link rel="stylesheet" href="resources/css/calendar.css" type="text/css">
<link rel="stylesheet" href="resources/css/clock.css" type="text/css">
<style>

#gWork button{
	text-align: center;
	border: 1px solid black;
	width: 400px;
	height: 95px;
	margin-left: 15px;
	margin-top: 30px;
	border: 1px solid black;
	background-color: white;
	font-size: 25px;
}

#lWork button {
	text-align: center;
	border: 1px solid black;
	width: 400px;
	height: 95px;
	margin-left: 15px;
	margin-top: 30px;
	border: 1px solid black;
	background-color: white;
	font-size: 25px;
}

#changeWorkTime button {
	text-align: center;
	border: 1px solid black;
	width: 400px;
	height: 95px;
	margin-left: 15px;
	margin-top: 30px;
	border: 1px solid black;
	background-color: white;
	font-size: 25px;
}

#leave button {
	text-align: center;
	border: 1px solid black;
	width: 400px;
	height: 95px;
	margin-left: 15px;
	margin-top: 175px;
	border: 1px solid black;
	background-color: white;
	font-size: 25px;
}
</style>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<div id="calendar">
				<div id="calendar_top">
					<label id="prevMonth"><button class="moveButton"
							onclick="movePrevMonth()">◁</button></label> <span id="yearMonth"></span>
					<label id="nextMonth"><button class="moveButton"
							onclick="moveNextMonth()">▷</button></label>
				</div>
				<div id="calendar_main"></div>
			</div>
			<div id="controller">
				<div id="clock">
					<div id="date"></div>
					<ul>
						<li id="hours"></li>
						<li class="point">:</li>
						<li id="min"></li>
						<li class="point">:</li>
						<li id="sec"></li>
					</ul>
				</div>
				<div id="gWork">
					<button>출근</button>
				</div>
				<div id="lWork">
					<button>퇴근</button>
				</div>
				<div id="changeWorkTime">
					<button>근무시간변경</button>
				</div>
				<div id="leave">
					<button>돌아가기</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"> //캘린더 생성
	var today = null;
	var year = null;
	var month = null;
	var firstDay = null;
	var lastDay = null;
	var $tdDay = null;
	var $tdText = null;

	$(document).ready(function() {
		makeCalendar();
		resetDay();
		showDay();
		clockOn();
	});

	//캘린더 생성
	function makeCalendar() {
		var table = "";
		table += "<table class='calendarTbl'>";
		table += "<tr><td>SUN</td><td>MON</td><td>TUE</td><td>WED</td><td>THU</td><td>FRI</td><td>SAT</td></tr>";
		for (var i = 0; i < 6; i++) {
			table += "<tr height='109'>";
			for (var j = 0; j < 7; j++) {
				table += "<td class='dt' style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap'>";
				table += "<div class='day'></div>";
				table += "<div class='text'></div></td>";
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
		firstDay = new Date(year, month - 1, 1);
		lastDay = new Date(year, month, 0);
		dayCount = 0;
		$tdDay = $(".day");
		$tdText = $(".text");
	}

	function showDay() {
		if (month < 10) {
			month = String("0" + month);
		}
		$("#yearMonth").text(year + "   " + month);
		
		//해당일을 표시
		for (var i = firstDay.getDay(); i < firstDay.getDay()
				+ lastDay.getDate(); i++) {
			$tdDay.eq(i).text(++dayCount);
			$tdDay.eq(i).attr("id",dayCount);

			if ($tdDay.eq(i).text() == today.getDate()) {
				if (month == today.getMonth() + 1) {
					if (year == today.getFullYear()) {
						$(".dt").eq(i).css("background-color", "gold");
					}
				}
			}
		}
		for (var i = 0; i < 42; i += 7) {
			$tdDay.eq(i).css("color", "red");
		}
		for (var i = 6; i < 42; i += 7) {
			$tdDay.eq(i).css("color", "blue");
		}
		getTime();
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
		for (var i = 0; i < 42; i++) {
			$tdDay.eq(i).text("");
			$(".dt").eq(i).css("background-color", "white");
		}
		dayCount = 0;
		firstDay = new Date(year, month - 1, 1);
		lastDay = new Date(year, month, 0);
		showDay();
	}
	
	function getTime() {
		$.ajax({
			type : 'get',
			url : 'rest/getTime',
			data : {'year' : year, 'month' : month},
			dataType : 'html',
			success : function(data) {
				console.log(data)
			},
			error : function(err) {
				console.log(err);
			}
		})
	}
</script>

<script type="text/javascript"> //시계

	function clockOn(){
	var monthNames = [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" ]; 
	var dayNames= ["일","월","화","수","목","금","토"]
	var newDate = new Date();
	newDate.setDate(newDate.getDate()); 
	$('#date').html(newDate.getFullYear()+" "+monthNames[newDate.getMonth()]+ " " + newDate.getDate() + " "+dayNames[newDate.getDay()]);
	setInterval( function() {
		var seconds = new Date().getSeconds();
		$("#sec").html(( seconds < 10 ? "0" : "" ) + seconds);
		},1000);
		
	setInterval( function() {
		var minutes = new Date().getMinutes();
		$("#min").html(( minutes < 10 ? "0" : "" ) + minutes);
	    },1000);
		
	setInterval( function() {
		var hours = new Date().getHours();
		$("#hours").html(( hours < 10 ? "0" : "" ) + hours);
	    }, 1000);
	}
</script>
</html>