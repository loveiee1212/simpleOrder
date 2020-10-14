<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/basicBox.css?after">
<link rel="icon" href="resources/image/smallLogo.png" type="image/x-icon">
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
	border: 3px solid #2565a3;
	width: 900px;
	height: 800px;
	float: left;
	margin-right: 38px;
	background-color: #ffffff;
}

#divTwo {
	border: 3px solid #2565a3;
	width: 450px;
	height: 800px;
	float: left;
	background-color: #ffffff;
}

#btn1 {
    text-align: center;
    border: 2px solid #ffffff;
    width: 350px;
    height: 100px;
    margin-left: 49px;
    margin-top: 20px;
    background-color: #2565a3;
    font-weight: bold;
    color: #ffffff;
    font-size: 25px;
}

#btn2, #btn3, #btn4, #btn5, #btn6, #btn7 {
    text-align: center;
    border: 2px solid #ffffff;
    width: 350px;
    height: 100px;
    margin-left: 49px;
    margin-top: 10px;
    background-color: #2565a3;
    font-weight: bold;
    color: #ffffff;
    font-size: 25px;
}

h2 {
	font-size: 35px;
	color: #1565c0;
	font-weight: bold;
	text-align: center;
	width: 300px;
	height: 30px;
	background-color: #ffffff;
	margin-left: 250px;
	padding: 40px;
}

#logo {
    width: 500px;
    opacity: 0.5;
    margin: 100px 200px;
}

input:focus, button:focus, select:focus {
	outline: none;
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
<meta charset="UTF-8">
<title>SimpleOrder</title>
</head>
<body>
<button type="button" id="changeTema" onclick="changeTema()">다크모드</button>
	<div id="baseBox">
		<div id="baseinnerBox">
			<div id="totalDiv">
				<div id="divOne">
				<h2>포스 설정</h2>
					<img src="resources/image/logo.png" alt="SimpleOrder 홈페이지" id="logo">
				</div>
				<div id="divTwo">
					<input type="button" id="btn1" value="테이블 설정" onclick="includeAjax('seatSettinFrm')"><br />
					<input type="button" id="btn2" value="직원 목록" onclick="includeAjax('empSettingFrm')"><br/> 
					<input type="button" id="btn3" value="직급 설정" onclick="includeAjax('postisionSettingFrmOn')"><br />
					 <input type="button" id="btn4" value="권한 설정" onclick="includeAjax('postionGrantSettingFrmOn')"><br />
					 <input type="button" id="btn5" value="키오스크 비밀번호 변경" onclick="includeAjax('cSecurityCodeSettingFrmOn')"><br />
					 <input type="button" id="btn6" value="키오스크 설정" onclick="location.href = 'kioskSettingFrm'"><br /> 
					 <input type="button" id="btn7" value="나가기" onclick="location.href = 'posmain'"><br />
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" id="basicIncludeService">
/* //테마 시작
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
		after = after.replaceAll("#2565a3", "#CCCCCC");
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
		after = after.replaceAll("#CCCCCC", "#2565a3");
		after = after.replaceAll("#141414", "#e3f2fd");
		after = after.replaceAll("#404040", "#ffffff");
		after = after.replaceAll("#F0F0F0", "#1565c0");
		after = after.replaceAll("#4F4F4F", "#90caf9");
		after = after.replaceAll("#F7F7F7", "#000000");
		$("style").html(after);
		temaBlack = temaChange(false);
	}
}
//테마 끝 */
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