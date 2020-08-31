<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

ul {
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
<body>
	<!-- <h2>kioskReview.jsp</h2> -->
	<div id="frame">
		<div id="header">
		<font>광고와 로고</font>
		</div>
		<!-- <div id="reviewList">
			<ul>
				<li>
					<div class="rv_detail">
						<div class="rv_code">
							<span class="rv_code_name">영업일+주문번호</span><span
								class="rv_code_time">2020년 8월 27일</span>
						</div>
						<div class="rv_score">
							<span class="starR1 on">0</span>
                            <span class="starR2 on">1</span>
                            <span class="starR1 on">2</span>
                            <span class="starR2 on">3</span>
                            <span class="starR1 on">4</span>
                            <span class="starR2 on">5</span>
                            <span class="starR1 on">6</span>
                            <span class="starR2 on">7</span>
                            <span class="starR1 on">8</span>
                            <span class="starR2 on">9</span>
							<div class="rv_img">
								<img class="img" src="./img/치킨.jpeg" alt="sysImg">
							</div>
							<div class="rv_text">졸맛 탱구리 소스가 예술임!</div>
						</div>
				</li>
				<li>
					<div class="rv_detail">
						<div class="rv_code">
							<span class="rv_code_name">영업일+주문번호</span><span
								class="rv_code_time">2020년 8월 27일</span>
						</div>
						<div class="rv_score">
							<span class="starR1 on">0</span> <span class="starR2">1</span> <span
								class="starR1">2</span> <span class="starR2">3</span> <span
								class="starR1">4</span> <span class="starR2">5</span> <span
								class="starR1">6</span> <span class="starR2">7</span> <span
								class="starR1">8</span> <span class="starR2">9</span>
						</div>
						<div class="rv_img">
							<img class="img" src="./img/감자튀김.jpg" alt="sysImg">
						</div>
						<div class="rv_text">겉은 바삭 속은 촉촉촉촉촉</div>
					</div>
				</li>

			</ul> -->

	</div>
	<div id="footer">
		<button class="btn" type="button"
			onclick="location.href='./kioskreviewwrite'">리뷰작성</button>
		<button class="btn" type="button"
			onclick="location.href='./kioskmenu'">나가기</button>
	</div>
	<script>
		$.ajax({
			url : 'rest/getreviewlist',
			type : 'post',
			dataType : 'html',
			success : function(data) {
				console.log(data);
			},
			error : function(err) {
				console.log(err);
			}
		});
	</script>
</body>
</html>