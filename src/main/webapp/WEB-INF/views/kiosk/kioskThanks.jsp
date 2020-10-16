<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SimpleOrder</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
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
	width: 1000px;
    height: 2400px;
	border: 3px solid #2565a3;
	background-color: #2565a3;
	font-weight: bold;
	color: #ffffff;
	font-size: 45px;
	text-align: center;
	animation: blink-animation 1s steps(5, start) infinite alternate;
	-webkit-animation: blink-animation 1s steps(5, start) infinite alternate;
}

@
keyframes blink-animation {from { visibility:visibility;
	
}

to {
	visibility: hidden;
}

}
@
-webkit-keyframes blink-animation {from { visibility:visibility;
	
}

to {
	visibility: hidden;
}

}

.far {
    margin-top: 100px;
}

#msg2 {
    margin-top: 700px;
    font-size: 80px;
}
</style>
</head>
<body>
	<div id="frame">
		<div id="msg">
			<div id="msg2">이용해주셔서 감사합니다</div><i class='far fa-grin-beam' style='font-size: 100px'></i>
		</div>
	</div>
</body>
</html>