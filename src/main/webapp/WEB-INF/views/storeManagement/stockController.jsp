<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/basicBox.css?after">
<link rel="icon" href="resources/image/smallLogo.png" type="image/x-icon">
<style type="text/css">
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

div#one, #two {
	border: 3px solid #81d4fa;
	width: 700px;
	height: 800px;
	float: left;
	background-color: white;
}

h2 {
    text-align: center;
}

table, th, td {
    border-collapse: collapse;
    font-size: 20px;
}

#stockRecorddiv {
    width: 700px;
    height: 800px;
    overflow: auto;
    text-align: center;
}

#stockRecorddiv::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#stockRecorddiv::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#stockRecorddiv::-webkit-scrollbar-thumb {
	background-color: #81d4fa;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#stockRecord {
    width: 700px;
    height: auto;
}

#stockRecord th {
    width: 100px;
    height: 50px;
    text-align: center;
    border: 3px solid white;
    background-color: #81d4fa;
    color: white;
}

#stockRecord td {
    height: 100px;
    border: none;
}

.number {
    width: 100px;
    height: 30px;
    border: 2px solid #81d4fa;
    font-size: 20px;
    text-align: center;
}

.updatebtn {
    width: 100px;
	height: 50px;
	border: 3px solid white;
	background-color: #e3f2fd;
	font-weight : bold; 
	color : #1565c0;
	font-size: 20px;
}

#stockListdiv {
    width: 700px;
    height: 650px;
    overflow: auto;
    text-align: center;
}

#stockListdiv::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#stockListdiv::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#stockListdiv::-webkit-scrollbar-thumb {
	background-color: #81d4fa;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#stockList {
    width: 700px;
    height: auto;
}

#stockList th {
    width: 100px;
    height: 50px;
    text-align: center;
    border: 3px solid white;
    background-color: #81d4fa;
    color: white;
}

#stockList td {
    height: 100px;
    border: none;
}

#Exit {
    width: 300px;
	height: 80px;
	border: 3px solid white;
	background-color: #e3f2fd;
	font-weight : bold; 
	color : #1565c0;
	font-size: 20px;
	float: right;
}

input:focus, button:focus {
	outline: none;
}

</style>
<meta charset="UTF-8">
<title>stockController</title>

</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
	<div id="one">
	<div id="stockRecorddiv">
		<table id="stockRecord">
			<tr >
				<th>상품 명</th>
				<th>변경 시간</th>
				<th>변경 수량</th>
			</tr>
		</table>
		</div>
	</div>
	<div id="two">
		<h2>재고 상품 목록</h2>
		<div id="stockListdiv">
		<table id="stockList">
			
		</table>
		</div>
		<button id="Exit" onclick="location.href='posmain'">나가기</button>
	</div>
	</div>
	</div>
</body>
<script type="text/javascript">
	getStockList();
	
	function updateStock(ele){ // 재고 업데이트
		element = ele.parentNode.parentNode;
		let oh_cnt = $(ele).siblings().val() // 
		let pdc_code = element.dataset.pdc_code;
		let pd_code = element.dataset.pd_code;
		let pd_date = element.dataset.pd_date;
		$.ajax({
			url : "rest/updateStock",
			type : "post",
			dataType : "json",
			data : {
				"oh_cnt" : -oh_cnt,
				"pdc_code" : pdc_code,
				"pd_code" : pd_code,
				"pd_date" : pd_date
			},
			success : function(data){
				getStockList();
				getStockRecord(ele.parentNode)
			}
		});
	}
	function getStockRecord(ele){ // 재고 기록 가져오기
		ele = ele.parentNode;
		let pdc_code = ele.dataset.pdc_code;
		let pd_code = ele.dataset.pd_code;
		let pd_date = ele.dataset.pd_date;
		$.ajax({
			url : "rest/getStockRecord",
			data : {
				"pdc_code" : pdc_code,
				"pd_code" : pd_code,
				"pd_date" : pd_date
			},
			dataType : "json",
			success : function(data){
				if(data.length =="0"){
				$("#stockRecord").html("")
					return;
				}
				$("#stockRecord").html(data.stockRecord)
			}
		})
	}
	
	function getStockList() { // 재고가 있는 상품 리스트 가져오기
		$.ajax({
			url : "rest/getStockList",
			dataType : "json",
			success : function(data) {
				$("#stockList").html("");
				$("#stockList").append("<tr><th>상품 카테고리</th><th>상품 명</th>	<th>재고 수량 </th><th>재고 추가 </th></tr>");
				$("#stockList").append(data.stockList);
			}

		})
	}
</script>
</html>