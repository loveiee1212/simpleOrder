<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
		<input type="button" value="직원 목록" onclick="empSettingDivOn()"><br/>
		<input type="button" value="직급별 권한 설정" onclick="empSettingDivOn()"><br/>
		<input type="button" value="마스터 계정 비밀번호 변경" onclick=""><br/>
		<input type="button" value="키오스크 설정" onclick=""><br/>
		<input type="button" value="나가기" onclick=""><br/>
		</div>
	</div>
</body>
<script type="text/javascript" id="empSettingScript">
${requestScope.basicPath}
function empSettingDivOn(){//세션의 코드로 직원 목록 출력
	$.ajax({
		url : "empSettingFrm",
		success : function(data){
			$("#divOne").html(data);
		}
	})
}
</script>
<script type="text/javascript" id="">
</script>
</html>