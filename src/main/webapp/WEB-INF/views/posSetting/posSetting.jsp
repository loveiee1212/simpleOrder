<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
div {
	border: black 1px solid
}
#totalDiv{
width: 1200px;
height: 800px;
}
#divOne,#divTwo{
width: 500px;
height: 700px;
float: left;
}
</style>
<meta charset="UTF-8">
<title>posSetting</title>
</head>
<body>
	<div id="totalDiv">
		<div id="divOne"></div>
		<div id="divTwo">
		<input type="button" value="테이블 설정" onclick=""><br/>
		<input type="button" value="직원 목록" onclick=""><br/>
		<input type="button" value="직급별 권한 설정" onclick=""><br/>
		<input type="button" value="마스터 계정 비밀번호 변경" onclick=""><br/>
		<input type="button" value="키오스크 설정" onclick=""><br/>
		<input type="button" value="나가기" onclick=""><br/>
		</div>
	</div>
</body>
</html>