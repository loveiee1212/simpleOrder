<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

input:focus {
	outline: none;
}

#reqList {
width: 900px;
height: 350px;
}

.reqDivList {
width: 300px;
height: 40px;
margin-top: 30px;
margin-left: 100px;
display: inline-block;
}

.requestList {
width: 300px;
height: 40px;
margin-bottom: 20px;
border: 3px solid #81d4fa;
font-size: 20px;
}

#addRequest {
    text-align: center;
    border: 2px solid white;
    width: 250px;
    height: 60px;
    margin-top: 50px;
    margin-left: 45px;
    background-color: #81d4fa;
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
    background-color: #81d4fa;
    font-weight: bold;
    color: white;
    font-size: 20px;
}

#removeRequest {
text-align: center;
    border: 2px solid #81d4fa;
    width: 250px;
    height: 60px;
    margin-left: 20px;
    background-color: white;
    font-weight: bold;
    color: #81d4fa;
    font-size: 20px;
}

</style>
</head>
<body>
	<h2>요청사항 수정</h2>
	<form action="updateRequestList" method="post">
	<div id="reqList"></div>
	
	<input type="button" id="addRequest" onclick="addRequest()" value ='요청사항 추가'> 
	<input type="submit" id="submit" value ='요청사항 변경'>
	<input type="button" id="removeRequest" onclick="removeRequest()" value ='요청사항 제거'>
	</form>

</body>
<script type="text/javascript">
function addRequest(){
	let newReq_Num=$(".requestList").length+1;
	if(newReq_Num <10){
	$("<div>").appendTo($("#reqList")).append("<input class ='requestList' type = 'text' name = '"+newReq_Num+"'>").append("</div>")
	}else{
		alert("요청박스는 9개까지 생성 가능합니다.")
	}
}
function removeRequest(){
	let divlength=$(".reqDivList").length-1;
	console.log(divlength)
	$(".reqDivList").eq(divlength).remove();
}
$.ajax({
	url : "rest/getRequsetList",
	dataType : "json",
	success : function(data){
		$("#reqList").append(data.reqList);
	}
});

</script>
</html>