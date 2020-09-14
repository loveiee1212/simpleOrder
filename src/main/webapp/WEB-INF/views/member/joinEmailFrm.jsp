<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinEmailFrm</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/basicBox.css" type="text/css">
</head>
<style>
body {
	background-color: #e3f2fd;
}

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

h1 {
	text-align: center;
	font-size: 40px;
	margin: 40px 500px 70px;
}

#joinInfo {
	width: 700px;
	height: 590px;
	border: 3px solid #81d4fa;
	font-size: 20px;
	margin: -50px 370px 38px;
}

td {
	padding: 0px 0px 0px 100px;
}

#email {
	margin-left: -10px;
}

#pw {
	margin-left: -10px;
}

#c_code {
	margin-left: -10px;
}

#c_pw {
	margin-left: -10px;
}

#c_name {
	margin-left: -10px;
}

#zipNo {
	margin-left: -10px;
}

#roadAddrPart1 {
	margin-left: -10px;
}

#addrDetail {
	margin-left: -10px;
}

#c_phone {
	margin-left: -10px;
}

#btn {
	width: 130px;
	height: 50px;
	border: 2px solid white;
	margin: 10px 230px;
	outline: 0;
	background-color: #81d4fa;
}

#btn:hover {
	color: #ff3d00;
	border: 2px solid white;
}

#msg1, #msg2, #msg3, #msg4, #msg5, #msg6, #msg7 {
	width: 600px;
	font-size: 18px;
	color: #ff3d00;
	padding-left: 315px;
	padding-right: 0px;
}
</style>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<nav class="navbar navbar-default">
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
				<h1>가입 안내</h1>
				<form action="createEmailAcount" name="form" id="form" method="post">
					<table id="joinInfo">
						<tr>
							<td>이메일</td>
							<td><input type="email" id="ce_email" onkeydown="keyEvt()"></td>
							<!-- 이메일 형식만 통과 되도록 -->
						</tr>
						<tr>
							<td colspan="2" id="msg1"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" maxlength="20" id="ce_pw"
								onkeydown="keyEvt()"></td>
							<!-- 12~20자 특수문자,숫자 포함 -->
						</tr>
						<tr>
							<td colspan="2" id="msg2"></td>
						</tr>
						<tr>
							<td>대표 사업자 번호</td>
							<td><input type="text" maxlength="12" id="c_code"
								onkeypress="onlyNum(this)" numberOnly="true"
								onkeydown="keyEvt()"></td>
							<!-- 필수입력 12자리 숫자만 -->
						</tr>
						<tr>
							<td colspan="2" id="msg3"></td>
						</tr>
						<tr>
							<td>사업자 계정 비밀번호</td>
							<td><input type="password" maxlength="20" id="c_pw"
								onkeydown="keyEvt()"></td>
							<!-- 필수입력 20자리 이내 -->
						</tr>
						<tr>
							<td colspan="2" id="msg4"></td>
						</tr>
						<tr>
							<td>사업자 상호</td>
							<td><input type="text" maxlength="30" id="c_name"
								onkeydown="keyEvt()"></td>
							<!-- 필수입력 30자리 이내 -->
						</tr>
						<tr>
							<td colspan="2" id="msg5"></td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td><input type="hidden" id="confmKey" name="confmKey"
								value=""> <input type="text" id="zipNo" name="zipNo"
								readonly style="width: 100px"> <input type="button"
								id="add" value="주소검색" onclick="goPopup();"></td>
						</tr>
						<tr>
							<td>도로명주소</td>
							<td><input type="text" id="roadAddrPart1" maxlength="50" style="width: 85%"
								onkeydown="keyEvt()"></td>
						</tr>
						<tr>
							<td>상세주소</td>
							<td><input type="text" id="addrDetail" style="width: 40%"
								value=""> <input type="text" id="roadAddrPart2"
								style="width: 40%" value=""></td>
						</tr>
						<tr>
							<td colspan="2" id="msg6"></td>
						</tr>
						<tr>
							<td>사업장 연락처</td>
							<td><input type="text" maxlength="11" id="c_phone"
								onkeypress="onlyNum(this)" numberOnly="true"></td>
							<!-- 필수입력 12자리 숫자만 -->
						</tr>
						<tr>
							<td colspan="2" id="msg7"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" id="btn"
								onclick="joinCmember()" value="회원 가입"></td>
						</tr>
					</table>
				</form>
			</nav>
		</div>
	</div>
