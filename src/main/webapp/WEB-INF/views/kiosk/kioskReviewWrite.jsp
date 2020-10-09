<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰쓰기</title>
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

img {
    width: 300px;
    margin-left: 120px;
}

#score {
	height: 50px;
	margin: 20px 25px 0px;
}

.starR1 {
	background:
		url(http://miuu227.godohosting.com/images/icon/ico_review.png)
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 22px;
	height: 40px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
	padding-left: 15px;
	margin-left: -10px;
}

.starR2 {
	background:
		url(http://miuu227.godohosting.com/images/icon/ico_review.png)
		no-repeat right 0;
	background-size: auto 100%;
	width: 22px;
	height: 43px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
	margin-right: 1px;
	margin-top: -2px;
}

.starR1.on {
	background-position: 0 0;
	width: 20px;
	height: 40px;
	margin-right: -15px;
	margin-left: 10px;
}

.starR2.on {
	background-position: -15px 0;
	width: 15px;
	height: 40px;
	margin-left: -4px;
	margin-right: -15px;
	padding-right: 10px;
	padding-left: 15px;
}

#rv_text {
	border: 3px solid #2565a3;
	margin-top: 10px;
	margin-left: 25px;
}

textarea {
	width: 480px;
	height: 350px;
	resize: none;
	font-size: 20px;
	resize: none;
}

textarea:focus {
	outline: none;
}

#footer .btn {
	width: 150px;
	height: 60px;
}

#footer .btn:focus {
	outline: none;
}

#btn1, #btn2 {
	border: 2px solid white;
	background-color: #2565a3;
	font-size: 19px;
	font-weight: bold;
	color: white;
	margin-left: 12px;
}

#btn3 {
	border: 3px solid #2565a3;
	background-color: white;
	color: #2565a3;
	font-size: 20px;
	font-weight: bold;
	margin-left: 12px;
}

#rv_file {
	margin-left: 30px;
	font-size: 19px;
}

#header {
	border: 3px solid #e3f2fd;
    background-color: #e0e0e0;
    height: 70px;
    text-align: center;
    font-size: 30px;
    padding-top: 30px;
}

#main {
	background-color: #e3f2fd;
	border: 3px solid #2565a3;
	margin: 10px;
}

#footer {
	margin: 15px;
}

.where {
	display: block;
	margin: 25px 15px;
	font-size: 11px;
	color: #000;
	text-decoration: none;
	font-family: verdana;
	font-style: italic;
}

#image_container img {
	width: 100px;
	height: 100px;
	position: relative;
	top: 0;
	left: 10px;
	overflow: hidden;
}

.image img {
	display: inline-block;
	max-width: 100%;
	height: 100px;
	height: auto;
	float: left;
	margin-left: 25px;
}

.filebox.bs3-primary label {
	display: inline-block;
	padding: .8em 1.75em;
	color: white;
	font-size: 15px;
	font-weight: bold;
	line-height: normal;
	vertical-align: middle;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-radius: .25em;
	background-color: #2565a3;
	border-color: white;
	margin: 30px 25px 20px;
	float: left;
}

@media ( max-width : 480px; ) {
	#frame {
		width: auto;
	}
	#main {
		float: none;
		width: auto;
	}
}
</style>
</head>
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
			<form action="insertreview" id="frm" method="post"
				enctype="multipart/form-data" onsubmit="return reviewWriteCheck()">
				<div>
					<div id="score">
						<input type="hidden" name="rv_score" id="rv_score" value="0">
						<span class="starR1 on">0</span> <span class="starR2">1</span> <span
							class="starR1">2</span> <span class="starR2">3</span> <span
							class="starR1">4</span> <span class="starR2">5</span> <span
							class="starR1">6</span> <span class="starR2">7</span> <span
							class="starR1">8</span> <span class="starR2">9</span>
					</div>
					<div class="image" id="image_container"></div>
					<input type="file" id="rv_file" name="rv_file" value="rv_file"
						multiple> <br>
					<textarea name="rv_text" id="rv_text" cols="80" rows="22"
						placeholder="리뷰입력"></textarea>
				</div>
				<div id="footer">
					<button class="btn" id="btn1" type="submit">리뷰작성</button>
					<button class="btn" id="btn2" type="reset">취소</button>
					<button class="btn" id="btn3" type="button"
						onclick="location.href='./kioskreview'">뒤로가기</button>
				</div>
			</form>
		</div>
	</div>
	<script>
		$('#score span').click(function() {
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			// console.log($(this).html());
			$('#rv_score').val($(this).html());
			console.log($('#rv_score').val())
			return false;
		});
		function reviewWriteCheck() {
			if (confirm("리뷰를 작성 하시겠습니까?")) {
				var rv_file = $("#rv_file");
				if (rv_file[0].files.length > 4) {
					alert("사진첨부는 세개까지만 가능합니다.");
					return false;
				}
			}
		}
	</script>
</body>
</html>