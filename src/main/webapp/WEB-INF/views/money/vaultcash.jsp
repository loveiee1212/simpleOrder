<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/basicBox.css" type="text/css">
<!-- <link rel="stylesheet" href="resources/css/calendar.css?afte" type="text/css"> -->
<link rel="stylesheet" href="resources/css/clock.css?afte" type="text/css">
<link rel="icon" href="resources/image/smallLogo.png" type="image/x-icon">
<title>시재 - SimpleOrder</title>
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

#cashZone {
    border: 3px solid #81d4fa;
    height: 795px;
    width: 900px;
    float: left;
    background-color: white;
}

table, tr, td, th {
	border: 3px solid #81d4fa;
}

#cashZone table {
	width: 700px;
	height: 700px;
	position: absolute;
	margin-left: 98px;
	position: absolute;
	margin-top: 46px;
	border-collapse: collapse;
}

#cashZone th {
	width: 200px;
	font-size: 30px;
}

#cashZone td.leftTd {
	width: 99px;
}

td.leftTd input {
	width: 200px;
	height: 57px;
	border: 0px;
	font-size: 30px;
	text-align: center;
}

td.leftTd input:focus {
	outline: none;
}

td {
	font-size: 30px;
	text-align: center;
}

#vcZone table {
    border: 3px solid #81d4fa;
    font-size: 25px;
    width: 550px;
    height: 800px;
    float: right;
    border-collapse: collapse;
    background-color: white;
}

#clock {
	margin-top: 5px;
	margin-left: 70px;
	width: 400px;
	height: 150px;
}

#date {
    font-size: 40px;
    margin-top: 20px;
}

#clock ul {
	width: 400px;
	margin-left: -40px;
}

#clock ul li {
	font-size: 40px;
}

#insertVC {
	text-align: center;
	border: 2px solid white;
	width: 250px;
	height: 95px;
	background-color: #81d4fa;
	font-weight: bold;
	color: white;
	font-size: 25px;
}

#btn {
	text-align: center;
	border: 3px solid #81d4fa;
	width: 200px;
	height: 95px;
	margin-left: 20px;
	background-color: white;
	font-weight: bold;
	color: #81d4fa;
	font-size: 25px;
}

#vcZone th {
	width: 200px;
}

button:focus {
	outline: none;
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
	overflow: auto;
	border-collapse: collapse;
	text-align: center;
}

#main_layer::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#main_layer::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#main_layer::-webkit-scrollbar-thumb {
	background-color: #81d4fa;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#salesListdiv, #productListdiv {
    width: 680px;
    height: auto;
}

#salesList td {
	font-size: 20px;
	width: 150px;
	height: 20px;
	border: none;
	border-right: none;
	border-bottom: 2px solid #81d4fa;
}

#salesList, #productList {
    border-collapse: collapse;
    width: 700px;
    height: 700px;
    magin-bottom: 30px;
}

#salesList th, #productList th {
    border: 3px solid white;
    width: 80px;
    height: 20px;
    background-color: #81d4fa;
}

#productList td {
    height: 20px;
    border: none;
	border-right: none;
	border-bottom: 2px solid #81d4fa;
}

#productList {
    margin-bottom: 20px;
}

