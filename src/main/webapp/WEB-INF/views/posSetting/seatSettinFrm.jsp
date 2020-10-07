<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/clock.css?afte" type="text/css">
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

table, tr, th, td {
	border: 1px black solid;
}

td, th {
	width: 50px;
	height: 50px;
}

h2 {
	font-size: 35px;
	color: #1565c0;
	font-weight: bold;
	text-align: center;
	width: 200px;
	height: 30px;
	background-color: white;
	margin-left: 310px;
	padding: 40px;
}

table, tr, td, th {
	border: 3px solid #81d4fa;
}

#seatCTselect {
    width: 150px;
	height: 38px;
	font-size: 20px;
	border: 3px solid #81d4fa;
	margin-bottom: 10px;
}

#sc_name {
    width: 200px;
	height: 35px;
	font-size: 20px;
	border: 3px solid #81d4fa;
	text-align: center;
}

#deletebtn {
    width: 100px;
	height: 38px;
	font-size: 20px;
	border: 3px solid #81d4fa;
	background-color: white;
	color: red;
	font-weight: bold;	
}

#updatebtn {
    width: 100px;
	height: 43px;
	font-size: 20px;
	border: 3px solid white;
	background-color: #81d4fa;
	color: white;
	font-weight: bold;
}

#createbtn {
    width: 100px;
	height: 45px;
	font-size: 20px;
	border: 3px solid white;
	background-color: #e3f2fd;
	color: #1565c0;
	font-weight: bold;
}

#CategoriList {
	border-collapse: collapse;
	height: 80px;
}

#Categoridiv {
    width: 800px;
	height: 80px;
	text-align: center;
	color: #1565c0;
	font-size: 20px;
	font-weight: bold;
	overflow: auto;
}

#Categoridiv::-webkit-scrollbar {
	width: 10px;
	height: 10px;
	background-color: #81d4fa;
}

#Categoridiv::-webkit-scrollbar-thumb {
	background-color: #81d4fa;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#Categoridiv::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

.categoriList {
    width: 100px; 
}

#seatList {
    width: 900px;
    height: 400px;
    overflow: auto;
}

#seatList table {
    width: 850px;
    margin-top: 5px;
}

#seatList td {
    width: 50px;
    height: 80px;
    background-color: #81d4fa;
    font-size: 20px;
    text-align: center;
    font-weight: bold;
}

#x, #y {
	width: 300px;
	height: 50px;
	margin-top: 10px;
	text-align: center;
	border: 3px solid #81d4fa;
	font-size: 25px;
}

#seatList::-webkit-scrollbar {
	width: 10px;
	height: 10px;
	background-color: #81d4fa;
}

#seatList::-webkit-scrollbar-thumb {
	background-color: #81d4fa;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#seatList::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

input[type="button" i] {
	text-align: center;
	border: 2px solid white;
	width: 150px;
	height: 60px;
	margin-right: 49px;
	margin-top: 10px;
	background-color: #81d4fa;
	font-weight: bold;
	color: white;
	font-size: 25px;
	float: right;
}

#submitbtn {
    text-align: center;
    border: 2px solid white;
    width: 250px;
    height: 70px;
    margin-right: 49px;
    margin-top: 10px;
    background-color: #e3f2fd;
    font-weight: bold;
    color: #1565c0;
    font-size: 20px;
    float: right;
}
</style>
<title>seatSettinFrm</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
${msg}
		<h2>테이블 설정</h2>
		<form id="scCRUD"  name= 'scCRUD' action="seatCTcrucd" method="post">
		<div>
		<select id="seatCTselect" onchange="selectedCT(this)" name ='sc_code'>
		
		</select>
		<input type="text" id="sc_name" name = 'sc_name'>
		<button type="button" id="deletebtn" onclick = 'deleteSeatCT()'>삭제</button>
		<button type="button" id="updatebtn" onclick = 'updateSeatCT()'>수정</button>
		<button type="button" id="createbtn" onclick = 'createSeatCT()'>추가</button>
		</div>
		</form>
	<form action="updateSeatList" method="post">
		<div id="Categoridiv">
		<table id="CategoriList">
		</table>
		</div>
		<div id="seatList">
		</div>
		<input type="submit" id="submitbtn" value="테이블 변경 사항 저장">
	</form>

	<script type="text/javascript">
	var selectedCTval = "01";	
	getScatlist();
		
		function deleteSeatCT(){
			if(selectedCTval =='01'){
				alert('기본 테이블은 삭제할수없습니다.')
				return;
			}
			scCRUD.action = 'deleteSeatCT';
			scCRUD.submit();
		}
		function updateSeatCT(){
			scCRUD.action = 'updateSeatCT'; 
			scCRUD.submit();
		}
		function createSeatCT(){
			scCRUD.action = 'createSeatCT'; 
			scCRUD.submit();
			
		}
		function selectedCT(ele){
			selectedCTval = $(ele).children(":selected").val();
		}
		function changeOn(ele){ // 자리 활성화
			let sc_code = ele.dataset.sc_code;
			let st_num = ele.dataset.st_num;
			$ele=$(ele);
			$ele.html("<input type ='hidden' name ='"+sc_code+"#"+st_num+"' value=''>").append(st_num);
			$ele.attr("style","");
			$(ele).attr("onclick","changeOff(this)");
		}
		function changeOff(ele){ // 자리 비활성화
			let st_num = ele.dataset.st_num;
			$ele = $(ele);
			$ele.html("").append(st_num);
			$(ele).attr("style","opacity : 0.3");
			$(ele).attr("onclick","changeOn(this)");
		}
		
		
		function showThisCategori(ele) { // 클릭한 카테고리 노출
			let sc_code = ele.dataset.sc_code;
			$(".seatList").attr("hidden", "hidden");
			$("#" + sc_code).removeAttr("hidden");
			$(".categoriList").attr("style", "background : none;");
			$(ele).attr("style","background : #90caf9;")
		}
		
		function updateSeatXYInfo(ele) { // seat카테고리의 X,Y축 업데이트
			$ele = $(ele.parentNode);
			let sc_code = $ele.find("#sc_code").val();
			let x = $ele.find("#x").val();
			let y = $ele.find("#y").val();
			$form = $("<form action ='updateSeatXYInfo' id='updateSeatXYInfo' hidden = 'hidden' method ='post'>");
			$form.append("<input type = 'hidden' name ='sc_code' value ='"+sc_code+"'>");
			$form.append("<input type = 'text' name ='x' value ='"+x+"'>");
			$form.append("<input type = 'text' name ='y' value ='"+y+"'>");
			$("body").append($form);
			$("#updateSeatXYInfo").submit();

		}
		
		function getScatlist() { //모든 SeatList 출력
			$.ajax({
				url : "rest/getSeatList",
				type : "get",
				dataType : "json",
				success : function(data) {
					console.log(data);
					$("#CategoriList").html(data.CategoriList);
					$("#seatList").html(data.seatList);
					$("#01").removeAttr("hidden");
					$(".categoriList").eq(0).attr("style","background : #90caf9;");
					$("#seatCTselect").html(data.seatCTselect);
					selectedCTval = "01";	
				}
			})
		}
	</script>
</body>
</html>