<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
table, tr, th, td {
	border: 1px black solid;
}

td, th {
	width: 50px;
	height: 50px;
}
</style>
<title>seatSettinFrm</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
${msg}
	<form action="updateSeatList" method="post">
		<h2>seatSettinFrm</h2>
		<table id="CategoriList">
		</table>
		<div id="seatList"></div>
		<input type="submit" value="테이블 변경 사항 저장">
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
			$(ele).attr("style","background : red;")
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
					$(".categoriList").eq(0).attr("style","background : red;");
				}
			})
		}
	</script>
</body>
</html>