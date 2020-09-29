<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SimpleOrder-시재변경내역</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/basicBox.css?after">
<link rel="stylesheet" href="resources/css/calendar.css?afte"
	type="text/css">
<style type="text/css">
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

#calendar {
	width: 1450px;
	float: none;
	margin-left: 5px;
	background-color: white;
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
	height: 670px;
	margin: -150px 0 0 -194px;
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

#main_layer td {
	font-size: 20px;
	height: 40px;
	padding-top: 10px;
}

#calendar_main {
	margin-top: -65px;
	float: left;
	width: 1200px;
}

button:focus {
	outline: none;
}

#btn {
	width: 1200px;
}

#Exit {
	float: right;
	text-align: center;
	border: 2px solid white;
	width: 230px;
	height: 80px;
	margin-left: 49px;
	margin-top: -80px;
	background-color: #81d4fa;
	font-weight: bold;
	color: white;
	font-size: 25px;
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
				<button id="Exit" onclick="location.href='changevc'">나가기</button>
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
			$(".dt").eq(i).attr("onclick", "getDayVCLog(" + dayCount + ")");

			if ($tdDay.eq(i).text() == today.getDate()) {
				if (month == today.getMonth() + 1) {
					if (year == today.getFullYear()) {
						$(".dt").eq(i).css("background-color", "#81d4fa");
					}
				}
			}
		}
		//시재 출력 메소드
		getMonthVC(dayCount);

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
</script>
<script type="text/javascript">
	//월별 시재 출력
	function getMonthVC(day) {

		$.ajax({
			type : 'get',
			url : 'rest/getmonthvc',
			data : {
				'l_date' : year + "-" + month + "-" + day,
				'f_date' : year + "-" + month + "-" + 01
			},
			dataType : 'json',
			success : function(data) {
				$tdText.text("");

				for ( var i in data) {

					if (data[i].BD_DATE != null) {
						var bd_date = moment(data[i].BD_DATE).format("DD");
						var bd_dateYM = moment(data[i].BD_DATE).format(
								"YYYY MM");
					}
					if (data[i].VC_CODE == "1") {
						var start = data[i].VC
					}
					if (data[i].VC_CODE == "-1") {
						var end = data[i].VC
					}

					for (var j = firstDay.getDay(); j < firstDay.getDay()
							+ lastDay.getDate(); j++) {

						if (bd_dateYM == $("#yearMonth").text()) {
							if (bd_date == $tdDay.eq(j).text()) {
								if (data[i].VC_CODE == "1") {
									$tdText.eq(j)
											.append(
													$("<span>").html(
															"시작시재 : " + start
																	+ "\r\n"));
								}
								if (data[i].VC_CODE == "-1") {
									$tdText.eq(j).append(
											$("<span>").html(
													"마감시재 : " + end + "\r\n"));
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

	function getDayVCLog(day) {
		$("#view_layer").addClass("open");

		$
				.ajax({
					type : "get",
					url : "rest/getdayvclog",
					data : {
						'bd_date' : moment($("#yearMonth").text() + "-" + day)
								.format("YYYY-MM-DD")
					},
					dataType : "json",
					success : function(data) {

						$("#main_layer").text("");
						$table = $("#main_layer").append($("<table>"));
						$table
								.append($("<tr><th>시간</th><th>구분</th><th>금액</th><th>차액</th><th>사유</th></tr>"));
						for ( var i in data) {
							$tr = $table.append($("<tr>"));
							$tr.append($("<td>").html(
									moment(data[i].VC_CHANGETIME).format(
											"HH:mm")));
							if (data[i].VC_CODE == "1") {
								$tr.append($("<td>").html("시작시재"));
							} else if (data[i].VC_CODE == "-1") {
								$tr.append($("<td>").html("마감시재"));
							} else {
								$tr.append($("<td>").html("환전"));
							}
							$tr.append($("<td>").html(data[i].VC));
							if (data[i].VC_CODE == "1") {
								$tr.append($("<td>").html(""));
							}
							if (data[i].VC_CODE != "1") {
								$tr.append($("<td>").html(
										data[i].VC - data[i - 1].VC));
							}

							if (data[i].VCC_MEMO != null) {
								$tr.append($("<td>").html(data[i].VCC_MEMO));
							} else if (data[i].VCC_MEMO == null) {
								$tr.append($("<td>").html(" "));
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
</html>