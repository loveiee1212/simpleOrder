<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>sellAndorder-판매</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/basicBox.css?after">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

.innerdiv {
	border: 3px solid #81d4fa;
	width: 740px;
	height: 800px;
	float: left;
	background-color: white;
}

.innerdiv2 {
	border: 3px solid #81d4fa;
	width: 740px;
	height: 800px;
	float: left;
}

#listbox button {
	width: 70px;
	height: 50px;
	color: red;
	background-color: white;
	border: none;
	font-size: 20px;
	box-shadow: none;
}

#listbox button:focus {
	outline: none;
}

#listbox {
    background-color: white;
    border: 3px solid #81d4fa;
    width: 700px;
    height: 400px;
    margin-left: 17px;
    margin-top: 10px;
    border-collapse: collapse;
    overflow: auto;
}

#listbox::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: white;
}

#listbox::-webkit-scrollbar {
	width: 10px;
	background-color: #81d4fa;
}

#listbox::-webkit-scrollbar-thumb {
	background-color: #81d4fa;
	background-image: -webkit-gradient(linear, 0 0, 0 100%, color-stop(.5, rgba(255, 255, 255,
		.2)), color-stop(.5, transparent), to(transparent));
}

div #listbox tr, td {
	border: none;
	border-bottom: 3px solid #81d4fa;
	width: 80px;
	height: 20px;
	padding: 20px;
	margin: 30px;
	text-align: center;
	font-size: 20px;
}

#moneylist {
	border-top: none;
	border: 3px solid #81d4fa;
	width: 700px;
	height: 70px;
	margin-left: 17px;
	background-color: white;
	font-size: 20px;
}

#moneylist ul li {
	list-style: none;
	float: left;
	margin-left: 15px;
}

li input {
	width: 80px;
	font-size: 20px;
}

.bottombox {
	width: 300px;
	height: 280px;
	margin-top: 15px;
	margin-left: 45px;
	float: left;
}

#paymentkind ul li {
	list-style: none;
	width: 80px;
	height: 30px;
	margin-top: 5px;
	margin-left: 9px;
	margin-right: -5px;
	text-align: center;
	padding: 20px;
	float: left;
	font-size: 20px;
}

#keypad ul li {
	list-style: none;
	border: 1px solid white;
	background-color: #81d4fa;
	color: white;
	width: 30px;
	height: 20px;
	text-align: center;
	padding: 20px;
	float: left;
	font-size: 20px;
	font-weight: bold;
}

#moneylist ul li input[type="number"]::-webkit-outer-spin-button,
	#moneylist ul li input[type="number"]::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
} /* input 태그 안 number로 주었을 때 */
.tab {
	overflow: hidden;
	background-color: white;
}

.tab button {
	color: #1565c0;
	font-weight: bold;
	font-size: 20px;
	background-color: white;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	height: 80px;
	width: 100px;
}

.tab button:hover {
	background-color: #90caf9;
}

.tab button.active {
	background-color: #90caf9;
}

.productbox {
    width: 150px;
    height: 120px;
    margin-top: 15px;
    margin-left: 25px;
    border: 3px solid #81d4fa;
    font-size: 25px;
    float: left;
    opacity: 0.5;
    background-color: silver;
}

#totalmoney, #takemoney, #uctmoney {
	width: 100px;
	height: 40px;
	margin-left: 10px;
	border: none;
	text-align: center;
}

#btn1, #btn2, #btn3 {
	border: 3px solid white;
	background-color: #81d4fa;
	color: white;
}

