<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>postisionSettingFrmon</title>
</head>
<body>
	<h2>직급 설정</h2>
	<table id="postionList">
		<tr>
			<th>직급명</th>
			<th>삭제</th>
			<th>수정</th>
		</tr>
	</table>
</body>
<script type="text/javascript">
	$.ajax({
		url : "rest/getPosition",
		type : "get",
		dataType : "json",
		success : function(data) {
			$("#postionList").append(data.positionList);
		}

	})
</script>
</html>