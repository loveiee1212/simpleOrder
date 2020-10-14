<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

#grantList {
    width: 1500px;
    border: 1px solid #2565a3;
    border-collapse: collapse;
}

#grantList th {
	width: 200px;
	height: 70px;
	text-align: center;
	border: 3px solid #2565a3;
	scrollbar-width: none;
	border-left-color: white;
	border-right-color: white;
	font-size: 25px;
	background-color: #2565a3;
	color: white;
}

#grantList td {
    width: 300px;
    height: 50px;
    text-align: center;
    border: 3px solid #e1f5fe;
    border-left-color: white;
    border-right-color: white;
    font-size: 23px;
    font-weight: bold;
}

input[type=checkbox] {
	width: 30px;
	height: 30px;
}

#tadiv {
    width: 100%;
    height: 400px;
    overflow: auto;
}

#tadiv::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#tadiv::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#tadiv::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#submit {
	text-align: center;
	border: 2px solid white;
	width: 300px;
	height: 70px;
	margin-right: 40px;
	margin-top: 35px;
	background-color: #2565a3;
	font-weight: bold;
	color: white;
	font-size: 25px;
	float: right;
}

input:focus, button:focus {
	outline: none;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>postionGrantSettingFrmon</title>
</head>
<body>
	<h2>권한 설정</h2>
	<form action="updatePositionGrant">
		<div id="tadiv">
			<table id="grantList">
				<tr>
					<th onclick='sortContent(0)'>직급명</th>
					<th onclick='sortContent(1)'>판매</th>
					<th onclick='sortContent(2)'>마감</th>
					<th onclick='sortContent(3)'>근태</th>
					<th onclick='sortContent(4)'>재고 관리</th>
					<th onclick='sortContent(5)'>매출 현황</th>
					<th onclick='sortContent(6)'>외상 처리</th>
					<th onclick='sortContent(7)'>시재 변경</th>
					<th onclick='sortContent(8)'>상품 관리</th>
					<th onclick='sortContent(9)'>판매키 관리</th>
					<th onclick='sortContent(10)'>포스 설정</th>
<!-- 				<th>키오스크 설정</th> -->
				</tr>
			</table>
		</div>
		<input type="submit" id="submit" value="저장">
	</form>
</body>
<script type="text/javascript">

/* //테마 시작
if ("${temaBlack}" == "") {
	temaBlack = false;
} else {
	temaBlack = JSON.parse('${temaBlack}');
}
changeTema();

function temaChange(temaBlack) {
	$.ajax({
		url : "rest/temaChange",
		type : "post",
		data : {
			"temaBlack" : temaBlack
		}
	})
	return !temaBlack;
}

function changeTema() {
	for(let i = 0 ; i < $("style").length ; i++){
		if (temaBlack) {
			$('#changeTema').text("화이트모드");
			before = $("style").eq(i).html();
			after = before.replaceAll("#0D0D0D", "#24619E");
			after = after.replaceAll("#2565a3", "#2B2B2B");
			after = after.replaceAll("#e3f2fd", "#141414");
			after = after.replaceAll("#ffffff", "#404040");
			after = after.replaceAll("#1565c0", "#F0F0F0");
			after = after.replaceAll("#90caf9", "#4F4F4F");
			after = after.replaceAll("#000000", "#F7F7F7");
			$("style").eq(i).html(after);
		} else {
			$('#changeTema').text("다크모드");
			before = $("style").eq(i).html();
			after = before.replaceAll("#24619E", "#0D0D0D");
			after = after.replaceAll("#2B2B2B", "#2565a3");
			after = after.replaceAll("#141414", "#e3f2fd");
			after = after.replaceAll("#404040", "#ffffff");
			after = after.replaceAll("#F0F0F0", "#1565c0");
			after = after.replaceAll("#4F4F4F", "#90caf9");
			after = after.replaceAll("#F7F7F7", "#000000");
			$("style").eq(i).html(after);
		}
	}
		if(temaBlack){
			temaBlack = temaChange(true);
		}else {
			temaBlack = temaChange(false);
		}
}
//테마 끝 */
	/* 	setInterval(function test() {
	 console.log($("#a").prop("checked"))
	 },90000) */
	$.ajax({ // 등급,권한 설정 창 노출
		url : "rest/getPositionGrant",
		type : "get",
		dataType : "json",
		success : function(hashmap) {
			$("#grantList").append(hashmap.positionGrantCheckBoxHtml);
			$(".0").attr('onclick', 'return false');
		}
	})
	
	var sortType = 'asc'; 

	function sortContent(index) {
	    var table = $("#grantList");

	    sortType = (sortType =='asc')?'desc' : 'asc';

	    var checkSort = true;
	    var rows = table[0].rows;
	    console.log(rows)

	    while (checkSort) { // 현재와 다음만 비교하기때문에 위치변경되면 다시 정렬해준다.
	        checkSort = false;

	        for (var i = 1; i < (rows.length-1); i++) {
	           var fCell = rows[i].cells[index].innerHTML.toUpperCase();
	            var sCell = rows[i + 1].cells[index].innerHTML.toUpperCase();
	console.log(fCell);
	console.log(sCell);

	            var row = rows[i];
	            // 오름차순<->내림차순 ( 이부분이 이해 잘안됬는데 오름차순이면 >, 내림차순이면 < 이고 if문의 내용은 동일하다 )
	            if ( (sortType == 'asc' && fCell > sCell) || 
	                    (sortType == 'desc' && fCell < sCell) ) {

	                row.parentNode.insertBefore(row.nextSibling, row);
	                checkSort = true;
	            }
	        }
	    }
	}
</script>
</html>