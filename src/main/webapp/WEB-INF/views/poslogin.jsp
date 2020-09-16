<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>poslogin</title>
</head>
<body>
	<form action="empAcountlogin" method="post">
		<input id="emp_code" name="emp_code" value="${empAcountInfo.emp_code}" placeholder="사원번호" type="text">
		<input id="emp_pw" name="emp_pw" placeholder="사원 비밀 번호" type="password"><br/>
		<error>${empAcountInfo.error }</error><br/>
		<input type="submit" value="로그인"> <input type="button" value="사업체 리스트 보기" onclick="location.href = 'backClist'">
	</form>
</body>
</html>