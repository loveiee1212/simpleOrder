<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SimpleOrder-매출현황</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/basicBox.css?after">
<link rel="stylesheet" href="resources/css/calendar.css?afte" type="text/css">
<link rel="stylesheet" href="resources/css/clock.css?afte" type="text/css">
<style>
	#calendar {
	 width: 1450px;
	}
	td.dt {
	width: 110px;
	}
	.sales{
	 background-color: gold;
	}
	#view_layer {
	display: none;
	position: fixed;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

#view_layer.open {
	display: block;
	color: gold;
}

#bg_layer {
	position: absolute;
	top: 0;
	left: 0;
	width: 1600px;
	height: 1000px;
	background: white;
	opacity: 0.5;
	filter: alpha(opacity = 50);
	z-index: 100;
}

#main_layer {
	position: absolute;
	top: 30%;
	left: 40%;
	width: 700px;
	height: 670px;
	margin: -150px 0 0 -194px;
	padding: 28px 28px 0 28px;
	border: 3px solid #81d4fa;
	background: #fff;
	font-size: 18px;
	z-index: 200;
	color: #767676;
	line-height: normal;
	white-space: normal;
	overflow: scroll;
	border-collapse: collapse;
	text-align: center;
}

#main_layer td {
	font-size: 20px;
	height: 40px;
	padding-top: 10px;
}
</style>
</head>
<body>

	<div id="baseBox">
		<div id="baseinnerBox">
			<div id="calendar">
				<div id="calendar_top">
					<div id="emp_codeList"></div>
					<div id="btn">
						<label id="prevMonth"><button class="moveButton"
								onclick="movePrevMonth()">◁</button></label> <span id="yearMonth"></span>
						<label id="nextMonth"><button class="moveButton"
								onclick="moveNextMonth()">▷</button></label>
					</div>
				</div>
				<div id="calendar_main"></div>

				<!-- 모달박스 -->
				<div id="view_layer">
					<div id="bg_layer"></div>
					<div id="main_layer">
					<div id="month"></div>
					<table id="salesList">
						<tr><th>구분</th><th>결제</th><th>외상</th><th>반품</th></tr>
						<tr><th>현금</th><td id="pay_cash"></td><td id="credit_cash"></td><td id="refund_cash"></td></tr>
						<tr><th>카드</th><td id="pay_card"></td><td id="credit_card"></td><td id="refund_card"></td></tr>
						<tr><th>미수금</th><td id="pay"></td><td id="credit"></td><td id="refund"></td></tr>
						<tr><th>총금액</th><td id="pay_total"></td><td id="credit_total"></td><td id="refund_total"></td></tr>
					</table>
					<table id="productList">
						<tr><th>상품명</th><th>판매가</th><th>판매갯수</th><th>금액</th></tr>
					</table>
					</div>
				</div>

				<button onclick="inputMonth()">월별매출보기</button>
				<button id="Exit" onclick="location.href='changevc'">나가기</button>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		makeCalendar();
		resetDay();
		showDay();
		
	});

	//캘린더 생성
	function makeCalendar() {
		var table = "";
		table += "<table class='calendarTbl'>";
		table += "<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th><th>SALES</th></tr>";
		for (var i = 0; i < 6; i++) {
			table += "<tr height='109'>";
			for (var j = 0; j < 7; j++) {
				table += "<td class='dt' style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap'>";
				table += "<div class='day'></div>";
				table += "<pre class='text' id='text"+i+"n"+j+"'></pre></td>";
				if(j==6){
					table += "<td class='sales' style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap'>";
					table += "<pre width='100' class='salesText' id='weekText"+i+"'></pre></td>";
				}
			}
			if(i==5){
				table += "<tr height='109'>";
				for (var j = 0; j < 7; j++) {
					table += "<td class='sales' style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap'>";
					table += "<pre width='100' class='salesText' id='dayText"+j+"'></pre></td>";
					if(j==6){
						table += "<td class='sales' style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap'>";
						table += "<pre width='100' class='salesText' id='allText'></pre></td>";
					}
				}
			}
			table += "</tr>";
		}
		table += "</table>"
		$("#calendar_main").html(table);
	}

	function resetDay() {
		today = new Date();
		year = today.getFullYear();
		month = today.getMonth() + 1;
		hour = today.getHours();
		minute = today.getMinutes();
		second = today.getSeconds();
		firstDay = new Date(year, month - 1, 1);
		lastDay = new Date(year, month, 0);
		$tdDay = $(".day");
		$tdText = $(".text");
		dayCount = 0;
	}

	function showDay() {
		if (month < 10) {
			month = String("0" + month);
		}
		$("#yearMonth").text(year + " " + month);

		//해당일을 표시
		for (var i = firstDay.getDay(); i < firstDay.getDay()
				+ lastDay.getDate(); i++) {
			++dayCount;

			$tdDay.eq(i).text(dayCount);
			$(".dt").eq(i).attr("onclick", "getDaySales(" + dayCount + ")");

			if ($tdDay.eq(i).text() == today.getDate()) {
				if (month == today.getMonth() + 1) {
					if (year == today.getFullYear()) {
						$(".dt").eq(i).css("background-color", "#81d4fa");
					}
				}
			}
		}
		getMonthSales(dayCount);
		
		$("#showAllWorkTime").attr("onclick",
				"showAllWorkTime(" + dayCount + ")");

		for (var i = 0; i < 42; i += 7) {
			$tdDay.eq(i).css("color", "red");
		}
		for (var i = 6; i < 42; i += 7) {
			$tdDay.eq(i).css("color", "blue");
		}
	}

	function movePrevMonth() {
		month--;
		if (month <= 0) {
			month = 12;
			year--;
		}
		showNewInfo();
	}

	function moveNextMonth() {
		month++;
		if (month > 12) {
			month = 1;
			year++;
		}
		showNewInfo();
	}

	function showNewInfo() {
		for (var i = 0; i < 56; i++) {
			$tdDay.eq(i).text("");
			$tdText.eq(i).text("");
			$(".dt").eq(i).css("background-color", "white");
		}
		$(".salesText").text("");
		
		dayCount = 0;
		firstDay = new Date(year, month - 1, 1);
		lastDay = new Date(year, month, 0);
		showDay();
	}
