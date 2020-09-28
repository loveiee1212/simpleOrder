<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>creditControle-외상관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
body {
	padding: 0;
}

#baseBox {
	border: 1px solid black;
	float: left;
	padding: 2%;
	transform: translate(-50%, 0%);
	margin: 0% 50%;
}

#baseinnerBox {
	float: left;
	border: pink 1px solid;
	width: 1500px;
	height: 800px;
	padding: 30px;
}

.innerdiv {
	border: 1px solid black;
	width: 745px;
	height: 800px;
	float: left;
}
/* tr,td{
border: 1px solid black;
width:40px;
height : 20px;
padding : 30px;
margin : 30px;
text-align: center;
} */
button {
	color: red;
	background-color: white;
	border: none;
	button: focus{ outline: none;
	box-shadow: none;
}

}
#listbox {
	border: 1px solid black;
	width: 700px;
	height: 400px;
	margin-left: 25px;
	margin-top: 20px;
	overflow: auto;
}

div#listbox tr, td {
	/* border: 1px solid black; */
	width: 80px;
	height: 20px;
	padding: 20px;
	margin: 30px;
	text-align: center;
}

#moneylist {
	border: 1px solid black;
	width: 700px;
	height: 50px;
	margin-left: 25px;
}

#moneylist ul li {
	list-style: none;
	float: left;
	margin-left: 10px;
}

li input {
	width: 80px;
}

.bottombox {
	width: 300px;
	height: 280px;
	margin-top: 30px;
	margin-left: 45px;
	float: left;
}

#paymentkind ul li {
	list-style: none;
	border: 1px solid black;
	width: 110px;
	height: 30px;
	margin-left: 30px;
	margin-top: 10px;
	text-align: center;
	padding: 20px;
}

#keypad ul li {
	list-style: none;
	border: 1px solid black;
	width: 30px;
	height: 20px;
	text-align: center;
	padding: 20px;
	float: left;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

#crdtableList tr, #crdtableList td {
	width: 150px;
}
</style>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<center>
				<div class="innerdiv" id="creditList"></div>
			</center>

			<div class="innerdiv">
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
						<li onclick="creditPayment(1)">현금결제</li>
						<li onclick="creditPayment(2)">카드결제</li>
						<li>메인으로</li>
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
						<li onclick="reset()" value="11">CE</li>
						<li value="0">0</li>
						<li onclick="backspace()" value="12">C</li>
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
				$("#uctmoney").val($("#totalmoney").val());
				var a = Number(data.endpay);
				$("#endpay").val(a);
				$("#takemoney").val(0);
				var b = $("#totalmoney").val();
				console.log(a);
				console.log(b);
				console.log(a==b);
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
	if ($(this).val() == 11 || $(this).val() == 12) {return;}
	str += $(this).val();
	$("#takemoney").val(Number(str));
	$("#uctmoney").val(
	$("#totalmoney").val() - $("#takemoney").val());
	if (($("#totalmoney").val()  - $("#takemoney").val()) < 0) {
	$("#Remain_money").html(
	"거스름돈 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val(($("#totalmoney").val() - $("#takemoney").val())* (-1));} 
	else {$("#Remain_money").html(
	"남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val(($("#totalmoney").val() - $("#takemoney").val()));}
	});

	function reset() {
		str = str.substring(str.length, str.length);
		$("#takemoney").val(Number(str));
		$("#Remain_money").html(
				"남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
		$("#uctmoney").val($("#totalmoney").val());}

	function backspace() {
		//	console.log("length" + str.substr(0, str.length - 1));
		$("#takemoney").val(str.substr(0, str.length - 1));
		$("#uctmoney").val($("#totalmoney").val()  - $("#takemoney").val());
		str = $("#takemoney").val();

		if (($("#totalmoney").val() - $("#takemoney").val()) < 0) {
			$("#Remain_money").html("거스름돈 <input type='number' readonly='readonly' id='uctmoney'>");
			$("#uctmoney").val(($("#totalmoney").val() - $("#takemoney").val()) * (-1));
		} else {
			$("#Remain_money").html("남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
			$("#uctmoney").val(($("#totalmoney").val()- $("#takemoney").val()));
		}
	}

	/* 키패드 */
	$("#takemoney").keyup(function(evt) {
	$("#uctmoney").val($("#totalmoney").val() - $("#takemoney").val());
	if (($("#totalmoney").val() - $("#takemoney").val()) < 0) {
	$("#Remain_money").html("거스름돈 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val(($("#totalmoney").val() - $("#takemoney").val())*(-1));} 
	else {$("#Remain_money").html("남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val($("#totalmoney").val() - $("#takemoney").val());}
	});
	$("#takemoney").focus(function() {
	$("#takemoney").val("");
	});
	
	
	
</script>
</html>
