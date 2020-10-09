<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 계정 가입 생성</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="resources/image/smallLogo.png" type="image/x-icon">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/basicBox.css?after">
</head>
<style>
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

#header {
	width: 1490px;
	height: 100px;
	background-color: #2565a3;
	margin-top: -30px;
	margin-left: -30px;
}

.navbar-default {
	background-color: #e3f2fd;
	border-color: #e3f2fd;
}

img {
    width: 200px;
    margin-top: -20px;
    margin-left: -80px;
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
	color: white;
	font-weight: bold;
}

.navbar-default .navbar-nav>li>a:hover {
	color: white;
	font-weight: bold;
}

#joinInfo {
	width: 700px;
	height: 590px;
	font-size: 20px;
	margin: 10px 370px;
}

td {
	padding: 0px 0px 5px 110px;
}

input:focus {
	outline: none;
}

#ce_email {
	width: 540px;
	height: 50px;
	font-size: 18px;
	margin-top: 15px;
	margin-left: -30px;
	border: 3px solid #2565a3;
}

#ce_pw, #c_code, #c_pw, #emp_name, #c_name {
	width: 540px;
	height: 50px;
	font-size: 18px;
	margin-left: -30px;
	border: 3px solid #2565a3;
}

#zipNo, #roadAddrPart1, #addrDetail {
	font-size: 18px;
	margin-left: -30px;
	margin-bottom: 5px;
	border: 3px solid #2565a3;
}

#add {
	width: 150px;
	height: 53px;
	margin-left: 4px;
	border: 2px solid white;
	background-color: #2565a3;
	font-weight: bold;
	color: white;
}

#c_phone {
	width: 540px;
	height: 50px;
	font-size: 18px;
	margin-top: -2px;
	margin-left: -30px;
	border: 3px solid #2565a3;
}

#btn {
	width: 540px;
	height: 50px;
	border: 2px solid white;
	margin: -5px -30px 5px;
	font-size: 25px;
	outline: 0;
	background-color: #2565a3;
	font-weight: bold;
	color: white;
}

