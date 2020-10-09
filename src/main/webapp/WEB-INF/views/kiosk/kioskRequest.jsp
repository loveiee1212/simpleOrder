<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>요청하기</title>
<link rel="icon" href="resources/image/smallLogo.png" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#frame {
	width: 568px;
	height: auto;
	margin: auto;
}

img {
    width: 300px;
    margin-left: 120px;
}

#header {
	border: 3px solid #e3f2fd;
    background-color: #e0e0e0;
    height: 70px;
    text-align: center;
    font-size: 30px;
    padding-top: 30px;
}

.req {
    width: 150px;
    height: 70px;
    float: left;
    margin: 10px;
    border: 2px solid white;
    background-color: #2565a3;
    font-weight: bold;
    color: white;
    font-size: 25px;
    text-align: center;
    padding-top: 30px;
}

#requestList {
	margin: 20px;
	border: 2px solid #2565a3;
	height: 375px;
}

#text {
	width: 300px;
	height: 45px;
	border: 3px solid #2565a3;
	text-align: center;
	font-size: 20px;
	margin-left: 20px;
}

#reqBtn {
	text-align: center;
	border: 2px solid white;
	width: 180px;
	height: 80px;
	background-color: #2565a3;
	font-weight: bold;
	color: white;
	font-size: 22px;
	margin-left: 30px;
}

#empCallbtn {
	text-align: center;
	border: 2px solid white;
	width: 250px;
	height: 80px;
	background-color: #2565a3;
	font-weight: bold;
	color: white;
	font-size: 22px;
	margin-top: 30px;
	margin-left: 20px;
}

#Exit {
	border: 2px solid white;
	width: 250px;
	height: 80px;
	background-color: #e3f2fd;
	font-weight: bold;
	color: #2565a3;
	font-size: 22px;
	margin-left: 20px;
}

input:focus, button:focus {
	outline: none;
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
	<%-- <h2>${sessionScope.c_code}</h2>
	<h2>${sessionScope.bd_date}</h2>
	<h2>${sessionScope.sc_code}</h2>
	<h2>${sessionScope.st_num}</h2>
	<h2>${sessionScope.oac_num}</h2> --%>
	<div id="frame">
	    <img src="resources/image/logo.png" alt="SimpleOrder 홈페이지">
		<div id="header">광고</div>
		<div id="main">
			<div id="requestList"></div>
			<form action="requestcall" method="post">
				<input type="text" id="text" name="text" placeholder="요청사항을 입력해주세요">
				<button id="reqBtn">요청하기</button>
			</form>
			<button id="empCallbtn" onclick="empCall();">직원호출</button>
			<button id="Exit" onclick="location.href='kioskmenu'">나가기</button>
		</div>
	</div>
	<script type="text/javascript">
		$('#reqBtn').click(function() {
			if (confirm($('#text').val() + "요청을(를) 하시겠습니까?")) {
				return true;
			}
			return false;
		});
		function reqClick(req) {
			var request = req.innerText;
			$('#text').val(request);
			$('#reqBtn').trigger('click');
		}
		function empCall() {
			$('#text').val("직원호출");
			$('#reqBtn').trigger('click');
		}
	</script>
</body>
</html>