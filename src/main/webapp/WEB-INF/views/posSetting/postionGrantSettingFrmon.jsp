<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

h2 {
	font-size: 35px;
	color: #81d4fa;
	font-weight: bold;
	text-align: center;
	width: 200px;
	height: 30px;
	background-color: white;
	margin-left: 310px;
	padding: 40px;
}

#grantList {
	width: 2500px;
	border: 1px solid #81d4fa;
	border-collapse: collapse;
}

#grantList th {
	width: 300px;
	height: 70px;
	text-align: center;
	border: 3px solid #81d4fa;
	scrollbar-width: none;
	border-left-color: white;
	border-right-color: white;
	font-size: 25px;
	background-color: #81d4fa;
	color: white;
}

#grantList td {
    width: 300px;
    height: 50px;
    text-align: center;
    border: 3px solid #e1f5fe;
    border-left-color: white;
    border-right-color: white;
    font-size: 20px;
    font-weight: bold;
}

input[type=checkbox] {
	width: 30px;
	height: 30px;
}

#tadiv {
	width: 100%;
	height: 100%;
	overflow-x: hidden;
	overflow-y: hidden;
}

#tadiv:hover {
	width: 100%;
	height: 100%;
	overflow-x: scroll;
	overflow-y: scroll;
}

#tadiv::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: white;
}

#tadiv::-webkit-scrollbar {
	width: 10px;
	background-color: #81d4fa;
}

#tadiv::-webkit-scrollbar-thumb {
	background-color: #81d4fa;
	background-image: -webkit-gradient(linear, 0 0, 0 100%, color-stop(.5, rgba(255, 255, 255,
		.2)), color-stop(.5, transparent), to(transparent));
}

#submit {
	text-align: center;
	border: 2px solid white;
	width: 300px;
	height: 70px;
	margin-right: 40px;
	margin-top: 35px;
	background-color: #81d4fa;
	font-weight: bold;
	color: white;
	font-size: 25px;
	float: right;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>postionGrantSettingFrmon</title>
</head>
<body>
	<h2>권한 설정</h2>
	<form action="updatePositionGrant">
		<div id="tadiv">
			<table id="grantList">
				<tr>
					<th>직급명</th>
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
<!-- 				<th>키오스크 설정</th> -->
				</tr>
			</table>
		</div>
		<input type="submit" id="submit" value="저장">
	</form>
</body>
<script type="text/javascript">
	/* 	setInterval(function test() {
	 console.log($("#a").prop("checked"))
	 },90000) */
	$.ajax({ // 등급,권한 설정 창 노출
		url : "rest/getPositionGrant",
		type : "get",
		dataType : "json",
		success : function(hashmap) {
			$("#grantList").append(hashmap.positionGrantCheckBoxHtml);
			$(".00").attr('onclick', 'return false');
		}
	})
</script>
</html>