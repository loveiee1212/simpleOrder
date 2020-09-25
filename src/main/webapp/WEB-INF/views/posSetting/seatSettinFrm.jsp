<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>seatSettinFrm</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h2>seatSettinFrm</h2>

<script type="text/javascript">
$.ajax({
	url : "rest/getSeatList",
	type : "get",
	success : function(data){
		console.log(data);
	}
	
})
</script>
</body>
</html>