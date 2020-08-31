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

	<table>
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
			<td><input type="button" onclick="joinCmember()" value="회원 가입"></td>
		</tr>
	</table>

</body>
<script type="text/javascript">

function joinCmember(){
	console.log("test")
	var email = document.getElementById('email').value
	var pw = document.getElementById('pw').value
	
	$.ajax({
		url : "rest/joinCmember",
		type : "post",
		data : {
			"email" : email,
			"pw" : pw
		},
		success : data => {
			console.log(data);
		}		
	})
	}


function joinCmemberEmail(email,pw){

};
</script>
</html>