</script>

<script type="text/javascript">
	//한달 매출 불러오기
	function getMonthSales(day){
		$.ajax({
			type : "get",
			url : "rest/getmonthsales",
			data : {
				'l_date' : year + "-" + month + "-" + day,
				'f_date' : year + "-" + month + "-" + 01
			},
			dataType : "json",
			success : function(data) {
				$tdText.text("");
				
				var cash = 0;
				var card = 0;
				var get_pay = 0;
				var credit = 0;
				var bd_date = null;
				var bd_dateYM = null;
				
				for (var i in data) {

					if (data[i].BD_DATE != null) {
						bd_date = moment(data[i].BD_DATE).format("DD");
						bd_dateYM = moment(data[i].BD_DATE).format("YYYY MM");
					}

					cash += (data[i].CASH)*1;
					card += (data[i].CARD)*1;
					
					if (data[i].OAC_NAME == "외상") {
						credit = data[i].TOTAL_PAY
					}
				}

					for (var j = firstDay.getDay(); j < firstDay.getDay()
							+ lastDay.getDate(); j++) {

						if (bd_dateYM == $("#yearMonth").text()) {
							if (bd_date == $tdDay.eq(j).text()) {
								
									$tdText.eq(j).append($("<span class='cash'>").html(
											"현금 : " + cash)).append($("<span class='card'>").html( "\r\n카드 : " + card
											)).append($("<span class='total'>").html( "\r\n총매출 : " + (card+cash)*1 + "\r\n"));
								
								if (data[i].OAC_NAME == "외상") {
									$tdText.eq(j).append($("<span class='credit'>").html(
													"외상 : " + credit + "\r\n"));
								}
							}
						}
					}
				
				salesCalculator();
			}
		});
	}
	
	//매출 합계 계산
	function salesCalculator(){
		//주별 합계 & 월 합계
		var allCash = 0;
		var allCard = 0;
		var allTotal = 0;
		var allCredit = 0;
		for (var i=0; i<6; i++){
			var cash = 0;
			var card = 0;
			var total =0;
			var credit = 0;
			for (var j=0; j<7; j++){
				cash += ($("#text"+i+"n"+j).children(".cash").text().slice(5))*1;
				card += ($("#text"+i+"n"+j).children(".card").text().slice(6))*1;
				total += ($("#text"+i+"n"+j).children(".total").text().slice(7))*1;
				credit += ($("#text"+i+"n"+j).children(".credit").text().slice(5))*1;
				
				allCash += ($("#text"+i+"n"+j).children(".cash").text().slice(5))*1;
				allCard += ($("#text"+i+"n"+j).children(".card").text().slice(6))*1;
				allTotal += ($("#text"+i+"n"+j).children(".total").text().slice(7))*1;
				allCredit += ($("#text"+i+"n"+j).children(".credit").text().slice(5))*1;
			}
			if(total!=0){
				$("#weekText"+i).text("현금 : " + cash+"\r\n카드 : " + card+"\r\n총매출 : " + total + "\r\n외상 : " + credit);
				$("#allText").text("현금 : " + allCash+"\r\n카드 : " + allCard+"\r\n총매출 : " + allTotal + "\r\n외상 : " + allCredit);
			} else {
				$("#weekText"+i).text("");
			}
		}
		//요일별 합계
		for (var i=0; i<7; i++){
			var cash = 0;
			var card = 0;
			var total =0;
			var credit = 0;
			for (var j=0; j<6; j++){
				cash += ($("#text"+j+"n"+i).children(".cash").text().slice(5))*1;
				card += ($("#text"+j+"n"+i).children(".card").text().slice(6))*1;
				total += ($("#text"+j+"n"+i).children(".total").text().slice(7))*1;
				credit += ($("#text"+j+"n"+i).children(".credit").text().slice(5))*1;
			}
			if(total!=0){
				$("#dayText"+i).text("현금 : " + cash+"\r\n카드 : " + card+"\r\n총매출 : " + total + "\r\n외상 : " + credit);
			} else {
				$("#dayText"+i).text("");
			}
		}
	}
