<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SimpleOrder-근태</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/basicBox.css?after">
<link rel="stylesheet" href="resources/css/calendar.css?afte" type="text/css">
<link rel="stylesheet" href="resources/css/clock.css?afte" type="text/css">
<link rel="icon" href="resources/image/smallLogo.png" type="image/x-icon">
<style>
body {
	background-color: #e3f2fd;
	font-family: 'NEXON Lv1 Gothic OTF Light';
}

@font-face {
	font-family: 'NEXON Lv1 Gothic OTF Light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#calendar, #controller {
	background-color: white;
}

#gWork button {
	text-align: center;
	border: 2px solid white;
	width: 300px;
	height: 95px;
	margin-left: 65px;
	margin-top: 30px;
	background-color: #81d4fa;
	font-weight: bold;
	color: white;
	font-size: 25px;
}

#lWork button, #changeWorkTime button, #showAllWorkTime button, #leave button
	{
	text-align: center;
	border: 2px solid white;
	width: 300px;
	height: 95px;
	margin-left: 65px;
	margin-top: 30px;
	background-color: #81d4fa;
	font-weight: bold;
	color: white;
	font-size: 25px;
}

#view_layer {
	display: none;
	position: fixed;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

#view_layer.open {
	display: block;
	color: gold;
}

#bg_layer {
	position: absolute;
	top: 0;
	left: 0;
	width: 1600px;
	height: 1000px;
	background: white;
	opacity: 0.5;
	filter: alpha(opacity = 50);
	z-index: 100;
}

#main_layer {
	position: absolute;
	top: 30%;
	left: 40%;
	width: 700px;
	height: 500px;
	margin: -50px 0 0 -194px;
	padding: 28px 28px 0 28px;
	border: 3px solid #81d4fa;
	background: #fff;
	font-size: 18px;
	z-index: 200;
	color: #767676;
	line-height: normal;
	white-space: normal;
	overflow: scroll;
	border-collapse: collapse;
	text-align: center;
}

#main_layer::-webkit-scrollbar {
	width: 10px;
	background-color: #81d4fa;
}

#main_layer::-webkit-scrollbar-thumb {
	background-color: #81d4fa;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#main_layer::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#main_layer th {
	border: 3px solid white;
	font-size: 20px;
	height: 40px;
	padding-top: 15px;
}

#main_layer td {
	font-size: 20px;
	height: 40px;
	padding-top: 10px;
}

#emp_codeList {
	float: left;
}

#btn {
	float: right;
}

#emp_list {
	border: 3px solid #81d4fa;
	width: 150px;
	height: 40px;
	font-size: 20px;
}

