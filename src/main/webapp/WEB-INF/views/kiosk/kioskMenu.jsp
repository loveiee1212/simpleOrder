<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>현재 주문메뉴</title>
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
</style>
</head>
<body>
	<%-- <h2>kioskMenu.jsp</h2>
	<h2>${sessionScope.c_code}</h2>
	<h2>${sessionScope.bd_date}</h2>
	<h2>${sessionScope.sc_code}</h2>
	<h2>${sessionScope.st_num}</h2>
	<h2>${sessionScope.oac_num}</h2> --%>
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
	<script type="text/javascript">
		$.ajax({
			url : 'rest/kioskmainready',
			type : 'post',
			dataType : 'json',
			success : function(data) {
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
				$('#seat').append(data.sc_name+" ");
				$('#seat').append("${sessionScope.st_num}"+"번 테이블");
				if(data.oac_time=="null"){
					$("#min").html("주문을 추가해주세요");
				}else{
				clockOn(data.oac_time);
				}
			},
			error : function(err) {
				console.log(err);
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

		/* 동적 시계 */
		function clockOn(oac_time) {
			var newDate = new Date();
			newDate.setDate(newDate.getDate());
			var oac_hours = Number(60 * 60 * (oac_time.substring(11, 13)));
			var oac_minutes = Number(60 * (oac_time.substring(14, 16)));
			var oac_seconds = Number(oac_time.substring(17, 19));
			setInterval(
					function() {
						var seconds = new Date().getSeconds();
						var minutes = new Date().getMinutes();
						var hours = new Date().getHours();
						var now_seconds = Number(seconds < 10 ? "0" : "")
								+ seconds;
						var now_minutes = 60 * (Number(minutes < 10 ? "0" : "") + minutes);
						var now_hours = 60 * 60 * (Number(hours < 10 ? "0" : "") + hours);
						var sum = (now_hours + now_minutes + now_seconds)
								- (oac_hours + oac_minutes + oac_seconds);
						$("#hour").html(parseInt(sum / 3600) + "시간  ");
						$("#min").html(parseInt((sum % 3600) / 60) + "분  ");
						$("#sec").html(sum % 60 + "초");

						$.ajax({
							url : 'rest/getoacstatus',
							type : 'post',
							dataType : 'json',
							success : function(data) {
								if(data.view!=null){
								location.href = data.view;
								}
							}
						});

					}, 1000);
		};
	</script>
</body>
</html>