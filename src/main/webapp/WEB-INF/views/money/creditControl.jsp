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
	margin-left: 60px;
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

#crdtableList tr, #crdtableList td{
width : 150px;
}

</style>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
				<center>
			<div class="innerdiv" id="creditList">
					
			</div>
				</center>

			<div class="innerdiv">
				<div id="listbox">
					<center>
						<table>
							<tr>
								<td>상품1</td>
								<td>10,000</td>
								<td style="border: none;"><input type="text" value="2"
									style="width: 30px; height: 40px;"></td>
							</tr>
							<tr>
								<td>상품2</td>
								<td>50,000</td>
								<td style="border: none;"><input type="text" value="2"
									style="width: 30px; height: 40px;"></td>
							</tr>
							<tr>
								<td>상품3</td>
								<td>97,000</td>
								<td style="border: none;"><input type="text" value="4"
									style="width: 30px; height: 40px;"></td>
							</tr>
						</table>
					</center>
				</div>
				<div id="moneylist">
					<ul>
						<li>총금액 <input type="number" readonly="readonly"
							id="totalmoney" value="108000"></li>
						<li>수금 <input type="number" id="takemoney" value="0"
							placeholder="0"></li>
						<li>미수금 <input type="number" readonly="readonly"
							id="uctmoney"></li>
					</ul>
				</div>
				<div class="bottombox" id="paymentkind">
					<ul>
						<li>현금결제</li>
						<li>카드결제</li>
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
	 console.log(result);
	 $("#creditList").html(result.data);
	 $("#crdtableList .crdinfo").click(function() {
			var tdArr = new Array();
					var tr = $(this);
					var td = tr.children();
					console.log(tr.text());
					/* tr 행의 정보들을 Arr에 담음 */
					td.each(function(i) {
						tdArr.push(td.eq(i).text());
					});
					$("#crdtableList tr[class='.crdinfo']").css('background-color','white');
					tr.css('background-color', '#ddd');
					console.log("배열에 담긴 값 : " + tdArr);
	 });
	 }
	 })
	};
	
	function detailcrdInfo(){
		$.ajax({
			type : 'post',
			url : 'rest/getorderlist',
			data : {oac_status : "0" }
		})
	}
	 
	 
	var str = "";
	$("#uctmoney").val($("#totalmoney").val());

	$("#keypad ul li").click(function() {
	if ($(this).val() == 11 || $(this).val() == 12) {return;}
	str += $(this).val();
	$("#takemoney").val(str);
	$("#uctmoney").val(
	$("#totalmoney").val() - $("#takemoney").val());
	if (($("#totalmoney").val() - $("#takemoney").val()) < 0) {
	$("#Remain_money").html(
	"거스름돈 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val(($("#totalmoney").val() - $("#takemoney").val())* (-1));} 
	else {$("#Remain_money").html(
	"남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val(($("#totalmoney").val() - $("#takemoney").val()));}
	});

	function reset() {
		str = str.substring(str.length, str.length);
		$("#takemoney").val(str);
		$("#Remain_money").html(
				"남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
		$("#uctmoney").val($("#totalmoney").val());}

	function backspace() {
		//	console.log("length" + str.substr(0, str.length - 1));
		$("#takemoney").val(str.substr(0, str.length - 1));
		$("#uctmoney").val($("#totalmoney").val() - $("#takemoney").val());
		str = $("#takemoney").val();

		if (($("#totalmoney").val() - $("#takemoney").val()) < 0) {
			$("#Remain_money")
					.html(
							"거스름돈 <input type='number' readonly='readonly' id='uctmoney'>");
			$("#uctmoney").val(
					($("#totalmoney").val() - $("#takemoney").val()) * (-1));
		} else {
			$("#Remain_money")
					.html(
							"남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
			$("#uctmoney")
					.val(($("#totalmoney").val() - $("#takemoney").val()));
		}
	}

	$("#takemoney").keyup(function(evt) {
	$("#uctmoney").val($("#totalmoney").val() - $("#takemoney").val());
	if (($("#totalmoney").val() - $("#takemoney").val()) < 0) {
	$("#Remain_money").html(
	"거스름돈 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val(($("#totalmoney").val() - $("#takemoney").val())* (-1));} 
	else {$("#Remain_money").html(
	"남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
	$("#uctmoney").val(($("#totalmoney").val() - $("#takemoney").val()));}
	});
	$("#takemoney").focus(function() {
	$("#takemoney").val("");
	});
	
	
	
</script>
</html>
