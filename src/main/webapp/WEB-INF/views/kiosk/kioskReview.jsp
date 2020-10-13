<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>이용후기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" href="resources/image/smallLogo.png"
	type="image/x-icon">
<style>
body {
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

#frame {
	width: 568px;
	height: auto;
	margin: auto;
}

#header {
	border: 3px solid #e3f2fd;
	background-color: #e0e0e0;
	height: 70px;
	text-align: center;
	font-size: 30px;
	padding-top: 30px;
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
	border-bottom: 1px solid #2565a3;
}

.rv_text {
	font-size: 25px;
}

.rv_code_name {
	font-size: 25px;
	font-weight: bold;
}

.rv_img {
	width: auto;
	overflow: auto;
	white-space: nowrap;
}

.rv_img::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

.rv_img::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

.rv_img::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

.img {
	width: 250px;
	height: 250px;
	max-height: initial;
	display: inline-block;
}

.orderdiv {
	border-radius: 25px;
	border: 1px solid rgb(133, 133, 133);
	margin: 10px 15px 10px;
	padding: 5px;
	display: inline-block;
	font-size: 15px;
	line-height: 0.1em;
	width: 130px;
	text-align: center;
}

.rv_code_time {
	float: right;
	font-weight: bold;
	font-size: 20px;
}

#addBtn {
	text-align: center;
    border: 2px solid white;
    width: 568px;
    height: 70px;
    background-color: #e3f2fd;
    font-weight: bold;
    color: #2565a3;
    font-size: 25px;
    margin-top: -5px;
    margin-bottom: 50px;
}

.write {
	width: 568px;
	height: 60px;
	border: 2px solid white;
	background-color: #2565a3;
	font-size: 25px;
	font-weight: bold;
	color: white;
}

.Exit {
	width: 568px;
	height: 60px;
	border: 2px solid #2565a3;
	background-color: #2565a3;
	font-size: 25px;
	font-weight: bold;
	color: white;
}

#footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 568px;
	margin: auto;
	height: auto;
}

button:focus {
	outline: none;
}

#msg {
	margin: 200px 50px;
	text-align: center;
	font-size: 30px;
}
</style>
</head>

<body>
	<div id="frame">
		<div id="header">
			<font>광고</font>
		</div>
		<div id="reviewList"></div>
		<div id="btn"></div>
		<div id="footer">
			<button class="write" onclick="location.href='./kioskreviewwrite'">리뷰작성</button>
			<button class="Exit" type="button"
				onclick="location.href='./kioskmenu'">나가기</button>
		</div>
	</div>
	<script type="text/javascript">
	//결제 상태확인

	
		//리뷰 등록 여부 확인
		if ('${resultMsg}' != "") {
			alert('${resultMsg}');
		}
		//결제됬는지 확인
		if ('${creditOk}' != "") {
			$('.write').css('display', 'inline');
			$('.write').attr("onclick", "location.href='./kioskreviewwrite'");
		} else {
			$('.write').css('display', 'none');
			$('.write').attr("onclick", "");
		}
		//리뷰 작성 여부 확인
		if ('${reviewOk}' != "") {
			$('.Exit').css('display', 'none');
			$('.Exit').attr("onclick", "");
		}

		getReviewList();
		function getReviewList() {
			$.ajax({
						url : 'rest/getreviewlist',
						type : 'post',
						data : {
							'rvNum' : $('.rv_detail').length
						},
						dataType : 'json',
						success : function(data) {
							console.log(data);
							$('#reviewList').append(data.rvList);
							if ($('#msg').length == 1) {
								$('#btn').html("");
							} else {

								if ($('.rv_detail').length % 5 == 0) {
									$('#btn')
											.html(
													"<button id='addBtn' onclick='getReviewList();'>더보기</button>");
								} else {
									$('#btn').html("");
								}
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