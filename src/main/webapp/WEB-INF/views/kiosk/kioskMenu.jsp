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

#bill {
	border: 1px solid black;
	width: 300px;
	height: 350px;
	margin: 20px 10px 20px 20px;
}

#aside {
	width: 200px;
	height: 350px;
	border: 1px solid black;
	margin: 20px 20px 20px 10px;
}

#aside div {
	border: 1px solid black;
	width: 150px;
	height: 90px;
	text-align: center;
	margin: 18px 24px;
}

#clickdiv ul li {
	display: inline;
}

tr, td {
	border: 1px solid black;
}

input[type="button"] {
	padding: 24px 50px;
	margin: 18px;
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
		<div id="bill">
			<strong>현재 주문 내역</strong><i id="bill_close_btn" class='fa fa-close'
				style='font-size: 36px'></i>
			<table>
				<tbody id="billBody">

				</tbody>
			</table>
		</div>
		<div id="aside">
			<div id="seat"></div>
			<div id="billSum"><p>합계</p></div>
			<div id="clickdiv">
			<p>이용시간</p>
				<ul>
					<li id="hour"></li>
					<li id="point">:</li>
					<li id="min"></li>
					<li id="point">:</li>
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
				var sum = (now_hours + now_minutes + now_seconds)-(oac_hours+oac_minutes+oac_seconds);
				$("#hour").html(parseInt(sum/3600)+"시간");
				$("#min").html(parseInt((sum%3600)/60)+"분")
				$("#sec").html(sum%60+"초");
			});
		};
	</script>
</body>
</html>