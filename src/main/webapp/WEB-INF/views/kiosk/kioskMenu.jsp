<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SimpleOrder</title>
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
	height: 70px;
	text-align: center;
	font-size: 30px;
	padding-top: 30px;
}

#billdiv {
	border: 2px solid #2565a3;
	width: 568px;
	height: 450px;
	margin-top: 10px;
}

#bill {
	width: 568px;
	height: 300px;
	float: left;
	overflow: auto;
	margin-top: 10px;
	font-weight: bold;
}

#bill::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: white;
}

#bill::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#bill::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	background-image: -webkit-gradient(linear, 0 0, 0 100%, color-stop(.5, rgba(255, 255, 255,
		.2)), color-stop(.5, transparent), to(transparent));
}

table {
	width: 568px;
	border-collapse: collapse;
}

td {
	height: 50px;
	font-size: 25px;
}

#b {
	font-size: 30px;
	text-align: center;
	background-color: #2565a3;
	color: white;
	height: 60px;
	padding-top: 20px;
}

.bill_pd_name {
	margin-left: 20px;
}

#aside {
	float: left;
	height: 70px;
}

#seat {
	border: 2px solid #2565a3;
	width: 568px;
	height: 60px;
	text-align: center;
	font-size: 30px;
	padding-top: 20px;
	font-weight: bold;
	margin-top: 10px;
}

#billSum {
	border: none;
	width: 560px;
	height: 40px;
	text-align: center;
	margin-top: 320px;
	font-size: 25px;
	padding-top: 10px;
	font-weight: bold;
}

#clickdiv {
	border: 2px solid #2565a3;
	width: 568px;
	height: 70px;
	text-align: center;
	font-size: 25px;
	font-weight: bold;
}

p {
	margin-top: 1px;
	float: left;
	margin-left: 70px;
}

#p {
	padding-top: 25px;
}

#clickdiv ul li {
	display: inline;
}

#odBtn {
	border: 2px solid white;
	background-color: #2565a3;
	font-size: 25px;
	font-weight: bold;
	color: white;
	height: 80px;
	width: 280px;
	margin-top: 20px;
	margin-left: 2px;
}

#reqBtn {
	border: 2px solid white;
	background-color: #2565a3;
	font-size: 25px;
	font-weight: bold;
	color: white;
	height: 80px;
	width: 280px;
	margin-top: 20px;
}

#rvBtn {
	border: 2px solid white;
	background-color: #e3f2fd;
	font-weight: bold;
	color: #2565a3;
	font-size: 25px;
	width: 580px;
	height: 80px;
}

input:focus {
	outline: none;
}

#billMsg {
	margin: 150px 0 0 195px;
	font-size: 20px;
}
</style>
</head>
<body>
	<div id="frame">
		<div id="header">
			<font>광고와 로고</font> ${resultMsg}
		</div>
		<div id="seat">
			<p>테이블 번호</p>
		</div>
		<div id="billdiv">
			<div id="b">
				<b>현재 주문 내역</b>
			</div>
			<div id="bill">
				<table>
					<tbody id="billBody">
					</tbody>
				</table>
			</div>
			<div id="billSum">
				<p>합계</p>
			</div>
		</div>
		<br>
		<div id="aside">
			<div id="clickdiv">
				<p id="p">이용시간</p>
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
		<div id="rvBtndiv">
			<input type="button" id="rvBtn" value="이용후기"
				onclick="location.href='kioskreview'">
		</div>
	</div>
</body>
	<script type="text/javascript">
	function getOrderNum(){
		setInterval(() => {
			$.ajax({
				url : "rest/getOrderNum",
				dataType : "html",
				success : function (data){
					if(data!=""){
						location.href = "kioskmenu";
					};
				}
			})
		}, 3000);
	}
	
	
		$.ajax({ // 테이블 번호,주문내역,이용시간
			url : 'rest/kioskmainready',
			type : 'post',
			dataType : 'json',
			success : function(data) {
				$('#billBody').html(data.bill); // 계산서
				billSum();
				billPriceUpdate();
				
				$('#seat').append(data.sc_name + " ");// 좌석확인
				$('#seat').append("${sessionScope.st_num}" + "번 테이블");
				
				
				if (data.oac_time == "null") { // 주문 여부 확인
					$("#min").html("주문을 추가해주세요");
					getOrderNum();
				} else {
					clockOn(data.oac_time,data.rvUseCode);
				}
				
				if(data.rvUseCode == '-1'){ // 리뷰 사용 여부 체크
					$("#rvBtn").remove();
				}
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

				sum += (price * cnt);
			}
			sum = sum.toLocaleString('en');
			$('#billSum').append(sum + "원");
		}
		function billPriceUpdate() {
			var pd_price = $('.bill_pd_price');
			var oh_cnt = $('.bill_oh_cnt');
			for (var i = 0; i < pd_price.length; i++) {
				var price = pd_price[i].innerText;
				var cnt = oh_cnt[i].innerText;
				price = Number(price).toLocaleString('en');
				pd_price[i].innerText = price + "원";
				oh_cnt[i].innerText = cnt + "개";
			}
		}

		/* 동적 시계 , 테이블 번호 확인*/
		function clockOn(oac_time, rvUseCode) {
			setInterval(function() {
				// 시작일시(주문 시간)
				var startDate = new Date(
						parseInt(oac_time.substring(0, 4), 10), parseInt(
								oac_time.substring(5, 7), 10) - 1, parseInt(
								oac_time.substring(8, 10), 10), parseInt(
								oac_time.substring(11, 13), 10), parseInt(
								oac_time.substring(14, 16), 10), parseInt(
								oac_time.substring(17, 19), 10));
				//현재 시각
				const date = new Date();
				const years = parseInt(date.getFullYear());
				const months = parseInt(date.getMonth());
				const days = parseInt(date.getDate());
				const hours = parseInt(date.getHours());
				const minutes = parseInt(date.getMinutes());
				const seconds = parseInt(date.getSeconds());
				// 종료일시
				var endDate = new Date(years, months, days, hours, minutes,
						seconds);
				// 두 일자(startTime, endTime) 사이의 차이를 구한다.
				var dateGap = endDate.getTime() - startDate.getTime();
				var timeGap = new Date(0, 0, 0, 0, 0, 0, endDate - startDate);

				// 두 일자(startTime, endTime) 사이의 간격을 "일-시간-분"으로 표시한다.
				//var diffDay = Math.floor(dateGap / (1000 * 60 * 60 * 24)); // 일수       
				var diffHour = timeGap.getHours(); // 시간
				var diffMin = timeGap.getMinutes(); // 분
				var diffSec = timeGap.getSeconds(); // 초

				$("#hour").html(diffHour + "시간 ");
				$("#min").html(diffMin + "분 ");
				$("#sec").html(diffSec + "초 ");
				//주문 상태 확인하기 세션에 테이블 번호 업데이트
				$.ajax({
					url : 'rest/getoacstatus',
					type : 'post',
					dataType : 'json',
					success : function(data) {
						//리뷰 사용여부 확인
						if('-1' == data.oac_status){
							if (rvUseCode == '-1') {
								location.href = 'kioskThanks';
							}else{
								location.href = 'kioskreview/'+data.oac_num 
							}
						}
					}
				});
			}, 1000);
			
		};
	</script>

</html>