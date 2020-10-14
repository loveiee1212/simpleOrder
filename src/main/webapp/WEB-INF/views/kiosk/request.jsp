<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>SimpleOrder</title>
<link rel="icon" href="resources/image/smallLogo.png" type="image/x-icon">
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

#frame {
	width: 568px;
	height: auto;
	margin: auto;
}

#msg {
	width: 568px;
	height: 500px;
	border: 3px solid #2565a3;
	margin-top: 200px;
	background-color: #2565a3;
	font-weight: bold;
	color: white;
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
		<div id="msg">
			<i class='fas fa-bell' style='font-size: 70px; color: black; margin-top: 50px;'></i>
			<div id="msg2">${requestInfo.sc_name}의</div>
			${requestInfo.st_num}번 테이블에서 <br> "${requestInfo.text}"요청 하였습니다.
		</div>
	</div>
</body>
<script type="text/javascript">
	setInterval(() => {
		location.href='./kioskrequest'
	}, 3000);
</script>
</html>