<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>KioskReview</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#frame {
	width: 568px;
	height: auto;
	margin: auto;
	border: 1px solid black;
}

#header {
	height: 100px;
	border: 1px solid black;
	margin: 10px;
}

ul{
	list-style: none;
	padding-left: 0px;
}

.rv_score {
	height: 30px;
	margin: 10px;
}

.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}

.rv_detail {
	margin: 20px;
}

.rv_img {
	max-height: 250px;
	overflow: hidden;
}

.rv_img img {
	width: 100%;
	max-height: initial;
	margin-top: -20%;
}

.rv_code_time {
	margin-left: 50px;
}
#addBtnP
{width: 500px;}
.btn {
	height: 60px;
}

#footer .btn {
	width: 249px;
	margin: 10px;
}

#footer {
	border: 1px solid black;
	margin: 10px;
}
</style>
</head>
<script>
	$.ajax({
		url : 'rest/getreviewlist',
		type : 'post',
		dataType : 'json',
		success : function(data) {
			console.log(data);
			$('#reviewList').html(data.rvList);
			console.log($('.img').length);
		},
		error : function(err) {
			console.log(err);
		}
	});
</script>
<body>
	<!-- <h2>kioskReview.jsp</h2> -->
	<div id="frame">
		<div id="header">
			<font>광고와 로고</font>
		</div>
		<div id="reviewList"></div>
		<div id="footer">
			<button class="btn" type="button"
				onclick="location.href='./kioskreviewwrite'">리뷰작성</button>
			<button class="btn" type="button"
				onclick="location.href='./kioskmenu'">나가기</button>
		</div>
	</div>

</body>
</html>