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
	border: 3px solid #2565a3;
	width: 740px;
	height: 800px;
	float: left;
	background-color: white;
}

.innerdiv2 {
	border: 3px solid #2565a3;
	width: 740px;
	height: 800px;
	float: left;
}

#product table{
    width: 700px;
    height: 500px;
}

#product {
    width: 700px;
    height: 600px;
    overflow: auto;
	overflow-x: hidden;
}

#product::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#product::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#product::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

.protd {
    width: 150px;
    height: 100px;
    font-weight: bold;
}

#listbox input {
    width: 150px;
    height: 30px;
    font-size: 20px;
    text-align: center;
}
    
#cancelbutton0 {
	width: 70px;
	height: 50px;
	color: red;
	background-color: white;
	border: none;
	font-size: 20px;
	box-shadow: none;
	font-weight: bold;
}

#listbox {
	background-color: white;
	border: 3px solid #2565a3;
	width: 700px;
	height: 400px;
	margin-left: 17px;
	margin-top: 10px;
	border-collapse: collapse;
	overflow: auto;
	overflow-x: hidden;
}

#listbox::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#listbox::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#listbox::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

div #listbox tr, td {
	border: none;
	width: 80px;
	height: 20px;
	padding: 20px;
	margin: 30px;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

#moneylist {
	border-top: none;
	border: 3px solid #2565a3;
	width: 700px;
	height: 70px;
	margin-left: 17px;
	background-color: white;
	font-size: 20px;
	font-weight: bold;
}

#moneylist ul li {
	list-style: none;
	float: left;
	margin-left: -17px;
}

li input {
    width: 80px;
    font-size: 20px;
    border: none;
    text-align: center;
}

.bottombox {
	width: 430px;
	height: 280px;
	margin-top: 15px;
	float: left;
}

.bottombox2 {
	width: 290px;
    height: 280px;
    margin-top: 15px;
    margin-right: 15px;
    float: right;
}

#paymentkind ul li {
	list-style: none;
	width: 140px;
	height: 30px;
	margin-top: 5px;
	margin-left: 9px;
	margin-right: -5px;
	text-align: center;
	padding: 20px;
	float: left;
	font-size: 23px;
}

#keypad ul li {
	list-style: none;
	border: 1px solid white;
	background-color: #2565a3;
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

#ctgtab {
    width: 740px;
    height: 80px;
    overflow: auto;
    overflow-y: hidden; 
}

#ctgtab::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#ctgtab::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#ctgtab::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

.tab {
	background-color: white;
}

.tab button {
	color: #2565a3;
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
	border: 3px solid #2565a3;
	font-size: 25px;
	float: left;
	opacity: 0.5;
	background-color: silver;
}

#totalmoney, #endpay, #takemoney, #uctmoney {
    margin: -20px 20px 5px 3px;
    font-size: 20px;
    border: none;
    text-align: center;
}

#btn1, #btn2, #btn3 {
	border: 3px solid white;
	background-color: #2565a3;
	color: white;
	font-weight: bold;
}

#btn4, #btn5 {
    border: 3px solid #2565a3;
    background-color: white;
    color: #2565a3;
    font-weight: bold;
}

.tList {
	display: none;
}

.blockCtg {
	display: block;
}

#background{
    display :none;
    position : absolute;
    width: 92%;
    height: 86.7%;
    background-color: #ddd;
    opacity: 0.5;
}

#addcreditbox{
	display : none;
	position: absolute;
	width : 450px;
	height : 300px;
	background-color: white;
	border: 3px solid #2565a3;
	margin-left :32%;
	margin-top: 17%;
}

#crd_name, #crd_phone {
    width: 400px;
    height: 50px;
    border: 3px solid #2565a3;
    text-align: center;
    font-size: 20px;
    margin: 30px 25px 5px;
}

#addcreditbutton {
    width: 400px;
    height: 80px;
    border: 3px solid #1565c0;
    background-color: #e3f2fd;
    font-weight : bold; 
	color : #1565c0;
    margin: 20px 25px 5px;
    text-align: center;
    font-size: 25px;
}

