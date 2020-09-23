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
	overflow: auto;
}

#divTwo {
	width: 500px;
	height: 700px;
	float: left;
}
</style>
<meta charset="UTF-8">
<title>kioskSetting</title>
</head>
<body>
	<div id="totalDiv">
		<div id="divOne" >
			<h2>kioskSetting</h2>
		</div>
		<div id="divTwo">
			<input type="button" value="테이블별 QR코드 가져오기" onclick="includeAjax('kioskQrCodeListFrm')">
		</div>
	</div>
</body>
<script type="text/javascript" id="basicIncludeService">
function includeAjax(url){
	$.ajax({
		url : url,
		success : function(html){
			$("#divOne").html(html)
		}
		
	})
}
</script>
</html>