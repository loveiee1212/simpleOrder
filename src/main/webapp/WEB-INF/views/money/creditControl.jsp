<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>creditControle-외상관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" href="resources/image/smallLogo.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="resources/css/basicBox.css?after">
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

#creditList th{
width: 200px;
height: 50px;
font-size: 20px;
background-color: #81d4fa;
color: white;
}

#creditList td {
width: 200px;
height: 50px;
font-size: 20px;
text-align: center;
}

.innerdiv {
background-color: white;
	border: 3px solid #81d4fa;
	width: 740px;
	height: 800px;
	float: left;
	text-align: center;
}

.innerdiv2 {
	border: 3px solid #81d4fa;
	width: 740px;
	height: 800px;
	float: left;
	text-align: center;
}

button {
	color: red;
	background-color: white;
	border: none;
}		

button: focus{ 
outline: none;
box-shadow: none;
}


#listbox {
	background-color: white;
    border: 3px solid #81d4fa;
    width: 700px;
    height: 400px;
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
	height: 10px;
	background-color: #81d4fa;
}

#listbox::-webkit-scrollbar-thumb {
	background-color: #81d4fa;
	background-image: -webkit-gradient(linear, 0 0, 0 100%, color-stop(.5, rgba(255, 255, 255,
		.2)), color-stop(.5, transparent), to(transparent));
}

#listbox tr, #listbox td {
	border: none;
	border-bottom: 3px solid #81d4fa;
	width: 150px;
	height: 20px;
	padding: 20px;
	margin: 30px;
	text-align: center;
	font-size: 20px;
}

#pdcnt0 {
width: 100px;
height: 30px;
text-align: center;
font-size: 20px;
border: none;
}

input:focus {
outline: none;
}

#moneylist {
	border: 3px solid #81d4fa;
	width: 700px;
	height: 50px;
	margin-left: 17px;
	background-color: white;
	font-size: 20px;
}

#moneylist ul li {
	list-style: none;
	float: left;
	margin-left: -17px;
}

#totalmoney, #endpay, #takemoney, #uctmoney {
    height: 25px;
    margin: 0 20px 5px 3px;
    font-size: 15px;
}

li input {
	width: 80px;
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
	width: 200px;
	height: 30px;
	margin-top: 10px;
	text-align: center;
	padding: 20px;
	font-size: 25px;
}

#btn1, #btn2 {
border: 2px solid white;
background-color: #81d4fa;
color: white;
font-weight: bold;
}

#Exit {
border: 3px solid #81d4fa;
background-color: white;
color: #81d4fa;
font-weight: bold;
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

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