button:focus {
	outline: none;
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
					<button onclick="ad_inTime()">출근</button>
				</div>
				<div id="lWork">
					<button onclick="ad_outTime()">퇴근</button>
				</div>
				<div id="changeWorkTime"></div>
				<div id="showAllWorkTime"></div>
				<div id="leave">
					<button onclick="location.href ='posmain'">돌아가기</button>
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
		clockOn();
		if ("${position}" == "00") {
			$("#changeWorkTime").append($("<button id = 'changeWorkTimeButton' onclick='changeWorkTime()'>").html("근무시간변경"));
			$("#showAllWorkTime").append($("<button id= 'showAllWorkTimeButton'>").html("전체근무시간"));
		}
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
			if(dayCount<10){
				dayCount = "0"+dayCount;
			}
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
		$("#showAllWorkTime").attr("onclick",
				"showAllWorkTime(" + dayCount + ")");
		getEmpList(dayCount);
		getTime(dayCount);

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
		for (var i = 0; i < 42; i++) {
			$tdDay.eq(i).text("");
			$tdText.eq(i).text("");
			$(".dt").eq(i).css("background-color", "white");
		}
		dayCount = 0;
		firstDay = new Date(year, month - 1, 1);
		lastDay = new Date(year, month, 0);
		showDay();
	}

	//출퇴근 시간 출력
	function getTime(day) {

		if ("${position}" == "00") {
			var emp_code = $("#emp_codeList option:selected").val();
		} else {
			var emp_code = null;
		}
		console.log(emp_code);

		$.ajax({
				type : 'get',
				url : 'rest/getTime',
				data : {
					'l_date' : year + "-" + month + "-" + day,
					'f_date' : year + "-" + month + "-" + 01,
					'emp_code' : emp_code
				},
				dataType : 'json',
				success : function(data) {
					console.log(data);
					$tdText.text("");

					for ( var i in data) {
						if (data[i].BD_DATE != null) {
							var bd_date = moment(data[i].BD_DATE).format("DD");
							var bd_dateYM = moment(data[i].BD_DATE).format("YYYY MM");
						}
						if (data[i].AD_INTIME != null) {
							var ad_inTime = moment(data[i].AD_INTIME).format("HH:mm:ss");
						}
						if (data[i].AD_OUTTIME != null) {
							var ad_outTime = moment(data[i].AD_OUTTIME).format("HH:mm:ss");
							/* var ad_outTime = data[i].AD_OUTTIME.substr(12, 9);
							ad_outTime = ad_outTime.replace(/\s/g,"");
							ad_outTime = ad_outTime.replace(/[a-zA-Z]+/g,""); */
						} else {
							var ad_outTime = "null";
						}

						for (var j = firstDay.getDay(); j < firstDay.getDay()+ lastDay.getDate(); j++) {

							if (bd_dateYM == $("#yearMonth").text()) {
								if (bd_date == $tdDay.eq(j).text()) {
									if (ad_outTime == "null") {
										$tdText.eq(j).text("출근: " + ad_inTime);
									} else {
										// moment.js 라이브러리를 이용하여 시간계산 방법
										var difHour = moment(data[i].AD_OUTTIME).diff(
												data[i].AD_INTIME, "hours");
										
										var difMinute = moment(data[i].AD_OUTTIME).diff(
													data[i].AD_INTIME,"minutes");
										$tdText.eq(j).text("출근: " + ad_inTime+ "\r\n퇴근: "+ ad_outTime
														+ "\r\n\r\n시간: "+ difHour + "시간 "+ difMinute % 60+ "분");
									}
								}
							}
						}
					}
				},
				error : function(err) {
					console.log(err);
				}
			});
	}

	//출근 시간 입력
	function ad_inTime() {
		var ad_inTime = moment().format("YYYY-MM-DD HH:mm");
		$.ajax({
			type : 'post',
			url : 'rest/insertAd_inTime',
			data : {
				"ad_inTime" : ad_inTime
			},
			dataType : "json",
			success : function(data) {
				if (data == 1) {
					alert("출근이 완료되었습니다");
				}
				resetDay();
				showNewInfo();
			},
			error : function(err) {
				alert("출근에 실패했습니다.");
				resetDay();
				showNewInfo();
			}
		});
	}

	//퇴근 시간 입력
	function ad_outTime() {
		var ad_outTime = moment().format("YYYY-MM-DD HH:mm");

		$.ajax({
			type : 'post',
			url : 'rest/insertAd_outTime',
			data : {
				"ad_outTime" : ad_outTime
			},
			dataType : "json",
			success : function(data) {
				if (data == 1) {
					alert("퇴근이 완료되었습니다");
				}
				resetDay();
				showNewInfo();
			},
			error : function(err) {
				alert("퇴근에 실패했습니다.");
				resetDay();
				showNewInfo();
			}
		});
	}
</script>

<script type="text/javascript">
	//출퇴근시간변경
	function changeWorkTime() {
		$("#showAllWorkTime").text("");
		$.ajax({
			type : "get",
			url : "changeworktime",
			dataType : "html",
			success : function(data) {
				$("#calendar").html(data);
				$("#changeWorkTimeButton").html("스케줄로 돌아가기");
				$("#changeWorkTimeButton").attr("onclick",
						"location.href='schedule'");
			}
		});
	}
</script>

