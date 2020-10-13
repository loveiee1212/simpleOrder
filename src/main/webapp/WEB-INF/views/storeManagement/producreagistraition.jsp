<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" href="resources/image/smallLogo.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="resources/css/basicBox.css?after">
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

h2 {
    text-align: center;
}

div#one {
	width: 740px;
	height: 800px;
	border: 3px solid #2565a3;
	float: left;
	background-color: white;
}

#proCategoriListdiv {
    width: 740px;
    height: 60px;
    overflow: auto;
    overflow-y: hidden; 
}

#proCategoriListdiv::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#proCategoriListdiv::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#proCategoriListdiv::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#proCategoriList {
	border-collapse: collapse;
	width: 500px;
	height: 50px;
	font-size: 25px;
	font-weight: bold;
	text-align: center;
	background-color: #e3f2fd;
	color: #1565c0;
	margin-bottom: 2px;
}

#proCategoriList td {
	border: none;
	border-right: 3px solid #2565a3;
	border-bottom: 3px solid #2565a3;
}

#aSellCTDiv {
    width: 730px;
    height: 650px;
    overflow: auto;
}

#aSellCTDiv::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#aSellCTDiv::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#aSellCTDiv::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#aSCK_name {
    border: 3px solid #2565a3;
    height: 60px;
    background-color: #2565a3;
    font-size: 23px;
    color: white;
}

#savebtn {
    width: 300px;
    height: 60px;
    border: 3px solid #2565a3;
    background-color: #e3f2fd;
    font-weight: bold;
    color: #1565c0;
    font-size: 20px;
    float: right;
    margin-right: 40px;
}

.sellKeyBasicTable {
    width: 700px;
    height: 400px;
	border-collapse: collapse;
}

.sellKeyBasicTable td {
    width: 150px;
    height: 150px;
    font-size: 20px;
    font-weight: bold;
    text-align: center;
    border: 3px solid #2565a3;
}

.adeletebtn {
    width: 100px;
    height: 40px;
    font-size: 20px;
    border: 3px solid #2565a3;
    color: red;
    background-color: white;
    font-weight: bold;
}

.anumber {
    width: 180px;
    height: 50px;
    font-size: 25px;
    border: 3px solid #2565a3;
    margin-left: 20px;
    text-align: center;
}

#Changebtn {
    border: 3px solid white;
    color: white;
    background-color: #2565a3;
    width: 200px;
    height: 70px;
    font-size: 20px;
    font-weight: bold;
    margin-left: 20px;
}

div#two {
	width: 740px;
	height: 598px;
	border: 3px solid #2565a3;
	float: left;
	background-color: white;
	overflow: auto;
	overflow-x: hidden;
	font-weight: bold;
}

#two::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#two::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#two::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#proList {
    text-align: center;
}

div#three {
	width: 740px;
	height: 200px;
	border: 3px solid #2565a3;
	border-top: none;
	float: left;
	background-color: white;
}

div#two table {
	border-collapse: collapse;
	width: 700px;
}

div#two td {
	width: 100px;
	height: 50px;
	font-size: 20px;
}

#sellKeyCategoriList {
	width: 250px;
	height: 40px;
	font-size: 20px;
	border: 3px solid #2565a3;
	margin: 20px;
}

#deleteSkcCategoribtn {
	width: 100px;
    height: 50px;
    border: 3px solid #2565a3;
    background-color: white;
    color: red;
    font-size: 25px;
    font-weight: bold;
}

#createSkcName {
	width: 250px;
	height: 40px;
	font-size: 18px;
	border: 3px solid #2565a3;
	margin-left: 20px;
}

#createSkcCategoribtn {
	width: 150px;
	height: 55px;
	border: 3px solid #2565a3;
	background-color: #e3f2fd;
	font-weight: bold;
	color: #1565c0;
	font-size: 22px;
}

#Exit {
	text-align: center;
    border: 2px solid white;
    width: 250px;
    height: 60px;
    background-color: #2565a3;
    font-weight: bold;
    color: white;
    font-size: 22px;
    float: right;
    margin-right: 20px;
}

input:focus, button:focus, select:focus {
	outline: none;
}
</style>
<meta charset="UTF-8">
<title>판매 상품 관리</title>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
	<form action='updatesellkey' method='post'>
	<div id="one">
		<div id="proCategoriListdiv">
			<table id="proCategoriList">
			</table>
		</div>
	</div>
	</form>
	<div id="two">
	<h2>판매 상품 관리</h2>
		<table id="proList"></table>
	</div>
	<div id="three">
		<select id="sellKeyCategoriList">
			
		</select><input type="button" value ='삭제' id="deleteSkcCategoribtn" onclick='deleteSkcCategoriFun()'>
		<br/>
		<input type="text" id='createSkcName'>
		<input type="button" value ='추가' id="createSkcCategoribtn" onclick='createSkcCategorifunction()'>
		<br>
				<button id="Exit" type="button" onclick="location.href='./posmain'">메인으로</button>
	</div>
</div>
</div>
</body>
<script type="text/javascript">
	getSellKeyCategoriList();
	let flag = false;
	getProCatList();
	getProList();

	let pdc_date = "";
	let pdc_code = "";
	let pd_date = "";
	let pd_code = "";
	let pd_name = "";
	let pd_price = "";
	
	let newSkc_code = 0;
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
			$(ele).append($("<input type ='button' value ='삭제' class = 'adeletebtn' onclick='deleteSellKey(this)'>"))
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
				$(".sellKeyBasicTable").eq(0).removeAttr("hidden");
			}
		})
	}
	function deleteSellKey(ele){
		ele = ele.parentNode;
		console.log(ele);
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
	function getSellKeyCategoriList(){
		$.ajax({
			url : "rest/getSellKeyCategoriList",
			dataType : "json", 
			success : function(list){
				console.log(list);
				$("#sellKeyCategoriList").html(list.sckList);
				newSkc_code = list.newSkc_code;
			}
		})
	}
	function createSkcCategorifunction(){
		skc_name = $("#createSkcName").val();
		console.log(newSkc_code);
		$form = $("<form action ='createSkcCategori' method ='post' name = 'createSkcCategori' hidden ='hidden'>");
		$form.append("<input name = 'skc_code' value = '"+newSkc_code+"'>");
		$form.append("<input name = 'skc_name' value = '"+skc_name+"'>");
		$("body").append($form);
		createSkcCategori.submit();
	}
	function deleteSkcCategoriFun(){
		let skc_code = $("#sellKeyCategoriList").children(":selected").attr("id");
		$form = $("<form action ='deleteSkcCategori' method ='post' name = 'deleteSkcCategori' hidden ='hidden'>");
		$form.append("<input name = 'skc_code' value = '"+skc_code+"'>");
		$("body").append($form);
		deleteSkcCategori.submit();
	}
</script>
</html>