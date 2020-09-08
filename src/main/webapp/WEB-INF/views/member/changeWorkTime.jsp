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
<style>

#empList {
	margin: 15px;
	height: 740px;
	width: 300px;
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

#empInfo div {
	border: 1px solid lime;
	width: 150px;
	height: 50px;
	margin: 15px;
	font-size: 20px;
	text-align: center;
}

#change div {
	display: inline-block;
	border: 1px solid lime;
	width: 150px;
	height: 50px;
	margin: 15px;
	font-size: 20px;
	text-align: center;
}

#change input {
	border: 0px;
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
	background-color: white;
	font-size: 20px;
	margin-right: 40px;
	margin-left: 15px;
	margin-top: 30px;
}

#originalTime {
	border: 1px solid black;
	width: 500px;
	height: 200px;
	margin: 15px;
	margin-top: 40px;
}

#originalTime span {
	margin: 15px;
	margin-top: 50px;
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
						<span>기존 출근 시간</span> <br /> <span>기존 퇴근 시간</span>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>

</html>