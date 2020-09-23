<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
body {
	min-height: 0px;
	min-width: 0px;
}
</style>
<meta charset="UTF-8">
<title>kioskQrCodeListFrm</title>
</head>
<body>
	<h2>kioskQrCodeListFrm</h2>
	<table id="qrcodeList">
	<tr>
	<td> <img alt='qr코드' src='https://chart.googleapis.com/chart?cht=qr&chs=200x200&chl=http://localhost/simpleOrder/kioskSettingFrm/123123123/1/1'></td>
	</tr>
	</table>
</body>
<script type="text/javascript">
	$.ajax({
		url : 'rest/getQrCodeList',
		type : 'get',
		dataType : 'json',
		success : function(data) {
			console.log(data);
			console.log($("#qrcodeList"));
			$("#qrcodeList").html(data.tableQrcodeList);
		}

	})
</script>
</html>