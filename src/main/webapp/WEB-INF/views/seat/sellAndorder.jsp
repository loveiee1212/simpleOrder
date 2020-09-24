<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>sellAndorder-판매</title>
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

#listbox button {
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
	margin-top: 10px;
}

div #listbox tr, td {
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
	width: 80px;
	height: 30px;
	margin-top: 25px;
	margin-left: 5px;
	text-align: center;
	padding: 10px;
	float: left;
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

#moneylist ul li input[type="number"]::-webkit-outer-spin-button,
	#moneylist ul li input[type="number"]::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
} /* input 태그 안 number로 주었을 때 */
.tab {
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

.tab button {
	background-color: inherit;
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
	background-color: #ddd;
}

.tab button.active {
	background-color: #ccc;
}

.productbox {
	width: 150px;
	height: 120px;
	margin-top: 15px;
	margin-left: 25px;
	border: 1px solid black;
	float: left;
}
</style>
</head>
<body>
${sc_code}
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

			<div class="innerdiv">
				<div id="listbox">
					<center>${list}</center>
				</div>
				<div id="moneylist">
					<ul>
						<li>총금액 <input type="number" readonly="readonly"
							id="totalmoney" value="108000"></li>
						<li>결제금액 <input type="number" id="takemoney" value="0"
							placeholder="0"></li>
						<li id="Remain_money">남은금액 <input type="number"
							readonly="readonly" id="uctmoney"></li>
					</ul>
				</div>
				<div class="bottombox" id="paymentkind">
					<ul>
						<li>현금결제</li>
						<li>카드결제</li>
						<li>외상결제</li>
						<li onclick='sendsaoList()'>주문하기</li>
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
	totalprice();
	console.log($("#oac_num").val()=="undefined");
	if($("#oac_num").val()=="undefined"){
		$("#oac_num").val(null);
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
			if (val == ""){				
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
		var pdcdateArray = [];
		var dateArray = [];
		var $pdccode = $("input[name = 'pdcode']");
		//console.log($pdccode.length);

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
				pdcdateArray.push($("#pddate" + i).data('code'));
			}

		}
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
			"pdc_date" : pdcdateArray,
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

	var str = "";
	$("#uctmoney").val($("#totalmoney").val());

	$("#keypad ul li")
			.click(
					function() {
						if ($(this).val() == 11 || $(this).val() == 12) {
							return;
						}

						str += $(this).val();
						$("#takemoney").val(str);
						$("#uctmoney").val(
								$("#totalmoney").val() - $("#takemoney").val());

						if (($("#totalmoney").val() - $("#takemoney").val()) < 0) {
							$("#Remain_money")
									.html(
											"거스름돈 <input type='number' readonly='readonly' id='uctmoney'>");
							$("#uctmoney").val(
									($("#totalmoney").val() - $("#takemoney")
											.val())
											* (-1));
						} else {
							$("#Remain_money")
									.html(
											"남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
							$("#uctmoney").val(
									($("#totalmoney").val() - $("#takemoney")
											.val()));
						}
					});

	function reset() {
		str = str.substring(str.length, str.length);
		$("#takemoney").val(str);
		$("#Remain_money").html(
				"남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
		$("#uctmoney").val($("#totalmoney").val());

	}

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

	$("#takemoney")
			.keyup(
					function(evt) {
						//console.log(evt);
						$("#uctmoney").val(
								$("#totalmoney").val() - $("#takemoney").val());

						if (($("#totalmoney").val() - $("#takemoney").val()) < 0) {
							$("#Remain_money")
									.html(
											"거스름돈 <input type='number' readonly='readonly' id='uctmoney'>");
							$("#uctmoney").val(
									($("#totalmoney").val() - $("#takemoney")
											.val())
											* (-1));
						} else {
							$("#Remain_money")
									.html(
											"남은금액 <input type='number' readonly='readonly' id='uctmoney'>");
							$("#uctmoney").val(
									($("#totalmoney").val() - $("#takemoney")
											.val()));
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