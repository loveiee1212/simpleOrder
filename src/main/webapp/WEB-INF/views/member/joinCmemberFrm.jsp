<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/basicBox.css" type="text/css">
</head>

<body>
		<table id="joinInfo">
			<tr>
				<td>이메일</td>
				<td><input type="text" id="email"></td>
				<!-- 이메일 형식만 통과 되도록 -->
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" maxlength="20" id="pw"></td>
				<!-- 12~20자 특수문자,숫자 포함 -->
			</tr>
			<tr>
				<td>대표 사업자 번호</td>
				<td><input type="number" maxlength="12" id="c_code"></td>
				<!-- 필수입력 12자리 숫자만 -->
			</tr>
			<tr>
				<td>사업자 계정 비밀번호</td>
				<td><input type="password" maxlength="20" id="c_pw"></td>
				<!-- 필수입력 20자리 이내 -->
			</tr>
			<tr>
				<td>사업자 상호</td>
				<td><input type="text" maxlength="30" id="c_name"></td>
			</tr>
			<!-- 필수입력 30자리 이내 -->
			<tr>
				<td>사업자 주소</td>
				<td><input type="text" maxlength="50" id="c_address"></td>
				<!-- 필수 입력 50자리 이내 !api 활용 해봐-->
			</tr>
			<tr>
				<td>사업장 연락처</td>
				<td><input type="number" maxlength="11" id="c_phone"></td>
				<!-- 필수입력 12자리 숫자만 -->
			</tr>

			<tr>
				<td><input type="button" onclick="joinCmember()" value="회원 가입"></td>
			</tr>
		</table>

</body>
<script type="text/javascript">

function joinCmember(){
console.log($('#joinInfo').serialize())
	var ce_email = document.getElementById('email').value
	var ce_pw = document.getElementById('pw').value
	var c_code = document.getElementById('c_code').value
	var c_pw = document.getElementById('c_pw').value
	var c_name = document.getElementById('c_name').value
	var c_address = document.getElementById('c_address').value
	var c_phone = document.getElementById('c_phone').value

	 $.ajax({
		url : "rest/joinCmember",
		type : "post",
		data : {
			"ce_email" : ce_email,
			"ce_pw" : ce_pw,
			"c_code" : c_code,
			"c_pw" : c_pw,
			"c_name" : c_name,
			"c_address" : c_address,
			"c_phone" : c_phone
		},
		success : data => {
			console.log(data);
		}		
	}) 
	}


</script>
</html>