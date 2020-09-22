<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>companyAPICodeChangeFrmOn</title>
</head>
<body>
	<h2>cSecurityCodeSettingFrm</h2>
	<form action="ChangeSecurityCode" name='securityCode' method="post">
		<table>
			<tr>
				<td><input type="text" id="securityCode" name="securityCode">
					<input type="submit" value="비밀번호 수정"></td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	$.ajax({
		url : "rest/getCSecurityCode",
		type : "get",
		dataType : "json",
		success : function(data) {
			$("#securityCode").val(data.securityCode);
		}

	})
</script>
</html>