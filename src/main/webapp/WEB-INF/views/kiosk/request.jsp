<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>request</title>
<link rel="icon" href="resources/image/smallLogo.png" type="image/x-icon">
<style type="text/css">
#frame {
	width: 568px;
	height: auto;
	margin: auto;
}

#msg {
	width: 568px;
	height: 500px;
	border: 3px solid #81d4fa;
	margin-top: 250px;
	background-color: #e3f2fd;
	font-weight: bold;
	color: #1565c0;
	font-size: 40px;
	text-align: center;
	animation: blink-animation 1s steps(5, start) infinite alternate;
   -webkit-animation: blink-animation 1s steps(5, start) infinite alternate;
}

@keyframes blink-animation {
   from {
       visibility: visibility;
   }
   to {
       visibility: hidden;
   }
}

@-webkit-keyframes blink-animation {
   from {
       visibility: visibility;
   }
   to {
       visibility: hidden;
   }
}

.fas {
    margin-top: 20px;
}

#msg2 {
	margin-top: 80px;
}
</style>
</head>
<body>
	<div id="frame">
		<div id="msg" onclick="location.href='./kioskrequest'">
			<i class='fas fa-bell' style='font-size: 70px; color: black; margin-top: 50px;'></i>
			<div id="msg2">${sc_name}</div>
			${st_num} <br> ${text}하였습니다.
		</div>
	</div>
</body>
</html>