<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>postionGrantSettingFrmon</title>
</head>
<body>
	<h2>직급별 권한 설정</h2>
	<table>
		<tr>
			<th>등급명</th>
			<th>판매</th>
			<th>마감</th>
			<th>근태</th>
			<th>재고 관리</th>
			<th>매출 현황</th>
			<th>외상 처리</th>
			<th>시재 변경</th>
			<th>상품 관리</th>
			<th>판매키 관리</th>
			<th>포스 설정</th>
			<th>키오스크 설정</th>
			<th>삭제</th>
		</tr>
		<tr>
			<td>사장님</td>
			<td> <input id="a" type="checkbox" checked="checked"> </td>
			<td> <input type="checkbox" checked> </td>
		</tr>

	</table>
</body>
<script type="text/javascript">
/* 	setInterval(function test() {
		console.log($("#a").prop("checked"))
	},90000) */


	$.ajax({
		url : "rest/getPositionGrant",
		success : function(data) {
			console.log(data);
		}
	})
</script>
</html>