<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SimpleOrder</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/basicBox.css?after">
<link rel="icon" href="resources/image/smallLogo.png" type="image/x-icon">
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

img {
    width: 250px;
    margin-top: -70px;
    float: left;
}

h2 {
    margin-top: 10px;
	margin-left: 470px;
	text-decoration: underline;
	text-underline-position: under;
	color: #2563A1;
	font-weight: bold;
}

#createCcode {
	width: 700px;
	height: 700px;
	font-size: 20px;
	margin: 20px 400px;
	padding-left: 70px;
}

input:focus, button:focus {
	outline: none;
}

#c_code {
	width: 540px;
	height: 70px;
	margin-top: 5px;
	margin-left: 75px;
	font-size: 20px;
	border: 3px solid #2565a3;
}

#c_pw, #emp_name, #c_name {
	width: 540px;
	height: 70px;
	font-size: 20px;
	margin-left: 75px;
	margin-top: 10px;
	border: 3px solid #2565a3;
}

#c_phone {
	width: 540px;
	height: 70px;
	font-size: 20px;
	margin-left: 75px;
	margin-top: 10px;
	border: 3px solid #2565a3;
}

#zipNo, #roadAddrPart1, #addrDetail {
	font-size: 20px;
	margin-top: 10px;
	margin-left: 75px;
	border: 3px solid #2565a3;
}

#roadAddrPart2 {
	font-size: 20px;
	margin-left: 14px;
	border: 3px solid #2565a3;
}

#add {
	width: 150px;
	height: 70px;
	margin-left: 14px;
	border: 2px solid white;
	background-color: #2565a3;
	font-weight: bold;
	font-size: 20px;
	color: white;
}

#btn1 {
	width: 250px;
	height: 80px;
	border: 2px solid white;
	margin: 0px 20px 20px 75px;
	outline: 0;
	background-color: #2565a3;
	font-size: 25px;
	font-weight: bold;
	color: white;
}

#btn2 {
	width: 250px;
	height: 80px;
	border: 3px solid #2565a3;
	margin: 0px 30px 10px 13px;
	padding: 5px 10px;
	outline: 0;
	background-color: white;
	color: #2565a3;
	font-size: 25px;
	font-weight: bold;
}

error {
	margin-left: 70px;
	color: #ff3d00;
	font-weight: bold;
}

