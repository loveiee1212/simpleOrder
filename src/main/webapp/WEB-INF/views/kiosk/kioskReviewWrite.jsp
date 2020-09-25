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
	border: 3px solid #81d4fa;
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

@media ( max-width : 480px ) {
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
					<div class="image" id="image_container"></div>
					<input type="hidden" id="fileCheck" value="0"> <input
						type="file" id="rv_file" name="rv_file" value="rv_file" multiple>
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
		$('#rv_file').on('change', function() {
			console.dir(this);
			console.dir(this.value);
			if ($(this).val() == '') {
				console.log("empty");
				$('#fileCheck').val(0); //첨부 안됨
			} else {
				console.log("not empty");
				$('#fileCheck').val(1); //첨부됨
			}
			console.log("check" + $('#fileCheck').val()); //1
		});

		function reviewWrite() {
			var rv_file = $("#rv_file");
			console.log(rv_file);
			console.dir(rv_file[0].files);
			console.dir(rv_file[0].files.length);
			for (var i = 0; i < rv_file[0].files.length; i++) {
				console.dir(rv_file[0].files[i]);

			}
			console.log($("#rv_score").val());
			console.log($("#rv_text").val());
			var reviewData = new FormData();
			reviewData.append("rv_score", $("#rv_score").val());
			for (var i = 0; i < rv_file[0].files.length; i++) {
				console.dir(rv_file[0].files[i]);
				reviewData.append("rv_files", rv_file[0].files[i]);
			}
			reviewData.append("fileCheck", $('#fileCheck').val());
			reviewData.append("rv_text", $("#rv_text").val());
			$.ajax({
				url : 'rest/insertreview',
				type : 'post',
				data : reviewData,
				processData : false,
				contentType : false,
				dataType : 'json',
				success : function(data) {
					console.log(data);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
	</script>
</body>
</html>