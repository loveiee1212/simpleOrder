<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>empSettingFrm</title>
</head>
<body>
	<h2>empSettingFrm</h2>
	<input type="button" onclick="fireEmpList(this)" value="퇴사자 목록"
		id="cListOption">
	<table id="empList">
	</table>
	<form name="empSettingForm" action=null method="post">
		<input id="method" type="hidden" name="_method" value="null">
		<table>
			<tr>
				<th>직원 코드</th>
				<th>직원 이름</th>
			</tr>
			<tr>
				<td><input id="getEmpCode" name="emp_code" type="text"
					readonly="readonly" class="empsetting"></td>
				<td><input id="getEmpName" name="emp_name" type="text"
					class="empsetting"></td>
			</tr>
			<tr>
				<th>직원 비밀번호</th>
				<th>직원 직급</th>
			</tr>
			<tr>
				<td><input id="getEmpPw" name="emp_pw" type="text"
					class="empsetting"></td>
				<td><select id="getEmpPosition" name="pst_position"
					class="empsetting">
				</select></td>
			</tr>
			<tr>${error}
			</tr>

			<tr>
				<td><input name="addORupdate" id="addORupdate" type="button"
					value="1" onclick="1"></td>
				<td><input id="delect" type="button" value="해고"
					onclick='fireEmpInfo()' hidden="hidden"></td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	getEmpList(1); // 상태가 1인 emp 노출

	createempSetting();

	function nowEmpList(data) {
		getEmpList(1); // 상태 1 emp 노출
		data.value = '퇴사자 목록';
		data.attributes[1].value = 'fireEmpList(this)';
	}
	function fireEmpList(data) {
		getEmpList(-1); // 상태 -1인 emp 노출
		data.value = '직원 목록';
		data.attributes[1].value = 'nowEmpList(this)';
		$("#getEmpPosition").html("");
		$("#delect").attr("hidden", "hidden");
	}
	function createempSetting() { // 새로운 emp 추가 Frm 을 제공
		$("#delect").attr("hidden", "hidden");
		addORupdate.attributes[4].value = 'createEmpInfo()';
		addORupdate.value = '추가하기';

		$.ajax({
			url : "rest/createEmpSetting",
			type : "get",
			dataType : "json",
			success : function(data) {
				$("#getEmpPosition").html("");
				$("#getEmpPosition").append(data.positionList);
				$("#getEmpCode").val(data.emp_code);
			}
		})
	}

	function createEmpInfo() { // form 액션 변경 후 서비밋 (추가)
		empSettingForm.action = 'createEmpInfo';
		$("#method").val("post");
		empSettingForm.submit();
	}

	function updateEmpInfo() { // form 엑션 변경 후 서브밋 (수정)
		empSettingForm.action = 'updateEmpInfo';
		$("#method").val("patch");
		empSettingForm.submit();

	}
	function fireEmpInfo() { // form 엑션 변경 후 서브밋 (해고)
		$("#method").val("patch");
		empSettingForm.action = 'fireEmpInfo';
		empSettingForm.submit();
	}

	function getEmpList(status) { // 세션의 저장된 사업체 코드로 직원의 목록 출력
		$.ajax({
			url : "rest/getEmpList",
			type : "get",
			data : {
				"emp_status" : status
			},
			dataType : "json",
			success : function(data) {
				$("#empList").html(data.empList);
			},
		})
	}

	function empInfosetting(index) { // 아래 버튼을 수정 기능추가 및 명명, 수정하기 위해 정보 긁어오기, 삭제 버튼 활성
		addORupdate.attributes[4].value = 'updateEmpInfo()'
		addORupdate.value = '수정';
		if ($("#cListOption").val() != '직원 목록') {
			$("#delect").removeAttr("hidden")
		}
		$("#method").val("patch");
		$.ajax({
			url : "rest/getPositionList",
			type : "get",
			data : {
				"empPosition" : $("#" + index).children()[3].innerText
			},
			dataType : "json",
			success : function(data) {
				$("#getEmpPosition").html("");
				$("#getEmpPosition").append(data.positionList);
			}
		})
		$("#getEmpName").val($("#" + index).children()[0].innerText);
		$("#getEmpCode").val($("#" + index).children()[1].innerText);
		$("#getEmpPw").val($("#" + index).children()[2].innerText);
	}
</script>
</html>