#btn4, #btn5 {
	border: 3px solid #81d4fa;
	background-color: white;
	color: #81d4fa;
}
</style>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<div class="innerdiv">
				<div class="tab">
					<button class="tablinks" onclick="opencategory(event, 'ctg1')">C1</button>
					<button class="tablinks" onclick="opencategory(event, 'ctg2')">C2</button>
					<button class="tablinks" onclick="opencategory(event, 'ctg3')">C3</button>
				</div>
				<div id="product"></div>

			</div>

			<div class="innerdiv2">
				<div id="listbox">
					<center>${list}</center>
				</div>
				<div id="moneylist">
					<ul>
						<li>총금액 <input type="number" readonly="readonly"
							id="totalmoney"></li>
						<li>결제금액 <input type="number" id="takemoney" value="0"
							placeholder="0"></li>
						<li id="Remain_money">남은금액 <input type="number"
							readonly="readonly" id="uctmoney"></li>
					</ul>
				</div>
				<div class="bottombox" id="paymentkind">
					<ul>
						<li id="btn1" onclick ="creditPayment(1)">현금결제</li>
						<li id="btn2" onclick ="creditPayment(2)">카드결제</li>
						<li id="btn3" onclick ="creditPayment(3)">외상결제</li>
						<li id="btn4" onclick='sendsaoList()'>주문하기</li>
						<li id="btn5">메인으로</li>
					</ul>
				</div>
				<div class="bottombox" id="keypad">
					<ul>
						<li value="1">1</li>
						<li value="2">2</li>
						<li value="3">3</li>
						<li value="4">4</li>
						<li value="5">5</li>
						<li value="6">6</li>
						<li value="7">7</li>
						<li value="8">8</li>
						<li value="9">9</li>
						<li onclick="backspace()" value="12"><i
							class="fa fa-arrow-left" style="font-size: 25px"></i></li>
						<li value="0">0</li>
						<li onclick="reset()" value="11"><i class="fa fa-times"
							style="font-size: 25px"></i></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	getsellkeyList();
	totalprice();
	
	function getsellkeyList(){
		$.ajax({
			type : 'get',
			url : 'rest/getSellKeyCatList',
			dataType : 'json',
			success : function(data){
				console.log(data);
				$(".tab").html(data.categoriList);
				$("#product").html(data.sellkeyList);
				
				$("#0 input").remove();
				$("#product input").remove();
				
			}
		})
	}
	

	
	if ($("#oac_num").val() == "null") {
		$("#oac_num").val("");
	}

	$("tr").children($("input")).keyup(function(evt) {
		totalprice();
	});

	function totalprice() {
		for (var i = 0; i < $("tr").length; i++) {
			var $pdcnt = $("#pdcnt" + i).val();
			var $hiddenprice = $("#hiddenprice" + i).val();
			var totalprice = $pdcnt * $hiddenprice
			$("#totalprice" + i).text(totalprice);
		}
		var sum = 0;

		var $price = $(".price");
		for (var i = 0; i < $price.length; i++) {
			var val = $price.eq(i).text();
			if (val == "") {
				val = '0';
			}
			sum += Number(val);
		}

		//console.log(sum);
		$("#totalmoney").val(sum);
	}

	function sendsaoList() {

		var pdccodeArray = [];
		var codeArray = [];
		var cntArray = [];
		var dateArray = [];
		var $pdccode = $("input[name = 'pdcode']");

		for (var i = 0; i < $pdccode.length; i++) {
			if ($("#pdcnt" + i).val() - $("#hiddencnt" + i).val() != 0) {
				pdccodeArray.push($("#pdcode" + i).data('code'));
			}

		}

		if (pdccodeArray.length == 0) {
			alert("변경 사항이 없습니다.")
			return;
		}
		;

		for (var i = 0; i < $pdccode.length; i++) {
			if ($("#pdcnt" + i).val() - $("#hiddencnt" + i).val() != 0) {
				dateArray.push($("#pddate" + i).val());
			}

		}

		for (var i = 0; i < $pdccode.length; i++) {
			if ($("#pdcnt" + i).val() - $("#hiddencnt" + i).val() != 0) {
				codeArray.push($("#pdcode" + i).val());
			}
		}

		var $cnt = $("input[name='pdcnt']");
		for (var i = 0; i < $cnt.length; i++) {
			if ($("#pdcnt" + i).val() - $("#hiddencnt" + i).val() != 0) {
				cntArray
						.push($("#pdcnt" + i).val() - $("#hiddencnt" + i).val());
			}
		}

		var objparam = {
			"oac_num" : $("#oac_num").val(),
			"sc_code" : $("#sc_code").val(),
			"st_num" : $("#st_num").val(),
			"pdc_code" : pdccodeArray,
			"pd_date" : dateArray,
			"pd_code" : codeArray,
			"oh_cnt" : cntArray
		}
		$.ajax({
			type : "post",
			url : 'rest/sendsaolist',
			data : objparam,
			dataType : 'html',
			success : function(result) {

				console.log("aaa");
				console.log(result);
				location.href = result;
			}
		});
	}

	function creditPayment(paytype){
		var oac_num = $("#sendoac_num").val();
		var bd_date = $("#sendbd_date").val();
		
		if($("#takemoney").val()-$("#totalmoney").val()>0){
		var getmoney = $("#totalmoney").val();
		}else{
		var getmoney = $("#takemoney").val();
		}//결제금액이 총금액보다 큰 경우 총금액이 결제금액으로 설정
		
		var text = $("#Remain_money").text();
		
		if(text.match("남은금액")){
		var totalmoney = $("#totalmoney").val($("#uctmoney").val());
			console.log("남은금액"+$("#uctmoney").val());
		}//남은금액이 있을경우 남은금액이 총금액의 값으로 들어가게 됨
		
		if(paytype == "1"){
			console.log("현금결제")
		}else if(paytype =="2"){
			console.log("카드결제")
		}else{
			console.log("외상결제")
		}
			//결제타입이 1일경우 현금결제 2일경우 카드결제
		
		console.log("주문번호"+oac_num);
		console.log("영업일"+bd_date);
		console.log("받은금액"+getmoney);
		
		var objparam = {
				"bd_date":bd_date,
				"oac_num":oac_num,
				"getmoney":getmoney,
				"paytype":paytype
		}
		console.log(objparam);
		
		/* $ajax({
		type : 'post',
		url : 'rest/moneypayment',
		data : objparam,
		dataType : 'json',
		success : function(result){
			
		} 
		})*/
	}
	
	
	/* 키패드 */
	var str = "";
	$("#uctmoney").val($("#totalmoney").val());

	$("#keypad ul li").click(function() {
	if ($(this).val() == 11 || $(this).val() == 12) {
	return;
	}

	str += $(this).val();
	$("#takemoney").val(str);
	$("#uctmoney").val($("#totalmoney").val() - $("#takemoney").val());
	if (($("#totalmoney").val() - $("#takemoney").val()) < 0) {
	$("#Remain_money").html("거스름돈 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val(($("#totalmoney").val() - $("#takemoney").val())* (-1));
	} else {
	$("#Remain_money").html("남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val(($("#totalmoney").val() - $("#takemoney").val()));}
	});

	function reset() {
	str = str.substring(str.length, str.length);
	$("#takemoney").val(str);
	$("#Remain_money").html(
	"남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val($("#totalmoney").val());
	}

	function backspace() {
	$("#takemoney").val(str.substr(0, str.length - 1));
	$("#uctmoney").val($("#totalmoney").val() - $("#takemoney").val());
	str = $("#takemoney").val();
	if (($("#totalmoney").val() - $("#takemoney").val()) < 0) {
	$("#Remain_money").html("거스름돈 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val(($("#totalmoney").val() - $("#takemoney").val()) * (-1));
	} else {
	$("#Remain_money").html("남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val(($("#totalmoney").val() - $("#takemoney").val()));}
	}
	$("#takemoney").keyup(function(evt) {
	$("#uctmoney").val($("#totalmoney").val() - $("#takemoney").val());
	if (($("#totalmoney").val() - $("#takemoney").val()) < 0) {
	$("#Remain_money").html("거스름돈 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val(($("#totalmoney").val() - $("#takemoney").val())* (-1));
	} else {$("#Remain_money").html("남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val(($("#totalmoney").val() - $("#takemoney").val()));
	}
	});
	$("#takemoney").focus(function() {
	$("#takemoney").val("");
	});

	function opencategory(evt, category) {

		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}

		evt.currentTarget.className += " active";

		var data = [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11' ];
		var str = "";
		//console.log(data.length);
		for ( var key in data) {
			str += "<div class='productbox'>" + data[key] + "</div>"
		}

		$("#product").html(str);
	}
</script>

</html>