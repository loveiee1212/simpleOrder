<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영수증 재출력</title>
<link rel="icon" href="resources/image/smallLogo.png" type="image/x-icon">
<style type="text/css">
body {
    font-size: 20px;
    font-weight: bold;
}

#proTable {
	width: 350px;
	height: 150px;
	text-align: center;
	margin-left: 100px;
	font-size: 20px;
	font-weight: bold;
}

#payTable {
	width: 400px;
	height: 120px;
	text-align: right;
	font-size: 20px;
	padding-right: 20px;
	margin-left : 70px;
}

#payTable th {
	float: left;
}
</style>
</head>
<body>
${cList}
${proList}
${payList}
${cashBills}
</body>
</html>