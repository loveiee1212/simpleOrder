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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
	margin: auto;
	height: auto;
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

#bill {
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

strong {
	font-size: 30px;
	margin-left: 170px;
}

i {
	margin-left: 140px;
}

#header_nav {
	/* overflow-x: scroll; */
	-ms-overflow-style: none;

	/* IE에서 스크롤바 감춤 */
	&::
	-webkit-scrollbar
	{
	display
	:
	none
	!important;
	/* 윈도우 크롬 등 */
}

}
#header_nav img {
	width: 80px;
}

.detail_body {
	width: 240px;
	height: 280px;
	border: solid rgb(133, 133, 133) 1px;
	border-radius: 5px;
	margin: 10px 20px;
	float: left;
}

.text_detail div {
	margin: 4px 0;
	text-align: center;
	width: 240px;
}

.pd_name {
	font-size: 20px;
	font-weight: bolder;
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
	width: 200px;
	border-radius: 5px;
}

.pList {
	clear: both;
}

.pdc_code, .pdc_date, .pd_code, .pd_date, .bsk_pdc_code, .bsk_pdc_date,
	.bsk_pd_code, .bsk_pd_date {
	display: none;
}

tr, td {
	border: 1px solid black;
}
</style>
<script type="text/javascript">
	//판매키에 등록된 상품리스트 출력
	$.ajax({
		url : 'rest/getsellproductlist',
		type : 'post',
		dataType : 'json',
		success : function(data) {
			//판매키 카테고리 네비바 html삽입
			$('#header_nav').html(data.sellCtList);
			//판매키 카테고리 html삽입
			$('#sellProList').html(data.sellProCtList);
			//판매키 카테고리에 class준거 차례대로 배열에 담기
			var pList = document.getElementsByClassName('pList');
			//판매키에 담긴 상품리스트 반복문
			for (var i = 0; i < data.pList.length; i++) {
				//판매키 카테고리에 class준거 반복문
				for (var j = 0; j < pList.length; j++) {
					//판매키 카테고리코드(상품 카테고리 코드) 와 상품리스트(상품 카테고리 코드) 값이 같은 곳에 삽입
					if (i == j) {
						$(".pList").eq(i).append(data.pList[j]);
					}
				}
			}
			var pd_price = $('.pd_price');
			for (var i = 0; i < pd_price.length; i++) {
				var price = pd_price[i].innerText;
				price = Number(price).toLocaleString('en');
				pd_price[i].innerText = price + "원";
			}
			orderLoading();
		},
		error : function(err) {
			console.log(err);
		}
	});
</script>
</head>
<!-- <h2>kioskOrder.jsp</h2> -->
<body>
	<div id="frame">
		<nav id="header_nav"></nav>
		<div id="sellProList"></div>
		<br>
	</div>
	<nav id="footer_nav">
		<div>
			<ul>
				<li><a href="javascript:void(0);" onclick="order();">주문하기</a></li>
				<li><a id="basket_open_btn" href="javascript:void(0);">주문내역</a></li>
				<li><a id="bill_open_btn" href="javascript:void(0);">계산서</a></li>
				<li><a href="kioskmenu">나가기</a></li>
			</ul>
		</div>
	</nav>

	<div id="basket">
		<div>
			<strong>장바구니</strong><i id="basket_close_btn" class="fa fa-close"
				style="font-size: 36px"></i>
			<table>
				<tbody id="bBody">

				</tbody>
			</table>
		</div>
	</div>
	<div id="bill"></div>
