<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>main</title>
</head>
<body>


	id :
	<input type="text" name="ce_email" id="id" /> pw :
	<input type="password" name="ce_pw" id="pw" />
	<input type="button" value="로그인" onclick = "cEmailLogin()">
	<input type="button" value="회원가입" onclick = 'location.href = "joinEmailFrm"'></br>
	<div id="errorDiv"></div>
	
	</br>
	<div id="errorDiv"></div>
</body>
<script type="text/javascript">
function cEmailLogin(){
	$.ajax({
		url : "rest/cEmailLogin",
		type : "get",
		data : {
			"ce_email" : $("#id").val(),
			"ce_pw" : $("#pw").val()
		},
		dataType : "json",
		success : data =>{
			console.log(data);
			if(data){
				location.href = "cList?ce_email="+$("#id").val();
			}else{
			$("#errorDiv").text("아이디와 비밀번호가 일치하지 않습니다.")
			}
		}
	})
		
	
}
	
</script>

</html>