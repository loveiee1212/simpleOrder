<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="accessSecurityCode" method="post">
		<table>
			<tr>
				<th>매장 인증 번호 입력</th>
			</tr>
			<tr>
				<th>광고</th>
			</tr>
			<tr>
				<td><input type="text" name='securityCode'
					placeholder="인증번호 입력" maxlength="4"></td>
				<td><input type="submit" value='인증'>
			</tr>
			<tr>
				<td>${error}</td>
			</tr>
		</table>
	</form>
	<div>
		그냥 확인용 css 작업간 삭제 가능
		<h2>kioskLogin</h2>
		<h2>${sessionScope.c_code}</h2>
		<h2>${sessionScope.bd_date}</h2>
		<h2>${sessionScope.sc_code}</h2>
		<h2>${sessionScope.st_num}</h2>
		<h2>${sessionScope.oac_num}</h2>
	</div>
</body>
</html>