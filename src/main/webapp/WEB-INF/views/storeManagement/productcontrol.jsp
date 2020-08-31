<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>productControl-상품관리</title>
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
	margin: 0 50%;
}

#baseinnerBox {
	float: left;
	border: pink 1px solid;
	width: 1500px;
	height: 800px;
	padding: 30px;
}

#outerdiv {
	width: 1500px;
	height: 800px;
	margin: 20px;
}

#innerdiv1 {
	border: 1px solid black;
	width: 700px;
	height: 755px;
	float: left;
	/* margin-left: 30px; */
	/* 	margin-top: 20px; */
}

#innerdiv2 {
	border: 1px solid black;
	width: 700px;
	height: 755px;
	float: left;
	margin-left: 55px;
}

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
	width: 600px;
	height: 400px;
	margin-left: 50px;
	margin-top: 10px;
}

#listbox input {
	width: 200px;
	height: 30px;
	margin: 20px;
	font-size: 20px;
	clear: both;
}

#listbox button {
	float: right;
	margin: 10px;
}

.bottombox {
	width: 300px;
	height: 280px;
	margin-top: 10px;
	margin-left: 30px;
	float: left;
}

#paymentkind ul li {
	list-style: none;
	border: 1px solid black;
	width: 110px;
	height: 30px;
	/* margin-left: 30px;*/
	margin-top: 20px;
	text-align: center;
	padding: 20px;
}

#keypad ul li {
	list-style: none;
	border: 1px solid black;
	width: 20px;
	height: 15px;
	text-align: center;
	padding: 25px;
	float: left;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

select {
	width: 150px;
	height: 50px;
	margin: 50px;
	font-size: 15px;
}

p {
	font-size: 20px;
}

tr, td {
	border: 1px solid black;
	width: 80px;
	height: 20px;
	padding: 20px;
	margin: 30px;
	text-align: center;
}
</style>
</head>

<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<div id="outerdiv">
				<div id="innerdiv1"></div>
				<div id="productList"></div>
				<div id="innerdiv2">
					<div id="listbox">
						<form action="sendupdateprice">
							<input type="text" name="p_code" id="p_code" readonly="readonly"
								placeholder="1-11" style="width: 50px;" />
							<button type="reset">다시 작성</button>
							<br />
							<center>
								<input type="text" name="p_name" id="p_name" placeholder="상품 이름" /><br />
								<input type="number" name="p_price" id="p_price" placeholder="가격 입력" /><br /> 
								<input type="file" name="p_img" id="p_img" style="width: 300px; height: 30px;" /><br /> 
							 <select name="p_printer">
									<option value="">프린터 없음</option>
									<option value="prt-1001">prt-1001</option>
									<option value="prt-2000M">prt-2000M</option>
								</select>
							</center>
						</form>
					</div>

					<div class="bottombox" id="paymentkind">
						<ul>
							<li onclick="updateproduct()">수정/등록</li>
							<li onclick="gomain()">메인으로</li>
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
	$.ajax({
		type : post,
		url : "rest/getproductlist",
		data : 'json',
		success : function() {
			for ( var i in result)
				console.log(result[i]);
			console.log(result[i]);
			$("#productList").append(result[i].productList);
			$("#productList").append(
					"<div id='stockList"+'i'+"' class='stockList'>")
		},
		error : function(err) {
			console.log(err);
		}
	});

	var str = "";
	$("#keypad ul li").click(function() {
		if ($(this).val() == 11 || $(this).val() == 12) {
			return;
		}
		console.log($(this).val());
		str += $(this).val();
		//console.log(str);
		$("#p_price").val(str);
	});

	function reset() {
		$("#p_price").val("");
	}

	function backspace() {
		console.log("length" + str.substr(0, str.length - 1));
		$("#p_price").val(str.substr(0, str.length - 1));
		str = $("#p_price").val();
	}

	function updateproduct() {
		/* 상품수정/등록 */
	}

	function gomain() {
		/* 메인으로 돌아가기 */
	}
</script>
</html>