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

</body>
<script type="text/javascript">
$.ajax({
	url : "getRequsetList",
	success : function(data){
		console.log(data);
	}
});

</script>
</html>