<script type="text/javascript">
	//근무시간 확인

	//직원 리스트 출력
	function getEmpList(day) {
		if ("${position}" == "00") {
			$.ajax({
				type : "get",
				url : "rest/getemplist",
				dataType : "json",
				success : function(data) {
					console.log(data);
					$("#emp_codeList").text("");
					$("#emp_codeList").append(
							$("<select name='emp_list' id='emp_list' onchange='getTime("+ day + ")'>"));
					$select = $("#emp_list");
					$select.append("<option value='00000'>직원선택</option>");
					$select.append($("<optgroup label='재직' id='work'>"));
					$select.append($("<optgroup label='퇴직' id='nowork'>"));
				
					for ( var i in data) {
						if (data[i].EMP_STATUS == "1") {
							$("#work").append($("<option value="+data[i].EMP_CODE+">").html(data[i].EMP_NAME));
						}
						if (data[i].EMP_STATUS == "-1") {
							$("#nowork").append($("<option value="+data[i].EMP_CODE+">").html(data[i].EMP_NAME));
						}
					}
				}
			});
		}
	}

	//전체 직원의 일 근무시간 확인
	function showWorkTime(day) {
		//사장이 아닐경우 해당 이벤트 사용불가
		if ("${position}" == "00") {
			//모달박스 생성
			$("#view_layer").addClass("open");
			$.ajax({
				type : "get",
				url : "rest/showworktime",
				data : {
					'bd_date' : moment($("#yearMonth").text() + "-" + day).format("YYYY-MM-DD")
				},
				dataType : "json",
				success : function(data) {
					$("#main_layer").text(" ");
					$table = $("#main_layer").append($("<table>"));
					$table.append($("<tr><th>사번</th><th>사원명</th><th>출근시간</th><th>퇴근시간</th><th>근무시간</th></tr>"));
					for ( var i in data) {
						$tr = $table.append($("<tr>"));
						$tr.append($("<td>").html(data[i].EMP_CODE));
						$tr.append($("<td>").html(data[i].EMP_NAME));
						$tr.append($("<td>").html(moment(data[i].AD_INTIME).format("HH:mm:ss")));
						if (data[i].AD_OUTTIME != null) {
							$tr.append($("<td>").html(moment(data[i].AD_OUTTIME).format("HH:mm:ss")));
							// sql문 내에서 시간 계산 방법
							$tr.append($("<td>").html(data[i].HOUR + "시간 "+ data[i].MINUTE + "분"));
						}
						$tr.append($("</tr>"));
					}
					$table.append($("</table>"));
				}
			});
		}
	}

	//전체 직원의 월 근무시간 확인
	function showAllWorkTime(day) {
		$("#view_layer").addClass("open");

		$.ajax({
			type : "get",
			url : "rest/showallworktime",
			data : {
				'f_date' : moment($("#yearMonth").text() + "-" + 01).format("YYYY-MM-DD"),
				'l_date' : moment($("#yearMonth").text() + "-" + day).format("YYYY-MM-DD")
			},
			dataType : "json",
			success : function(data) {
				$("#main_layer").text(" ");
				$table = $("#main_layer").append($("<table>"));
				$table.append($("<tr><th>사번</th><th>직급</th><th>사원명</th><th>시간으로계산</th><th>분으로계산</th></tr>"));

				for ( var i in data) {
					$tr = $table.append($("<tr>"));
					$tr.append($("<td>").html(data[i].EMP_CODE));
					$tr.append($("<td>").html(data[i].PST_NAME));
					$tr.append($("<td>").html(data[i].EMP_NAME));
					if (data[i].HOUR != null) {
						$tr.append($("<td>").html(data[i].HOUR + "시간 "));
						$tr.append($("<td>").html(Math.floor(data[i].MINUTE / 60) + "시간 "
													+ data[i].MINUTE % 60 + "분"));
					}
					$tr.append($("</tr>"));
				}
				$table.append($("</table>"));
			}

		});
	}

	//모달박스 해제
	var $layerWindow = $("#view_layer");
	$layerWindow.find("#bg_layer").on("mousedown", function(evt) {
		$layerWindow.removeClass("open");
	});
</script>

<script type="text/javascript">
	//시계

	function clockOn() {
		var monthNames = [ "01", "02", "03", "04", "05", "06", "07", "08",
				"09", "10", "11", "12" ];
		var dayNames = [ "일", "월", "화", "수", "목", "금", "토" ]
		var newDate = new Date();
		newDate.setDate(newDate.getDate());
		$('#date').html(
				newDate.getFullYear() + " " + monthNames[newDate.getMonth()]
						+ " " + newDate.getDate() + " "
						+ dayNames[newDate.getDay()]);
		setInterval(function() {
			var seconds = new Date().getSeconds();
			$("#sec").html((seconds < 10 ? "0" : "") + seconds);
		}, 1000);

		setInterval(function() {
			var minutes = new Date().getMinutes();
			$("#min").html((minutes < 10 ? "0" : "") + minutes);
		}, 1000);

		setInterval(function() {
			var hours = new Date().getHours();
			$("#hours").html((hours < 10 ? "0" : "") + hours);
		}, 1000);
	}
</script>
</html>