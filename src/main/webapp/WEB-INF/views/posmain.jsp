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
<link rel="icon" href="resources/image/smallLogo.png" type="image/x-icon">
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
    width: 300px;
    margin-left: 600px;
    margin-bottom: 40px;
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

#sellpagebtn, #endvcbtn, #schedulebtn, #stockbtn, #salesbtn, #creditbtn, #changevcbtn, #productbtn, #producreagistraitionbtn, #posSettingbtn, #empLogOutbtn, #emailLogoutbtn {
	width: 300px;
    height: 150px;
    border: 2px;
    margin: 20px 35px;
    text-align: center;
    background-color: #81d4fa;
    font-size: 30px;
    color: white;
    font-weight: bold;
    border-radius: 10px;
}

input:focus, button:focus {
	outline: none;
}
</style>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<a class="navbar-brand" href="main"><img
				src="resources/image/logo.png" alt="SimpleOrder 홈페이지"></a>
			<div>
			<input type="button" id="sellpagebtn" class='grantList' onclick="checkBd_date('sellpage')" value="판매">
			<input type="button" id="endvcbtn" class='grantList' onclick="checkBd_date('endvc')" value="마감"> 
			<input type="button" id="schedulebtn" class='grantList' onclick="checkBd_date('schedule')" value="근태">
			<input type="button" id="stockbtn" class='grantList' onclick="checkBd_date('stockController')" value="재고 관리"> 
			<input type="button" id="salesbtn" class='grantList' onclick="location.href = 'salescontrol'" value="매출 현황"> 
			<input type="button" id="creditbtn" class='grantList' onclick="checkBd_date('creditcontrol')" value="외상 처리">
			<input type="button" id="changevcbtn" class='grantList' onclick="checkBd_date('changevc')" value="시재 변경">
			<input type="button" id="productbtn" class='grantList' onclick="location.href = 'productcontrol'" value="상품 관리">
			<input type="button" id="producreagistraitionbtn" class='grantList' onclick="location.href = 'producreagistraition'" value="판매 상품 관리">
			<input type="button" id="posSettingbtn" class='grantList' onclick="location.href = 'posSetting'" value="포스 설정">
			<input type="button" id="empLogOutbtn" class='' onclick="location.href = 'empLogOut'" value="사용자 전환"> 
			<button id="emailLogoutbtn" onclick="location.href ='emailLogout'">종료</button>
		    </div>
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