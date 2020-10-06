<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
div#one, #two {
	border: 1px solid black;
	min-height: 500px;
	min-width: 500px;
	float: left
}
</style>
<meta charset="UTF-8">
<title>stockController</title>

</head>
<body>
	<h2>stockController</h2>
	<div id="one">
		<table id="stockRecord">
			<tr >
				<th>상품 명</th>
				<th>변경 시간</th>
				<th>변경 수량</th>
			</tr>
		</table>
	</div>
	<div id="two">
		<h2>재고 상품 목록</h2>
		<table id="stockList">
			<tr>
				<th>상품 카테고리</th>
				<th>상품 명</th>
				<th>재고 수량 </th>
				<th>재고 추가 </th>
			</tr>
		</table>
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
				console.log(data);
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
				$("#stockList").append(data.stockList);
			}

		})
	}
</script>
</html>