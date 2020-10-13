<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" href="resources/image/smallLogo.png" type="image/x-icon">
<meta charset="UTF-8">
<title>requsetListSettingFrm</title>
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

input:focus, button:focus {
	outline: none;
}

#reqList {
   width: 900px;
   height: 350px;
}

.reqDivList {
    margin-top: -30px;
    margin-left: 70px;
    margin-bottom: 20px;
    display: inline-block;
}

.requestList {
   width: 150px;
   height: 100px;
   border: 3px solid #2565a3;
   color: #2565a3;
   font-size: 25px;
   text-align: center;
   margin: 20px;
   font-weight: bold;
}

#rq_kind {
   border: 3px solid #2565a3;
   width: 250px;
   height: 50px;
   font-size: 20px;
   margin-left: 43px;
   text-align: center;
}

#addRequest {
    text-align: center;
    border: 2px solid white;
    width: 250px;
    height: 60px;
    margin-top: 50px;
    margin-left: 25px;
    background-color: #2565a3;
    font-weight: bold;
    color: white;
    font-size: 20px;
}

#submit {
    text-align: center;
    border: 2px solid white;
    width: 250px;
    height: 60px;
    margin-left: 20px;
    background-color: #2565a3;
    font-weight: bold;
    color: white;
    font-size: 20px;
}

#removeRequest {
    text-align: center;
    border: 3px solid #2565a3;
    width: 250px;
    height: 60px;
    margin-left: 20px;
    background-color: white;
    font-weight: bold;
    color: red;
    font-size: 20px;
}

#updateRequest {
    width: 400px;
    height: 60px;
    border: none;
    background-color: #e3f2fd;
	color: #1565c0;
	font-weight: bold;
    font-size: 20px;
    margin-top: 30px;
    margin-right: 40px;
    float: right;
    text-align: center;
}

#msg1 {
	width: 500px;
	color: #ff3d00;
	font-size: 20px;
	margin-left: 55px;
	font-weight: bold;
}
</style>
</head>
<body>
	<h2>요청사항 수정</h2>
	<form name ='requsetListCRUD' action="" method="post" onsubmit="return requsetFrm()">
	<div id="reqList"></div>
	
	<input type="hidden" id='rq_num' name='rq_num'>
	<input type="text" id='rq_kind' name='rq_kind' placeholder="요청사항 입력" onkeydown="keyEvt()">
	<input type="button" id="addRequest" onclick="addRequests()" value ='요청사항 추가'> 
	<input type="button" id="removeRequest" onclick="removeRequests()" value ='요청사항 제거'>
	<div id="msg1"></div>
	<input type="button" id="updateRequest" onclick="updateRequests()" value ='변경 내역 저장'>
	</form>

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
function requsetFrm() { // 요청사항 추가 버튼 누르면 액션변경
	return false;
}

function keyEvt() { // 오류메세지 뜨고 난후 입력하면 공백처리
	document.getElementById("msg1").innerHTML = " ";
}

function updateRequests(){
	rq_num.remove();
	$("#rq_kind").remove();
	requsetListCRUD.action = 'updateRequest';
	requsetListCRUD.submit();
};
function addRequests(){
	if(rq_num.value < 10){
	requsetListCRUD.action = 'addRequest';
	/* requsetListCRUD.submit(); */
	}else{
		alert("요청사항은 9개까지 생성 가능합니다.");
	}
	if (requsetFrm()==false) { // 요청버튼 추가 누르면 유효성 검사
		if ($('#rq_kind').val() == "" && rq_num.value < 10) {
			document.getElementById("msg1").innerHTML = "요청사항을 입력해주세요!!";
			$('#rq_kind').focus();
			return false;
		}
		requsetListCRUD.submit();
	}
};
function removeRequests(){
	requsetListCRUD.action = 'removeRequest';
	requsetListCRUD.submit();
}
$.ajax({
	url : "rest/getRequsetList",
	dataType : "json",
	success : function(data){
		$("#reqList").append(data.reqList);
		 $("#rq_num").val($(".requestList").length+1);
         $(".requestList").attr("readonly",true); // 요청사항 리스트 읽기전용 활성화
	}
});

</script>
</html>