<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>productRagistration-상품등록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/basicBox.css" type="text/css">
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

#outerdiv {
	width: 1500px;
	height: 800px;
	margin: 20px;
}

#innerdiv1 {
	background-color: white;
	border: 1px solid #e3f2fd;
	width: 700px;
	height: 755px;
	float: left;
	/* margin-left: 30px; */
	/* 	margin-top: 20px; */
}

#innerdiv2 {
	background-color: white;
	border: 3px solid #81d4fa;
	width: 700px;
	height: 755px;
	float: left;
	margin-left: 55px;
}

button {
	color: red;
	background-color: white;
	border: none;
	button: focus; 
	outline: none;
	box-shadow: none;
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
	/* float: right; */
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

table {
	border: none;
	border-collapse: collapse;
}

td {
	width: 150px;
	height: 20px;
	border: 3px solid #81d4fa;
	border-top-color: white;
	border-left-color: white;
	border-right-color : white; 
	padding : 20px;
	margin : 30px; 
	text-align : center; 
	font-size : 19px;
	font-weight: bold;
}

tr {
	width: 150px;
	height: 20px;
	border: 3px solid #81d4fa;
	padding: 20px;
	margin: 30px;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

.tab {
	overflow: hidden;
	border: none;
	background-color: #e3f2fd;
}

.category {
	font-size: 20px;
	background-color: white;
	color: #1565c0;
	font-weight: bold;
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

.pList {
	display: none;
}

.blockCtg {
	display: block;
}

.pdts {
	border: 5px solid #81d4fa;
	width: 150px;
	height: 100px;
	float: left;
	margin: 15px;
	opacity: 0.5;
	background-color: white;
	font-size: 20px;
}
</style>
</head>

<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<div id="outerdiv">
				<div id="innerdiv1">
					<div class="tab"></div>
					<div id="pbox"></div>
				</div>
				<div id="innerdiv2">
					<div id="productList">
						<table id="pListtable">
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	getproductcategoryList();
	getproductList2();
	function getproductList2() {
		$.ajax({
			type : "post",
			url : "rest/getproductlist2",
			dataType : 'json',
			success : function(result) {
				console.log(result);
				$("#pListtable").html(result.pList2);
			},
			error : function(err) {
				console.log(err);
			}
		});
	}

	function getproductcategoryList() {

		$.ajax({
			type : "post",
			url : "rest/getproductcategorylist",
			dataType : 'json',
			success : function(result) {
				console.log(result);
				for ( var i in result) {
					$("div .tab").append(result[i].pdc_name);
					if (i < 10) {
						$("#pbox").append(
								"<div id='product0"+i+"' class='pList'>");
					} else {
						$("#pbox").append(
								"<div id='product"+i+"' class='pList'>");
					}
					for ( var j in result[i].cpList) {
						if (i < 10) {
							$("#product0" + i).append(
									"<div class='pdts' id='pName" + i + (j + 1)
											+ "' data-code=" + (j + 1) + ">"
											+ result[i].cpList[j] + "</div>");
						} else {
							$("#product" + i).append(
									"<div class='pdts' id='pName" + i + (j + 1)
											+ "' data-code=" + (j + 1) + ">"
											+ result[i].cpList[j] + "</div>");
						}
					}
				}
			},
			error : function(err) {
				console.log(err);
			}
		});
	};

	function opentable(evt, categoryname) {
		console.log(1);
		var product = $("div[id*='product']");

		console.log(product.length);

		for (var i = 0; i < product.length; i++) {
			product[i].className = product[i].className.replace('blockCtg',
					"pList");
		}

		console.log($("#" + categoryname).attr('class'));

		if ($("#" + categoryname).attr('class') == 'pList') {
			$("#" + categoryname).attr('class', 'blockCtg');
		}
	};
</script>
</html>