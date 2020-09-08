<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#flotBoxDiv {
	display: none;
}

#flotBoxDiv.on {
	display: inline;
}

#flotBoxbg {
	background-color: black;
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	opacity: 0.5;
}

#flotBox {
	transform: translate(-50%, -50%);
	margin: 50% 50%;
	position: absolute;
	width: 500px;
	height: 500px;
	background-color: white;
}
</style>
<meta charset="UTF-8">
<title>1</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	<div id="flotBoxDiv">

		<div id="flotBoxbg"></div>
		<div id="flotBox">

			<table>
				<tr>
					<th>사업자 번호</th>
					<td id="c_code"></td>
					<th rowspan="2"><input type="button" onclick="cLogin()"
						value="로그인"></th>
				</tr>
				<tr>
					<th>비밀번호 입력</th>
					<td><input type="password" id="c_pw"></td>
				</tr>
			</table>

		</div>
	</div>


	<table id="cListInfo">
		<tr>
			<th>상호명</th>
			<th>사업자번호</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
	</table>
</body>
<script type="text/javascript">
getClistInfo();




function cLogin(){
	$.ajax({
		url : "rest/cLogin",
		type : "get",
		data : {
			"ce_email" : "${ce_email}",
			"c_code" : $("#c_code").html(),
			"c_pw" : $("#c_pw").val()
		},
		dataType : "json",
		success : data =>{
			console.log(data);
		}
	})
}


function getClistInfo(){//사업자 정보 로드
	$.ajax({
		url : "rest/getClist",
		type : "get",
		data : {
			"ce_email" : "${ce_email}"
		},
		dataType : "json",
		success : data =>{
			$("#cListInfo").append(data.cListInfoHtml);
		}
	})
	}








$("#flotBoxbg").click(function(){
	off();
})
$(document).keydown(function(data){ 
	if(data.keyCode==27){
		off(); 
	};
})





	function off(){ //모달박스 끄기 펑션
	$("#flotBoxDiv").removeClass("on");
}

	function cLogindivon(cCode){	//모달 박스 키기, 정보 입력
		$("#flotBoxDiv").addClass("on");
		$("#c_code").html(cCode)
	};
	
	

</script>

</html>