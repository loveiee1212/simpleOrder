<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문하기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" href="resources/image/smallLogo.png"
	type="image/x-icon">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style>
#frame {
	width: 568px;
	height: auto;
	margin: auto;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #2565a3;
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

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 30px 29px;
	text-decoration: none;
	font-size: 25px;
	font-weight: bold;
}

#footer_nav {
	position: fixed;
	bottom: 0;
	width: 568px;
	margin: auto;
	height: auto;
}

#basket {
	display: none;
	width: 460px;
	height: 100%;
	margin: auto;
	padding: 20px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#baskettable, #billtable {
	width: 510px;
	height: 600px;
	overflow: auto;
	margin-left: -20px;
}

#baskettable::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#baskettable::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#baskettable::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#billtable::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#billtable::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#billtable::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#baskettable td {
	border-bottom: 2px solid #2565a3;
	height: 120px;
	font-size: 20px;
}

#bill {
	display: none;
	width: 460px;
	height: 100%;
	overflow: auto;
	margin: auto;
	padding: 20px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#bill td {
	height: 80px;
	font-size: 20px;
}

i {
	margin-right: 20px;
	float: right;
}

#header_nav {
	height: 80px;
}

#header_div {
	width: 570px;
	height: 100px;
	overflow-x: auto;
	overflow-y: hidden;
}

#header_div::-webkit-scrollbar {
	width: 20px;
	background-color: #2565a3;
}

#header_div::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#header_div::-webkit-scrollbar-track {
	background-color: #2565a3;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#header_div ul {
	width: 1000px;
	height: 83px;
	overflow-x: auto;
	overflow-y: hidden;
}

#header_nav img {
	width: 140px;
	margin-top: 5px;
	margin-right: 30px;
}

.detail_body, .soldOut {
	width: 240px;
	height: 300px;
	border: solid #2565a3 1px;
	border-radius: 5px;
	margin: 15px 20px;
	float: left;
}

.text_detail div {
	margin: 10px 0;
	text-align: center;
	width: 240px;
}

.pd_name {
	font-size: 20px;
	font-weight: bolder;
	width: 200px;
}

.pList_detail {
	width: 200px;
	float: left;
}

.pd_imgName {
	width: 200px;
	height: 200px;
	margin: 12px 20px 0 20px;
}

.pList_detail img {
	max-width: 100%;
	border-radius: 5px;
}

.pdc_code, .pd_code, .pd_date, .bsk_pdc_code, .bsk_pd_code, .bsk_pd_date
	{
	display: none;
}

.pd_soldOut {
	color: red;
}

#orderbtn {
	margin-left: 15px;
}

#pro01, #pro02 {
	height: 50px;
	font-size: 25px;
	margin-left: 20px;
	padding-top: 10px;
}

#skc01, #skc02 {
	height: 60px;
	background-color: #e3f2fd;
}

p {
	text-align: center;
	margin-top: -5px;
	color: rgb(133, 133, 133);
}

#basket p, #bill p {
	font-size: 35px;
	text-align: center;
	margin-top: 5px;
	color: black;
}

table {
	width: 500px;
}

.bsk_pd_price {
	width: 90px;
}

.bsk_oh_cnt {
	width: 50px;
	text-align: center;
}

.bsk_pd_cnt {
	width: 50px;
}

#delete {
	width: 80px;
	height: 50px;
	font-size: 20px;
	border: 3px solid #2565a3;
	color: red;
	background-color: white;
}

#cntUp, #cntDown {
	border: 3px solid #2565a3;
	background-color: white;
	width: 50px;
	height: 50px;
	margin-left: 20px;
	font-size: 20px;
}

#cntUp, #cntDown:focus {
	outline: none;
}

#bskText {
	margin-top: -300px;
	text-align: center;
}

#bskSum, #billSum {
	float: right;
	margin-right: 20px;
	padding-bottom: 20px;
	font-size: 25px;
}

