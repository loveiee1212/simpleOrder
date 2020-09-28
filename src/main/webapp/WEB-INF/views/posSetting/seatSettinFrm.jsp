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
	color: #81d4fa;
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

#CategoriList {
    width: 300px;
    height: 80px;
    text-align: center;
    color: #81d4fa;
    font-size: 20px;
    font-weight: bold;
    border-collapse: collapse;
}

#seatList {
 width: 600px;
    height: 300px;
 overflow-x: hidden;
	overflow-y: hidden;
}

#seatList table {
width: 600px;
    height: 300px;
} 

#seatList td {
width: 150px;
    height: 80px;
    background-color: #81d4fa;
    font-size: 20px;
}

#x, #y {
width: 200px;
height: 30px;
font-size: 20px;
text-align: center;
border: 3px solid #81d4fa;
}

#seatList:hover {
	width: 900px;
 height: 450px;
	overflow-x: scroll;
	overflow-y: scroll;
}

#seatList::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: white;
}

#seatList::-webkit-scrollbar {
	width: 10px;
	background-color: #81d4fa;
}

#seatList::-webkit-scrollbar-thumb {
	background-color: #81d4fa;
	background-image: -webkit-gradient(linear, 0 0, 0 100%, color-stop(.5, rgba(255, 255, 255,
		.2)), color-stop(.5, transparent), to(transparent));
}

#submit {
text-align: center;
    border: 2px solid white;
    width: 250px;
    height: 70px;
    margin-right: 49px;
    margin-top: 10px;
    background-color: #81d4fa;
    font-weight: bold;
    color: white;
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
	<form action="updateSeatList" method="post">
		<h2>테이블 설정</h2>
		<table id="CategoriList">
		</table>
		<div id="seatList"></div>
		<input type="submit" id="submit" value="테이블 변경 사항 저장">
	</form>

	<script type="text/javascript">
		getScatlist();
		
		
		
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
			$(ele).attr("style","background : #1565c0;")
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
					$(".categoriList").eq(0).attr("style","background :  #1565c0;");
				}
			})
		}
	</script>
</body>
</html>