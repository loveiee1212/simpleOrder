<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>reveiwUsagestatusFrm</title>
<style type="text/css">
body {
	background-color: #e3f2fd;
	font-family: 'NEXON Lv1 Gothic OTF Light';
}

@font-face {
	font-family: 'NEXON Lv1 Gothic OTF Light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

table {
	margin-top: 100px;
	margin-left: 200px;
}

th {
	font-size: 30px;
	text-align: center;
	width: 250px;
}

#active, #unactive, td {
    width: 50px;
    height: 50px;
    margin-top: 30px;
    margin-left: 100px;
}

#save {
    text-align: center;
    border: 2px solid white;
    width: 150px;
    height: 80px;
    margin-right: 50px;
    margin-top: 100px;
    background-color: #81d4fa;
    font-weight: bold;
    color: white;
    font-size: 25px;
    float: right;
}
</style>
</head>
<body>
<h2>리뷰 사용 여부</h2>
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
<input type="submit" id="save" value="저장">
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