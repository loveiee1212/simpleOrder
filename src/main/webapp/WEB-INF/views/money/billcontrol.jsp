<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>영수증관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="icon" href="resources/image/smallLogo.png"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="resources/css/basicBox.css?after">
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

#b_topbox {
	width: 700px;
	height: 150px;
	margin-left: 30px;
	margin-top: 20px;
}

#b_topbox h1 {
	margin-left: 20px;
}

#searchbills tr, #searchbills th, #searchbills td {
	width: 150px;
	height: 30px;
	font-size: 20px;
}

#b_date {
	border: 3px solid #81d4fa;
	height: 30px;
	font-size: 20px;
}

#b_code {
	border: 3px solid #81d4fa;
	height: 40px;
	font-size: 20px;
}

#search {
	width: 130px;
	padding: 10px;
	margin-left: 10px;
	font-size: 20px;
	font-weight: bold;
	border: 3px solid white;
	color: white;
	background-color: #81d4fa;
	border: 3px solid white;
	margin-left: 10px;
}

#b_middlebox {
	border: 3px solid #81d4fa;
	width: 680px;
	height: 580px;
	margin-left: 30px;
	margin-top: 15px;
	overflow: auto;
	border-collapse: collapse;
}

#b_middlebox::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: white;
}

#b_middlebox::-webkit-scrollbar {
	width: 10px;
	height: 10px;
	background-color: white;
}

#b_middlebox::-webkit-scrollbar-thumb {
	background-color: #81d4fa;
	background-image: -webkit-gradient(linear, 0 0, 0 100%, color-stop(.5, rgba(255, 255, 255,
		.2)), color-stop(.5, transparent), to(transparent));
}

#b_middlebox th {
	background-color: #81d4fa;
	color: white;
	width: 130px;
	height: 50px;
	font-size: 20px;
	text-align: center;
}

#b_middlebox td {
	width: 130px;
	height: 80px;
	font-size: 20px;
	text-align: center;
	border-top: 2px solid #81d4fa;
}

#companyList {
	font-size: 20px;
}

#bill_info {
	border: 3px solid #81d4fa;
	width: 600px;
	height: 450px;
	margin-top: 40px;
	margin-left: 65px;
	overflow: auto;
}

#bill_info::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: white;
}

#bill_info::-webkit-scrollbar {
	width: 10px;
	height: 10px;
	background-color: white;
}

#bill_info::-webkit-scrollbar-thumb {
	background-color: #81d4fa;
	background-image: -webkit-gradient(linear, 0 0, 0 100%, color-stop(.5, rgba(255, 255, 255,
		.2)), color-stop(.5, transparent), to(transparent));
}

#proTable {
	width: 400px;
	height: 150px;
	text-align: center;
	margin-left: 100px;
	font-size: 20px;
}

#payTable {
	width: 600px;
	height: 120px;
	text-align: right;
	font-size: 20px;
	padding-right: 20px;
}

#payTable th {
	float: left;
}

#takeActionbox {
	width: 700px;
	height: 260px;
	float: left;
	margin-top: 10px;
	margin-left: 27px;
}

.takeAction {
	border: 3px solid white;
	background-color: #81d4fa;
	color: white;
	width: 165px;
	height: 70px;
	text-align: center;
	margin: 10px;
	margin-left: 40px;
	float: left;
	width: 165px;
}

.takeAction2 {
	border: 3px solid white;
	background-color: #e3f2fd;
	color: #1565c0;
	width: 165px;
	height: 70px;
	text-align: center;
	margin: 10px;
	margin-left: 40px;
	float: left;
	background-color: #e3f2fd;
}

.takeAction3 {
	border: 3px solid #81d4fa;
	background-color: white;
	color: red;
	width: 165px;
	height: 70px;
	text-align: center;
	margin: 10px;
	margin-left: 40px;
	float: left;
}

.takeAction p, .takeAction2 p, .takeAction3 p {
	margin-top: 20px;
	font-size: 20px;
	font-weight: bold;
}

