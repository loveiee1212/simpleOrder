<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KioskOrder</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<style>
#frame {
	width: 568px;
	height: auto;
	margin: auto;
}

.pList_detail {
	border: gray 1px solid;
	height: 148px;
	margin: 5px;
}

.pList_main {
	width: 70%;
	height: 150px;
	float: left;
}

.pList_img {
	width: 30%;
	height: 150px;
	float: right;
}

#pList img {
	width: 100px;
	height: 100px;
	margin: 30px;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 43px;
	text-decoration: none;
}

#footer_nav {
	position: fixed;
	bottom: 0;
	width: 568px;
}

#basket {
	display: none;
	width: 460px;
	height: 600px;
	overflow: auto;
	margin: auto;
	padding: 20px 60px;
	background-color: #fefefe;
            border: 1px solid #888;
            border-radius: 3px;
}

.pList_detail {
	border: gray 1px solid;
	height: 118px;
	margin: 5px 0;
}

.pList_main {
	width: 70%;
	height: 120px;
	float: left;
}

.pList_count {
	width: 30%;
	height: 120px;
	float: right;
}

.pList_img img {
	width: 100px;
	height: 100px;
	margin: 10px;
}

.count {
	width: 40px;
	height: 40px;
	margin-top: 15px;
}

#count {
	float: right;
	margin-right: 30px;
}

strong {
	font-size: 30px;
	margin-left: 170px;
}

i {
	margin-left: 140px;
}

#sum {
	text-align: right;
}
</style>
</head>
<!-- <h2>kioskOrder.jsp</h2> -->
<body>
	<div id="frame">
		<nav id="header_nav">
			<div>
				<ul>
					<li><a href="#">logo</a></li>
					<li><a href="#c1List">치킨</a></li>
					<li><a href="#c2List">사이드</a></li>
					<li><a href="#c3List">음료</a></li>
				</ul>
			</div>
		</nav>
		<div id="pList">
			<div id="c1List">
				<h2>치킨</h2>
				<div class="pList_detail">
					<span class="pList_main">
						<div>
							<h2>후라이드 치킨</h2>
						</div>
						<div>바삭바삭 식감좋은 후라이드 치킨</div>
						<div>18,000원</div>
					</span> <span class="pList_img"> <img src="../img/치킨.jpeg"
						alt="imgEL">
					</span>
				</div>
				<div class="pList_detail">
					<span class="pList_main">
						<div>
							<h2>후라이드 치킨</h2>
						</div>
						<div>바삭바삭 식감좋은 후라이드 치킨</div>
						<div>18,000원</div>
					</span> <span class="pList_img"> <img src="../img/치킨.jpeg"
						alt="imgEL">
					</span>
				</div>

			</div>
			<div id="c2List">
				<h2>사이드</h2>
				<div class="pList_detail">
					<span class="pList_main">
						<div>
							<h2>감자튀김</h2>
						</div>
						<div>겉은 바삭 속은 촉촉 수제 감자튀김</div>
						<div>3,000원</div>
					</span> <span class="pList_img"> <img src="../img/감자튀김.jpg"
						alt="imgEL">
					</span>
				</div>
				<div class="pList_detail">
					<span class="pList_main">
						<div>
							<h2>감자튀김</h2>
						</div>
						<div>겉은 바삭 속은 촉촉 수제 감자튀김</div>
						<div>3,000원</div>
					</span> <span class="pList_img"> <img src="../img/감자튀김.jpg"
						alt="imgEL">
					</span>
				</div>
				<div id="c3List">
					<h2>음료</h2>

					<div class="pList_detail">
						<span class="pList_main">
							<div>
								<h2>콜라</h2>
							</div>
							<div>역시 콜라는 코카콜라</div>
							<div>2,000원</div>
						</span> <span class="pList_img"> <img src="../img/콜라.jpg"
							alt="치킨el">
						</span>
					</div>
				</div>
				<br>
			</div>
			<nav id="footer_nav">
				<div>
					<ul>
						<li><a href="javascript:void(0);">주문하기</a></li>
						<li><a id="basket_open_btn" href="javascript:void(0);">주문내역</a></li>
						<li><a href="javascript:void(0);">계산서</a></li>
						<li><a href="javascript:void(0);">나가기</a></li>
					</ul>
				</div>
			</nav>
		</div>
		<div id="basket">
			<div>
				<strong>장바구니</strong><i id="basket_close_btn" class="fa fa-close" style="font-size: 36px"></i>
			</div>
			<div class="pList_detail">
				<span class="pList_main">
					<div>
						<h2>후라이드 치킨</h2>
					</div>
					<div>18,000원</div>
				</span> <span class="pList_count">

					<div id="count">
						<input type="button" class="count" value="▲"><br> <input
							type="button" class="count" value="▼">
					</div>
				</span>
			</div>
			<div class="pList_detail">
				<span class="pList_main">
					<div>
						<h2>감자튀김</h2>
					</div>
					<div>3,000원</div>
				</span> <span class="pList_count">

					<div id="count">
						<input type="button" class="count" value="▲"><br> <input
							type="button" class="count" value="▼">
					</div>
				</span>
			</div>
			<div class="pList_detail">
				<span class="pList_main">
					<div>
						<h2>콜라</h2>
					</div>
					<div>2,000원</div>
				</span> <span class="pList_count">

					<div id="count">
						<input type="button" class="count" value="▲"><br> <input
							type="button" class="count" value="▼">
					</div>
				</span>
				<h2 id="sum">합계 23000원</h2>
			</div>
		</div>
		<div id="bill">계산서Modal</div>
	</div>
</body>
<script type="text/javascript">
function modal(id) {
    var zIndex = 9999;
    var modal = $('#' + id);

    // 모달 div 배경 레이어
    var bg = $('<div>')
        .css({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.4)'
        })
        .appendTo('body');

    modal
        .css({
            position: 'fixed',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        })
        .show()
        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        $('#basket_close_btn').on('click', function () {
            bg.remove();
            modal.hide();
        });
    	
}
$('#basket_open_btn').on('click', function () {
    // 모달창 띄우기
    modal('basket');
});
	/* 
	 ajax발생시켜 상품리스트(카테고리 포함) 가져오기
	 안보이는div생성 상품 누를때마다 상품코드 집어 넣기
	 주문하기 클릭하면 div안에 있는 상품코드 다 서버로 넘기기
	 주문내역 클릭시 숨겨둔 div보여지게 하기
	 계산서 클릭시 준문했던 내역 긁어와서 div하나 띄어주고 주문내역 붙이기
	 */
</script>


</html>