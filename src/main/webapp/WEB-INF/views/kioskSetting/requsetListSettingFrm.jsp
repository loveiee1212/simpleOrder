<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>requsetListSettingFrm</title>
</head>
<body>
	<h2>requsetListSettingFrm</h2>
	<form action="updateRequestList" method="post">
	<div id="reqList"></div>
	<input type="submit" value ='요청사항 변경'>
	</form>

</body>
<script type="text/javascript">
$.ajax({
	url : "rest/getRequsetList",
	dataType : "json",
	success : function(data){
		console.log(data)
		$("#reqList").append(data.reqList);
	}
});

</script>
</html>