#Exit {
	text-align: center;
	border: 2px solid white;
	width: 605px;
	height: 70px;
	background-color: #81d4fa;
	font-weight: bold;
	color: white;
	font-size: 20px;
	float: right;
	margin-top: 10px;
	margin-right: 50px;
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
				<div id="b_topbox">
					<h1>영수증 관리</h1>
					<table id="searchbills">
						<tr>
							<th>영업일 선택</th>
							<td><input type="date" name="b_date" id="b_date" /></td>
							<td rowspan="2"><button type="button" id="search"
									onclick="searchbills()">조회</button></td>
						</tr>
						<tr>
							<th>주문번호</th>
							<td><input type="text" name="b_code" id="b_code" /></td>
						</tr>


					</table>
				</div>
				<div id="b_middlebox">${bList}</div>

			</div>

			<div class="innerdiv">
				<div id="bill_info" class="bottombox">
					<!-- 상호이름 상단노출 -->
					<center>
						<h1 id='titlename'></h1>
					</center>
					<div id='top_info'>
						<div id='companyList'></div>
						<div id='middle_info'>
							<div id='proList'></div>
							<div id='bottom_info'></div>
						</div>
					</div>
				</div>
				<div id="takeActionbox" class="bottombox">
					<div class="takeAction">
						<p>재출력</p>
					</div>
					<div class="takeAction">
						<p>현금 영수증</p>
					</div>
					<div class="takeAction">
						<p>결제 변경</p>
					</div>
					<div class="takeAction2">
						<p>직원 재출력</p>
					</div>
					<div class="takeAction3" id='cancelpay'>
						<p>결제 취소</p>
					</div>
					<div class="takeAction2" id='repay'>
						<p>재매출</p>
					</div>
					<button id="Exit" type="button"
						onclick="location.href='./sellpage'">뒤로가기</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(".bList_tr").click(function() {
				var tr = $(this);
				var td = tr.children();
				/* tr 행의 정보들을 Arr에 담음 */
				$("tr").css('background-color', 'white');
				tr.css('background-color', '#ddd');
				var bd_date = td.children("#bd_date").val();
				var oac_num = td.children("#oac_num").val();
				var oac_status = td.children("#oac_status").data('code');
				var obj = {
					"bd_date" : bd_date,
					"oac_num" : oac_num,
					"oac_status" : oac_status
				}
				 $.ajax({
					type : 'post',
					url : 'rest/getdetailbill',
					data : obj,
					dataType : 'json',
					success : function(data) {
						console.log(data);
						$("#titlename").html(data.companyName);
						$("#companyList").html(data.companyList);
						$("#proList").html(data.productList);
						$("#bottom_info").html(data.paymentList);
						$("#uctcredit").html(Number($("#all_total").text())-$("#total").val());
						
						//선택한 주문번호가 결제이거나 외상일 떄
						if(oac_status==-1||oac_status==0){
						$("#cancelpay").css("color","red");
						$("#repay").css("color","#81d4fa");
						
						}else{
							$("#cancelpay").css("color","#ddd");
							$("#repay").css("color","#ddd");	
						}
						
						$("#cancelpay").click(function(){
							if(oac_status==1||oac_status==-2){
							return false;
							}else{
								cancelpay(obj);
							}
							
					});
						
						$("#repay").click(function(){
							if(oac_status==1||oac_status==-2){
							return false;
							}else{
								repay(obj);
							}
						});
					}

		});
		});
	
	 function cancelpay(obj){
		console.log(obj);
		if(confirm("결제 취소 시 해당하는 모든 상품이 반품 처리 됩니다. 취소하시겠습니까 ?")){
		$.ajax({
			type : 'post',
			url : 'rest/cancelpay',
			data : obj,
			dataType : 'json',
			success : function(result){
				console.log(result);
				alert(result.result);
				location.reload();
			}
		});
		}else{
			alert("실행이 취소되었습니다.");
		}
	} 
	 function repay(obj){
		 if(confirm("재매출 시 해당하는 모든 상품이 반품 처리 됩니다. 재매출 처리 하시겠습니까 ?")){
				$.ajax({
					type : 'post',
					url : 'rest/cancelpay',
					data : obj,
					dataType : 'json',
					success : function(result){
						location.href = "./resell?oac_num=" + obj.oac_num+ "&bd_date=" + obj.bd_date + "&oac_num="+ obj.oac_num+ "&oac_status="+ obj.oac_status;
					}
				});
				}else{
					alert("실행이 취소되었습니다.");
				}
	 
	 }
</script>
</html>