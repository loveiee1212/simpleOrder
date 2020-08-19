<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changeWorkTime</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/basicBox.css" type="text/css">
<link rel="stylesheet" href="resources/css/calendar.css" type="text/css">
<style>
#clock {
	text-align: center;
	border: 1px solid black;
	width: 400px;
	height: 95px;
	margin-left: 15px;
	margin-top: 30px;
	border: 1px solid black;
}

#clock ul {
	width: 200px;
	list-style: none;
	text-align: center;
	margin-left: 15%;
}

#clock ul li {
	display: inline;
	font-size: 25px;
	text-align: center;
}

.date {
	text-align: center;
	font-size: 20px;
}

.point {
	position: relative;
	padding-left: 10px;
	padding-right: 10px;
	text-align: center;
}

#gWork button {
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

#empList{
	margin : 15px;
	height: 740px;
	width : 300px;
	border: 1px solid olive;
	float: left;
}
#changeBox {
	margin: 15px;
	height: 740px;
	width: 600px;
	border: 1px solid olive;
	float: right;
}
#empInfo div{
	border : 1px solid lime;
	width: 150px;
	height: 50px;
	margin: 15px;
	font-size: 20px;
	text-align: center;
}

#change div {
	display: inline-block;
	border : 1px solid lime;
	width: 150px;
	height: 50px;
	margin: 15px;
	font-size: 20px;
	text-align: center;
}

#change input {
	border : 0px;
	width: 300px;
	height: 50px;
	margin: 15px;
	font-size: 20px;
	text-align: center;
}

#button button {
	border: 1px solid black;
	width: 150px;
	height: 50px;
	background-color : white;  
	font-size: 20px;
	margin-right: 40px;
	margin-left: 15px;
	margin-top: 30px;
}

#originalTime {
	border : 1px solid black;
	width : 500px;
	height : 200px;
	margin: 15px;
	margin-top: 40px;
}

#originalTime span {
	margin: 15px;
	margin-top : 50px;
	font-size: 20px;
}
</style>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<div id="calendar">
				<div id="empList">
					<div>직원 리스트</div>
				</div>
				<form id="changeBox">
					<div class="date">날짜</div>
					<div id="empInfo">
						<div id="empNumber">
							<span>사번</span>
						</div>
						<div id="empName">
							<span>이름</span>
						</div>
					</div>
					<div id="change">
						<div class="goLeave">출근</div>
						<input type="time" name="gTime">
						<div class="goLeave">퇴근</div>
						<input type="time" name="lTime">
					</div>
					<div id="button">
						<label><button>변경</button></label> <label><button>취소</button></label>
					</div>
					<div id="originalTime">
						<span>기존 출근 시간</span> <br/>
						<span>기존 퇴근 시간</span>
					</div>
				</form>
		</div>
		<div id="controller">
			<div id="clock">
				<div class="date"></div>
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
<script type="text/javascript">
	//시계
	clockOn();
	function clockOn() {
		var monthNames = [ "01", "02", "03", "04", "05", "06", "07", "08",
				"09", "10", "11", "12" ];
		var dayNames = [ "일", "월", "화", "수", "목", "금", "토" ]
		var newDate = new Date();
		newDate.setDate(newDate.getDate());
		$('.date').html(
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