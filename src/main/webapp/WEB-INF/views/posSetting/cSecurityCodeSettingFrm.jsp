<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>companyAPICodeChangeFrmOn</title>
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

h2 {
	font-size: 35px;
	color: #1565c0;
	font-weight: bold;
	text-align: center;
	width: 500px;
	height: 30px;
	background-color: white;
	margin-top: 50px;
	margin-left: 150px;
	padding: 50px;
}

#securityCode {
	width: 400px;
	height: 60px;
	text-align: center;
	font-size: 25px;
	border: 3px solid #2565a3;
	margin-top: 100px;
	margin-left: 80px;
}

#submit {
	text-align: center;
	border: 2px solid white;
	width: 300px;
	height: 70px;
	background-color: #2565a3;
	font-weight: bold;
	color: white;
	font-size: 25px;
	float: right;
	margin-top: 100px;
	margin-left: 30px;
}

input:focus, button:focus {
	outline: none;
}

</style>
</head>
<body>
<h2>키오스크 비밀번호 변경</h2>
	<form action="ChangeSecurityCode" name='securityCode' method="post">
		<table>
			<tr>
				<td><input type="text" id="securityCode" name="securityCode">
					<input type="submit" id="submit" value="비밀번호 수정"></td>
			</tr>
		</table>
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
	for(let i = 0 ; i < $("style").length ; i++){
		if (temaBlack) {
			$('#changeTema').text("화이트모드");
			before = $("style").eq(i).html();
			after = before.replaceAll("#0D0D0D", "#24619E");
			after = after.replaceAll("#2565a3", "#2B2B2B");
			after = after.replaceAll("#e3f2fd", "#141414");
			after = after.replaceAll("#ffffff", "#404040");
			after = after.replaceAll("#1565c0", "#F0F0F0");
			after = after.replaceAll("#90caf9", "#4F4F4F");
			after = after.replaceAll("#000000", "#F7F7F7");
			$("style").eq(i).html(after);
		} else {
			$('#changeTema').text("다크모드");
			before = $("style").eq(i).html();
			after = before.replaceAll("#24619E", "#0D0D0D");
			after = after.replaceAll("#2B2B2B", "#2565a3");
			after = after.replaceAll("#141414", "#e3f2fd");
			after = after.replaceAll("#404040", "#ffffff");
			after = after.replaceAll("#F0F0F0", "#1565c0");
			after = after.replaceAll("#4F4F4F", "#90caf9");
			after = after.replaceAll("#F7F7F7", "#000000");
			$("style").eq(i).html(after);
		}
	}
		if(temaBlack){
			temaBlack = temaChange(true);
		}else {
			temaBlack = temaChange(false);
		}
}
//테마 끝 */

	$.ajax({
		url : "rest/getCSecurityCode",
		type : "get",
		dataType : "json",
		success : function(data) {
			$("#securityCode").val(data.securityCode);
		}

	})
</script>
</html>