</body>
<script type="text/javascript">
//숫자만 입력하는 함수
function onlyNum(obj) {
	if ((event.keyCode < 48) || (event.keyCode > 57))
		event.returnValue = false;

	$(document).on("keyup", "input:text[numberOnly]", function() {
		$(this).val($(this).val().replace(/[^0-9]/gi, ""));
	});
}

//주소 검색창
function goPopup() {
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("addr/addr.jsp", "pop",
			"width=570,height=420, scrollbars=yes, resizable=yes");
	document.getElementById("msg6").innerHTML = " ";

	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
		roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
		detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
		buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.roadAddrPart2.value = roadAddrPart2;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
}

function joinCmember(){ //회원 가입버튼 입력시 발동, 
	
	// 사업자번호 정규식
	var codeRule = /^(?=.*[0-9]).{12,12}$/;
	// 비밀번호 정규식
	var pwRule = /^(?=.*[a-zA-Z]{1,20})(?=.*[!@#$%^*-+]{1,20})(?=.*[0-9]{1,20}).{12,20}$/;

	// 이메일 정규식
	var mail = $("#ce_email").val();
	var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if ($('#ce_email').val() == "") {
		document.getElementById("msg1").innerHTML = "이메일을 입력해주세요!!";
		$('#ce_email').focus();
		return false;
	}  else if (mail.match(emailRule) == null) {
		document.getElementById("msg1").innerHTML = "이메일 형식에 맞게 입력해주세요!!";
		$('#ce_email').focus();
		return false;
	} else if (!pwRule.test($('#ce_pw').val().trim())) {
		document.getElementById("msg2").innerHTML = "특수문자 혼합하여 12~20자 입력하세요!!";
		$('#ce_pw').focus();
		return false;
	} else if (!codeRule.test($('#c_code').val().trim())) {
		document.getElementById("msg3").innerHTML = "숫자 12자리 입력하세요!!";
		$('#c_code').focus();
		return false;
	} else if (!pwRule.test($('#c_pw').val().trim())) {
		document.getElementById("msg4").innerHTML = "특수문자 혼합하여 12~20자 입력하세요!!";
		$('#c_pw').focus();
		return false;
	} else if ($('#c_name').val() == "") {
		document.getElementById("msg5").innerHTML = "상호명을 입력해주세요!!";
		$('#c_name').focus();
		return false;
	} else if ($('#roadAddrPart1').val() == "") {
		document.getElementById("msg6").innerHTML = "주소를 입력해주세요!!";
		$('#add').focus();
		return false;
	} else if ($('#c_phone').val() == "") {
		document.getElementById("msg7").innerHTML = "연락처를 입력해주세요!!";
		$('#c_phone').focus();
		return false;
	} 
	

	
	var ce_email = document.getElementById('email').value;
	var ce_pw = document.getElementById('pw').value;
	var c_code = document.getElementById('c_code').value;
	var c_pw = document.getElementById('c_pw').value;
	var c_name = document.getElementById('c_name').value;
	var c_address = document.getElementById('roadAddrPart1').value;
	var c_phone = document.getElementById('c_phone').value;

	 $.ajax({
		url : "rest/createEmailAcount",
		type : "post",
		data : {
			"ce_email" : ce_email,
			"ce_pw" : ce_pw,
			"c_code" : c_code,
			"c_pw" : c_pw,
			"c_name" : c_name,
			"c_address" : c_address,
			"c_phone" : c_phone
		},
		dataType : "json",
		success : createEmailAcountresult => {
			if(createEmailAcountresult){
				location.href = "cList?ce_email="+ce_email;
			}
		},
		error : data => {
			console.log("a");
		}
	});
	}
	
function keyEvt() { //오류메시지 없애기
	document.getElementById("msg1").innerHTML = " ";
	if ($('#pw').val() != "") {
		document.getElementById("msg2").innerHTML = " ";
	}
	document.getElementById("msg3").innerHTML = " ";
	if ($('#c_pw').val() != "") {
		document.getElementById("msg4").innerHTML = " ";
	}
	document.getElementById("msg5").innerHTML = " ";
	document.getElementById("msg7").innerHTML = " ";
}
</script>
</html>