#msg1, #msg2, #msg3, #msg4, #msg5, #msg6 {
	width: 600px;
	font-size: 18px;
	color: #ff3d00;
	padding-left: 80px;
	font-weight: bold;
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
<body>
<button type="button" id="changeTema" onclick="changeTema()">다크모드</button>
	<div id="baseBox">
		<div id="baseinnerBox">
			<form action="createCcodeAcount" name="form" id="form" method="post" onsubmit="return test()">
				<a class="navbar-brand" href="main"><img src="resources/image/logo.png" alt="SimpleOrder 홈페이지"></a>
				<h2>접속중인 이메일 : ${ce_email}</h2>
				<input type="hidden" name="ce_email" value="${ce_email}"}>
				<table id="createCcode">
					<tr>
						<td><input id="c_code" name="c_code" onkeypress="onlyNum(this)" numberOnly="true" onkeydown="keyEvt()" value="${cCodeInfo.c_code}" type="text" placeholder="대표 사업자 번호 12자리" maxlength="12"></td>
					</tr>
					<tr><td id="msg1"></td></tr>
					<tr>
						<td><input id="c_pw" name="c_pw" type="password" placeholder="비밀번호 12~20자리" maxlength="20" onkeydown="keyEvt()" value="${cCodeInfo.c_pw}"></td>
					</tr>
					<tr><td id="msg2"></td></tr>
					<tr>
						<td><input id="emp_name" name="emp_name" value="${cCodeInfo.emp_name}" type="text" placeholder="사업자 대표명" maxlength="5" onkeydown="keyEvt()"></td>
					</tr>
					<tr><td id="msg3"></td></tr>
					<tr>
						<td><input type="hidden" id="confmKey" name="confmKey" value="${cCodeInfo.confmKey}">
						<input type="text" id="zipNo" name="zipNo" placeholder="우편번호" readonly style="width: 370px; height: 70px;" value="${acountInfo.zipNo}">
						<input type="button" id="add" value="주소검색" onclick="goPopup();"></td>
					</tr>
					<tr>
						<td><input type="text" id="roadAddrPart1" name="roadAddrPart1" placeholder="사업장 주소" readonly maxlength="50" style="width: 540px; height: 70px;" onkeydown="keyEvt()" value="${cCodeInfo.roadAddrPart1}"></td>
					</tr>
					<tr>
						<td><input type="text" id="addrDetail" name="addrDetail" style="width: 340px; height: 70px;" value="${cCodeInfo.addrDetail}" placeholder="상세주소">
						<input type="text" id="roadAddrPart2" style="width: 180px; height: 70px;" value="" placeholder="동" readonly value="${cCodeInfo.roadAddrpar2}" name="roadAddrPart2"></td>
					</tr>
					<tr><td id="msg4"></td></tr>
					<tr>
						<td><input id="c_name" name="c_name" value="${cCodeInfo.c_name}" type="text" placeholder="사업장 상호명"  onkeydown="keyEvt()"></td>
					</tr>
					<tr><td id="msg5"></td></tr>
					<tr>
						<td><input id="c_phone" name="c_phone" value="${cCodeInfo.c_phone}" type="text" placeholder="사업장 연락처  -없이 11자리" maxlength="11" onkeypress="onlyNum(this)" numberOnly="true"  onkeydown="keyEvt()"></td>
					</tr>
					<tr><td id="msg6"></td></tr>
					<tr>
						<td><error id="error"> ${cCodeInfo.error}</error></td>
					</tr>
					<tr>
						<td><input type="submit" id="btn1" value="사업장 추가">
						<input type="button" id="btn2" value="뒤로가기" onclick="location.href = 'cList'"></td>
					</tr>
				</table>
				<input type="text" style="display: none" name="c_address" id="address">
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
//테마 시작
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
		after = after.replaceAll("#2563A1", "#FAFAFA");
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
		after = after.replaceAll("#FAFAFA", "#2563A1");
		$("style").html(after);
		temaBlack = temaChange(false);
	}
}
//테마 끝
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
		document.getElementById("msg4").innerHTML = " ";

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

	function test() { //버튼 입력시 발동

		$("#address").val(
				$("#zipNo").val() + "#" + $("#roadAddrPart1").val() + "#"
						+ $("#addrDetail").val() + $("#roadAddrPart2").val()); // 주소 한줄로 만드는 코드

		// 사업자번호 정규식
		var codeRule = /^(?=.*[0-9]).{12,12}$/;
		// 비밀번호 정규식
		var pwRule = /^(?=.*[a-zA-Z]{1,20})(?=.*[!@#$%^*-+]{1,20})(?=.*[0-9]{1,20}).{12,20}$/;

		if (!codeRule.test($('#c_code').val().trim())) {
			document.getElementById("msg1").innerHTML = "숫자 12자리 입력하세요!!";
			$('#c_code').focus();
			return false;
		} else if (!pwRule.test($('#c_pw').val().trim())) {
			document.getElementById("msg2").innerHTML = "특수문자 혼합하여 12~20자 입력하세요!!";
			$('#c_pw').focus();
			return false;
		} else if ($('#emp_name').val() == "") {
			document.getElementById("msg3").innerHTML = "사업자 대표명을 입력해주세요!!";
			$('#emp_name').focus();
			return false;
		} else if ($('#roadAddrPart1').val() == "") {
			document.getElementById("msg4").innerHTML = "주소를 입력해주세요!!";
			$('#add').focus();
			return false;
		} else if ($('#c_name').val() == "") {
			document.getElementById("msg5").innerHTML = "상호명을 입력해주세요!!";
			$('#c_name').focus();
			return false;
		} else if ($('#c_phone').val() == "") {
			document.getElementById("msg6").innerHTML = "연락처를 입력해주세요!!";
			$('#c_phone').focus();
			return false;
		} else {
			return true;
		}
	}

	function keyEvt() { //오류메시지 없애기
		document.getElementById("msg1").innerHTML = " ";
		if ($('#c_pw').val() != "") {
			document.getElementById("msg2").innerHTML = " ";
		}
		document.getElementById("msg3").innerHTML = " ";
		document.getElementById("msg5").innerHTML = " ";
		document.getElementById("msg6").innerHTML = " ";
		document.getElementById("error").innerHTML = " ";
	}
</script>
</html>