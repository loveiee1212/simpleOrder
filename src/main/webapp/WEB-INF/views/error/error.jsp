<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<style type="text/css">
#backGround {
	z-index: -50;
	position: absolute;
	top: 38%;
	width: 600px;
	left: 60%;
	
}

#logo {
	width: 300px;
	margin-left: 186px;
}

#errorBox {
	left: 30%;
	top: 26%;
	width: 700px;
	height: 300px;
	position: absolute;
	float: left;
}

#text {
	font-size: 25px;
	text-align: center;
}

#text font {
	font-size: 30px;
	font-weight: 20px;
	font-family: Impact, Charcoal, sans-serif;
}

#text a {
	font-size: 20px;
}
</style>
</head>
<body>
	<div id="errorBox">

		<img id="logo" src="resources/image/logo.png" alt="SimpleOrder logo">
		<div id="text">
			<font><%-- ${errorCode}. --%>
			문제가 발생하였습니다.</font> <br> <br>메인으로 이동하시겠습니까?<br> <a
				href="main">메인으로 이동하기</a>
		</div>
	</div>
	<img id="backGround" src="resources/image/hand.png"
		alt="hand">
</body>
</html>