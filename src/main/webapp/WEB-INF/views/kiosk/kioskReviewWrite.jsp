<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kioskReviewRrite</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

#score {
	height: 40px;
	margin: 20px 25px 0px;
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

#rv_text {
	border: 3px solid #81d4fa;
	margin-top: 10px;
	margin-left: 25px;
}

textarea {
	width: 480px;
	height: 350px;
	resize: none;
	font-size: 19px;
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
	background-color: #81d4fa;
	font-size: 19px;
	font-weight: bold;
	color: white;
	margin-left: 12px;
}

#btn3 {
	border: 3px solid #81d4fa;
	background-color: white;
	color: #81d4fa;
	font-size: 19px;
	font-weight: bold;
	margin-left: 12px;
}

#rv_file {
	margin-left: 30px;
	font-size: 19px;
}

#header {
	border: 3px solid #e3f2fd;;
	background-color: #e0e0e0;
	margin: 10px;
	height: 80px;
	margin: 10px;
}

#main {
	background-color: #e3f2fd; 
	border : 3px solid #81d4fa;
	margin: 10px;
	border: 3px solid #81d4fa;
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

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
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
	background-color: #81d4fa;
	border-color: white;
	margin: 30px 25px 20px;
	float: left;
}
</style>
</head>
<body>
	<div id="frame">
		<div id="header">광고&로고</div>
		<div id="main">
			<form action="reviewWrite" id="frm" method="POST"
				enctype="multipart/form-data">
				<div>
					<div id="score">
						<input type="hidden" name="rv_score" id="rv_score" value="0">
						<span class="starR1 on">0</span> <span class="starR2">1</span> <span
							class="starR1">2</span> <span class="starR2">3</span> <span
							class="starR1">4</span> <span class="starR2">5</span> <span
							class="starR1">6</span> <span class="starR2">7</span> <span
							class="starR1">8</span> <span class="starR2">9</span>
					</div>
					<div class="filebox bs3-primary preview-image">
						<div class="image" id="image_container"></div>
						<label for="input_file">업로드</label> <input type="file"
							id="input_file" class="upload-hidden" accept="image/*"
							onchange="setThumbnail(event);" maxlength="3" multiple>
					</div>
					<br>
					<textarea name="rv_text" id="rv_text" cols="80" rows="22"
						placeholder="리뷰입력"></textarea>
				</div>
				<div id="footer">
					<button class="btn" id="btn1" type="button"
						onclick="reviewWrite();">리뷰작성</button>
					<button class="btn" id="btn2" type="reset">취소</button>
					<button class="btn" id="btn3" type="button"
						onclick="location.href='kioskMenu.jsp'">나가기</button>
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

		function reviewWrite() {
			var rv_file = $("#rv_file");
			console.log(rv_file);
			console.dir(rv_file[0].files);
			console.dir(rv_file[0].files.length);
			var reviewData = new FormData();
		}

		function setThumbnail(event) { 
			for (var image of event.target.files) {
				var reader = new FileReader(); 
				reader.onload = function(event) { 
					var img = document.createElement("img"); 
					img.setAttribute("src", event.target.result); 
					document.querySelector("div#image_container").appendChild(img);
					}; 
					console.log(image); 
					reader.readAsDataURL(image); 
					} 
			}
		
		

	</script>
</body>
</html>