<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>kioskRequest</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#frame {
	width: 568px;
	height: auto;
	margin: auto;
}

#header {
	border: 3px solid #e3f2fd;;
	background-color: #e0e0e0;
	margin: 10px;
	height: 80px;
	margin: 10px;
}

.req {
	width: 150px;
	height: 100px;
	border: solid 1px black;
	float: left;
	margin: 10px;
}

#requestList {
	margin: 20px;
	border: solid 1px black;
	height: 380px;
}
</style>
</head>
<script>
	$.ajax({
		url : 'rest/getrequestlist',
		type : 'post',
		dataType : 'json',
		success : function(data) {
			console.log(data);
			$('#requestList').html(data.reqList);
		},
		error : function(err) {
			console.log(err);
		}
	});
</script>
<body>
	<h2>${sessionScope.c_code}</h2>
	<h2>${sessionScope.bd_date}</h2>
	<h2>${sessionScope.sc_code}</h2>
	<h2>${sessionScope.st_num}</h2>
	<h2>${sessionScope.oac_num}</h2>
	<div id="frame">
		<div id="header">광고&로고</div>
		<div id="main">
			<div id="requestList"></div>
			<form action="requestcall" method="post" target="_blank">
				<input type="text" id="text" name="text" placeholder="요청사항을 입력해주세요">
				<button id="reqBtn">요청하기</button>
			</form>
			<button onclick="empCall();">직원호출</button>
			<button onclick="location.href='kioskreview'">나가기</button>
		</div>
	</div>
	<script type="text/javascript">
		$('#reqBtn').click(function() {
			if (confirm($('#text').val() + "을(를) 하시겠습니까?")) {
				return true;
			}
			return false;
		});
		function reqClick(req) {
			var request = req.innerText;
			$('#text').val(request + " 요청");
			$('#reqBtn').trigger('click');
			$('#text').val("");
		}
		function empCall() {
			$('#text').val("직원호출");
			$('#reqBtn').trigger('click');
			$('#text').val("");
		}
	</script>
</body>
</html>