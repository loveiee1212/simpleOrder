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
	border: 3px solid #2565a3;
	margin-right: 38px;
	background-color: white;
}

#divOne::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#divOne::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#divOne::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#divTwo {
	width: 450px;
	height: 800px;
	float: left;
	border: 3px solid #2565a3;
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
	background-color: #2565a3;
	font-weight: bold;
	color: white;
	font-size: 25px;
}

input:focus, button:focus {
	outline: none;
}

#logo {
	width: 500px;
	opacity: 0.5;
	margin: 100px 200px;
}

/* #changeTema {
	width: 180px;
	height: 50px;
	background-color: #0D0D0D;
	color: #fcfaff;
	font-size: 20px;
	font-weight: bold;
	border-radius: 20px;
	float: right;
} */
</style>
<meta charset="UTF-8">
<title>키오스크설정</title>
</head>
<body>
<!-- <button type="button" id="changeTema" onclick="changeTema()">다크모드</button> -->
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
//테마 끝 */

	${basicPath}
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