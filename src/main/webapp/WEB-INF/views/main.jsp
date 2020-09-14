<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="resources/css/basicBox.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>main</title>
</head>
<style>
body {
	background-color: #e3f2fd;
}

#header {
	width: 1581px;
	height: 100px;
	background-color: #81d4fa;
	margin-top: -30px;
	margin-left: -72px;
}

.navbar-default {
	background-color: #e3f2fd;
}

img {
	width: 300px;
	height: 200px;
	margin-top: -60px;
	margin-left: -50px;
}

a.navbar-brand {
	width: 300px;
	height: 100px;
	font-size: 20px;
	margin-left: 80px;
	margin-right: 30px;
}

a:hover {
	color: #ff3d00;
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
}

.navbar-default .navbar-nav>li>a {
	color: rgb(15, 13, 13);
}

.navbar-default .navbar-nav>li>a:hover {
	color: #ff3d00;
}

#join {
	width: 700px;
	height: 300px;
}

.login {
	width: 700px;
	height: 300px;
	border: 3px solid #81d4fa;
	font-size: 25px;
	margin-top: 30px;
	margin-left: 370px;
	padding: 40px 50px 0px 150px;
}

input:focus {
	outline: none;
}

#id {
	margin: 0px 37px;
}

#pw {
	margin: 30px 25px 0px;
}

#btn1 {
	border: 2px solid white;
	margin: 0px 30px 0px 100px;
	outline: 0;
	background-color: #81d4fa;
}

#btn2 {
	border: 2px solid white;
	outline: 0;
	background-color: #81d4fa;
}

#btn1:hover, #btn2:hover {
	color: #ff3d00;
	border: 2px solid white;
}

#hline {
	width: 100%;
	height: 2px;
	background-color: #81d4fa;
	margin-top: 90px;
}

b {
	font-size: 20px;
}

p {
	padding-top: 10px;
	font-size: 15px;
	text-align: center;
	flex-wrap: wrap;
	align-content: center;
}

.carousel-inner {
	height: 100px;
	margin-top: 50px;
}

li {
	padding-left: 50px;
}

#errorDiv {
	font-size: 20px;
	color: #ff3d00;
	margin-left: 40px;
}

#msg1, #msg2 {
	width: 500px;
	font-size: 20px;
	color: #ff3d00;
	margin-left: 80px;
}
</style>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<nav class="navbar navbar-default">
				<div id="header">
					<div class="navbar-header">
						<a class="navbar-brand" href="main"><img
							src="resources/image/logo.png" alt="홈페이지 로고"></a>
						<!-- 포스 메인페이지 -->
					</div>
					<ul class="nav navbar-nav">
						<li><a href="productinfo">상품소개</a></li>
						<!-- 상품소개 페이지 -->
						<li><a href="joinEmailFrm">가입안내</a></li>
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
							<h3>아직도 simple order 모르신다구요?</h3>
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
						<span class="sr-only">Previous</span>
					</a> <a class="right-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
				<form action="cEmailLogin" method="post" onsubmit="return cEmailLogin()">
					<div class="login">
						id : <input type="email" name="ce_email" id="id"
							placeholder="사업자이메일" onkeydown="keyEvt()"
							value="${requestScope.ce_email}" /> <br>
						<div id="msg1"></div>
						pw : <input type="password" name="ce_pw" id="pw"
							placeholder="비밀번호 12~20자리" onkeydown="keyEvt()" /> <br>
						<div id="msg2"></div>
						<br> <input type="submit" id="btn1" value="로그인" /> <input
							type="button" id="btn2" value="회원가입"
							onclick='location.href = "joinEmailFrm"'><br>
				</form>
				<div id="errorDiv">${requestScope.errorDiv}</div>
		</div>
		<div id="hline">
			<p>
				<b>회사정보</b>
			</p>
			<p>
				SimpleOrder(주) | 대표: HD6 | 인천광역시 미추홀구 학익동 <br> 365고객센터 |
				전자금융거래분쟁처리담당 1234-1234 <br> 사업자 등록번호 : 123-45-00678 | email:
				simple@order.com <br> &copy; Untitled. All rights reserved. |
				Photos by <a href="#">choi ay</a> | Design by <a href="#"
					rel="nofollow">choi ay</a>.
			</p>
		</div>
		</nav>
	</div>
	</div>
</body>
<script type="text/javascript">
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
	}
</script>

</html>