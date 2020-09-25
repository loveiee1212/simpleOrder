<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>requsetListSettingFrm</title>
</head>
<body>
	<h2>requsetListSettingFrm</h2>
	<form action="updateRequestList" method="post">
	<div id="reqList"></div>
	
	<input type="button" onclick="addRequest()" value ='요청사항 추가'> 
	<input type="submit" value ='요청사항 변경'>
	<input type="button" onclick="removeRequest()" value ='요청사항 제거'>
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