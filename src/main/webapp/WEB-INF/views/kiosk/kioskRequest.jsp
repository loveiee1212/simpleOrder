<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>kioskRequest</title>
<style>
</style>
</head>
<script>
	$.ajax({
		url : 'rest/getrequestlist',
		type : 'post',
		dataType : 'json',
		success : function(data) {
			console.log(data);
			$('#requestList').html(data.reqList);
		},
		error : function(err) {
			console.log(err);
		}
	});
</script>
<body>
	<h2>kioskRequest.jsp</h2>
	<div id="requestList"></div>
	<button>요청하기</button>

</body>
</html>