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
	<table id="empList">
		<tr>
			<th>이름</th>
			<th>코드</th>
			<th>비밀번호</th>
			<th>직급</th>
		</tr>
	</table>
	<form name="empSettingForm" action="updateEMpInfo" method="post">
		<input type="hidden" name="_method" value="patch">
		<table>
			<tr>
				<th>직원 코드</th>
				<th>직원 이름</th>
			</tr>
			<tr>
				<td><input id="getEmpCode" name="empCode" type="text"
					readonly="readonly"></td>
				<td><input id="getEmpName" name="empName" type="text"></td>
			</tr>
			<tr>
				<th>직원 비밀번호</th>
				<th>직원 직급</th>
			</tr>
			<tr>
				<td><input id="getEmpPw" name="empPw" type="text"></td>
				<td><select id="getEmpPosition" name="empPosition">
				</select></td>
			</tr>
			<tr>${error}
			</tr>

			<tr>
				<td><input name="addORupdate" id="addORupdate" type="button" value="추가하기" onclick="addEmp2()"></td>
				<td><input type="button" value="삭제" onclick='delectEmpInfo()'></td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	function addEmp2() { //새로운 emp 추가
		
	}

	function addEmp1() { // 새로운 emp 추가 Frm 을 제공
		addORupdate.attributes[4].value = 'addEmp2()';
		addORupdate.value = '추가하기';
	}
	function updateEmpInfo() { // 새로운 직원 정보를 수정
		empSettingForm.action = 'updateEmpInfo';
		empSettingForm.submit();
	}
	function delectEmpInfo() { // 삭제 서브미트 발생시
		empSettingForm.action = 'delectEmpInfo';
		empSettingForm.submit();
	}

	getEmpPostionList();
	function getEmpPostionList() { // 세션의 저장된 사업체 코드로 직원의 목록 출력
		$.ajax({
			url : "rest/getEmpPostionList",
			type : "get",
			dataType : "json",
			success : function(data) {
				console.log(data);
				$("#empList").append(data.empList)
			},
		})
	}

	function empInfosetting(i) { // 아래 버튼을 수정 기능추가 및 명명, 수정하기 위해 정보 긁어오기
		addORupdate.attributes[4].value = 'updateEmpInfo()'
		addORupdate.value = '수정';
		$.ajax({
			url : "rest/getPositionList",
			type : "get",
			data : {
				"empPosition" : $("#" + i).children()[3].innerText
			},
			dataType : "json",
			success : function(data) {
				$("#getEmpPosition").html("");
				$("#getEmpPosition").append(data.positionList);
			}
		})
		$("#getEmpName").val($("#" + i).children()[0].innerText);
		$("#getEmpCode").val($("#" + i).children()[1].innerText);
		$("#getEmpPw").val($("#" + i).children()[2].innerText);
	}
</script>
</html>