</body>
<script type="text/javascript">
	function order() {
		var bsk_pdc_code = $('.bsk_pdc_code');
		var bsk_pdc_date = $('.bsk_pdc_date');
		var bsk_pd_code = $('.bsk_pd_code');
		var bsk_pd_date = $('.bsk_pd_date');
		var oh_cnt = $('.oh_cnt');
		var bskArr = new Array();
		for (var i = 0; i < bsk_pdc_code.length; i++) {
			// console.log(bsk_pdc_code[i].innerText);
			// console.log(bsk_pd_code[i].innerText);
			// console.log(oh_cnt[i].innerText);
			/* var arr=new Array();
			arr[0]=bsk_pdc_code[i].innerText;
			arr[1]=bsk_pd_code[i].innerText;
			arr[2]=oh_cnt[i].innerText; */
			bskArr[i] = bsk_pdc_code[i].innerText + '/'
					+ bsk_pd_code[i].innerText + '/' + oh_cnt[i].innerText;
			/* bskArr[i]=arr; */
		}
		for (var i = 0; i < bskArr.length; i++) {
			console.log(bskArr[i]);
		}
		$.ajax({
			url : 'rest/insertorder',
			type : 'post',
			data : {
				"bskArr" : bskArr
			},
			success : function(data) {
				console.log(data);
			},
			error : function(err) {
				console.log(err);
			}
		});
	}
	function modal(id) {
		var zIndex = 9999;
		var modal = $('#' + id);

		// 모달 div 배경 레이어
		var bg = $('<div>').css({
			position : 'fixed',
			zIndex : zIndex,
			left : '0px',
			top : '0px',
			width : '100%',
			height : '100%',
			overflow : 'auto',
			// 레이어 색갈은 여기서 바꾸면 됨
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
						}).show()

		// 닫기 버튼 처리, 배경 레이어와 모달 div 지우기
		$('#basket_close_btn').on('click', function() {
			bg.remove();
			modal.hide();
		});
		$('#bill_close_btn').on('click', function() {
			bg.remove();
			modal.hide();
		});

	}

	// 장바구니 모달창 띄우기
	$('#basket_open_btn').on('click', function() {
		//모달창 열기
		modal('basket');
	});

	// 계산서 모달창 띄우기
	$('#bill_open_btn').on('click', function() {
		$.ajax({
			url : 'rest/getbilllist',
			type : 'post',
			dataType : 'json',
			success : function(data) {
				//계산서 html 삽입
				$('#bill').html(data.bill);
				//모달창 열기
				modal('bill');
			},
			error : function(err) {
				console.log(err);
			}
		});
	});
	function orderLoading() {
		//상품 클릭
		$('.detail_body').on(
				"click",
				function() {
					if (confirm("주문 추가하시겠습니까?")) {
						//클릭한 상품의 상품 카테고리 코드, 상품 코드, 상품 이름, 상품 가격 가져옴 
						var pdc_code = $(this).children().eq(0).children()
								.eq(1).children().eq(0).text()
						var pdc_date = $(this).children().eq(0).children()
								.eq(1).children().eq(1).text()
						var pd_code = $(this).children().eq(0).children().eq(1)
								.children().eq(2).text()
						var pd_date = $(this).children().eq(0).children().eq(1)
								.children().eq(3).text()
						var pd_name = $(this).children().eq(0).children().eq(1)
								.children().eq(4).text()
						var pd_price = $(this).children().eq(0).children()
								.eq(1).children().eq(5).text()
						//상품 카테고리 코드, 상품 코드, 상품 이름, 상품 가격 파라미터로 넘김
						insertOrder(pdc_code, pdc_date, pd_code, pd_date,
								pd_name, pd_price);
					}
				})
	}
	//장바구니에 담기
	function insertOrder(pdc_code, pdc_date, pd_code, pd_date, pd_name,
			pd_price) {
		//장바구니에 상품이 이미 담겨 있는지 확인
		var result = insertCheck(pdc_code, pd_code);
		if (result) {
			console.log('그냥 인서트');
			var str = '';
			str += "<tr id = '" + pdc_code + pd_code + "'>";
			str += "<td class='bsk_pdc_code'>" + pdc_code + "</td>";
			str += "<td class='bsk_pdc_date'>" + pdc_date + "</td>";
			str += "<td class='bsk_pd_code'>" + pd_code + "</td>";
			str += "<td class='bsk_pd_date'>" + pd_date + "</td>";
			str += "<td>" + pd_name + "</td>";
			str += "<td>" + pd_price + "</td>";
			str += "<td><input type='button' value='▲' onclick='cntUp($(this));'>";
			str += "<input type='button' value='▼' onclick='cntDown($(this));'></td>"
			str += "<td class='oh_cnt'>1</td>";
			str += "<td><input type='button' value='삭제' onclick='deleteCol($(this));'></td>";
			str += "</tr>";
			$('#bBody').append(str);
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
						$("#" + pdc_code + pd_code).find(".oh_cnt").text();
						var num = ($("#" + pdc_code + pd_code).find(".oh_cnt")
								.text()) * 1;
						num++;
						$("#" + pdc_code + pd_code).find(".oh_cnt").text(num)
						return false;
					}
				}
			}
		}
		return true;
	}
	//상품 개수 늘리기
	function cntUp(elem) {
		var num = elem.parents('tr').children('.oh_cnt').text()
		num++;
		elem.parents('tr').children('.oh_cnt').text(num);
	}
	//상품 개수 줄이기
	function cntDown(elem) {
		var num = elem.parents('tr').children('.oh_cnt').text()
		num--;
		//상품개수가 0이 되면 테이블 컬럼 삭제
		if (num == 0) {
			if (confirm("주문목록에서 삭제 하시겠습니까?")) {
				elem.closest('tr').remove();
			} else {
				num++;
			}
		}
		elem.parents('tr').children('.oh_cnt').text(num);
	}
	//장바구니에 담긴 테이블 컬럼 삭제
	function deleteCol(elem) {
		if (confirm("주문목록에서 삭제 하시겠습니까?")) {
			elem.closest('tr').remove();
		}
	}
</script>


</html>