.pList {
	height: 60px;
	color: #2565a3;
	background-color: #e3f2fd;
	clear: both;
	font-size: 25px;
	font-weight: bold;
	padding-top: 20px;
	padding-left: 10px;
}

#order {
	border: 2px solid white;
	width: 580px;
	height: 80px;
	background-color: #2565a3;
	font-weight: bold;
	color: white;
	font-size: 25px;
}

#basket_close_btn, #bill_close_btn {
	border: 2px solid white;
	width: 580px;
	height: 80px;
	background-color: #e3f2fd;
	font-weight: bold;
	color: #2565a3;
	font-size: 25px;
	margin-bottom: 20px;
}

#bskFooter, #billFooter {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 568px;
	margin: auto;
	height: auto;
}

#hline {
	margin-top: 20px;
}

b {
	font-size: 20px;
}

#hline_p {
	font-size: 15px;
	text-align: center;
	flex-wrap: wrap;
	align-content: center;
}

#innerdiv {
	clear: left;
	margin-bottom: 100px;
}

input:focus, button:focus {
	outline: none;
}

#billMsg {
	margin: 240px 0 0 160px;
	font-size: 20px;
}
</style>
<script type="text/javascript">
	//판매키에 등록된 상품리스트 출력
	$.ajax({
		url : 'rest/getsellproductlist',
		type : 'post',
		dataType : 'json',
		success : function(data) {
			console.log(data.sellProList);
			//판매키 카테고리 네비바 html삽입
			$('#header_nav').html(data.sellCtList);
			//판매키 카테고리 html삽입
			$('#sellProList').html(data.sellProList);
			priceUpdate();
			orderLoading();
			proHide();
		},
		error : function(err) {
			console.log(err);
		}
	});
	function priceUpdate() {
		var pd_price = $('.pd_price');
		for (var i = 0; i < pd_price.length; i++) {
			var price = pd_price[i].innerText;
			price = Number(price).toLocaleString('en');
			pd_price[i].innerText = price + "원";
		}
	}
	function proHide() {
		var pro = $('.pro');
		for (var i = 0; i < pro.length; i++) {
			console.log(pro.eq(i).attr("id"));
			$("#" + pro.eq(i).attr("id")).hide();
		}
		$("#" + pro.eq(0).attr("id")).show();

		$('#0').removeClass("fa-angle-up");
		$('#0').addClass("fa-angle-down");
	}