</script>
<script type="text/javascript">
	//한달 매출 상세 불러오기
	function inputMonth(){
		$("#view_layer").addClass("open");
		$("#month").find("input").remove();
		var date = moment($("#yearMonth").text()).format("YYYY-MM");
		$("#month").append($("<input id='monthSelect' type='month' onchange='getMonthDetail()' value='"+date+"'>"));
		getMonthDetail();
	}
	
	function getMonthDetail() {

		 $.ajax({
			type : "get",
			url : "rest/getmonthdetail",
			data : {
				'bd_date' : moment($("#monthSelect").val() + "-" + 01).format("YYYY-MM-DD")
			},
			dataType : "json",
			success : function(data) {
				$("#salesList").find("td").text("");
				$(".pro").remove();
				
				for(var sales of data.salesList){
					var cash = sales.CASH;
					var card = sales.CARD;
					if (sales.OAC_NAME == "결제"){
						$("#pay_cash").text(cash);
						$("#pay_card").text(card);
					}
					if (sales.OAC_NAME == "외상"){
						$("#credit_cash").text(cash);
						$("#credit_card").text(card);
					}
					if (sales.OAC_NAME == "반품"){
						$("#refund_cash").text(cash*-1);
						$("#refund_card").text(card*-1);
					}
				}
				for (var total of data.totalSales){
					var totalPay = total.TOTAL_PAY;
					if (total.OAC_NAME == "결제"){
						$("#pay_total").text(totalPay);
						$("#pay").text($("#pay_total").text()*-1-($("#pay_cash").text()*-1+$("#pay_card").text()*-1));
					}
					if (total.OAC_NAME == "외상"){
						$("#credit_total").text(totalPay);
						$("#credit").text($("#credit_total").text()*-1-($("#credit_cash").text()*-1+$("#credit_card").text()*-1));
					}
					if (total.OAC_NAME == "반품"){
						$("#refund_total").text(totalPay*-1);
						$("#refund").text($("#refund_total").text()*1-($("#refund_cash").text()*1+$("#refund_card").text()*1));
					}
				}
				
				var tr = "";
				tr += "<tr class='pro'><th colspan='4'>결제상품</th>";
				for (var product of data.productList){
					tr += "'<tr class='pro'><td>"+product.PD_NAME+"</td>'";
					tr += "'<td>"+product.PD_PRICE+"</td>'";
					tr += "'<td>"+product.OH_CNT+"</td>'";
					tr += "'<td>"+(product.PD_PRICE*1)*(product.OH_CNT*1)+"</td>'";
				}
				$("#productList").append(tr);
				tr="";
				tr += "<tr class='pro'><th colspan='4'>반품상품</th>";
				for (var refund of data.refundList){
					tr += "'<tr class='pro'><td>"+refund.PD_NAME+"</td>'";
					tr += "'<td>"+refund.PD_PRICE+"</td>'";
					tr += "'<td>"+refund.OH_CNT+"</td>'";
					tr += "'<td>"+(refund.PD_PRICE*1)*(refund.OH_CNT*1)+"</td>'";
				}
				$("#productList").append(tr);
				
			}
		}); 
	}
		
