<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SimpleOrder</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="resources/image/smallLogo.png" type="image/x-icon">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/basicBox.css?after">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
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

li {
	padding-left: 50px;
}

.navbar-default .navbar-nav>li>a {
	color: white;
	font-weight: bold;
}

.navbar-default .navbar-nav>li>a:hover {
	color: white;
	font-weight: bold;
}

.container-fluid {
	margin-top: 30px;
	font-weight: bold;
}

.row {
	margin-top: 50px;
}

P {
	font-size: 25px;
}

h1 {
	text-align: center;
	font-size: 40px;
	margin: 40px 500px 70px;
	font-weight: bold;
}

h3 {
    font-weight: bold;
}
#baseBox {
	color: #000000;
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
		<nav class="navbar navbar-default">
			<div id="baseinnerBox">
				<div id="header">
					<div class="navbar-header">
						<a class="navbar-brand" href="main"><img src="resources/image/logo.png" alt="SimpleOrder 홈페이지"></a>
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
				<div class="container-fluid text-center">
					<h1>주요기능</h1>
					<h4></h4>
					<br>
					<div class="row">
						<div class="col-sm-4">
							<i class='fas fa-power-off' style='font-size: 50px'></i>
							<h3>POWER</h3>
							<p>간편한 로그인</p>
						</div>
						<div class="col-sm-4">
							<i class='fas fa-people-arrows' style='font-size: 50px'></i>
							<h3>USER</h3>
							<p>누구나 쉽게 사용</p>
						</div>
						<div class="col-sm-4">
							<i class='fas fa-lock' style='font-size: 50px'></i>
							<h3>SECURITY</h3>
							<p>철저한 보안력</p>
						</div>
					</div>
					<br> <br>
					<div class="row">
						<div class="col-sm-4">
							<i class='fas fa-envelope-square' style='font-size: 50px'></i>
							<h3>MESSAGE</h3>
							<p>메세지 기능</p>
						</div>
						<div class="col-sm-4">
							<i class='fas fa-desktop' style='font-size: 50px'></i>
							&nbsp;&nbsp;<i class='fas fa-mobile-alt' style='font-size: 50px'></i>
							<h3>DEVICE</h3>
							<p>모바일 사용 가능</p>
						</div>
						<div class="col-sm-4">
							<i class='fa fa-qrcode' style='font-size:50px'></i>
							<h3>QRCODE</h3>
							<p>QR코드로 키오스크 접속가능</p>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</div>
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
				after = after.replaceAll("#000000", "#F7F7F7");
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
				after = after.replaceAll("#F7F7F7", "#000000");
				$("style").html(after);
				temaBlack = temaChange(false);
			}
		}
		//테마 끝
	</script>
</body>
</html>