#msg1, #msg2, #msg3, #msg4, #msg5, #msg6, #msg7, #msg8, #error {
	width: 600px;
	font-size: 18px;
	color: #ff3d00;
	padding-left: 80px;
	font-weight: bold;
}
</style>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<nav class="navbar navbar-default">
				<div id="header">
					<div class="navbar-header">
						<a class="navbar-brand" href="main"><img src="resources/image/logo.png" alt="SimpleOrder 홈페이지"></a>
						<!-- 포스 메인페이지 -->
					</div>
					<ul class="nav navbar-nav">
						<li><a href="productinfo">상품소개</a></li>
						<!-- 상품소개 페이지 -->
						<li><a href="joinEmailFrm">회원가입</a></li>
						<!-- 가입안내 페이지 -->
						<li><a href="mainskill">주요기능</a></li>
						<!-- 주요 기능 페이지 -->
					</ul>
				</div>
				<form action="createEmailAcount" name="form" id="form" method="post" onsubmit="return joinCmember()">
					<table id="joinInfo">
						<tr>
							<td><input type="email" id="ce_email" name="ce_email" placeholder="사업자 이메일" onkeydown="keyEvt()" value="${acountInfo.ce_email}"></td>
							<!-- 이메일 형식만 통과 되도록 -->
						</tr>
						<tr><td id="msg1"></td></tr>
						<tr>
							<td><input type="password" id="ce_pw" name="ce_pw" placeholder="비밀번호 특수문자 포함하여 12~20자리" maxlength="20" onkeydown="keyEvt()"></td>
							<!-- 12~20자 특수문자,숫자 포함 -->
						</tr>
						<tr><td id="msg2"></td></tr>
						<tr>
							<td><input type="text" id="c_code" name="c_code" placeholder="대표 사업자 번호 12자리" maxlength="12" onkeypress="onlyNum(this)" numberOnly="true" onkeydown="keyEvt()" value="${acountInfo.c_code}"></td>
							<!-- 필수입력 12자리 숫자만 -->
						</tr>
						<tr><td id="msg3"></td></tr>
						<tr>
							<td><input type="password" id="c_pw" name="c_pw" placeholder="대표 사업자 비밀번호 12~20자리" maxlength="20" onkeydown="keyEvt()"></td>
							<!-- 필수입력 20자리 이내 -->
						</tr>
						<tr><td id="msg4"></td></tr>
						<tr>
							<td><input type="text" id="emp_name" name="emp_name" placeholder="사업자 대표명" maxlength="5" onkeydown="keyEvt()" value="${acountInfo.emp_name}"></td>
							<!-- 필수입력 5자리 이내 -->
						</tr>
						<tr><td id="msg5"></td></tr>
						<tr>
							<td><input type="text" id="c_name" name="c_name" placeholder="사업자 상호명" maxlength="30" onkeydown="keyEvt()" value="${acountInfo.c_name}"></td>
							<!-- 필수입력 30자리 이내 -->
						</tr>
						<tr><td id="msg6"></td></tr>
						<tr>
							<td><input type="hidden" id="confmKey" name="confmKey" value="${acount.confmKey}">
							<input type="text" id="zipNo" name="zipNo" placeholder="우편번호" readonly style="width: 380px; height: 50px;" value="${acountInfo.zipNo}">
							<input type="button" id="add" value="주소검색" onclick="goPopup();"></td>
						</tr>
						<tr>
							<td><input type="text" id="roadAddrPart1" name="roadAddrPart1" placeholder="도로명 주소" readonly maxlength="50" style="width: 540px; height: 50px;" value="${acountInfo.roadAddrPart1}"></td>
						</tr>
						<tr>
							<td><input type="text" id="addrDetail" name="addrDetail" style="width: 383px; height: 50px;" value="${acountInfo.addrDetail}" placeholder="상세주소"  onkeydown="keyEvt()">
							<input type="text" id="roadAddrPart2" style="width: 150px; height: 50px; border: 3px solid #2565a3;" value="" placeholder="동" readonly value="${acountInfo.roadAddrpar2}" name="roadAddrPart2"></td>
						</tr>
						<tr><td id="msg7"></td></tr>
						<tr>
							<td><input type="text" id="c_phone" name="c_phone" placeholder="사업장 연락처  -없이 11자리" maxlength="11" onkeypress="onlyNum(this)" numberOnly="true" value="${acountInfo.c_phone}"></td>
							<!-- 필수입력 12자리 숫자만 -->
						</tr>
						<tr><td id="msg8"></td></tr>
						<tr><td id="error">${acountInfo.error}</td></tr>
						<tr>
							<td><input type="submit" id="btn" value="회원 가입"></td>
						</tr>
					</table>
					<input type="text" style="display: none" name="c_address" id="address">
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

	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	/* document.domain = "http://localhost/simpleOrder/"; */

	function goPopup() {
		/* window.name="jusoPopup"; */
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("addr/addr.jsp", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
		document.getElementById("msg7").innerHTML = " ";

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

	function joinCmember() { //회원 가입버튼 입력시 발동, 

		$("#address").val(
				$("#zipNo").val() + "#" + $("#roadAddrPart1").val() + "#"
						+ $("#addrDetail").val() + $("#roadAddrPart2").val()); // 주소 한줄로 만드는 코드

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
		} else if (mail.match(emailRule) == null) {
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
		} else if ($('#emp_name').val() == "") {
			document.getElementById("msg5").innerHTML = "사업자 대표명을 입력해주세요!!";
			$('#emp_name').focus();
			return false;
		} else if ($('#c_name').val() == "") {
			document.getElementById("msg6").innerHTML = "상호명을 입력해주세요!!";
			$('#c_name').focus();
			return false;
		} else if ($('#roadAddrPart1').val() == "") {
			document.getElementById("msg7").innerHTML = "주소를 입력해주세요!!";
			$('#add').focus();
			return false;
		} else if ($('#c_phone').val() == "") {
			document.getElementById("msg8").innerHTML = "연락처를 입력해주세요!!";
			$('#c_phone').focus();
			return false;
		} else {
			return true;
		}
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
		document.getElementById("msg6").innerHTML = " ";
		document.getElementById("msg8").innerHTML = " ";
		document.getElementById("error").innerHTML = " ";
	}
</script>
</html>