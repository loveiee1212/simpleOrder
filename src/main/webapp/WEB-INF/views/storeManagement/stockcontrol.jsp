<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

#a {
	margin-top: 35px;
	border: 1px solid black;
	width: 700px;
	height: 730px;
	float: left;
}

#b {
	margin-right: 10px;
	margin-top: 127px;
	height: 400px;
	overflow: auto;
	margin-top: 127px;
}

#c {
	margin-top: 35px;
	margin-left: 95px;
	border: 1px solid black;
	width: 700px;
	height: 730px;
	float: left;
	border: 1px solid black;
}

#d {
	margin-left: 27px;
}

#e {
	margin-right: 10px;
	overflow: auto;
	margin-left: 27px;
	height: 400px;
	margin-top: 50px;
}

.tab2 {
	margin-top: 50px;
	/* border: 1px solid black; */
	text-align: center;
}

.tab1 {
	overflow: scroll;
}

.tab1 tr td {
	border: 1px solid black;
	width: 150px;
	height: 70px;
}

.tab2 tr td {
	margin-left: 320px;
}

.tab3 tr td {
	border: 1px solid black;
	width: 205px;
	height: 70px;
	margin: 30px;
	border: 1px solid black;
}

.btnDown, .btnUp {
	width: 150px;
	height: 70px;
	border: none;
	background: none;
}

#btnSave {
	margin-left: 510px;
	margin-top: 50px;
	width: 150px;
	height: 70px;
	border: none;
}

#btnEnd {
	margin-left: 510px;
	margin-top: 50px;
	width: 150px;
	height: 70px;
	border: none;
	margin-top: 50px;
}

#h2_1 {
	margin-left: 27px;
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
			<div id="a">

				<h2 id="h2_1">입고물품 등록</h2>
				<div id="b">

					<center>
						<table class="tab1">

						</table>
				</div>
				<input type="button" value="저장" id="btnSave">
				</center>
			</div>
			<div id="c">
				<div id="d">
					<h2>입고 내역</h2>
					<table class="tab2">
						<tr>
							<td>입출고 날짜</td>
							<td><input type="date" name="b_date" id="b_date" /></td>
							<td>
								<button type="button" onclick="searchbills()">조회</button>
							</td>
						</tr>
					</table>
				</div>
				<div id="e">
					<table class="tab3">

					</table>
				</div>
				<input type="button" value="나가기" id="btnEnd">
			</div>
		</div>
	</div>
</body>
<script>
	$.ajax({
		type : post,
		url : "rest/getstocklist",
		data : 'json',
		success : function() {
			for ( var i in result)
				console.log(result[i]);
			console.log(result[i]);
			$().append(result[i]);
			$().append("<div id='stockList"+i+"' class='stockList'>")
		},
		error : function(err) {
			console.log(err);
		}
	});
	
	
</script>
</html>