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
<link rel="icon" href="resources/image/smallLogo.png"
	type="image/x-icon">
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

.tList {
	display: none;
}

.blockCtg {
	display: block;
}
</style>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<div class="innerdiv">
				<div class="tab" id='ctgtab'></div>
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
						<li id="btn3" onclick="addcreditList()">외상결제</li>
						<li id="btn4" onclick='sendsaoList()'>주문하기</li>
						<li id="btn5" onclick="location.href='./sellpage'">뒤로가기</li>
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
	console.log($("#oac_num").val());
	if($("#oac_num").val()!="null"){		
	getpayAmount();
	}
	
	function getpayAmount(){
		$.ajax({
			type : 'post',
			url : 'rest/getpayamount',
			data : {"oac_num":$("#oac_num").val()},
			dataType : 'json',
			success : function(data){
			console.log(data);
			var a = Number(data.endpay);
			$("#endpay").val(a);
			$("#uctmoney").val($("#totalmoney").val()-a);
			if($("#totalmoney").val()==a){
				updateOac();
			}
			}
		})
	}

	function updateOac(){
		$.ajax({
			type : 'post',
			url : 'rest/updateoac',
			data : {"bd_date":"","oac_num":$("#oac_num").val()},
			dataType : 'json',
			success : function(data){
			console.log(data);
			alert(data.result);
			location.href = "./posmain";
			
			}
		})
	}
	
	function getsellkeyList() {
		$.ajax({
					type : 'post',
					url : 'rest/getsellkeylist',
					dataType : 'json',
					success : function(data) {
						$("#ctgtab").html(data.ctgList);
						$("#product").html(data.divList);
						for ( var i in data.sellkeyList) {
							var Arrvalue = data.sellkeyList[i];
							$("#tnum" + Arrvalue.SKC_CODE + Arrvalue.SK_NUM).css({"background-color" : "white",'visibility' : 'visible'});
							var str = "";
							str += "<input type='hidden' id='pd_code' data-code='"+Arrvalue.PDC_CODE+"'value='"+Arrvalue.PD_CODE+"'/>";
							str += "<input type='hidden' id='pd_date' data-code='"+Arrvalue.PD_DATE+"'/>";
							str += "<input type='hidden' id='pd_info' data-code='"+Arrvalue.PD_PRICE+"'/ value='"+Arrvalue.PD_NAME+"'>";
							str += Arrvalue.PD_NAME + "<br/>";
							str += Arrvalue.PD_PRICE + "원";
							$("#tnum" + Arrvalue.SKC_CODE + Arrvalue.SK_NUM)
									.html(str);
						}

						$("#table0").attr("class", "blockCtg");

						$(".protd").click(function() {
							var td = $(this);
							var tdiv = td.children();
							var pdc_code = tdiv.children("#pd_code").data('code');
							var pd_code = tdiv.children("#pd_code").val();
							var pd_date = tdiv.children("#pd_date").data('code')
							var pd_price = tdiv.children("#pd_info").data('code');
							var pd_name = tdiv.children("#pd_info").val();
							var $pdccode = $("input[name = 'pdcode']").length;
							for(var i=0;i<$pdccode;i++){
								console.log($("#pdcode"+i).data('code')==pdc_code&&$("#pdcode"+i).val()==pd_code);
								console.log($("#pdcode"+i).data('code'));
								console.log($("#pdcode"+i).val());
								console.log(pdc_code);
								console.log(pd_code);
								if($("#pdcode"+i).data('code')==pdc_code&&$("#pdcode"+i).val()==pd_code){
									$("#pdcnt"+i).val(Number($("#pdcnt"+i).val())+1);
									return;
								}
							}
							
							if($pdccode!=0){
							var value = "";
							value+="<tr>";
							value+="<td><input type='hidden' name='pdcode' id='pdcode"+$pdccode + "' data-code='"
									+pdc_code + "' value='" + pd_code + "'/>"
									+ "<input type='hidden' name='pddate' id='pddate"+$pdccode + "' value='" + pd_date + "'/>"
									+ pd_name + "</td>";
							value+="<td><p class ='price' id='totalprice'>"+pd_price+"</p>";
							value+="<input type='hidden' id='hiddenprice"+$pdccode + "' value='" + pd_price
									+ "'/></td>";
							value+="<td><input type='hidden' id='hiddencnt"+$pdccode +"' value='0'/>"
							+"<input type='Number' name ='pdcnt' id='pdcnt"+$pdccode + "' value='" + 1 + "'/></td>";
							value+="<td><button>취소</button></td>";
							value+="</tr>";
							$("#listbox").children("center").children("table").append(value);
							}else{
								var value = "";
								value+="<table>";
								value+="<tr>";
								value+="<td><input type='hidden' name='pdcode' id='pdcode"+$pdccode + "' data-code='"
										+pdc_code + "' value='" + pd_code + "'/>"
										+ "<input type='hidden' name='pddate' id='pddate"+$pdccode + "' value='" + pd_date + "'/>"
										+ pd_name + "</td>";
								value+="<td><p class ='price' id='totalprice'>"+pd_price+"</p>";
								value+="<input type='hidden' id='hiddenprice"+$pdccode + "' value='" + pd_price
										+ "'/></td>";
								value+="<td><input type='hidden' id='hiddencnt"+$pdccode +"' value='0'/>"
								+"<input type='Number' name ='pdcnt' id='pdcnt"+$pdccode + "' value='" + 1 + "'/></td>";
								value+="<td><button>취소</button></td>";
								value+="</tr>";
								value+="</table>";
								$("#listbox").children("center").append(value);
							}
						})
					}
				})

	}
	
	/* 테이블 카테고리 클릭시 오픈 */
	function opentable(evt, categoryname) {
		var table = $("div[id*='table']");
		for (var i = 0; i < table.length; i++) {
			table[i].className = table[i].className
					.replace("blockCtg", "tList");
		}
		if ($("#" + categoryname).attr('class') == 'tList') {
			$("#" + categoryname).attr('class', 'blockCtg');
		}
	};

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
		};
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
				cntArray.push($("#pdcnt" + i).val() - $("#hiddencnt" + i).val());
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
		console.log(objparam);
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
		var endpay = $("#endpay").val();
		var oac_num = $("#oac_num").val();
		var bd_date = $("#sendbd_date").val();
		var getmoney = $("#takemoney").val();
		if($("#takemoney").val()-($("#totalmoney").val()-endpay)>0){
		var paymoney = $("#totalmoney").val()-endpay;
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
		console.log(objparam);
		 $.ajax({
		type : 'post',
		url : 'rest/moneypayment',
		data : objparam,
		dataType : 'json',
		success : function(result){
			alert(result.result);
			location.reload();
		} 
		})
	}
	
	function addcreditList(){
		$.ajax({
			type : 'post',
			url : 'rest/addcreditlist',
			data : {"oac_num" : $("#oac_num").val()},
			dataType : 'json',
			success : function (result){
				console.log(result);
				alert(result.result);
			}
		});
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
	if (($("#totalmoney").val()-endpay - $("#takemoney").val()) < 0) {
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