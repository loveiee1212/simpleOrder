<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

#flotBoxDiv {
	z-index: 3;
	display: none;
}

#flotBoxDiv.on {
	display: inline;
	z-index: 4;
}

#flotBoxbg {
	background-color: black;
	width: 1600px;
	height: 1000px;
	position: absolute;
	left: 0;
	top: 0;
	opacity: 0.5;
	z-index: 5;
}

#flotBox {
	transform: translate(-50%, 0%);
	margin: -500px 750px;
	position: absolute;
	width: 600px;
	height: 400px;
	background-color: white;
	z-index: 6;
	font-size: 20px;
	padding: 70px 70px 0px 70px;
	max-width: 100%;
	max-height: 100%;
}

input:focus, button:focus {
	outline: none;
}

#c_code {
	width: 200px;
	height: 80px;
	font-size: 20px;
	text-align: center;
	margin-top: 0px;
}

#c_pw {
	width: 300px;
	height: 80px;
	font-size: 20px;
	text-align: center;
	margin-top: 0px;
	border: 0;
	border-bottom: 3px solid #2565a3;
}

#clogin {
	width: 550px;
	height: 70px;
	border: 2px solid white;
	margin: 10px 1px;
	font-size: 25px;
	outline: 0;
	background-color: #2565a3;
	font-weight: bold;
	color: white;
}

img {
	width: 300px;
	margin-top: 45px;
	margin-left: 600px;
	margin-bottom: 50px;
	z-index: 1;
}

#cListInfo {
	width: 1400px;
    height: auto;
    border: 3px solid #2565a3;
    font-size: 20px;
    z-index: 2;
    border-collapse: collapse;
    font-weight: bold;
}


#UPbtn {
	width: 80px;
	height: 50px;
	border: 3px solid #2565a3;
	background-color: white;
	font-size: 18px;
	font-weight: bold;
	color: #2565a3;
}

#DEbtn {
	width: 80px;
	height: 50px;
	border: 2px solid white;
	background-color: #2565a3;
	font-size: 18px;
	font-weight: bold;
	color: white;
}

#cListInfoDiv {
    width: 1450px;
    height: 300px;
	margin-left: 20px;
	overflow: auto;
}

#cListInfoDiv::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#cListInfoDiv::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#cListInfoDiv::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

table {
	border: none;
}

th, td {
	border: 3px solid #2565a3;
}

#th, #td, #msg1 {
	border: none;
	overflow: none;
}

th {
	background-color: white;
	color: #2565a3;
	width: 250px;
	height: 40px;
}

td {
	height: 60px;
	text-align: center;
	margin: -50px;
	padding: -10px;
	overflow: auto;
	-ms-overflow-style: none;
	scrollbar-width: none;
}

td:-webkit-scrollbar {
	display: none;
}

#btn1 {
	width: 650px;
	height: 80px;
	border: 2px solid white;
	margin: 30px 50px 10px 18px;
	outline: 0;
	background-color: #2565a3;
	font-size: 20px;
	font-weight: bold;
	color: white;
}

#btn2 {
	width: 650px;
	height: 80px;
	border: 3px solid #2565a3;
	margin: 10px 0px 10px 47px;
	padding: 5px 10px;
	outline: 0;
	background-color: white;
	color: #2565a3;
	font-size: 20px;
	font-weight: bold;
}

#btn3 {
    width: 200px;
    height: 60px;
    border: 3px solid #2565a3;
    margin: 150px 80px 10px 47px;
    padding: 5px 10px;
    outline: 0;
    background-color: white;
    color: #2565a3;
    font-size: 20px;
    font-weight: bold;
    float: right;
    border-radius: 50px;
}

#error {
	font-size: 20px;
	color: red;
	margin-left: 30px;
}