input:focus, button:focus {
	outline: none; 
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
						<li id="btn1" onclick="creditPayment(0,1,0)">현금결제</li>
						<li id="btn2" onclick="creditPayment(0,2,0)">카드결제</li>
						<li id="btn3" onclick="openCreditbox()">외상결제</li>
						<li id="btn4" onclick='sendsaoList(0,0)'>주문하기</li>
						<li id="btn5" onclick="location.href='./sellpage'">뒤로가기</li>
					</ul>
				</div>
				<div class="bottombox2" id="keypad">
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
			<div id='background'>
			</div>
			<div id = "addcreditbox">
				<input type='text' id="crd_name" maxlength="5"  placeholder="성함(최대 5자)"/>
				<input type='text' id="crd_phone" maxlength="11" placeholder="연락처(최대 11자)"/>
				<input type='button' id='addcreditbutton' value='외상처리'/>
			</div>
		</div>
	</div>
</body>
<script>
$(document).ready(function(){	
	getsellkeyList();
	totalprice();
	if($("#oac_status").val()==-2){
		$("#btn4").css("color",'#ddd');
		$("#endpay").val(0);
	}
	if($("#oac_num").val()!="null" && $("#oac_status").val()!=-2){
		if($("#totalmoney").val()!=0){			
	getpayAmount();
		}
	}
})

	function cancelorder(i){
	$("#pdcnt"+i).val(0);
	$("#pdcnt"+i).parents("tr").css("display","none");
	totalprice();
	}
		
	
	
	function getpayAmount(){
			var oac_num = {"oac_num":$("#oac_num").val()};
		$.ajax({
			type : 'post',
			url : 'rest/getpayamount',
			data : oac_num,
			dataType : 'json',
			success : function(data){
			if(data!=""){				
			var a = Number(data.endpay);
			$("#endpay").val(a);
			$("#uctmoney").val($("#totalmoney").val()-a);
			if($("#totalmoney").val()==a){
				updateOac();
			}
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
			alert(data.result);
			location.href = "./sellpage";
			
			}
		})
	}
	
	function getsellkeyList() {
		$.ajax({type : 'post',
					url : 'rest/getsellkeylist',
					dataType : 'json',
					success : function(data) {
						$("#ctgtab").html(data.ctgList);
						$("#product").html(data.divList);
						for ( var i in data.sellkeyList) {
							var Arrvalue = data.sellkeyList[i];
							if(Arrvalue.STK_STOCK!=-1&&Arrvalue.STK_STOCK==0){
							$("#tnum" + Arrvalue.SKC_CODE + Arrvalue.SK_NUM).css({"color" : "#a8a8a8",'visibility' : 'visible'});
							}else{								
							$("#tnum" + Arrvalue.SKC_CODE + Arrvalue.SK_NUM).css({"background-color" : "white",'visibility' : 'visible'});
							}
							var str = "";
							str += "<input type='hidden' id='pd_code' data-code='"+Arrvalue.PDC_CODE+"'value='"+Arrvalue.PD_CODE+"'/>";
							str += "<input type='hidden' id='pd_date' data-code='"+Arrvalue.PD_DATE+"'/>";
							str += "<input type='hidden' id='pd_info' data-code='"+Arrvalue.PD_PRICE+"'/ value='"+Arrvalue.PD_NAME+"'>";
							str += "<input type='hidden' id='pd_stock' data-code='"+Arrvalue.STK_STOCK+"'/>";
							str += Arrvalue.PD_NAME + "<br/>";
							str += Arrvalue.PD_PRICE + "원<br/>";
							if(Arrvalue.STK_STOCK!=-1){								
							str += "남은 재고 : "+Arrvalue.STK_STOCK;
							}
							$("#tnum" + Arrvalue.SKC_CODE + Arrvalue.SK_NUM)
									.html(str);
						}

						$("#table0").attr("class", "blockCtg");

						$(".protd").click(function() {
							var td = $(this);
							var tdiv = td.children();
							if(tdiv.children("#pd_stock").data('code')==0){
								alert("남은 재고가 없습니다.");
								return false;
							}
							
							var pdc_code = tdiv.children("#pd_code").data('code');
							if(pdc_code==undefined){
								return false;
							}
							var pd_code = tdiv.children("#pd_code").val();
							var pd_date = tdiv.children("#pd_date").data('code')
							var pd_price = tdiv.children("#pd_info").data('code');
							var pd_name = tdiv.children("#pd_info").val();
							var $pdccode = $("input[name = 'pdcode']").length;
							for(var i=0;i<$pdccode;i++){
								if($("#pdcode"+i).data('code')==pdc_code&&$("#pdcode"+i).val()==pd_code){
									$("#pdcode"+i).parents("tr").css("display",'');
									if(tdiv.children("#pd_stock").data('code')!=-1){										
									if(tdiv.children("#pd_stock").data('code')<Number($("#pdcnt"+i).val())+1){
									alert("남은 재고 수량까지 주문 가능합니다.");
									return false;
									}
									}
									$("#pdcnt"+i).val(Number($("#pdcnt"+i).val())+1);
									if(tdiv.children("#pd_stock").data('code')!=-1){										
									$("#pdcnt"+i).attr('max',tdiv.children("#pd_stock").data('code'));
									}
									$("#totalprice"+i).text(Number($("#hiddenprice"+i).val())*Number($("#pdcnt"+i).val()));
									totalprice();
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
							value+="<td><p class ='price' id='totalprice"+$pdccode+"'>"+pd_price+"</p>";
							value+="<input type='hidden' id='hiddenprice"+$pdccode + "' value='" + pd_price
									+ "'/></td>";
							if(tdiv.children("#pd_stock").data('code')!=-1){
								value+="<td><input type='hidden' id='hiddencnt"+$pdccode +"' value='0'/>"
								+"<input type='Number' name ='pdcnt' min='0' max='"+tdiv.children("#pd_stock").data('code')+"' id='pdcnt"+$pdccode + "' onchange='totalprice()' value='" + 1 + "'/></td>";
								}else{									
								value+="<td><input type='hidden' id='hiddencnt"+$pdccode +"' value='0'/>"
								+"<input type='Number' name ='pdcnt' min='0' id='pdcnt"+$pdccode + "' onchange='totalprice()' value='" + 1 + "'/></td>";
								}
							value+="<td><input type='button' id='cancelbutton"+$pdccode+"' onclick='cancelorder("+$pdccode+")' value='취소'/></td>";
							value+="</tr>";
							$("#listbox").children("center").children("table").append(value);
							totalprice();
							}else{
								var value = "";
								value+="<table>";
								value+="<tr>";
								value+="<td><input type='hidden' name='pdcode' id='pdcode"+$pdccode + "' data-code='"
										+pdc_code + "' value='" + pd_code + "'/>"
										+ "<input type='hidden' name='pddate' id='pddate"+$pdccode + "' value='" + pd_date + "'/>"
										+ pd_name + "</td>";
								value+="<td><p class ='price' id='totalprice"+$pdccode+"'>"+pd_price+"</p>";
								value+="<input type='hidden' id='hiddenprice"+$pdccode + "' value='" + pd_price
										+ "'/></td>";
								if(tdiv.children("#pd_stock").data('code')!=-1){
								value+="<td><input type='hidden' id='hiddencnt"+$pdccode +"' value='0'/>"
								+"<input type='Number' name ='pdcnt' min='0' max='"+tdiv.children("#pd_stock").data('code')+"' id='pdcnt"+$pdccode + "' onchange='totalprice()' value='" + 1 + "'/></td>";
								}else{									
								value+="<td><input type='hidden' id='hiddencnt"+$pdccode +"' value='0'/>"
								+"<input type='Number' name ='pdcnt' min='0' id='pdcnt"+$pdccode + "' onchange='totalprice()' value='" + 1 + "'/></td>";
								}
								value+="<td><input type='button' id='cancelbutton"+$pdccode+"' onclick='cancelorder("+$pdccode+")' value='취소'/></td>";
								value+="</tr>";
								value+="</table>";
								$("#listbox").children("center").append(value);
								totalprice();
							}
							$("tr").children($("input [name='pdcnt']")).keyup(function(evt) {
								var $pdccode = $("input[name = 'pdcode']");
								for(var i = 0; i<$pdccode.length;i++){
									if($("#pdcnt"+i).attr("max")!=undefined){
										if(Number($("#pdcnt"+i).val())>Number($("#pdcnt"+i).attr("max"))){
											alert("주문한 수량이 남은 재고수량보다 큽니다.");
											$("#pdcnt"+i).val($("#pdcnt"+i).attr("max"));
											totalprice();
											return false;
										}
									}
								}								
								totalprice();
								
							});
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

	if ($("#oac_num").val() == "null" && $("#totalmoney").val()!=0) {
		$("#oac_num").val("");
	}

	//수량변경 
	$("tr").children($("input")).keyup(function(evt) {
		
		totalprice();
	});

	function totalprice() {
		var $pdccode = $("input[name = 'pdcode']");
		for(var i = 0; i<$pdccode.length;i++){
			if($("#pdcnt"+i).attr("max")!=undefined){
				if(Number($("#pdcnt"+i).val())>Number($("#pdcnt"+i).attr("max"))){
					alert("주문한 수량이 남은 재고수량보다 큽니다.");
					$("#pdcnt"+i).val($("#pdcnt"+i).attr("max"));
					totalprice();
					return false;
				}
			}
		}
		
		
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
		$("#uctmoney").val($("#totalmoney").val());
	}

	function sendsaoList(paytype) {
		if($("#oac_status").val()==-2&& paytype==0){
			return false;
		}
		
		var pdccodeArray = [];
		var codeArray = [];
		var cntArray = [];
		var dateArray = [];
		var $pdccode = $("input[name = 'pdcode']");
		var isempty = [];
		
		
		for(var i = 0; i<$pdccode.length;i++){
			if($("#pdcnt"+i).attr("max")!=undefined){
				if(Number($("#pdcnt"+i).val())>Number($("#pdcnt"+i).attr("max"))){
					alert("주문한 수량이 남은 재고수량보다 큽니다.");
					$("#pdcnt"+i).val($("#pdcnt"+i).attr("max"));
					totalprice();
					return false;
				}
			}
		}
		
		if($("#before_num").val()!=undefined){
			for (var i = 0; i < $pdccode.length; i++) {
					pdccodeArray.push($("#pdcode" + i).data('code'));
			}
			if (pdccodeArray.length == 0 && $("#oac_status").val()!=-2) {
				alert("변경 사항이 없습니다.")
				return;
			};
			for (var i = 0; i < $pdccode.length; i++) {
				dateArray.push($("#pddate" + i).val());
			}

			for (var i = 0; i < $pdccode.length; i++) {			
				codeArray.push($("#pdcode" + i).val());
			}

			var $cnt = $("input[name='pdcnt']");
			for (var i = 0; i < $cnt.length; i++) {
			cntArray.push($("#pdcnt" + i).val() - $("#hiddencnt" + i).val());
			}	
		}else{			
		for (var i = 0; i < $pdccode.length; i++) {
			if ($("#pdcnt" + i).val() - $("#hiddencnt" + i).val() != 0) {
				pdccodeArray.push($("#pdcode" + i).data('code'));
			}
		}
		if (pdccodeArray.length == 0 && $("#oac_status").val()!=-2) {
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
		
		
		if($("#oac_num").val()!="null"||$("#oac_num").val()!=undefined){
			for(var i = 0; i<$pdccode.length;i++){
				if($("#pdcnt" + i).val()==0){
					isempty.push($("#pdcnt" + i).val());
				}
			}
		}
		if(isempty.length==$pdccode.length){
			if(confirm("주문 내역이 없습니다.해당 테이블의 주문 번호를 말소처리 하시겠습니까?")){
				$.ajax({
					type : 'post',
					url : 'rest/cancelordernum',
					data : {"oac_num" : $("#oac_num").val()},
					dataType : 'json',
					success : function(result){
						alert(result.result);
					}
					
				})	
			}
		}
		
		
		$.ajax({
			type : "post",
			url : 'rest/sendsaolist',
			data : objparam,
			dataType : 'json',
			success : function(result) {
				if(paytype==1||paytype==2){
					creditPayment(1,paytype,result.oac_num);
				}else if(paytype==3){
					addcreditList(result.oac_num);
				}else{					
				location.href = result.result;
				}
			}
		});
	}
	

	function creditPayment(num,paytype,getoac_num){
		var pdccodeArray = [];
		var $pdccode = $("input[name = 'pdcode']");
		var oac_num = $("#oac_num").val();
		if(oac_num==""||oac_num==undefined||oac_num==null||oac_num=="null"){
		if(num!=1){
			sendsaoList(paytype);
			return false;
		}
		if(oac_num!=0){			
		oac_num = getoac_num;
		}
		}else{
			for (var i = 0; i < $pdccode.length; i++) {
				if ($("#pdcnt" + i).val() - $("#hiddencnt" + i).val() != 0) {
					pdccodeArray.push($("#pdcode" + i).data('code'));
				}
			}
		if (pdccodeArray.length != 0 && num !=1) {
			//alert("주문 변경사항이 있습니다.")
			if(confirm("주문 변경사항이 있습니다. 주문 내역 변경 후 결제합니다.")){
				sendsaoList(paytype);
			}else{				
			return false;
			}
		};
		}
		var endpay = $("#endpay").val();
		var bd_date = $("#sendbd_date").val();
		if($("#takemoney").val()==0){
			if(confirm("받은 금액이 0원입니다. 전액 결제 처리하시겠습니까?")){
				$("#takemoney").val($("#totalmoney").val()-endpay);
			}
		}
		var getmoney = $("#takemoney").val();
		if($("#takemoney").val()-($("#totalmoney").val()-endpay)>0){
		var paymoney = $("#totalmoney").val()-endpay;
		}else{
		var paymoney = $("#takemoney").val();
		}//결제금액이 총금액보다 큰 경우 총금액이 결제금액으로 설정
		
		var text = $("#Remain_money").text();
		
		/* if(text.match("남은금액")){
		var totalmoney = $("#totalmoney").val($("#uctmoney").val());
		}//남은금액이 있을경우 남은금액이 총금액의 값으로 들어가게 됨 */
		
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
			location.href = "./sellandorder?sc_code=" + $("#sc_code").val()+ "&st_num=" + $("#st_num").val() + "&oac_num="+ oac_num;
		} //result end
		})//ajax end
	
		
	}
	
	function openCreditbox(){		
		$("#background").css("display","block");
		$("#addcreditbox").css("display","block");
		$("#addcreditbutton").click(function(){
			 var oac_num = $("#oac_num").val();
			 var $pdccode = $("input[name = 'pdcode']");
			 var pdccodeArray = [];
			 if(oac_num==""||oac_num==undefined||oac_num==null||oac_num=="null"){
						sendsaoList(3);
						return false;
					 }else{
						
						for (var i = 0; i < $pdccode.length; i++) {
							if ($("#pdcnt" + i).val() - $("#hiddencnt" + i).val() != 0) {
							pdccodeArray.push($("#pdcode" + i).data('code'));
							}
							}
							if (pdccodeArray.length != 0) {
							alert("주문 변경사항이 있습니다.")
							return;
							};
							 addcreditList(oac_num);
					 };
				})
		}
	
	function addcreditList(getoac_num){
			 var crd_name = $("#crd_name").val();
			 var crd_phone = $("#crd_phone").val();
			 var oac_num = $("#oac_num").val();
			 if(oac_num==""||oac_num==undefined||oac_num==null||oac_num=="null"){
					oac_num = getoac_num
				 };
			 var obj = {
					 "crd_name" : crd_name,
					 "crd_phone" : crd_phone,
					 "oac_num" : oac_num
			 }
			 	$.ajax({
				type : 'post',
				url : 'rest/addcreditlist',
				data : obj,
				dataType : 'json',
				success : function (result){
					alert(result.result);
					location.href = "./posmain";
				}
			});
		
	}
	
	$("#background").click(function(){
		$("#background").css("display","none");
		$("#addcreditbox").css("display","none");
	});
	
	 
	

	/* 키패드 */
	var str = "";
	$("#uctmoney").val($("#totalmoney").val());

	$("#keypad ul li").click(function() {
	var endpay = $("#endpay").val();
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