<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>postisionSettingFrmon</title>
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

h2 {
	font-size: 35px;
	color: #2565a3;
	font-weight: bold;
	text-align: center;
	width: 200px;
	height: 30px;
	background-color: white;
	margin-left: 310px;
	padding: 40px;
}

#Listdiv {
	width: 900px;
	height: 400px;
	overflow: auto;
}

#postionList {
	width: 800px;
	height: 400px;
	text-align: center;
	font-size: 25px;
	margin-left: 50px;
	border-collapse: collapse;
	background-color: white;
}

#Listdiv::-webkit-scrollbar {
	width: 10px;
	height: 10px;
	background-color: white;
}

#Listdiv::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#Listdiv::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#postionList td {
	border: 3px solid #2565a3;
}

#postionList th {
	border: 3px solid white;
	border-top-color: #2565a3;
	background-color: #2565a3;
	color: white;
	padding: 15px;
}

#postionList input[type="text" i] {
	width: 200px;
	height: 30px;
	text-align: center;
	font-size: 25px;
	border: none;
}

.positionDeleteClass, .positionAddClass {
	width: 120px;
	height: 50px;
	text-align: center;
	font-size: 20px;
	background-color: #2565a3;
	border: 3px solid white;
	color: white;
	font-weight: bold;
}

.positionAddClass {
	width: 400px;
	height: 70px;
	text-align: center;
	font-size: 30px;
	background-color: #2565a3;
	border: 3px solid white;
	color: white;
	font-weight: bold;
}

.positionUpdateClass {
	width: 120px;
	height: 50px;
	text-align: center;
	font-size: 20px;
	background-color: white;
	border: 3px solid #2565a3;
	color: #2565a3;
	font-weight: bold;
}

input:focus, button:focus {
	outline: none;
}
</style>
</head>
<body>
	<h2>직급 설정</h2>
	<div id="Listdiv">
		<table id="postionList">
			<tr>
				<th>직급명</th>
				<th>삭제</th>
				<th>수정</th>
			</tr>
		</table>
	</div>
	<form action="" name="updateordelete" method="post">
		<input id="pst_position" name="pst_position" hidden="hidden">
		<input id="pst_name" name="pst_name" hidden="hidden">
	</form>
</body>
<script>

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

	function updatePosition(element) {
		pst_position = element.parentNode.parentNode.getAttribute('id');
		pst_name = $("#" + pst_position).find('.pst_name').val();
		$("#pst_position").val(pst_position);
		$("#pst_name").val(pst_name);
		updateordelete.action = 'updatePosition';
		updateordelete.submit();
	}

	function deletePosition(element) {
		if (confirm("소속된 직원은 모두 대표권한으로 변경 됩니다. 직원 목록에서 다시 권한을 설정해주세요")) {
			pst_position = element.parentNode.parentNode.getAttribute('id');
			pst_name = $("#" + pst_position).find('.pst_name').val();
			$("#pst_position").val(pst_position);
			$("#pst_name").val(pst_name);
			updateordelete.action = 'deletePosition';
			updateordelete.submit();
		}
	}
	function createPosition() {
		if (confirm("새로운 직급은 권한이 없습니다. 권한설정에서 권한을 부여 후 사용해주세요")) {
			$("#pst_name").val($("#newPst_name").val());
			updateordelete.action = 'createPosition';
			if($("#newPst_name").val()==""){
				alert("직급명을 입력해주세요!!");
				$('#newPst_name').focus();
				return false;
			}
			updateordelete.submit();
		}
	}
	console.log("aa");
	$.ajax({
		url : "rest/getPosition",
		type : "get",
		dataType : "json",
		success : function(data) {
			console.log(data);
			$("#postionList").append(data.positionList);
		},
		error : function (data){
			console.log(data);
		}

	})

</script>
</html>