#msg1 {
	height: 30px;
	font-size: 18px;
	color: #ff3d00;
	padding-left: 240px;
}
</style>
<meta charset="UTF-8">
<title>사업자 리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/basicBox.css?after">
</head>
<body>

	

	<div id="baseBox">
		<div id="baseinnerBox">
			<a class="navbar-brand" href="main"><img
				src="resources/image/logo.png" alt="SimpleOrder 홈페이지"></a>
			<input
				type="button" id="btn3" onclick="location.href = 'emailLogout'"
				value="EMAIL 로그아웃">
			<div id="cListInfoDiv">
			<table id="cListInfo">
				<tr>
					<th>상호명</th>
					<th>사업자번호</th>
					<th>전화번호</th>
					<th>주소</th>
					<th colspan="2">비고</th>
				</tr>
			</table>
			</div>
			<input type="button" id="btn1"
				onclick="location.href ='createccodefrm'" value="사업장 추가"> 
			<input
				type="button" id="btn2" onclick="location.href = 'emailsales'"
				value="사업장 전체 매출">	
				<div id="flotBoxDiv">
		<div id="flotBoxbg"></div>
		<div id="flotBox">
			<form name="cLogin" action="" onsubmit="return cloginTest()"
				method="post">
				<table>
					<tr>
						<th id="th">사업자 번호</th>
						<td id="td"><input type="text" id="c_code" name="c_code"
							readonly="readonly" style="outline: none; border: none;"></td>
					</tr>
					<tr>
						<th id="th">사업자 비밀번호</th>
						<td id="td"><input type="password" id="c_pw" name="c_pw"
							maxlength="20" placeholder="비밀번호 12~20자리" onkeydown="keyEvt()"></td>
					</tr>
					<tr>
						<td colspan="2" id="msg1"></td>
					</tr>
					<tr>
						<td colspan="2" id="td"><input type="submit" id="clogin"
							value="로그인"></td>
					</tr>
				</table>
				<div id="error"></div>
				<input type="text" name="ce_email" value="${ce_email}"
					style="display: none;">
			</form>
		</div>
	</div>
		</div>
	</div>
</body>
<script type="text/javascript">
getClistInfo();// 처음 사업체 정보 가져오기
errorUse();//로그인 실패시

function errorUse(){
	if('${cInfo}'!=""){//에러를 통해서 가져온 값이 없다면 작동하지 않음
		cLogindivon(${cInfo.c_code});// 있다면 해당 사업체 번호로 로그인 박스 켜짐
	}
	$("#error").html("${cInfo.error}") // 에러 메세지또한 로그인 아래에 노출
}

function cloginTest() {
	// 비밀번호 정규식
	var pwRule = /^(?=.*[a-zA-Z]{1,20})(?=.*[!@#$%^*-+]{1,20})(?=.*[0-9]{1,20}).{12,20}$/;
	
    if (!pwRule.test($('#c_pw').val().trim())) {
	document.getElementById("msg1").innerHTML = "특수문자 혼합하여 12~20자 입력하세요!!";
	$('#c_pw').focus();
	return false;
	} else {
		return true;
	}
}

function getClistInfo(){//사업자 정보 로드
	$.ajax({
		url : "rest/getClist",
		type : "get",
		data : {
			"ce_email" : "${ce_email}"
		},
		dataType : "json",
		success : data =>{
			$("#cListInfo").append(data.cListInfoHtml);
		}
	});
	}


$("#flotBoxbg").click(function(){
	off();
})
$(document).keydown(function(data){ 
	if(data.keyCode==27){
		off(); 
	};
})

	function off(){ //모달박스 끄기 펑션
	$("#flotBoxDiv").removeClass("on");
}

	function cLogindivon(cCode){	//모달 박스 키기, 정보 입력
		cLogin.action = 'cLogin';
		$("#flotBoxDiv").addClass("on");
		$("#c_code").val(cCode);
	};
	function cAcountDelect(cCode){
		cLogin.action = 'cAcountDelect';
		$("#flotBoxDiv").addClass("on");
		$("#c_code").val(cCode);
	};
	function cAcountUpdate(cCode){
		cLogin.action = 'cAcountUpdate';
		$("#flotBoxDiv").addClass("on");
		$("#c_code").val(cCode);
	};
	
function keyEvt() {
	document.getElementById("error").innerHTML = " ";
}
</script>

</html>