.pro th, .pro td {
    height: 30px;
}
</style>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<div id="cashZone">
				<table id="cashTable">
					<tr>
						<th>100000원</th>
						<td class="leftTd"><input id="10" class="num" type="number"
							placeholder="갯수입력" min="0"
							onchange="carculate(100000,value,'100000tx'),vctext()"></td>
						<td><div>
								<span id="100000tx" class="cash"></span>
							</div></td>
					</tr>
					<tr>
						<th>50000원</th>
						<td class="leftTd"><input id="09" class="num" type="number"
							min="0" placeholder="갯수입력"
							onchange="carculate(50000,value,'50000tx'), vctext()"></td>
						<td><div>
								<span id="50000tx" class="cash"></span>
							</div></td>
					</tr>
					<tr>
						<th>10000원</th>
						<td class="leftTd"><input id="08" class="num" type="number"
							min="0" placeholder="갯수입력"
							onchange="carculate(10000,value,'10000tx'), vctext()"></td>
						<td><div>
								<span id="10000tx" class="cash"></span>
							</div></td>
					</tr>
					<tr>
						<th>5000원</th>
						<td class="leftTd"><input id="07" class="num" type="number"
							min="0" placeholder="갯수입력"
							onchange="carculate(5000,value,'5000tx'), vctext()"></td>
						<td><div>
								<span id="5000tx" class="cash"></span>
							</div></td>
					</tr>
					<tr>
						<th>1000원</th>
						<td class="leftTd"><input id="06" class="num" type="number"
							min="0" placeholder="갯수입력"
							onchange="carculate(1000,value,'1000tx'), vctext()"></td>
						<td><div>
								<span id="1000tx" class="cash"></span>
							</div></td>
					</tr>
					<tr>
						<th>500원</th>
						<td class="leftTd"><input id="05" class="num" type="number"
							min="0" placeholder="갯수입력"
							onchange="carculate(500,value,'500tx'), vctext()"></td>
						<td><div>
								<span id="500tx" class="cash"></span>
							</div></td>
					</tr>
					<tr>
						<th>100원</th>
						<td class="leftTd"><input id="04" class="num" type="number"
							min="0" placeholder="갯수입력"
							onchange="carculate(100,value,'100tx'), vctext()"></td>
						<td><div>
								<span id="100tx" class="cash"></span>
							</div></td>
					</tr>
					<tr>
						<th>50원</th>
						<td class="leftTd"><input id="03" class="num" type="number"
							min="0" placeholder="갯수입력"
							onchange="carculate(50,value,'50tx'), vctext()"></td>
						<td><div>
								<span id="50tx" class="cash"></span>
							</div></td>
					</tr>
					<tr>
						<th>10원</th>
						<td class="leftTd"><input id="02" class="num" type="number"
							min="0" placeholder="갯수입력"
							onchange="carculate(10,value,'10tx'), vctext()"></td>
						<td><div>
								<span id="10tx" class="cash"></span>
							</div></td>
					</tr>
					<tr>
						<th>5원</th>
						<td class="leftTd"><input id="01" class="num" type="number"
							min="0" placeholder="갯수입력"
							onchange="carculate(5,value,'5tx'), vctext()"></td>
						<td><div>
								<span id="5tx" class="cash"></span>
							</div></td>
					</tr>
					<tr>
						<th>1원</th>
						<td class="leftTd"><input id="00" class="num" type="number"
							value="0" min="0" placeholder="갯수입력"
							onchange="carculate(1,value,'1tx'), vctext()"></td>
						<td><div>
								<span id="1tx" class="cash"></span>
							</div></td>
					</tr>
				</table>
			</div>
			<div id="vcZone">
				<table id="vcTable">
					<tr>
						<td colspan="2">
							<div id="clock">
								<div id="date"></div>
								<ul>
									<li id="hours"></li>
									<li class="point">:</li>
									<li id="min"></li>
									<li class="point">:</li>
									<li id="sec"></li>
								</ul>
							</div>
						</td>
					</tr>
					<tr>
						<th>시작시재</th>
						<td><div>
								<span id="differenceSC"></span>
							</div></td>
					</tr>
					<tr>
						<th>현금매출</th>
						<td><div>
								<span id="cash"></span>
							</div></td>
					</tr>
					<tr>
						<th>마감시재
						<td><div>
								<span id="differenceEC"></span>
							</div></td>
					</tr>
					<tr>
						<th>시재차</th>
						<td><div>
								<span id="difference"></span>
							</div></td>
					</tr>
					<tr>
						<td colspan="2"><button id="insertVC">시재저장</button>
							<button id="btn" onclick="location.href='posmain'">나가기</button></td>
					</tr>
				</table>
			</div>
				<!-- 모달박스 -->
				<div id="view_layer">
					<div id="bg_layer"></div>
					<div id="main_layer">
					<div id="month"></div>
					<div id="salesListdiv"><table id="salesList">
						<tr><th>구분</th><th>결제</th><th>외상</th><th>반품</th></tr>
						<tr><th>현금</th><td id="pay_cash"></td><td id="credit_cash"></td><td id="refund_cash"></td></tr>
						<tr><th>카드</th><td id="pay_card"></td><td id="credit_card"></td><td id="refund_card"></td></tr>
						<tr><th>미수금</th><td id="pay"></td><td id="credit"></td><td id="refund"></td></tr>
						<tr><th>총금액</th><td id="pay_total"></td><td id="credit_total"></td><td id="refund_total"></td></tr>
					</table>
					</div>
					<div id="productListdiv">
					<table id="productList">
						<tr><th>상품명</th><th>판매가</th><th>판매갯수</th><th>금액</th></tr>
					</table>
					</div>
					</div>
				</div>
				<div></div>
		</div>
	</div>
</body>

