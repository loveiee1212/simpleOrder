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
}

#header {
	border: 3px solid #e3f2fd;
	background-color: #e0e0e0;
	margin: 10px;
	height: 100px;
}

ul {
	padding-left: 0px;
}

li {
	list-style: none;
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
	margin-bottom: 30px;
	padding-bottom: 50px;
	border-bottom: 1px solid gray;
}

.rv_text {
	font-size: 20px;
}

.rv_code_name {
	font-size: 18px;
}

.rv_img {
    width: auto;
    overflow: auto;
    white-space: nowrap;
}

.rv_img::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: white;
}

.rv_img::-webkit-scrollbar {
	width: 10px;
	height: 10px;
	background-color: white;
}

.rv_img::-webkit-scrollbar-thumb {
	background-color: #81d4fa;
	background-image: -webkit-gradient(linear, 0 0, 0 100%, color-stop(.5, rgba(255, 255, 255,
		.2)), color-stop(.5, transparent), to(transparent));
}

.img {
    width: 250px;
    height: 250px;
    max-height: initial;
    display: inline-block;
}

.orderdiv {
  border-radius: 25px;
  border: 2px solid #81d4fa;
  margin: 10px 5px 5px;
  display: inline-block;
}

.rv_code_time {
	margin-left: 50px;
}

#addBtn {
	text-align: center;
	border: 2px solid white;
	width: 568px;
	height: 50px;
	background-color: #e3f2fd;
	font-weight: bold;
	color: #1565c0;
	font-size: 20px;
	margin-bottom: 10px;
}

.Exit {
    border: 3px solid #81d4fa;
    background-color: white;
    font-size: 19px;
    font-weight: bold;
    color: #81d4fa;
    height: 60px;
    width: 568px;
}

button:focus {
	outline: none;
}
</style>
</head>

<body>
	<h2>${sessionScope.c_code}</h2>
	<h2>${sessionScope.bd_date}</h2>
	<h2>${sessionScope.sc_code}</h2>
	<h2>${sessionScope.st_num}</h2>
	<h2>${sessionScope.oac_num}</h2>
	<h2>${sessionScope.creditOk}</h2>
	<!-- <h2>kioskReview.jsp</h2> -->
	<div id="frame">
		<div id="header">
			<font>광고와 로고</font>
		</div>
		<div id="reviewList"></div>
		<div id="btn"></div>
		<div id="footer">
			<button class="write" onclick="location.href='./kioskmenu'">리뷰작성</button>
			<button class="Exit" type="button"
				onclick="location.href='./kioskmenu'">나가기</button>
		</div>
	</div>
	<script type="text/javascript">
	if('${creditOk}'==""){
		alert("리뷰등록은 결제 후에 가능합니다");
		$('.write').css('display','none')
	}
		getReviewList();
		function getReviewList() {
			$
					.ajax({
						url : 'rest/getreviewlist',
						type : 'post',
						data : {
							'rvNum' : $('.rv_detail').length
						},
						dataType : 'json',
						success : function(data) {
							console.log(data);
							$('#reviewList').append(data.rvList);
							if ($('.rv_detail').length % 5 == 0) {
								$('#btn')
										.html(
												"<button id='addBtn' onclick='getReviewList();'>더보기</button>");
							} else {
								$('#btn').html("");
							}
						},
						error : function(err) {
							console.log(err);
						}
					});

		}
	</script>
</body>
</html>