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