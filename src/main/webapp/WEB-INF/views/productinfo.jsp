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
</head>
<style>
body {
	background-color: #e3f2fd;
	font-family: 'NEXON Lv1 Gothic OTF Light';
} 

@font-face {
    font-family: 'NEXON Lv1 Gothic OTF Light';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF Light.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

#header {
	width: 1490px;
	height: 100px;
	background-color: #81d4fa;
	margin-top: -30px;
	margin-left: -30px;
}

.navbar-default {
	background-color: #e3f2fd;
	border-color: #e3f2fd;
}

img {
	width: 200px;
	margin-top: -65px;
	margin-left: -50px;
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
	color: rgb(15, 13, 13);
}

h1 {
	text-align: center;
	font-size: 40px;
	margin: 40px 500px 30px;
}

.container-fluid {
	margin-top: 30px;
}

.row {
	margin-top: 50px;
}

h2 {
	text-align: center;
}

#product {
	width: 600px;
	height: 500px;
	margin-left: 500px;
}

P {
	margin: 40px;
	font-size: 20px;
	text-align: left;
}
</style>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<nav class="navbar navbar-default">
				<div id="header">
					<div class="navbar-header">
						<a class="navbar-brand" href="main"><img src="resources/image/logo.png"
							alt="SimpleOrder 홈페이지"></a>
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
			</nav>
			<h1>상품소개</h1>
			<h2>상품명: Simple Order</h2>
			<div id="product">
				<p>&#149;&nbsp;&nbsp;웹 기반 pos 제작으로 별도의 프로그램 없이 사용가능</p>
				<p>&#149;&nbsp;&nbsp;기기의 설치가 필요 없음</p>
				<p>&#149;&nbsp;&nbsp;모바일 웹으로도 사용가능</p>
				<p>&#149;&nbsp;&nbsp;외부에서도 인터넷 연결 시 매장의 매출 확인 가능</p>
				<p>
					&#149;&nbsp;&nbsp;고객들이 직접 이동해서 주문해야 하는 방식에서 <br>
					&nbsp;&nbsp;벗어나 자리에서 QR코드를 통한 주문 가능
				</p>
				<p>&#149;&nbsp;&nbsp;클라이언트가 필요한 기능을 직접 커스터마이징 가능</p>
				<p>&#149;&nbsp;&nbsp;직원들의 근태, 월급 등 인사 관리 기능</p>
			</div>
		</div>
	</div>
</body>
</html>