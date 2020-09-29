<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>reveiwUsagestatusFrm</title>
</head>
<body>
<h2>reveiwUsagestatusFrm</h2>
<form action="updatereveiwUsagestatus" method="post">
<!-- <form action="test" method="post"> -->
<table>
<tr>
	<th>사용</th>
	<th>비사용</th>
</tr>

<tr>
	<td><input type="radio" name = 'c_reviewuse' value='1' id="active"></td>
	<td><input type="radio" name = 'c_reviewuse' value='-1' id='unactive'></td>
</tr>
</table>
<input type="submit" value="저장">
</form>


	
</body>
<script type="text/javascript">
$.ajax({
	url : "rest/getreveiwUsagestatus",
	type : "get",
	dataType : "json",
	success : function (result){
		if(result){
			$("#active").attr("checked","checked");
		}else{
			$("#unactive").attr("checked","checked");
		}
	}
})
</script>
</html>