</script>

<script type="text/javascript">
	//일별 매출 상세 불러오기
	function getDaySales(day){
		$("#view_layer").addClass("open");
		$("#month").find("input").remove();
		
		$.ajax({
			type : "get",
			url : "rest/getdaysales",
			data : {
				'bd_date' : moment($("#yearMonth").text() + "-" + day).format("YYYY-MM-DD")
			},
			dataType : "json",
			success : function(data) {
				$("#salesList").find("td").text("");
				$(".pro").remove();
				
				for(var sales of data.salesList){
					var cash = sales.CASH;
					var card = sales.CARD;
					if (sales.OAC_NAME == "결제"){
						$("#pay_cash").text(cash);
						$("#pay_card").text(card);
					}
					if (sales.OAC_NAME == "외상"){
						$("#credit_cash").text(cash);
						$("#credit_card").text(card);
					}
					if (sales.OAC_NAME == "반품"){
						$("#refund_cash").text(cash*-1);
						$("#refund_card").text(card*-1);
					}
				}
				for (var total of data.totalSales){
					var totalPay = total.TOTAL_PAY;
					if (total.OAC_NAME == "결제"){
						$("#pay_total").text(totalPay);
						$("#pay").text($("#pay_total").text()*-1-($("#pay_cash").text()*-1+$("#pay_card").text()*-1));
					}
					if (total.OAC_NAME == "외상"){
						$("#credit_total").text(totalPay);
						$("#credit").text($("#credit_total").text()*-1-($("#credit_cash").text()*-1+$("#credit_card").text()*-1));
					}
					if (total.OAC_NAME == "반품"){
						$("#refund_total").text(totalPay*-1);
						$("#refund").text($("#refund_total").text()*1-($("#refund_cash").text()*1+$("#refund_card").text()*1));
					}
				}
				
				var tr = "";
				tr += "<tr class='pro'><th colspan='4'>결제상품</th>";
				for (var product of data.productList){
					tr += "'<tr class='pro'><td>"+product.PD_NAME+"</td>'";
					tr += "'<td>"+product.PD_PRICE+"</td>'";
					tr += "'<td>"+product.OH_CNT+"</td>'";
					tr += "'<td>"+(product.PD_PRICE*1)*(product.OH_CNT*1)+"</td>'";
				}
				$("#productList").append(tr);
				tr="";
				tr += "<tr class='pro'><th colspan='4'>반품상품</th>";
				for (var refund of data.refundList){
					tr += "'<tr class='pro'><td>"+refund.PD_NAME+"</td>'";
					tr += "'<td>"+refund.PD_PRICE+"</td>'";
					tr += "'<td>"+refund.OH_CNT+"</td>'";
					tr += "'<td>"+(refund.PD_PRICE*1)*(refund.OH_CNT*1)+"</td>'";
				}
				$("#productList").append(tr);
				
			}
		});
	}

	//모달박스 해제
	var $layerWindow = $("#view_layer");
	$layerWindow.find("#bg_layer").on("mousedown", function(evt) {
		$layerWindow.removeClass("open");
	});
</script>
</html>