<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SimpleOrder</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/basicBox.css?after">
<link rel="icon" href="resources/image/smallLogo.png"
	type="image/x-icon">
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

#sellpagebtn, #endvcbtn, #schedulebtn, #stockbtn, #salesbtn, #creditbtn,
	#changevcbtn, #productbtn, #producreagistraitionbtn, #posSettingbtn,
	#empLogOutbtn, #emailLogoutbtn {
	width: 300px;
	height: 150px;
	border: 2px;
	margin: 20px 35px;
	text-align: center;
	background-color: #2565a3;
	font-size: 30px;
	color: white;
	font-weight: bold;
	border-radius: 10px;
}

input:focus, button:focus, select:focus {
	outline: none;
}

#changeTema {
	width: 180px;
	height: 50px;
	background-color: #0D0D0D;
	color: #fcfaff;
	font-size: 20px;
	font-weight: bold;
	border-radius: 20px;
	float: right;
}
</style>
<body>
	<div id="baseBox">
		<button type="button" id="changeTema" onclick="changeTema()">다크모드</button>
		<div id="baseinnerBox">
			<a class="navbar-brand" href="#" onclick='history.go(0)'><img
				src="resources/image/logo.png" alt="SimpleOrder 홈페이지"></a>
			<div>
				<input type="button" id="sellpagebtn" class='grantList'
					onclick="checkBd_date('sellpage')" value="판매"> <input
					type="button" id="endvcbtn" class='grantList'
					onclick="checkBd_date('endvc')" value="마감"> <input
					type="button" id="schedulebtn" class='grantList'
					onclick="checkBd_date('schedule')" value="근태"> <input
					type="button" id="stockbtn" class='grantList'
					onclick="checkBd_date('stockController')" value="재고 관리"> <input
					type="button" id="salesbtn" class='grantList'
					onclick="location.href = 'salescontrol'" value="매출 현황"> <input
					type="button" id="creditbtn" class='grantList'
					onclick="checkBd_date('creditcontrol')" value="외상 처리"> <input
					type="button" id="changevcbtn" class='grantList'
					onclick="checkBd_date('changevc')" value="시재 변경"> <input
					type="button" id="productbtn" class='grantList'
					onclick="location.href = 'productcontrol'" value="상품 관리"> <input
					type="button" id="producreagistraitionbtn" class='grantList'
					onclick="location.href = 'producreagistraition'" value="판매 상품 관리">
				<input type="button" id="posSettingbtn" class='grantList'
					onclick="location.href = 'posSetting'" value="포스 설정"> <input
					type="button" id="empLogOutbtn" class=''
					onclick="location.href = 'empLogOut'" value="사용자 전환">
				<button id="emailLogoutbtn" onclick="location.href ='emailLogout'">종료</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	//테마 시작
	if ("${temaBlack}" == "") {
		temaBlack = false;
	} else {
		temaBlack = JSON.parse('${temaBlack}');
	}
	changeTema();

	function temaChange(temaBlack) {
		$.ajax({
			url : "rest/temaChange",
			type : "post",
			data : {
				"temaBlack" : temaBlack
			}
		})
		return !temaBlack;
	}

	function changeTema() {
		if (temaBlack) {
			$('#changeTema').text("화이트모드");
			before = $("style").html();
			after = before.replaceAll("#0D0D0D", "#24619E");
			after = after.replaceAll("#2565a3", "#2B2B2B");
			after = after.replaceAll("#e3f2fd", "#141414");
			after = after.replaceAll("#ffffff", "#404040");
			after = after.replaceAll("#1565c0", "#F0F0F0");
			after = after.replaceAll("#90caf9", "#4F4F4F");
			after = after.replaceAll("#000000", "#F7F7F7");
			$("style").html(after);
			temaBlack = temaChange(true);
		} else {
			$('#changeTema').text("다크모드");
			before = $("style").html();
			after = before.replaceAll("#24619E", "#0D0D0D");
			after = after.replaceAll("#2B2B2B", "#2565a3");
			after = after.replaceAll("#141414", "#e3f2fd");
			after = after.replaceAll("#404040", "#ffffff");
			after = after.replaceAll("#F0F0F0", "#1565c0");
			after = after.replaceAll("#4F4F4F", "#90caf9");
			after = after.replaceAll("#F7F7F7", "#000000");
			$("style").html(after);
			temaBlack = temaChange(false);
		}
	}
	//테마 끝

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