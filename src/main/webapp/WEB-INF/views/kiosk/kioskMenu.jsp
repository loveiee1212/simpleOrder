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
<style type="text/css">
#frame {
	width: 568px;
	height: auto;
	margin: auto;
	border: 1px solid black;
	
}
#bill{
	border: 1px solid black;
	width: 300px;
	height: 350px;
	margin: 20px;
}
.smallBox{
	border: 1px solid black;
	width: 150px;
	height: 80px;

}
#clickdiv ul li {
	display: inline;
	font-size: 24px;
	text-align: center;
}
</style>
<script type="text/javascript">
	$.ajax({
		url : 'rest/getreviewuse',
		type : 'post',
		success : function(data) {
			if (data == '-1') {
				$('#rvBtn').attr("onclick", "");
				$('#rvBtn').remove();
			}
		}
	});
	$.ajax({
		url : 'rest/getbilllist',
		type : 'post',
		dataType : 'json',
		success : function(data) {
			//계산서 html 삽입
			$('#billBody').html(data.bill);
			billSum();
			billPriceUpdate();
		},
		error : function(err) {
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
		$('#billSum').text("합계 " + sum + "원");
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
		<div id="bill">
			<strong>현재 주문 내역</strong><i id="bill_close_btn" class='fa fa-close'
				style='font-size: 36px'></i>
			<table>
				<tbody id="billBody">

				</tbody>
			</table>
		</div>
		<div id="seat" class="smallBox"></div>
		<div id="billSum" class="smallBox"></div>
		<div id="clickdiv" class="smallBox">
			<ul>
				<li id="date"></li>
				<li id="hours"></li>
				<li id="point">:</li>
				<li id="min"></li>
				<li id="point">:</li>
				<li id="sec"></li>
			</ul>
		</div>
		<input type="button" id="odBtn" value="주문추가"
			onclick="location.href='kioskorder'"> <input type="button"
			id="reqBtn" value="요청사항" onclick="location.href='kioskrequest'">
		<input type="button" id="rvBtn" value="이용후기"
			onclick="location.href='kioskreview'">
	</div>
	<script type="text/javascript">
		clockOn();
		/* 동적 시계 */
		function clockOn() {
			console.log("clock On");
			var monthNames = [ "01", "02", "03", "04", "05", "06", "07", "08",
					"09", "10", "11", "12" ];
			var dayNames = [ "일", "월", "화", "수", "목", "금", "토" ]
			var newDate = new Date();
			newDate.setDate(newDate.getDate());
			console.log(newDate.getFullYear() + "-"
					+ monthNames[newDate.getMonth()] + "-" + newDate.getDate()
					+ " " + dayNames[newDate.getDay()]);
			$('#date').html(
					newDate.getFullYear() + "-"
							+ monthNames[newDate.getMonth()] + "-"
							+ newDate.getDate() + " "
							+ dayNames[newDate.getDay()]);
			console.log($('#date'));
			setInterval(function() {
				var seconds = new Date().getSeconds();
				$("#sec").html((seconds < 10 ? "0" : "") + seconds);
			});

			setInterval(function() {
				var minutes = new Date().getMinutes();
				$("#min").html((minutes < 10 ? "0" : "") + minutes);
			});

			setInterval(function() {
				var hours = new Date().getHours();
				$("#hours").html((hours < 10 ? "0" : "") + hours);
			});
		};
	</script>
</body>
</html>