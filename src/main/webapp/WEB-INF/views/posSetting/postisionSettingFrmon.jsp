<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>postisionSettingFrmon</title>
<style>
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
	color: #1565c0;
	font-weight: bold;
	text-align: center;
	width: 200px;
	height: 30px;
	background-color: white;
	margin-left: 310px;
	padding: 40px;
}

#postionList {
	width: 800px;
	height: 400px;
	text-align: center;
	font-size: 25px;
	margin-left: 50px;
	overflow-x: scroll;
	overflow-y: scroll;
	border-collapse: collapse;
	background-color: white;
}

#postionList::-webkit-scrollbar {
	width: 10px;
	height: 10px;
	background-color: #81d4fa;
}

#postionList::-webkit-scrollbar-thumb {
	background-color: #81d4fa;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#postionList::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#postionList td {
	border: 3px solid #81d4fa;
}

#postionList th {
	border: 3px solid white;
	border-top-color: #81d4fa;
	background-color: #81d4fa;
	color: white;
	padding: 15px;
}

#postionList input[type="text" i] {
	width: 200px;
	height: 30px;
	text-align: center;
	font-size: 25px;
	border: none;
}

.positionDeleteClass, .positionAddClass {
	width: 120px;
	height: 50px;
	text-align: center;
	font-size: 20px;
	background-color: #81d4fa;
	border: 3px solid white;
	color: white;
}

.positionAddClass {
	width: 400px;
	height: 70px;
	text-align: center;
	font-size: 30px;
	background-color: #81d4fa;
	border: 3px solid white;
	color: white;
}

.positionUpdateClass {
	width: 120px;
	height: 50px;
	text-align: center;
	font-size: 20px;
	background-color: white;
	border: 3px solid #81d4fa;
	color: #81d4fa;
}
</style>
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
	<form action="" name="updateordelete" method="post">
		<input id="pst_position" name="pst_position" hidden="hidden">
		<input id="pst_name" name="pst_name" hidden="hidden">
	</form>
</body>
<script>
	function updatePosition(element) {
		pst_position = element.parentNode.parentNode.getAttribute('id');
		pst_name = $("#" + pst_position).find('.pst_name').val();
		$("#pst_position").val(pst_position);
		$("#pst_name").val(pst_name);
		updateordelete.action = 'updatePosition';
		updateordelete.submit();
	}

	function deletePosition(element) {
		if (confirm("소속된 직원은 모두 대표권한으로 변경 됩니다. 직원 목록에서 다시 권한을 설정해주세요")) {
			pst_position = element.parentNode.parentNode.getAttribute('id');
			pst_name = $("#" + pst_position).find('.pst_name').val();
			$("#pst_position").val(pst_position);
			$("#pst_name").val(pst_name);
			updateordelete.action = 'deletePosition';
			updateordelete.submit();
		}
	}
	function createPosition() {
		if (confirm("새로운 직급은 권한이 없습니다. 권한설정에서 권한을 부여 후 사용해주세요")) {
			$("#pst_name").val($("#newPst_name").val());
			updateordelete.action = 'createPosition';
			updateordelete.submit();
		}
	}

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