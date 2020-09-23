<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
div {
	border: black 1px solid
}

#totalDiv {
	width: 1400px;
	height: 800px;
}

#divOne {
	width: 800px;
	height: 700px;
	float: left;
}

#divTwo {
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
			<input type="button" value="테이블 설정" onclick=""><br />
			<input type="button" value="직원 목록" onclick="includeAjax('empSettingFrm')"><br />
			<input type="button" value="직급 설정" onclick="includeAjax('postisionSettingFrmOn')"><br />
			<input type="button" value="권한 설정"	onclick="includeAjax('postionGrantSettingFrmOn')"><br />
			<input type="button" value="마스터 계정 비밀번호 변경" onclick="includeAjax('cSecurityCodeSettingFrmOn')"><br /> 
			<input type="button" value="키오스크 설정" onclick="location.href = 'kioskSettingFrm'"><br /> 
			<input type="button" value="나가기" onclick="location.href = 'posmain'"><br />
		</div>
	</div>
</body>
<script type="text/javascript" id="basicIncludeService">
	${basicPath}
	function includeAjax(url){
		$.ajax({
			url : url,
			success : function(html){
				$("#divOne").html(html);
			}
		})
	}
</script>
</html>