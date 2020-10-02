<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
div#one, #two {
	width: 800px;
	height: 800px;
	border: 1px solid black;
	float: left;
}

table, td, tr, th {
	border: 1px solid black;
}

td {
	width: 100px;
	height: 100px;
}
div#two td {
	width: 100px;
	height: 40px;
}
</style>
<meta charset="UTF-8">
<title>storeManagement</title>
</head>
<body>
	<h2>storeManagement</h2>
	<form action='updatesellkey' method='post'>
	<div id="one">
		
			<table id="proCategoriList">
			</table>
		
	</div>
	</form>
	<div id="two">
		<table id="proList"></table>
	</div>

</body>
<script type="text/javascript">
	let flag = false;
	getProCatList();
	getProList();

	let pdc_date = "";
	let pdc_code = "";
	let pd_date = "";
	let pd_code = "";
	let pd_name = "";
	let pd_price = "";

	function setProInfo(ele) {
		if (flag) {
			$(ele).html("");
			$(ele).append($("<input type ='hidden' name ='pdc_code' value='"+pdc_code+"'>"))
			$(ele).append($("<input type ='hidden' name ='pd_code' value='"+pd_code+"'>"))
			$(ele).append($("<input type ='hidden' name ='pd_date' value='"+pd_date+"'>"))
			$(ele).append($("<input type ='hidden' name ='skc_code' value='"+ele.dataset.skc_code+"'>"))
			$(ele).append($("<input type ='hidden' name ='sk_num' value='"+ele.dataset.sk_num+"'>"))
			$(ele).append($("<div>"+pd_name+"</div>"))
			$(ele).append($("<div>"+pd_price+"원"+"</div>"))
			$(ele).append($("<input type ='button' value ='삭제' onclick='deleteSellKey(this)'>"))
// 			ele.dataset.pdc_date = pdc_date;
// 			ele.dataset.pdc_code = pdc_code;
// 			ele.dataset.pd_date = pd_date;
// 			ele.dataset.pd_code = pd_code;
			ele.childNodes[0].innerHTML = pd_name;
			ele.childNodes[1].innerHTML = pd_price;
			flag = false;
		}
	}
	function getProInfo(ele) {
		pd_name = ele.childNodes[0].innerHTML;
		pd_price = ele.childNodes[1].innerHTML;
		pdc_date = ele.dataset.pdc_date;
		pdc_code = ele.dataset.pdc_code;
		pd_date = ele.dataset.pd_date;
		pd_code = ele.dataset.pd_code;
		flag = true;
	}
	function selectSKC(ele) {
		let selectId = ele.dataset.skc_code;
		$(".sellKeyBasicTable").attr("hidden", "hidden");
		$("#" + selectId).removeAttr("hidden");
	}
	function getProList() {
		$.ajax({
			url : "rest/getProList",
			dataType : "json",
			success : function(data) {
				$("#proList").html(data.proList);
			}
		})
	}
	function getProCatList() {
		$.ajax({
			url : "rest/getSellKeyCatList",
			dataType : "json",
			success : function(data) {
				console.log(data);
				$("#proCategoriList").html(data.categoriList);
				$("#one").append(data.sellkeyList);
				$("#01").removeAttr("hidden");
			}
		})
	}
	function deleteSellKey(ele){
		ele = ele.parentNode;
		ele.innerHTML = "";
		$(ele).append($("<div>"+ele.dataset.sk_num+"</div>"));
	}
	function ChangeSellkeySize(ele){
		ele = ele.parentNode;
		let x = $(ele).children().eq(0).val();
		let y = $(ele).children().eq(1).val();
		$form = $("<form action ='updateSellKeySize' method ='post' name = 'updateSellKeySize' hidden ='hidden'>");
		$form.append("<input name = 'skc_code' value = '"+ele.dataset.skc_code+"'>");
		$form.append("<input name = 'x' value = '"+x+"'>");
		$form.append("<input name = 'y' value = '"+y+"'>");
		
		$("body").append($form);
		updateSellKeySize.submit();
		
		
	}
</script>
</html>