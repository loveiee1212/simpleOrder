<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KioskMenu</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" href="resources/image/smallLogo.png"
	type="image/x-icon">
<style type="text/css">
body {
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

#header {
	border: 3px solid #e3f2fd;
	background-color: #e0e0e0;
	margin: 10px;
	height: 100px;
}

#bill {
	border: 3px solid #81d4fa;
	width: 300px;
	height: 400px;
	margin: 20px 10px 20px 20px;
	float: left;
	overflow: auto;
}

#bill::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: white;
}

#bill::-webkit-scrollbar {
	width: 10px;
	height: 10px;
	background-color: #81d4fa;
}

#bill::-webkit-scrollbar-thumb {
	background-color: #81d4fa;
	background-image: -webkit-gradient(linear, 0 0, 0 100%, color-stop(.5, rgba(255, 255, 255,
		.2)), color-stop(.5, transparent), to(transparent));
}

table {
	width: 300px;
	border-collapse: collapse;
}

td {
	height: 50px;
	font-size: 22px;
}

#b {
	font-size: 30px;
	margin: 20px 0 20px 55px;
}

.bill_pd_name {
	margin-left: 20px;
}

#aside {
	width: 200px;
	height: 450px;
	margin: 20px 20px 20px 10px;
	float: left;
}

#seat {
	border: 3px solid #81d4fa;
	width: 200px;
	height: 90px;
	text-align: center;
	font-size: 25px;
	padding-top: 20px;
}

#billSum {
	border: 3px solid #81d4fa;
	width: 200px;
	height: 100px;
	text-align: center;
	margin: 18px 1px;
	font-size: 25px;
	padding-top: 20px;
}

#clickdiv {
	border: 3px solid #81d4fa;
	width: 200px;
	height: 100px;
	text-align: center;
	margin: 18px 1px;
	font-size: 22px;
	padding-top: 20px;
}

p {
	margin-top: 1px;
}

#clickdiv ul li {
	display: inline;
}

#clickdiv ul {
	margin-top: 30px;
	margin-left: -35px;
}

#odBtn {
	border: 2px solid white;
	background-color: #81d4fa;
	font-size: 20px;
	font-weight: bold;
	color: white;
	height: 80px;
	width: 170px;
	margin: -20px 10px;
}

#reqBtn {
	border: 2px solid white;
	background-color: #81d4fa;
	font-size: 20px;
	font-weight: bold;
	color: white;
	height: 80px;
	width: 170px;
	margin-top: -20px;
}

#rvBtn {
	border: 2px solid white;
	width: 170px;
	height: 80px;
	background-color: #e3f2fd;
	font-weight: bold;
	color: #1565c0;
	font-size: 20px;
	margin: -20px 10px;
}

input:focus {
	outline: none;
}
</style>
<script type="text/javascript">
	$.ajax({
		url : 'rest/kioskmainready',
		type : 'post',
		dataType : 'json',
		success : function(data) {
			console.log(data);
			//계산서 html 삽입
			$('#billBody').html(data.bill);
			billSum();
			billPriceUpdate();
			//리뷰 사용여부 확인
			if (data.rvUseCode == '-1') {
				$('#rvBtn').attr("onclick", "");
				$('#rvBtn').remove();
			}
			//테이블 카테고리 적어주기
			$('#seat').html(
					data.sc_name + "<br>" + "${sessionScope.st_num}번 테이블");
			clockOn(data.oac_time);
		},
		error : function(err) {
			console.log(err);
			$('#billBody').html("주문내역이 없습니다");
		}
	});
	//계산서 안에 있는 상품 가격이랑 개수 합치기
	function billSum() {
		var bill_pd_price = $('.bill_pd_price');
		var bill_oh_cnt = $('.bill_oh_cnt');
		var sum = 0;
		for (var i = 0; i < bill_pd_price.length; i++) {
			var price = Number(bill_pd_price[i].innerText);
			var cnt = Number(bill_oh_cnt[i].innerText);

			console.log(price);
			sum += (price * cnt);
		}
		console.log(sum);
		sum = sum.toLocaleString('en');
		console.log(sum);
		$('#billSum').append(sum + "원");
	}
	function billPriceUpdate() {
		var pd_price = $('.bill_pd_price');
		var oh_cnt = $('.bill_oh_cnt');
		for (var i = 0; i < pd_price.length; i++) {
			var price = pd_price[i].innerText;
			var cnt = oh_cnt[i].innerText;
			price = Number(price).toLocaleString('en');
			console.log(price);
			pd_price[i].innerText = price + "원";
			oh_cnt[i].innerText = cnt + "개";
		}
	}
</script>
</head>
<body>
	<h2>kioskMenu.jsp</h2>
	<h2>${sessionScope.c_code}</h2>
	<h2>${sessionScope.bd_date}</h2>
	<h2>${sessionScope.sc_code}</h2>
	<h2>${sessionScope.st_num}</h2>
	<h2>${sessionScope.oac_num}</h2>
	<div id="frame">
		<div id="header">
			<font>광고와 로고</font>
		</div>
		<div id="bill">
			<div id="b">
				<b>현재 주문 내역</b>
			</div>
			<table>
				<tbody id="billBody">
				</tbody>
			</table>
		</div>
		<div id="aside">
			<div id="seat"></div>
			<div id="billSum">
				<p>합계</p>
			</div>
			<div id="clickdiv">
				<p>이용시간</p>
				<ul>
					<li id="hour"></li>
					<li id="min"></li>
					<li id="sec"></li>
				</ul>
			</div>
		</div>
		<input type="button" id="odBtn" value="주문추가"
			onclick="location.href='kioskorder'"> <input type="button"
			id="reqBtn" value="요청사항" onclick="location.href='kioskrequest'">
		<input type="button" id="rvBtn" value="이용후기"
			onclick="location.href='kioskreview'">
	</div>
	<script type="text/javascript">
		/* 동적 시계 */
		function clockOn(oac_time) {
			var newDate = new Date();
			newDate.setDate(newDate.getDate());
			var oac_hours = Number(60 * 60 * (oac_time.substring(11, 13)));
			var oac_minutes = Number(60 * (oac_time.substring(14, 16)));
			var oac_seconds = Number(oac_time.substring(17, 19));
			setInterval(function() {
				var seconds = new Date().getSeconds();
				var minutes = new Date().getMinutes();
				var hours = new Date().getHours();
				var now_seconds = Number(seconds < 10 ? "0" : "") + seconds;
				var now_minutes = 60 * (Number(minutes < 10 ? "0" : "") + minutes);
				var now_hours = 60 * 60 * (Number(hours < 10 ? "0" : "") + hours);
				var sum = (now_hours + now_minutes + now_seconds)
						- (oac_hours + oac_minutes + oac_seconds);
				$("#hour").html(parseInt(sum / 3600) + "시간  ");
				$("#min").html(parseInt((sum % 3600) / 60) + "분  ")
				$("#sec").html(sum % 60 + "초");
			});
		};
	</script>
</body>
</html>