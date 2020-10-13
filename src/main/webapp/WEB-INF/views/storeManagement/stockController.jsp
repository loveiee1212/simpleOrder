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
	border: 3px solid #2565a3;
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
    font-weight: bold;
}

#stockRecorddiv {
    width: 700px;
    height: 800px;
    overflow: auto;
    text-align: center;
    overflow-x: hidden;
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
	background-color: #2565a3;
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
    height: 60px;
    text-align: center;
    border: 3px solid white;
    background-color: #2565a3;
    color: white;
    font-size: 25px;
}

#stockRecord td {
    height: 100px;
    border: none;
}

.anumber {
    width: 100px;
    height: 30px;
    border: 3px solid #2565a3;
    font-size: 20px;
    text-align: center;
}

.aupdatebtn {
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
    overflow-x: hidden;
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
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#stockList {
    width: 700px;
    height: auto;
}

#stockList th {
    width: 130px;
    height: 60px;
    text-align: center;
    border: 3px solid white;
    background-color: #2565a3;
    color: white;
    font-size: 25px;
}

#stockList td {
    height: 100px;
    border: none;
}

#Exit {
    width: 300px;
	height: 80px;
	border: 3px solid white;
	background-color: #2565a3;
	font-weight : bold; 
	color : white;
	font-size: 20px;
	float: right;
}

input:focus, button:focus {
	outline: none;
}

</style>
<meta charset="UTF-8">
<title>재고관리</title>

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
	
	var sortType = 'asc'; 

	function sortContent(index) {
	    var table = $("#stockRecord");

	    sortType = (sortType =='asc')?'desc' : 'asc';

	    var checkSort = true;
	    var rows = table[0].rows;
	    console.log(rows)

	    while (checkSort) { // 현재와 다음만 비교하기때문에 위치변경되면 다시 정렬해준다.
	        checkSort = false;

	        for (var i = 1; i < (rows.length-1); i++) {
	           var fCell = rows[i].cells[index].innerHTML.toUpperCase();
	            var sCell = rows[i + 1].cells[index].innerHTML.toUpperCase();

	            var row = rows[i];

	            // 오름차순<->내림차순 ( 이부분이 이해 잘안됬는데 오름차순이면 >, 내림차순이면 <이고 if문의 내용은 동일하다 )
	            if ( (sortType == 'asc' && fCell > sCell) || 
	                    (sortType == 'desc' && fCell < sCell) ) {

	                row.parentNode.insertBefore(row.nextSibling, row);
	                checkSort = true;
	            }
	        }
	    }
	}
	
	var sortType = 'asc'; 

	function sortContent2(index) {
	    var table = $("#stockList");

	    sortType = (sortType =='asc')?'desc' : 'asc';

	    var checkSort = true;
	    var rows = table[0].rows;
	    console.log(rows)

	    while (checkSort) { // 현재와 다음만 비교하기때문에 위치변경되면 다시 정렬해준다.
	        checkSort = false;

	        for (var i = 1; i < (rows.length-1); i++) {
	           var fCell = rows[i].cells[index].innerHTML.toUpperCase();
	            var sCell = rows[i + 1].cells[index].innerHTML.toUpperCase();

	            var row = rows[i];

	            // 오름차순<->내림차순 ( 이부분이 이해 잘안됬는데 오름차순이면 >, 내림차순이면 <이고 if문의 내용은 동일하다 )
	            if ( (sortType == 'asc' && fCell > sCell) || 
	                    (sortType == 'desc' && fCell < sCell) ) {

	                row.parentNode.insertBefore(row.nextSibling, row);
	                checkSort = true;
	            }
	        }
	    }
	}
	
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
				$("#stockList").append("<tr><th onclick='sortContent2(0)'>상품 카테고리</th><th onclick='sortContent2(1)'>상품 명</th>	<th onclick='sortContent2(2)'>재고 수량 </th><th>재고 추가 </th></tr>");
				$("#stockList").append(data.stockList);
			}

		})
	}
</script>
</html>