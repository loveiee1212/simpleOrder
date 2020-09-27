<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/basicBox.css?after">
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

#totalDiv {
	border: none;
	width: 1400px;
	height: 800px;
	margin-left: 50px;
	width: 1400px;
}

#divOne {
	border: 3px solid #81d4fa;
	width: 900px;
	height: 800px;
	float: left;
	margin-right: 38px;
	background-color: white;
}

#divTwo {
	border: 3px solid #81d4fa;
	width: 450px;
	height: 800px;
	float: left;
	background-color: white;
}

#btn1 {
    text-align: center;
    border: 2px solid white;
    width: 350px;
    height: 100px;
    margin-left: 49px;
    margin-top: 20px;
    background-color: #81d4fa;
    font-weight: bold;
    color: white;
    font-size: 25px;
}

#btn2, #btn3, #btn4, #btn5, #btn6, #btn7 {
    text-align: center;
    border: 2px solid white;
    width: 350px;
    height: 100px;
    margin-left: 49px;
    margin-top: 10px;
    background-color: #81d4fa;
    font-weight: bold;
    color: white;
    font-size: 25px;
}

input:focus {
	outline: none;
}
</style>
<meta charset="UTF-8">
<title>posSetting</title>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<div id="totalDiv">
				<div id="divOne"></div>
				<div id="divTwo">
					<input type="button" id="btn1" value="테이블 설정" onclick="includeAjax('seatSettinFrm')"><br />
					<input type="button" id="btn2" value="직원 목록" onclick="includeAjax('empSettingFrm')"><br/> 
					<input type="button" id="btn3" value="직급 설정" onclick="includeAjax('postisionSettingFrmOn')"><br />
					 <input type="button" id="btn4" value="권한 설정" onclick="includeAjax('postionGrantSettingFrmOn')"><br />
					 <input type="button" id="btn5" value="마스터 계정 비밀번호 변경" onclick="includeAjax('cSecurityCodeSettingFrmOn')"><br />
					 <input type="button" id="btn6" value="키오스크 설정" onclick="location.href = 'kioskSettingFrm'"><br /> 
					 <input type="button" id="btn7" value="나가기" onclick="location.href = 'posmain'"><br />
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" id="basicIncludeService">
	${basicPath}
	
	



	function includeAjax(url) {
		$.ajax({
			url : url,
			success : function(html) {
				$("#divOne").html(html);
			}
		})
	}
</script>
</html>