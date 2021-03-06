<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="resources/image/smallLogo.png"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="resources/css/basicBox.css?after">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>SimpleOrder</title>
</head>
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

#header {
	width: 1490px;
	height: 100px;
	background-color: #2565a3;
	margin-top: -30px;
	margin-left: -30px;
}

.navbar-default {
	background-color: #e3f2fd;
	border-color: #e3f2fd;
}

img {
	width: 200px;
	margin-top: -20px;
	margin-left: -80px;
}

a.navbar-brand {
	width: 300px;
	height: 100px;
	font-size: 20px;
	margin-left: 60px;
	margin-right: 30px;
}

#myCarousel {
	background-color: #e3f2fd;
}

.left-control, .right-control {
	color: #6d6d6d;
}

ul {
	padding-top: 20px;
	font-size: 20px;
	flex-wrap: wrap;
	text-align: center;
}

.nav {
	margin-left: 600px;
	margin-top: 5px;
}

.carousel-indicators, .glyphicon-chevron-left:before,
	.glyphicon-chevron-right:before {
	display: none;
}

.navbar-default .navbar-nav>li>a {
	color: white;
	font-weight: bold;
}

.navbar-default .navbar-nav>li>a:hover {
	color: white;
	font-weight: bold;
}

.login {
	width: 700px;
	height: 500px;
	font-size: 28px;
	margin-top: 30px;
	margin-left: 370px;
	padding: 40px 30px 0px 100px;
}

input:focus, button:focus {
	outline: none;
}

#id {
	width: 540px;
	height: 60px;
	border: 3px solid #2565a3;
	font-size: 18px;
	margin: 0px -20px;
}

#pw {
	width: 540px;
	height: 60px;
	border: 3px solid #2565a3;
	font-size: 18px;
	margin: 10px -20px 0px;
}

#btn1 {
	width: 540px;
	height: 60px;
	border: 2px solid white;
	margin: 0px 30px 10px -20px;
	outline: 0;
	background-color: #2565a3;
	color: white;
	font-weight: bold;
}

#btn2 {
	width: 540px;
	height: 60px;
	border: 3px solid #2565a3;
	margin: 0px 30px 10px -20px;
	padding: 5px 10px;
	outline: 0;
	background-color: white;
	color: #2565a3;
	font-weight: bold;
}

#line {
	width: 540px;
	height: 1px;
	background-color: #2565a3;
	margin-top: 20px;
	margin-bottom: 30px;
	margin-left: -20px;
}

#hline {
	width: 1470px;
	height: 1px;
	background-color: #2565a3;
	margin-top: 10px;
	margin-bottom: 30px;
	margin-left: -20px;
}

b {
	font-size: 20px;
}

p {
	font-size: 15px;
	text-align: center;
	flex-wrap: wrap;
	align-content: center;
}

.carousel-inner {
	height: 50px;
	margin-top: 45px;
	margin-bottom: -20px;
}

h3 {
	font-size: 30px;
	font-family: 'NEXON Lv1 Gothic OTF';
}

@font-face {
	font-family: 'NEXON Lv1 Gothic OTF';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

li {
	padding-left: 50px;
}

#msg1, #msg2, #errorDiv {
	width: 500px;
	font-size: 20px;
	color: #ff3d00;
	margin-left: -20px;
}

#a {
	font-size: 20px;
	margin-left: 230px;
	text-decoration: none;
}

