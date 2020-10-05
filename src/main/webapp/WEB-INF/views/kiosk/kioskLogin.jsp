<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KioskLogin</title>
<link rel="icon" href="resources/image/smallLogo.png"
	type="image/x-icon">
<style>
body {
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

#frame {
	width: 568px;
	height: auto;
	margin: auto;
}

#innerdiv {
	width: 568px;
	height: 500px;
	margin-top: 200px;
}

#SecurityCodetable {
	width: 568px;
	height: 500px;
}

#SecurityCodetable td {
	height: 50px;
}

#header {
	width: 568px;
	height: 150px;
	font-size: 30px;
}

#header {
	width: 568px;
	height: 50px;
	border: 3px solid #e3f2fd;
	background-color: #e0e0e0;
	margin: 10px;
}

#securityCode {
	width: 568px;
	height: 50px;
	border: 3px solid #81d4fa;
	font-size: 20px;
	text-align: center;
	font-weight: bold;
	margin-top: 30px;
}

#submit {
	width: 580px;
	height: 60px;
	border: 2px solid white;
	outline: 0;
	background-color: #81d4fa;
	color: white;
	font-size: 20px;
	text-align: center;
	font-weight: bold;
	margin-top: -100px;
}

#hline {
	width: 568px;
	height: 1px;
	background-color: #81d4fa;
	margin-top: 10px;
	margin-bottom: 30px;
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

input:focus {
	outline: none;
}
</style>
</head>
<body>
	<div id="frame">
		<div id="innerdiv">
			<form action="accessSecurityCode" method="post">
				<table id="SecurityCodetable">
					<tr>
						<th id="header">광고</th>
					</tr>
					<tr>
						<td><input type="text" id="securityCode" name='securityCode'
							placeholder="인증번호 입력" maxlength="4"></td>
					</tr>
					<tr>
						<td><input type="submit" value='확인' id="submit">
					</tr>
					<tr>
						<td>${error}</td>
					</tr>
				</table>
				<div>
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
				</div>
			</form>
		</div>
		<%-- <div>
			그냥 확인용 css 작업간 삭제 가능
			<h2>kioskLogin</h2>
			<h2>${sessionScope.c_code}</h2>
			<h2>${sessionScope.bd_date}</h2>
			<h2>${sessionScope.sc_code}</h2>
			<h2>${sessionScope.st_num}</h2>
			<h2>${sessionScope.oac_num}</h2>
		</div> --%>
	</div>
</body>
</html>