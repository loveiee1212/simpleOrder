<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/basicBox.css?after">
<link rel="icon" href="resources/image/smallLogo.png" type="image/x-icon">
<title>poslogin</title>
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

img {
    width: 350px;
    margin-left: 600px;
    z-index: 1;
    margin-bottom: 40px;
}

#login {
	width: 1400px;
	height: 500px;
	border: 3px solid #81d4fa;
	font-size: 20px;
	margin: 20px 20px;
	padding-left: 60px;
}

#poslogin {
	/* border: 3px solid #81d4fa; */
	float: left;
	width: 700px;
	height: 400px;
	margin: 30px 70px;
}

input:focus {
	outline: none;
}

button:focus {
	outline: none;
}

#emp_code {
	width: 540px;
	height: 60px;
	font-size: 25px;
	text-align: center;
	margin-top: 30px;
}

#emp_pw {
	width: 540px;
	height: 60px;
	font-size: 25px;
	text-align: center;
	margin-top: 20px;
}

#btn1 {
	width: 545px;
	height: 60px;
	border: 1px solid white;
	font-size: 25px;
	outline: 0;
	background-color: #81d4fa;
	color: white;
	font-weight: bold;
}

#btn2 {
	width: 545px;
	height: 60px;
	border: 3px solid #81d4fa;
	font-size: 25px;
	padding: 5px 10px;
	outline: 0;
	background-color: white;
	color: #81d4fa;
	font-weight: bold;
}

#line {
	width: 540px;
	height: 1px;
	background-color: #81d4fa;
	margin-top: 30px;
	margin-bottom: 30px;
}

#numplate {
	float: left;
	width: 400px;
	height: 500px;
	margin: 20px 40px;
}

button {
	width: 100px;
	height: 100px;
	font-size: 30px;
	margin-left: 20px;
	margin-bottom: 20px;
	border: 1px solid white;
	background-color: #81d4fa;
	color: white;
}

#msg1, #msg2 {
	width: 500px; font-size : 20px;
	color: #ff3d00;
	font-size: 20px; color : #ff3d00;
	margin-left: 10px;
}

error {
	margin-left: 10px;
	color: #ff3d00;
}
</style>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<a class="navbar-brand" href="main"><img src="resources/image/logo.png" alt="SimpleOrder 홈페이지"></a>
			<div id="login">
				<form action="empAcountlogin" id="poslogin" method="post" onsubmit="return posLogin()">
					<input class="code" id="emp_code" name="emp_code" value="${empAcountInfo.emp_code}" placeholder="사원번호 5자리" type="text" maxlength="5" onkeypress="onlyNum(this)" numberOnly="true" onkeydown="keyEvt()">
					<div id="msg1"></div>
					<input id="emp_pw" name="emp_pw" placeholder="사원 비밀번호 4자리" maxlength="4" onkeypress="onlyNum(this)" numberOnly="true" type="password" onkeydown="keyEvt()"><br />
					<div id="msg2"></div>
					<error id="error">${empAcountInfo.error}</error>
					<br /> <input type="submit" id="btn1" value="로그인">
					<div id="line"></div>
					<input type="button" id="btn2" value="사업체 리스트 보기" onclick="location.href = 'backClist'">
				</form>

				<div id="numplate">
					<button class="num" onclick="add(1)">1</button>
					<button class="num" onclick="add(2)">2</button>
					<button class="num" onclick="add(3)">3</button>
					<br>
					<button class="num" onclick="add(4)">4</button>
					<button class="num" onclick="add(5)">5</button>
					<button class="num" onclick="add(6)">6</button>
					<br>
					<button class="num" onclick="add(7)">7</button>
					<button class="num" onclick="add(8)">8</button>
					<button class="num" onclick="add(9)">9</button>
					<br>
					<button onclick="test(this)"><i class="fa fa-arrow-left" style="font-size: 30px"></i></button>
					<button class="num" onclick="add(0)">0</button>
					<button onclick="test2(this)"><i class="fa fa-times" style="font-size: 30px"></i></button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>


//번호(num버튼) 입력시 사원번호 5자리 입력후 비밀번호로 넘어가는 함수
var id = document.getElementById("emp_code");
var pw = document.getElementById("emp_pw");
function add(num) {
	document.getElementById("msg1").innerHTML = " ";
	document.getElementById("msg2").innerHTML = " ";
	var count = 0;
	if (id.value.length < 5) {
		id.value += num;
	} else if (pw.value.length < 5) {
		pw.value += num;
		pw.value = pw.value.slice(0, 4);
	}
}

//숫자만 입력하는 함수
function onlyNum(obj) {
	if ((event.keyCode < 48) || (event.keyCode > 57))
		event.returnValue = false;

	$(document).on("keyup", "input:text[numberOnly]", function() {
		$(this).val($(this).val().replace(/[^0-9]/gi, ""));
	});
}

// 사원번호&비밀번호 체크
function posLogin() {
	if (id.value == "") {
		document.getElementById("msg1").innerHTML = "사원번호가 공백입니다!!";
		id.focus();
		return false;
	} else if (id.value.length < 5) {
		document.getElementById("msg1").innerHTML = "사원번호 5자리를 입력해주세요!!";
		id.focus();
		return false;	
	} else if (pw.value == "") {
		document.getElementById("msg2").innerHTML = "사원 비밀번호가 공백입니다!!";
		pw.focus();
		return false;
	} else if (pw.value.length < 4) {
		document.getElementById("msg2").innerHTML = "사원 비밀번호 4자리를 입력해주세요!!";
		pw.focus();
		return false;
	} else {
		return true;
	}
}

function keyEvt() { //오류메시지 없애기	
	if (id.value != "") {
		document.getElementById("msg1").innerHTML = " ";
	}
	if (pw.value != "") {
		document.getElementById("msg2").innerHTML = " ";
	}
	document.getElementById("error").innerHTML = " ";
}

function test(obj) { // 하나씩 지우기
	if (pw.value != ""){
		pw.focus();
		pw.value = pw.value.slice(0, -1);
	}else if (id.value != ""){
		id.focus();
		id.value = id.value.slice(0, -1);
	}
}

function test2(obj) { // 전체 지우기
	id.value="";
	pw.value="";
} 




</script>
</html>