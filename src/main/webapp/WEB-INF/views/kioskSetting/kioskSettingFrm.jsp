<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/basicBox.css?after">
<link rel="icon" href="resources/image/smallLogo.png"
	type="image/x-icon">
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

h2 {
	font-size: 35px;
	color: #1565c0;
	font-weight: bold;
	text-align: center;
	width: 300px;
	height: 30px;
	background-color: white;
	margin-left: 250px;
	padding: 40px;
}

#divOne {
	width: 900px;
	height: 800px;
	float: left;
	overflow: auto;
	border: 3px solid #81d4fa;
	margin-right: 38px;
	background-color: white;
}

#divOne::-webkit-scrollbar {
	width: 10px;
	background-color: #81d4fa;
}

#divOne::-webkit-scrollbar-thumb {
	background-color: #81d4fa;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#divOne::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#divTwo {
	width: 450px;
	height: 800px;
	float: left;
	border: 3px solid #81d4fa;
	background-color: white;
}

#kioskQrCodeListFrm, #requestListSettingFrm, #reveiwUsagestatusFrm,
	#posSetting {
	text-align: center;
	border: 2px solid white;
	width: 350px;
	height: 100px;
	margin-left: 49px;
	margin-top: 50px;
	background-color: #81d4fa;
	font-weight: bold;
	color: white;
	font-size: 25px;
}

input:focus {
	outline: none;
}

#logo {
	width: 500px;
	opacity: 0.5;
	margin: 100px 200px;
}
</style>
<meta charset="UTF-8">
<title>kioskSetting</title>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<div id="totalDiv">
				<div id="divOne">
					<h2>키오스크 설정</h2>
					<img src="resources/image/logo.png" alt="SimpleOrder 홈페이지"
						id="logo">
				</div>
				<div id="divTwo">
					<input type="button" id="kioskQrCodeListFrm" value="테이블별 QR코드 가져오기"
						onclick="includeAjax('kioskQrCodeListFrm')"><br /> <input
						type="button" id="requestListSettingFrm" value="요청사항 수정하기"
						onclick="includeAjax('requestListSettingFrm')"><br /> <input
						type="button" id="reveiwUsagestatusFrm" value="리뷰 사용 여부 체크"
						onclick="includeAjax('reveiwUsagestatusFrm')"><br /> <input
						type="button" id="posSetting" value="포스 설정으로 "
						onclick="location.href = 'posSetting'">
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" id="basicIncludeService">
	$
	{
		basicPath
	}
	function includeAjax(url) {
		$.ajax({
			url : url,
			success : function(html) {
				$("#divOne").html(html)
			}
		})
	}
</script>
</html>