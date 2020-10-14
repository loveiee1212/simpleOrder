<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

#flotBoxDiv {
	z-index: 3;
	display: none;
}

#flotBoxDiv.on {
	display: inline;
	z-index: 4;
}

#flotBoxbg {
	/* background-color: black; */
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
td{
	color: #000000;
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/basicBox.css?after">
</head>
<body>


<button type="button" id="changeTema" onclick="changeTema()">다크모드</button>
	<div id="baseBox">
		<div id="baseinnerBox">
			<a class="navbar-brand" href="#" onclick='history.go(0)'><img
				src="resources/image/logo.png" alt="SimpleOrder 홈페이지"></a> <input
				type="button" id="btn3" onclick="location.href = 'emailLogout'"
				value="EMAIL 로그아웃">
			<div id="cListInfoDiv">
				<table id="cListInfo">
					<tr>
						<th onclick='sortContent(0)'>상호명</th>
						<th onclick='sortContent(1)'>사업자번호</th>
						<th onclick='sortContent(2)'>전화번호</th>
						<th onclick='sortContent(3)'>주소</th>
						<th colspan="2" onclick='sortContent(4)'>비고</th>
					</tr>
				</table>
			</div>
			<input type="button" id="btn1"
				onclick="location.href ='createccodefrm'" value="사업장 추가"> <input
				type="button" id="btn2" onclick="location.href = 'emailsales'"
				value="사업장 전체 매출">
			<div id="flotBoxDiv">
				<div id="flotBoxbg"></div>
				<div id="flotBox">
					<form name="cLogin" action="" onsubmit="return cloginTest()"
						method="post">
						<table id="cListtable">
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
//테마 끝
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

var sortType = 'asc'; 

function sortContent(index) {
    var table = $("#cListInfo");

    sortType = (sortType =='asc')?'desc' : 'asc';

    var checkSort = true;
    var rows = table[0].rows;
    console.log(rows)

    while (checkSort) { // 현재와 다음만 비교하기때문에 위치변경되면 다시 정렬해준다.
        checkSort = false;

        for (var i = 1; i < (rows.length-1); i++) {
           var fCell = rows[i].cells[index].innerHTML.toUpperCase();
            var sCell = rows[i + 1].cells[index].innerHTML.toUpperCase();
console.log(fCell);
console.log(sCell);

            var row = rows[i];
            // 오름차순<->내림차순 ( 이부분이 이해 잘안됬는데 오름차순이면 >, 내림차순이면 < 이고 if문의 내용은 동일하다 )
            if ( (sortType == 'asc' && fCell > sCell) || 
                    (sortType == 'desc' && fCell < sCell) ) {

                row.parentNode.insertBefore(row.nextSibling, row);
                checkSort = true;
            }
        }
    }
}
</script>

</html>