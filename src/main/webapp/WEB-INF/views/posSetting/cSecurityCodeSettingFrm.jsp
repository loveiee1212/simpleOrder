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
	border: 3px solid #81d4fa;
	margin-top: 100px;
	margin-left: 80px;
}

#submit {
	text-align: center;
	border: 2px solid white;
	width: 300px;
	height: 70px;
	background-color: #81d4fa;
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