#changeTema {
	width: 180px;
	height: 50px;
	background-color: #0D0D0D;
	color: #fcfaff;
	font-size: 20px;
	font-weight: bold;
	border-radius: 20px;
	float: right;
}
</style>
<body>
		<button type="button" id="changeTema" onclick="changeTema()">다크모드</button>
	<div id="baseBox">
		<div id="baseinnerBox">
			<nav class="navbar navbar-default">
				<div id="header">
					<div class="navbar-header">
						<a class="navbar-brand" href="main"><img
							src="resources/image/logo.png" alt="SimpleOrder 홈페이지"></a>
						<!-- 포스 메인페이지 -->
					</div>
					<ul class="nav navbar-nav">
						<li><a href="productinfo">상품소개</a></li>
						<!-- 상품소개 페이지 -->
						<li><a href="joinEmailFrm">회원가입</a></li>
						<!-- 가입안내 페이지 -->
						<li><a href="mainskill">주요기능</a></li>
						<!-- 주요 기능 페이지 -->
					</ul>
				</div>
				<div id="myCarousel" class="carousel slide text-center"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<h3>SIMPLE ORDER</h3>
						</div>
						<div class="item">
							<h3>기존 제품과의 차별된 기능</h3>
						</div>
						<div class="item">
							<h3>누구나 편리한 사용법</h3>
						</div>
					</div>
					<a class="left-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span></a> <a class="right-control"
						href="#myCarousel" role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
				<div class="login">
					<form action="cEmailLogin" method="post"
						onsubmit="return cEmailLogin()">
						<input type="email" name="ce_email" id="id"
							placeholder="사업자 이메일을 입력해주세요" onkeydown="keyEvt()"
							value="${requestScope.ce_email}" />
						<div id="msg1"></div>
						<input type="password" name="ce_pw" id="pw"
							placeholder="비밀번호 특수문자 포함하여 12~20자리를 입력해주세요" onkeydown="keyEvt()" />
						<br>
						<div id="msg2"></div>
						<div id="errorDiv">${requestScope.errorDiv}</div>
						<br> <input type="submit" id="btn1" value="로그인" /><br>
						<a href="#" id="a">아이디(이메일)/비밀번호 찾기 ></a>
						<div id="line"></div>
						<input type="button" id="btn2" value="회원가입"
							onclick='location.href = "joinEmailFrm"'><br>
					</form>
				</div>
				<div id="hline"></div>
				<p>
					<b>회사정보</b>
				</p>
				<p>
					SimpleOrder(주) | 대표: HD6 | 인천광역시 미추홀구 학익동 <br> 365고객센터 |
					전자금융거래분쟁처리담당 1234-1234 <br> 사업자 등록번호 : 123-45-00678 | email:
					simple@order.com <br> &copy; Untitled. All rights reserved. |
					Photos by <a href="#">choi ay</a> | Design by <a href="#"
						rel="nofollow">choi ay</a>
				</p>
			</nav>
		</div>
	</div>
</body>
<script type="text/javascript">
	//테마 시작
	if ("${temaBlack}" == "") {
		temaBlack = false;
	} else {
		temaBlack = JSON.parse('${temaBlack}');
	}
	changeTema();

	function temaChange(temaBlack) {
		$.ajax({
			url : "rest/temaChange",
			type : "post",
			data : {
				"temaBlack" : temaBlack
			}
		})
		return !temaBlack;
	}

	function changeTema() {
		if (temaBlack) {
			$('#changeTema').text("화이트모드");
			before = $("style").html();
			after = before.replaceAll("#0D0D0D", "#24619E");
			after = after.replaceAll("#2565a3", "#2B2B2B");
			after = after.replaceAll("#e3f2fd", "#141414");
			after = after.replaceAll("#ffffff", "#404040");
			after = after.replaceAll("#1565c0", "#F0F0F0");
			after = after.replaceAll("#90caf9", "#4F4F4F");
			$("style").html(after);
			temaBlack = temaChange(true);
		} else {
			$('#changeTema').text("다크모드");
			before = $("style").html();
			after = before.replaceAll("#24619E", "#0D0D0D");
			after = after.replaceAll("#2B2B2B", "#2565a3");
			after = after.replaceAll("#141414", "#e3f2fd");
			after = after.replaceAll("#404040", "#ffffff");
			after = after.replaceAll("#F0F0F0", "#1565c0");
			after = after.replaceAll("#4F4F4F", "#90caf9");
			$("style").html(after);
			temaBlack = temaChange(false);
		}
	}
	//테마 끝
	function cEmailLogin() { //로그인 버튼 클릭시
		// 이메일 정규식
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var mail = $("#id").val();
		// 비밀번호 정규식
		var pwRule = /^(?=.*[a-zA-Z]{1,20})(?=.*[!@#$%^*-+]{1,20})(?=.*[0-9]{1,20}).{12,20}$/;

		if ($('#id').val() == "") {
			document.getElementById("msg1").innerHTML = "이메일을 입력해주세요!!";
			$('#id').focus();
			return false;
		} else if (mail.match(emailRule) == null) {
			document.getElementById("msg1").innerHTML = "이메일 형식에 맞게 입력해주세요!!";
			$('#id').focus();
			return false;
		} else if (!pwRule.test($('#pw').val().trim())) {
			document.getElementById("msg2").innerHTML = "특수문자 혼합하여 12~20자 입력하세요!!";
			$('#pw').focus();
			return false;
		} else {
			return true;
		}

	}

	function keyEvt() { // 오류메시지 없애기
		document.getElementById("msg1").innerHTML = " ";
		if ($('#pw').val() != "") {
			document.getElementById("msg2").innerHTML = " ";
		}
		document.getElementById("errorDiv").innerHTML = " ";
	}
</script>

</html>