<script type="text/javascript">
	//시재 작업

	$(document).ready(function() {
		if ("${vc_status}" == "start") {
			$("#insertVC").text("시작시재입력");
			$("#insertVC").attr("onclick", "insertStartVC()");
		}

		if ("${vc_status}" == "end") {
			getStartVC();
			getCashSales();
			$("#insertVC").text("마감시재입력");
			$("#insertVC").attr("onclick", "insertEndVC()");
		}

		if ("${vc_status}" == "theEnd") {
			getStartVC();
			getCashSales();
			getEndVC();
			alert("영업이 종료되었습니다.");
		}
	})

	//시작시재 입력하기
	function insertStartVC() {
		var arr = new Array();

		var obj = new Object();
		obj.vc_code = 1;
		arr.push(obj);
		for (var i = 0; i < $(".num").length; i++) {
			var obj = new Object();
			obj.cu_code = $(".num").eq(i).attr("id");
			obj.vcd_cnt = $(".num").eq(i).val();
			if (obj.vcd_cnt != "") {
				arr.push(obj);
			}
		}
		var jArr = JSON.stringify(arr);

		$.ajax({
			type : "post",
			url : "rest/insertvc",
			data : jArr,
			contentType : "application/json; charset=UTF-8",
			dataType : "json",
			success : function(data) {
				if (data == "success") {
					alert("시제가 입력되었습니다.\r\n메인으로 이동합니다.");
					location.href = "posmain";
				} else if (data == "error") {
					alert("시제입력에 실패했습니다.");
				}
			}
		});
	}

	//마감시재 입력하기
	function insertEndVC() {
		if (confirm("마감하시겠습니까?")) {
			var arr = new Array();

			var obj = new Object();
			obj.vc_code = -1;
			arr.push(obj);
			for (var i = 0; i < $(".num").length; i++) {
				var obj = new Object();
				obj.cu_code = $(".num").eq(i).attr("id");
				obj.vcd_cnt = $(".num").eq(i).val();
				if (obj.vcd_cnt != "") {
					arr.push(obj);
				}
			}
			var jArr = JSON.stringify(arr);

			$.ajax({
				type : "post",
				url : "rest/insertvc",
				data : jArr,
				contentType : "application/json; charset=UTF-8",
				dataType : "json",
				success : function(data) {
					if (data == "success") {
						alert("마감이 완료되었습니다");
						getDaySales();
					} else if (data == "error") {
						alert("마감이 실패했습니다.");
					} else if (data == "notYet"){
						alert("아직 주문중인 테이블이 있습니다");
						location.href="endvc";
					}
				}
			});
		}
	}

	//시작시재 불러오기
	function getStartVC() {
		$.ajax({
			type : "get",
			url : "rest/getstartvc",
			dataType : "json",
			success : function(data) {
				$("#differenceSC").text(data);
			}
		});
	}

	//현금매출 불러오기
	function getCashSales() {
		$.ajax({
			type : "get",
			url : "rest/getcashsales",
			dataType : "json",
			success : function(data) {
				$("#cash").text(data);
				getDiff();
			}
		});
	}

	//마감시재 불러오기
	function getEndVC() {
		$.ajax({
			type : "get",
			url : "rest/getendvc",
			dataType : "json",
			success : function(data) {
				$("#differenceEC").text(data);
				getDiff();
			}
		});
	}

	function getDiff() {
		if($("#differenceEC").text() == ""){
			var diff = ($("#differenceSC").text())*1+($("#cash").text())*1;
		} else {
			var diff = (($("#differenceSC").text())*1+($("#cash").text())*1)-($("#differenceEC").text())*1
		}
		$("#difference").text(diff);
	}
</script>

<script type="text/javascript">
	//시제 계산
	function carculate(money, num, position) {
		var result = money * num;
		$("#" + position).text(result);
	}

	function vctext() {
		var sum = 0;
		for (var i = 0; i < $(".cash").length; i++) {
			sum += ($(".cash").eq(i).text()) * 1;
		}
		if ("${vc_status}" == "start") {
			$("#differenceSC").text(sum);
		} else if ("${vc_status}" == "end") {
			$("#differenceEC").text(sum);
			//시제차 텍스트 찍기
			$("#difference").text(
					($("#differenceSC").text()*1 + $("#cash").text()*1)
							- $("#differenceEC").text()*1);
		}

	}
</script>

<script type="text/javascript">
	//일별 매출 상세 불러오기
	function getDaySales(){
		$("#view_layer").addClass("open");
	
		$.ajax({
			type : "get",
			url : "rest/getdaysales",
			data : {
				'bd_date' : null
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
				
				if(data == "noSales") {
					alert("매출불러오기를 실패했습니다");
				}
			}
		});
	}

	//모달박스 해제
	var $layerWindow = $("#view_layer");
	$layerWindow.find("#bg_layer").on("mousedown", function(evt) {
		$layerWindow.removeClass("open");
		alert("메인페이지로 이동합니다");
		location.href="posmain";
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		clockOn();
	})
	//시계

	function clockOn() {
		var monthNames = [ "01", "02", "03", "04", "05", "06", "07", "08",
				"09", "10", "11", "12" ];
		var dayNames = [ "일", "월", "화", "수", "목", "금", "토" ]
		var newDate = new Date();
		newDate.setDate(newDate.getDate());
		$('#date').html(
				newDate.getFullYear() + " " + monthNames[newDate.getMonth()]
						+ " " + newDate.getDate() + " "
						+ dayNames[newDate.getDay()]);
		setInterval(function() {
			var seconds = new Date().getSeconds();
			$("#sec").html((seconds < 10 ? "0" : "") + seconds);
		}, 1000);

		setInterval(function() {
			var minutes = new Date().getMinutes();
			$("#min").html((minutes < 10 ? "0" : "") + minutes);
		}, 1000);

		setInterval(function() {
			var hours = new Date().getHours();
			$("#hours").html((hours < 10 ? "0" : "") + hours);
		}, 1000);
	}
</script>
</html>