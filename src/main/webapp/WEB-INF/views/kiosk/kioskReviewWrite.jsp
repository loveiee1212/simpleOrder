<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kioskReviewRrite</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        #frame {
            width: 568px;
            height: auto;
            margin: auto;
        }

        #score {
            height: 50px;
            margin: 10px;
        }

        .starR1 {
            background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
            background-size: auto 100%;
            width: 15px;
            height: 30px;
            float: left;
            text-indent: -9999px;
            cursor: pointer;
        }

        .starR2 {
            background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
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
            resize: none;
            margin: 10px;
        }

        .btn {
            height: 60px;
        }

        #footer .btn {
            width: 28%;
            margin: 12px;
        }

        #header {
            border: 1px solid black;
            margin: 10px;
            height: 80px;
        }

        #main {
            border: 1px solid black;
            margin: 10px;
        }

        #footer {
            border: 1px solid black;
            margin: 10px;
        }
    </style>
</head>
<body>
    <form action="reviewWrite" id="frm" method="POST" enctype="multipart/form-data">
        <div id="frame">
            <div id="header">광고&로고</div>
            <div id="main">
                <div id="score">
                    <input type="hidden" name="rv_score" id="rv_score" value="0">
                    <span class="starR1 on">0</span>
                    <span class="starR2">1</span>
                    <span class="starR1">2</span>
                    <span class="starR2">3</span>
                    <span class="starR1">4</span>
                    <span class="starR2">5</span>
                    <span class="starR1">6</span>
                    <span class="starR2">7</span>
                    <span class="starR1">8</span>
                    <span class="starR2">9</span>
                </div>
                <div>
                    <input type="file" id="rv_file" name="rv_file" value="rv_file" multiple>
                    <br>
                    <textarea name="rv_text" id="rv_text" cols="72" rows="22" placeholder="리뷰입력"></textarea>
                </div>
            </div>
            <div id="footer">
                <button class="btn" type="button" onclick="reviewWrite();">리뷰작성</button>
                <button class="btn" type="reset">취소</button>
                <button class="btn" type="button" onclick="location.href='kioskMenu.jsp'">나가기</button>
            </div>
    </form>
    </div>
    <script>
            $('#score span').click(function () {
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
    </script>
</body>
</html>