<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>posmain</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/basicBox.css?after">
</head>
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

img {
	width: 250px;
	margin-top: -30px;
	margin-right: -230px;
	float: left;
}

h2 {
	text-align: center;
	font-size: 60px;
	font-family: 'NEXON Lv1 Gothic OTF';
	margin-top: 80px;
}

@font-face {
	font-family: 'NEXON Lv1 Gothic OTF';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#btn {
	width: 300px;
	height: 150px;
	border: 2px;
	margin: 20px 35px;
	text-align: center;
	background-color: #81d4fa;
	font-size: 30px;
	color: white;
}
</style>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<a class="navbar-brand" href="main"><img
				src="resources/image/logo.png" alt="SimpleOrder 홈페이지"></a>
			<h2>PosMain</h2>
			<input type="button" id="btn" class='grantList'	onclick="checkBd_date('sellpage')" value="판매">
			<input type="button" id="btn" class='grantList'	onclick="location.href = 'endvc'" value="마감"> 
			<input type="button" id="btn" class='' onclick="location.href = 'empLogOut'" value="사용자 전환"> 
			<input type="button" id="btn" class='grantList'	onclick="checkBd_date('schedule')" value="근태">
			<input type="button" id="btn" class='grantList'	onclick="location.href = ''" value="재고 관리"> 
			<input type="button" id="btn" class='grantList'	onclick="location.href = ''" value="매출 현황"> 
			<input type="button" id="btn" class='grantList' onclick="checkBd_date('kimsangIron')" value="외상 처리">
			<input type="button" id="btn" class='grantList'	onclick="checkBd_date('changevc')" value="시재 변경">
			<input type="button" id="btn" class='grantList' onclick="location.href = ''" value="상품 관리">
			<input type="button" id="btn" class='grantList'	onclick="location.href = ''" value="판매 상품 관리">
			<input type="button" id="btn" class='grantList'	onclick="location.href = 'posSetting'" value="포스 설정">
			<button id="btn" onclick="location.href ='emailLogout'">종료</button>
		</div>
	</div>
</body>
<script type="text/javascript">
	let data = ${grantList};
	for (let i = 0; i < data.length; i++) {
		if (!data[i]) {
			$(".grantList").eq(i).attr("hidden", "hidden")
		}
	}


	//영업일 확인
	function checkBd_date(position) {
		$.ajax({
					type : "get",
					url : "rest/checkbd_date",
					dataType : "json",
					success : function(data) {
						if (data == "startVC") {
							if (confirm("영업시작전입니다\r\n영업을 시작하시겠습니까?\r\n'확인'을 누르시면 시작시재로 이동합니다.")) {
								location.href = data;
							}
						}
						if (data == "havaBd_date") {
							location.href = position;
						}
						if (data == "error") {
							location.href = data;
						}
					}
				});
	}
</script>
</html>