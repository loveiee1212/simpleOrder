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
                    </span>
                    <span class="pList_img">
                        <img src="../img/치킨.jpeg" alt="imgEL">
                    </span>
                </div>
                <div class="pList_detail">
                    <span class="pList_main">
                        <div>
							<h2>후라이드 치킨</h2>
						</div>
                        <div>바삭바삭 식감좋은 후라이드 치킨</div>
                        <div>18,000원</div>
                    </span>
                    <span class="pList_img">
                        <img src="../img/치킨.jpeg" alt="imgEL">
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
                    </span>
                    <span class="pList_img">
                        <img src="../img/감자튀김.jpg" alt="imgEL">
                    </span>
                </div>
                <div class="pList_detail">
                    <span class="pList_main">
                        <div>
							<h2>감자튀김</h2>
						</div>
                        <div>겉은 바삭 속은 촉촉 수제 감자튀김</div>
                        <div>3,000원</div>
                    </span>
                    <span class="pList_img">
                        <img src="../img/감자튀김.jpg" alt="imgEL">
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
                        </span>
                        <span class="pList_img">
                            <img src="../img/콜라.jpg" alt="치킨el">
                        </span>
                    </div>
                </div>
                <br>
                <br>
                <br>
            </div>
            <nav id="footer_nav">
                <div>
                    <ul>
                        <li><a href="#">주문하기</a></li>
                        <li><a href="#">주문내역</a></li>
                        <li><a href="#">계산서</a></li>
                        <li><a href="#">나가기</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</body>
<script type="text/javascript">
/* 
	ajax발생시켜 상품리스트(카테고리 포함) 가져오기
	안보이는div생성 상품 누를때마다 상품코드 집어 넣기
	주문하기 클릭하면 div안에 있는 상품코드 다 서버로 넘기기
	주문내역 클릭시 숨겨둔 div보여지게 하기
	계산서 클릭시 준문했던 내역 긁어와서 div하나 띄어주고 주문내역 붙이기
 */
</script>


</html>