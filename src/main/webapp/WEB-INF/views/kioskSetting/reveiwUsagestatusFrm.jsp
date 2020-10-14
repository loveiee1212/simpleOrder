<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>reveiwUsagestatusFrm</title>
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

table {
	margin-top: 100px;
	margin-left: 200px;
}

th {
	font-size: 30px;
	text-align: center;
	width: 250px;
}

#active, #unactive, td {
    width: 50px;
    height: 50px;
    margin-top: 30px;
    margin-left: 100px;
}

#save {
    text-align: center;
    border: 2px solid white;
    width: 150px;
    height: 80px;
    margin-right: 50px;
    margin-top: 100px;
    background-color: #2565a3;
    font-weight: bold;
    color: white;
    font-size: 25px;
    float: right;
}
</style>
</head>
<body>
<h2>리뷰 사용 여부</h2>
<form action="updatereveiwUsagestatus" method="post">
<!-- <form action="test" method="post"> -->
<table>
<tr>
	<th>사용</th>
	<th>비사용</th>
</tr>

<tr>
	<td><input type="radio" name = 'c_reviewuse' value='1' id="active"></td>
	<td><input type="radio" name = 'c_reviewuse' value='-1' id='unactive'></td>
</tr>
</table>
<input type="submit" id="save" value="저장">
</form>


	
</body>
<script type="text/javascript">

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
$.ajax({
	url : "rest/getreveiwUsagestatus",
	type : "get",
	dataType : "json",
	success : function (result){
		if(result){
			$("#active").attr("checked","checked");
		}else{
			$("#unactive").attr("checked","checked");
		}
	}
})
</script>
</html>