</style>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<center>
				<div class="innerdiv" id="creditList"></div>
			</center>

			<div class="innerdiv2">
				<center>
					<div id="listbox"></div>
				</center>
				<div id="moneylist">
					<ul>
						<li>총금액 <input type="number" readonly="readonly"
							id="totalmoney"></li>
						<li>결제금액 <input type="number" readonly="readonly"
							id="endpay"></li>
						<li>받은금액 <input type="number" id="takemoney"
							placeholder="0"></li>
						<li id="Remain_money">남은금액 <input type="number"
							readonly="readonly" id="uctmoney"></li>
					</ul>
				</div>
				<div class="bottombox" id="paymentkind">
					<ul>
						<li id="btn1" onclick="creditPayment(1)">현금결제</li>
						<li id="btn2" onclick="creditPayment(2)">카드결제</li>
						<li id="Exit"onclick="location.href='./posmain'">메인으로</li>
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
getCreditList();



	/* 외상 정보 가져오기 */
	function getCreditList(){	
	 $.ajax({
	 type:"post",
	 url:"rest/getcreditlist",
	 data:{"oac_status": 0 },
	 dataType:"json",
	 success : function(result){
	 $("#creditList").html(result.data);
	 $("#crdtableList .crdinfo").click(function() {
			var tdArr = new Array();
			var tr = $(this);
			var td = tr.children();
			/* tr 행의 정보들을 Arr에 담음 */
			$("#crdtableList tr[class='.crdinfo']").css('background-color','white');
			tr.css('background-color', '#ddd');
			var bd_date = $(this).children("#bd_date").val();
			var oac_num = $(this).children("#oac_num").val();
			getdetailCredit(bd_date,oac_num);
	 });
	 }
	 })
	};
	
	function getdetailCredit(bd_date,oac_num){
		var objparam ={"bd_date":bd_date,
						"oac_num" : oac_num,
						"oac_status" : 0};
		$.ajax({
			type : 'post',
			url : 'rest/showdetailcredit',
			data : objparam,
			dataType : 'json',
			success : function (data){
				$("#listbox").html(data.data);
				totalprice();
				/* 수량변경시 값 수정 */
				var a = Number(data.endpay);
				$("#endpay").val(a);
				$("#takemoney").val(0);
				$("#uctmoney").val($("#totalmoney").val()-a);
				var b = $("#totalmoney").val();
				if(a==b){
					updateOac(bd_date,oac_num);
				}
			}
	
		})
	}
	
	function updateOac(bd_date,oac_num){
		$.ajax({
			type : 'post',
			url : 'rest/updateoac',
			data : {"bd_date":bd_date,"oac_num":oac_num},
			dataType : 'json',
			success : function (result){
				console.log(result);
				alert(result.result);
				location.href = "./posmain";
			}
		})
	}
	
	function creditPayment(paytype){
		var oac_num = $("#sendoac_num").val();
		var bd_date = $("#sendbd_date").val();
		
		var getmoney = $("#takemoney").val();
		
		if($("#takemoney").val()-$("#totalmoney").val()>0){
		var paymoney = $("#totalmoney").val();
		}else{
		var paymoney = $("#takemoney").val();
		}//결제금액이 총금액보다 큰 경우 총금액이 결제금액으로 설정
		
		var text = $("#Remain_money").text();
		
		if(text.match("남은금액")){
		var totalmoney = $("#totalmoney").val($("#uctmoney").val());
		}//남은금액이 있을경우 남은금액이 총금액의 값으로 들어가게 됨
		
		var objparam = {
				"bd_date":bd_date,
				"oac_num":oac_num,
				"getmoney":getmoney,
				"paymoney" : paymoney,
				"paytype":paytype
		}
		
		 $.ajax({
		type : 'post',
		url : 'rest/moneypayment',
		data : objparam,
		dataType : 'json',
		success : function(result){
			alert(result.result);
			getdetailCredit(bd_date,oac_num);
		} 
		})
	}
		
		function totalprice() {
			console.log(endpay);
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
			$("#totalmoney").val(sum);
		}
	/* 키패드 */
	var str = "";
	$("#uctmoney").val($("#totalmoney").val());

	$("#keypad ul li").click(function() {
	var endpay = $("#endpay").val();
	console.log(endpay);
	if ($(this).val() == 11 || $(this).val() == 12) {return;}
	str += $(this).val();
	$("#takemoney").val(Number(str));
	$("#uctmoney").val(
	$("#totalmoney").val()- endpay - $("#takemoney").val());
	if (($("#totalmoney").val() -endpay  - $("#takemoney").val()) < 0) {
	$("#Remain_money").html(
	"거스름돈 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val(($("#totalmoney").val()-endpay - $("#takemoney").val())* (-1));} 
	else {$("#Remain_money").html(
	"남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val(($("#totalmoney").val()-endpay - $("#takemoney").val()));}
	});

	function reset() {
		var endpay = $("#endpay").val();
		str = str.substring(str.length, str.length);
		$("#takemoney").val(Number(str));
		$("#Remain_money").html(
				"남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
		$("#uctmoney").val($("#totalmoney").val()-endpay);}

	function backspace() {
		var endpay = $("#endpay").val();
		//	console.log("length" + str.substr(0, str.length - 1));
		$("#takemoney").val(str.substr(0, str.length - 1));
		$("#uctmoney").val($("#totalmoney").val()-endpay  - $("#takemoney").val());
		str = $("#takemoney").val();

		if (($("#totalmoney").val()-endpay - $("#takemoney").val()) < 0) {
			$("#Remain_money").html("거스름돈 <input type='number' readonly='readonly' id='uctmoney'>");
			$("#uctmoney").val(($("#totalmoney").val()-endpay - $("#takemoney").val()) * (-1));
		} else {
			$("#Remain_money").html("남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
			$("#uctmoney").val(($("#totalmoney").val()-endpay - $("#takemoney").val()));
		}
	}

	/* 키패드 */
	$("#takemoney").keyup(function(evt) {
	var endpay = $("#endpay").val();
	$("#uctmoney").val($("#totalmoney").val()-endpay - $("#takemoney").val());
	if (($("#totalmoney").val() - $("#takemoney").val()) < 0) {
	$("#Remain_money").html("거스름돈 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val(($("#totalmoney").val()-endpay - $("#takemoney").val())*(-1));} 
	else {$("#Remain_money").html("남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val($("#totalmoney").val()-endpay - $("#takemoney").val());}
	});
	$("#takemoney").focus(function() {
	$("#takemoney").val("");
	});
	
	
	
</script>
</html>
