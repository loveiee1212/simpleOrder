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
	transform: translate(-50%, 0%);
	margin: 10% 50%;
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
			<form action="cLogin" onsubmit="return cloginTest()" method="post">
				<table>
					<tr>
						<th>사업자 번호</th>
						<td><input type="text" id="c_code" name="c_code"
							readonly="readonly" style="outline: none; border: none;">
						</td>
						<th rowspan="2"><input type="submit" value="로그인"></th>
					</tr>
					<tr>
						<th>비밀번호 입력</th>
						<td><input type="password" id="c_pw" name="c_pw"></td>
					</tr>
				</table>
				<div id="error"></div>
				<input type="text" name="ce_email" value="${ce_email }"
					style="display: none">
			</form>
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
	<input type="button" onclick="location.href = 'createccodefrm'" value="사업장 추가">
	<input type="button" onclick="location.href = 'emailLogout'" value="eMail로그아웃">

</body>
<script type="text/javascript">
getClistInfo();// 처음 사업체 정보 가져오기
errorUse();//로그인 실패시

function errorUse(){
	if('${cInfo}'!=""){//에러를 통해서 가져온 값이 없다면 작동하지 않음
		cLogindivon(${cInfo.c_code});// 있다면 해당 사업체 번호로 로그인 박스 켜짐
	}
	$("#error").html("${cInfo.error}") // 에러 메세지또한 로그인 아레에 노출
	
}


function cloginTest() {
	return true;
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
		$("#c_code").val(cCode)
	};
	
	

</script>

</html>