</script>
</head>
<body>
	<div id="frame">
		<div id="header_div">
			<nav id="header_nav"></nav>
		</div>
		<div id="sellProList"></div>
		<div id="innerdiv">
			<div id="hline"></div>
			<p id="hline_b">
				<b>회사정보</b>
			</p>
			<p id="hline_p">
				SimpleOrder(주) | 대표: HD6 | 인천광역시 미추홀구 학익동 <br> 365고객센터 |
				전자금융거래분쟁처리담당 1234-1234 <br> 사업자 등록번호 : 123-45-00678 | email:
				simple@order.com <br> &copy; Untitled. All rights reserved. |
				Photos by <a href="#">choi ay</a> | Design by <a href="#"
					rel="nofollow">choi ay</a>
			</p>
		</div>
		<nav id="footer_nav">
			<div>
				<ul>
					<li><a href="javascript:void(0);" onclick="order();">주문하기</a></li>
					<li><a id="basket_open_btn" href="javascript:void(0);">장바구니</a></li>
					<li><a id="bill_open_btn" href="javascript:void(0);">계산서</a></li>
					<li><a href="kioskmenu">나가기</a></li>
				</ul>
			</div>
		</nav>

		<div id="basket">
			<div>
				<br>
				<p>장바구니</p>
				<div id="baskettable">
					<table>
						<tbody id="bskBody">

						</tbody>
					</table>
				</div>
				<h2 id="bskText">장바구니가 비어있습니다</h2>
			</div>
			<div id="bskFooter">
				<div id="bskSum"></div>
				<button id="order" onclick="order();">주문하기</button>
				<button id="basket_close_btn">나가기</button>
			</div>
		</div>
		<div id="bill">
			<p>계산서</p>
			<div id="billtable">
				<table>
					<tbody id="billBody">

					</tbody>
				</table>
			</div>
			<div id="billFooter">
				<div id="billSum"></div>
				<button id="bill_close_btn">나가기</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$.ajax({ // 테이블 번호,주문내역,이용시간
		url : 'rest/kioskmainready',
		type : 'post',
		dataType : 'json',
		success : function(data) {
			console.log(data);
			if(data.oac_time !="null"){
			setInterval(() => {
				$.ajax({
					url : 'rest/getoacstatus',
					type : 'post',
					dataType : 'json',
					success : function(data) {
						//리뷰 사용여부 확인
						
						if('-1' == data.oac_status){
							if (data.rvUseCode == '-1') {
								location.href = 'kioskThanks';
							}else{
								location.href = 'kioskreview/'+data.oac_num 
							}
						}
					}
				});
			}, 3000);
			}
		}
	});
	
		// 장바구니 모달창 띄우기
	$('#basket_open_btn').on('click', function() {
		//모달창 열기
		modal('basket');
	});

	// 계산서 모달창 띄우기
	$('#bill_open_btn').on('click', function() {
		//모달창 열기
		modal('bill');
		$.ajax({
			url : 'rest/getbilllist',
			type : 'post',
			dataType : 'json',
			success : function(data) {
				//계산서 html 삽입
				$('#billBody').html(data.bill);
				billSum();
				billPriceUpdate();
			},
			error : function(err) {
				$('#billBody').html("주문내역이 없습니다");
			}
		});
	});
	//계산서 안에 있는 상품 가격이랑 개수 합치기
	function billSum() {
		var bill_pd_price = $('.bill_pd_price');
		var bill_oh_cnt = $('.bill_oh_cnt');
		var sum = 0;
		for (var i = 0; i < bill_pd_price.length; i++) {
			var price = Number(bill_pd_price[i].innerText);
			var cnt = Number(bill_oh_cnt[i].innerText);

			console.log(price);
			sum += (price * cnt);
		}
		console.log(sum);
		sum = sum.toLocaleString('en');
		console.log(sum);
		$('#billSum').text("합계 " + sum + "원");
	}
	function billPriceUpdate() {
		var pd_price = $('.bill_pd_price');
		var oh_cnt = $('.bill_oh_cnt');
		for (var i = 0; i < pd_price.length; i++) {
			var price = pd_price[i].innerText;
			var cnt = oh_cnt[i].innerText;
			price = Number(price).toLocaleString('en');
			console.log(price);
			pd_price[i].innerText = price + "원";
			oh_cnt[i].innerText = cnt + "개";
		}
	}

	function modal(id) {
		var zIndex = 9999;
		var modal = $('#' + id);

		// 모달 div 배경 레이어 생성
		var bg = $('<div>').css({
			position : 'fixed',
			zIndex : zIndex,
			left : '0px',
			top : '0px',
			width : '100%',
			height : '100%',
			overflow : 'auto',
			// 레이어 색깔은 여기서 바꾸면 됨
			backgroundColor : 'rgba(0,0,0,0.4)'
		}).appendTo('body');

		modal
				.css(
						{
							position : 'fixed',
							boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

							// 시꺼먼 레이어 보다 한칸 위에 보이기
							zIndex : zIndex + 1,

							// div center 정렬
							top : '50%',
							left : '50%',
							transform : 'translate(-50%, -50%)',
							msTransform : 'translate(-50%, -50%)',
							webkitTransform : 'translate(-50%, -50%)'
						}).show(500)

		// 닫기 버튼 처리, 배경 레이어와 모달 div 지우기
		$('#basket_close_btn').on('click', function() {
			bg.remove();
			modal.hide(500);
		});
		$('#bill_close_btn').on('click', function() {
			bg.remove();
			modal.hide(500);
		});

	}

	function orderLoading() {
		//상품 클릭
		$('.detail_body').on(
				"click",
				function() {
					if (confirm("주문 추가하시겠습니까?")) {
						//클릭한 상품의 상품 카테고리 코드, 상품 코드, 상품 이름, 상품 가격 가져옴 
						var pdc_code = $(this).children().eq(0).children()
								.eq(1).children().eq(0).text()
						var pd_code = $(this).children().eq(0).children().eq(1)
								.children().eq(1).text()
						var pd_date = $(this).children().eq(0).children().eq(1)
								.children().eq(2).text()
						var pd_name = $(this).children().eq(0).children().eq(1)
								.children().eq(3).text()
						var pd_price = $(this).children().eq(0).children()
								.eq(1).children().eq(4).text()
						//상품 카테고리 코드, 상품 코드, 상품 이름, 상품 가격 파라미터로 넘김
						insertOrder(pdc_code, pd_code, pd_date, pd_name,
								pd_price);
					}
				})

		$('.soldOut').on("click", function() {
			console.log("품절");
			alert("죄송합니다 품절 상품입니다");
		});
		$('.pList').on("click", function() {
			var skc = $(this).children().attr("id");
			$('#pro' + skc).toggle(600);
			if ($(this).children().hasClass("fa-angle-up")) {
				$(this).children().removeClass("fa-angle-up");
				$(this).children().addClass("fa-angle-down");
			} else {
				$(this).children().removeClass("fa-angle-down");
				$(this).children().addClass("fa-angle-up");
			}
		});
	}
	//장바구니에 담기
	function insertOrder(pdc_code, pd_code, pd_date, pd_name, pd_price) {
		//장바구니에 상품이 이미 담겨 있는지 확인
		var result = insertCheck(pdc_code, pd_code);
		if (result) {
			console.log('그냥 인서트');
			var str = '';
			str += "<tr id = '" + pdc_code + pd_code + "'>";
			str += "<td class='bsk_pdc_code'>" + pdc_code + "</td>";
			str += "<td class='bsk_pd_code'>" + pd_code + "</td>";
			str += "<td class='bsk_pd_date'>" + pd_date + "</td>";
			str += "<td>" + pd_name + "</td>";
			str += "<td class='bsk_pd_price'>" + pd_price + "</td>";
			str += "<td class='bsk_pd_cnt'><input type='button' value='▲' id='cntUp' onclick='cntUp($(this));'>";
			str += "<input type='button' value='▼' id='cntDown' onclick='cntDown($(this));'></td>"
			str += "<td class='bsk_oh_cnt'>1</td>";
			str += "<td>개</td>";
			str += "<td><input type='button' value='삭제' id='delete' onclick='deleteCol($(this));'></td>";
			str += "</tr>";
			$('#bskBody').append(str);
			$('#bskText').hide();
			$('#bskSum').show();
			bskSum();
			return true;
		} else {
			console.log('개수 추가');
			return false;
		}

	}
	//상품 카테고리 코드와 상품 코드를 배열에 담고 반복문 돌려서 똑같은 상품이 담겨 있는지 확인
	function insertCheck(pdc_code, pd_code) {
		//상품 카테고리 코드 배열
		var a = $('.bsk_pdc_code');
		//상품 코드 배열
		var b = $('.bsk_pd_code');
		for (var i = 0; i < a.length; i++) {
			if (pdc_code == a.eq(i).text()) {
				for (var j = 0; j < b.length; j++) {
					if (pd_code == b.eq(j).text()) {
						$("#" + pdc_code + pd_code).find(".bsk_oh_cnt").text();
						var num = ($("#" + pdc_code + pd_code).find(
								".bsk_oh_cnt").text()) * 1;
						num++;
						$("#" + pdc_code + pd_code).find(".bsk_oh_cnt").text(
								num)
						bskSum();
						return false;
					}
				}
			}
		}
		return true;
	}
	//상품 개수 늘리기
	function cntUp(elem) {
		var num = elem.parents('tr').children('.bsk_oh_cnt').text()
		num++;
		elem.parents('tr').children('.bsk_oh_cnt').text(num);
		bskSum();
	}
	//상품 개수 줄이기
	function cntDown(elem) {
		var num = elem.parents('tr').children('.bsk_oh_cnt').text()
		num--;
		elem.parents('tr').children('.bsk_oh_cnt').text(num);
		//상품개수가 0이 되면 테이블 컬럼 삭제
		if (num == 0) {
			if (confirm("주문목록에서 삭제 하시겠습니까?")) {
				elem.closest('tr').remove();
				if ($('#bskBody').children().length == 0) {
					$('#bskText').show();
					$('#bskSum').hide();
				}
			} else {
				num++;
			}
		}
		elem.parents('tr').children('.bsk_oh_cnt').text(num);
		bskSum();
	}
	//장바구니에 담긴 테이블 컬럼 삭제
	function deleteCol(elem) {
		if (confirm("주문목록에서 삭제 하시겠습니까?")) {
			elem.closest('tr').remove();
			bskSum();
			console.log($('#bskBody').children().length);
			if ($('#bskBody').children().length == 0) {
				$('#bskText').show();
				$('#bskSum').hide();
			}
		}
	}
	//장바구니 안에 있는 상품 가격이랑 개수 합치기
	function bskSum() {
		var bsk_pd_price = $('.bsk_pd_price');
		var bsk_oh_cnt = $('.bsk_oh_cnt');
		var sum = 0;
		for (var i = 0; i < bsk_pd_price.length; i++) {
			var price = bsk_pd_price[i].innerText;
			price = price.slice(0, -1);
			price = price.replace(/(,)/g, "");
			Number(price);
			var cnt = Number(bsk_oh_cnt[i].innerText);

			console.log(price);
			console.log(cnt);
			sum += (price * cnt);
			console.log(sum);
		}

		sum = Number(sum).toLocaleString('en');
		$('#bskSum').text("합계 " + sum + "원");
		console.log($('#bskText').text());
		console.log($('#bskBody').children().length);
		if ($('#bskBody').children().length === 0) {
			console.log(sum + "원");

		}
	}
	//주문하기
	function order() {
		if (confirm("주문 하시겠습니까?")) {
			console.log($('#bskBody').children().length);
			if ($('#bskBody').children().length === 0) {
				alert("장바구니가 비어있습니다");
				return false;
			}
			//class 이름별로 변수에 담아서 풀어주기
			var bsk_pdc_code = $('.bsk_pdc_code');
			var bsk_pd_code = $('.bsk_pd_code');
			var bsk_pd_date = $('.bsk_pd_date');
			var bsk_oh_cnt = $('.bsk_oh_cnt');
			var bskArr = new Array();
			for (var i = 0; i < bsk_pdc_code.length; i++) {
				var obj = new Object();
				obj.pdc_code = bsk_pdc_code[i].innerText;
				obj.pd_code = bsk_pd_code[i].innerText;
				obj.pd_date = bsk_pd_date[i].innerText;
				obj.oh_cnt = bsk_oh_cnt[i].innerText;
				bskArr.push(obj);
			}
			for (var i = 0; i < bskArr.length; i++) {
				console.log(bskArr[i]);
			}
			var bArr = JSON.stringify(bskArr);
			$.ajax({
				url : 'rest/insertorder',
				type : 'post',
				data : bArr,
				dataType : 'json',
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					console.log(data);
					alert(data.msg);
					//return 가져온 데이터로 location.href 해주면 됨
					location.href = data.view;
				},
				error : function(err) {
					console.log(err);
				}
			});
		}
	}
</script>


</html>