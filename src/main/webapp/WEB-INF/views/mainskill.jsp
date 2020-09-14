<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/basicBox.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<style>
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

ul {
	padding-top: 20px;
	font-size: 20px;
	flex-wrap: wrap;
	text-align: center;
}

.nav {
	margin-left: 600px;
}

li {
	padding-left: 50px;
}

.navbar-default .navbar-nav>li>a {
	color: rgb(15, 13, 13);
}

.navbar-default .navbar-nav>li>a:hover {
	color: #ff3d00;
}

.container-fluid {
	margin-top: 30px;
}

.row {
	margin-top: 50px;
}

P {
	font-size: 20px;
}

h1 {
	text-align: center;
	font-size: 40px;
	margin: 40px 500px 70px;
}
</style>
<body>
	<div id="baseBox">
		<nav class="navbar navbar-default">
			<div id="baseinnerBox">
				<div id="header">
					<div class="navbar-header">
						<a class="navbar-brand" href="main"><img src="resources/image/logo.png"
							alt="홈페이지 로고"></a>
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
				<div class="container-fluid text-center">
					<h1>주요기능</h1>
					<h4></h4>
					<br>
					<div class="row">
						<div class="col-sm-4">
							<i class='fas fa-power-off' style='font-size: 40px'></i>
							<h3>POWER</h3>
							<p>간편한 로그인</p>
						</div>
						<div class="col-sm-4">
							<i class='fas fa-people-arrows' style='font-size: 40px'></i>
							<h3>USER</h3>
							<p>누구나 쉽게 사용</p>
						</div>
						<div class="col-sm-4">
							<i class='fas fa-lock' style='font-size: 40px'></i>
							<h3>보안</h3>
							<p>철저한 보안력</p>
						</div>
					</div>
					<br> <br>
					<div class="row">
						<div class="col-sm-4">
							<i class='fas fa-envelope-square' style='font-size: 40px'></i>
							<h3>메세지</h3>
							<p>메세지 기능</p>
						</div>
						<div class="col-sm-4">
							<i class='fas fa-desktop' style='font-size: 40px'></i>
							&nbsp;&nbsp;<i class='fas fa-mobile-alt' style='font-size: 40px'></i>
							<h3>다양한 기기</h3>
							<p>모바일 사용 가능</p>
						</div>
						<div class="col-sm-4">
							<i class='fas fa-question' style='font-size: 70px'></i>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</div>
</body>
</html>