<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
body {
	padding: 0;
}

#baseBox {
	border: 1px solid black;
	float: left;
	padding: 2%;
	transform: translate(-50%, 0%);
	margin: 0 50%;
}

#baseinnerBox {
	float: left;
	border: pink 1px solid;
	width: 1500px;
	height: 800px;
	padding: 30px;
}

#a {
	margin-top: 35px;
	border: 1px solid black;
	width: 700px;
	height: 730px;
	float: left;
}

#b {
	margin-right: 10px;
	margin-top: 127px;
	height: 400px;
	overflow: auto;
	margin-top: 127px;
}

#c {
	margin-top: 35px;
	margin-left: 95px;
	border: 1px solid black;
	width: 700px;
	height: 730px;
	float: left;
	border: 1px solid black;
}

#d {
	margin-left: 27px;
}

#e {
	margin-right: 10px;
	overflow: auto;
	margin-left: 27px;
	height: 400px;
	margin-top: 50px;
}

.tab2 {
	margin-top: 50px;
	/* border: 1px solid black; */
	text-align: center;
}

.tab1 {
	overflow: scroll;
}

.tab1 tr td {
	border: 1px solid black;
	width: 150px;
	height: 70px;
}

.tab2 tr td {
	margin-left: 320px;
}

.tab3 tr td {
	border: 1px solid black;
	width: 205px;
	height: 70px;
	margin: 30px;
	border: 1px solid black;
}

.btnDown, .btnUp {
	width: 150px;
	height: 70px;
	border: none;
	background: none;
}

#btnSave {
	margin-left: 510px;
	margin-top: 50px;
	width: 150px;
	height: 70px;
	border: none;
}

#btnEnd {
	margin-left: 510px;
	margin-top: 50px;
	width: 150px;
	height: 70px;
	border: none;
	margin-top: 50px;
}

#h2_1 {
	margin-left: 27px;
}

l
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

tr, td {
	border: 1px solid black;
	width: 138px;
	height: 20px;
	padding: 10px;
	margin: 20px;
	text-align: center;
}

#Date {
	font-size: 26px;
	text-align: center;
	margin-left: 20px;
	margin-top: 10px;
}

.clickdiv ul {
	width: 200px;
	padding: 0px;
	list-style: none;
	text-align: center;
}

.clickdiv ul li {
	display: inline;
	font-size: 25px;
	text-align: center;
}
</style>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<div id="a">

				<h2 id="h2_1">입고물품 등록</h2>
				<div id="b">
					<div id="prostockList">
						<table id="psListtable">
						</table>
					</div>
				</div>
				<input type="button" value="저장" id="btnSave" onclick="updateStock()">
			</div>
			<div id="c">
				<div id="d">
					<h2>입고 내역</h2>
					<div class="clickdiv">
						<div id="Date"></div>
						<ul>
							<li id="hours"></li>
							<li id="point">:</li>
							<li id="min"></li>
							<li id="point">:</li>
							<li id="sec"></li>
						</ul>
					</div>
					<table class="tab2">
						<tr>
							<td>입출고 날짜</td>
							<td><form action="#">
									예약일 선택 <input type="date" name="pd_date" id="pd_date" /> <input
										type="button" onclick="searchDateStock()" value="검색" /> <input
										type="reset" value="새로고침" /> <br />
								</form>
							<td>하위</td>
						</tr>
					</table>
					<div id="stockList">
						<table id="sListtable">
						</table>
					<input type="button" value="나가기" id="btnEnd"></div>
				</div>
				<div id="e">
					<table class="tab3">

					</table>
				</div>
				
			</div>
		</div>
	</div>
</body>
<script>
	clockon();
	//왼쪽 재고 리스트 출력
	$.ajax({
		type : "post",
		url : "rest/getstocklist",
		dataType : 'json',
		success : function(result) {
			console.log(result);
			$("#sListtable").html(result.sList);
			stockListReady();
		},
		error : function(err) {
			console.log(err);
		}
	});

	// 오른쪽 재고리스트 출력
	$.ajax({
		type : "post",
		url : "rest/getpstocklist",
		dataType : 'json',
		success : function(result) {
			console.log(result);
			$("#psListtable").html(result.psList);
		},
		error : function(err) {
			console.log(err);
		}
	});

	/* Datepicker UI default 설정 */
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd', //날짜 포맷
		prevText : '이전 달', // 마우스 오버시 이전달 텍스트
		nextText : '다음 달', // 마우스 오버시 다음달 텍스트
		closeText : '닫기', // 닫기 버튼 텍스트 변경
		currentText : '오늘', // 오늘 텍스트 변경
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ], //한글 캘린더중 월 표시를 위한 부분
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ], //한글 캘린더 중 월 표시를 위한 부분
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ], //한글 캘린더 요일 표시 부분
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ], //한글 요일 표시 부분
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ], // 한글 요일 표시 부분
		showMonthAfterYear : true, // true : 년 월  false : 월 년 순으로 보여줌
		yearSuffix : '년', //
		showButtonPanel : true, // 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
	//        buttonImageOnly: true,	// input 옆에 조그만한 아이콘으로 캘린더 선택가능하게 하기
	//        buttonImage: "images/calendar.gif",	// 조그만한 아이콘 이미지
	//        buttonText: "Select date"	// 조그만한 아이콘 툴팁
	});

	/* 동적 시계 */
	function clockon() {
		var monthNames = [ "01", "02", "03", "04", "05", "06", "07", "08",
				"09", "10", "11", "12" ];
		var dayNames = [ "일", "월", "화", "수", "목", "금", "토" ]
		var newDate = new Date();
		newDate.setDate(newDate.getDate());
		$('#Date').html(
				newDate.getFullYear() + " " + monthNames[newDate.getMonth()]
						+ " " + newDate.getDate() + " "
						+ dayNames[newDate.getDay()]);
		setInterval(function() {
			var seconds = new Date().getSeconds();
			$("#sec").html((seconds < 10 ? "0" : "") + seconds);
		}, 100);

		setInterval(function() {
			var minutes = new Date().getMinutes();
			$("#min").html((minutes < 10 ? "0" : "") + minutes);
		}, 100);

		setInterval(function() {
			var hours = new Date().getHours();
			$("#hours").html((hours < 10 ? "0" : "") + hours);
		}, 100);
	};

	/* 특정일 조회시 검색되는 예약정보 출력  */
	function searchDateStock() {
		console.log($("#pd_date").val());
		$.ajax({
			type : "post",
			url : "rest/searchdatestock",
			data : {
				pd_date : $("#pd_date").val()
			},
			dataType : 'json',
			success : function(result) {
				console.log(result);
				$("#sListtable").html(result.sList)
			}
		})
	};
	// 재고 수량 업 다운 버튼 클릭시 수량 증감소
	function stockListReady() {
		$('.btnUp').click(function() {
			var n = $('.btnUp').index(this);
			var num = $(".num:eq(" + n + ")").val();
			console.log(num);
			num = $(".num:eq(" + n + ")").val(num * 1 + 1);
			console.log(num);
		});
		$('.btnDown').click(function() {
			var n = $('.btnDown').index(this);

			var num = $(".num:eq(" + n + ")").val();
			console.log(num);
			console.log(num);
			num = $(".num:eq(" + n + ")").val(num * 1 - 1);
		});
	};
	//재고 수정 업데이트
	function updateStock() {

		console.log($("#p_code0").data("code"));
		var pdArray = [];
		var pdcArray = [];
		var pdnArray = [];
		var stkArray = [];
		var $pcode = $("input[name='p_code']");
		var $stock = $("input[name='stk_stock']");
		var $pname = $("input[name='pd_name']");
		for (var i = 0; i < $pcode.length; i++) {
			pdArray.push($("#p_code" + i).val());
		}
		for (var i = 0; i < $pcode.length; i++) {
			console.log("input[]")
			if ($("#p_code" + i).data("code") < 10) {
				pdcArray.push("0" + $("#p_code" + i).data("code"));
			} else {
				pdcArray.push($("#p_code" + i).data("code"));
			}
		}
		for (var i = 0; i < $pcode.length; i++) {
			console.log("input[]")
			if ($("#stk_stock" + i).data("code") < 10) {
				pdcArray.push("0" + $("#stk_stock" + i).data("code"));
			} else {
				pdcArray.push($("#stk_stock" + i).data("code"));
			}
		}
		

		console.log(pdArray);
		console.log(pdcArray);
		console.log(pdnArray);
		console.log(stkArray);

		var $objparam = {
			"pdc_code" : pdcArray,
			"pd_code" : pdArray,
			"pd_name" : pdnArray,
			"stk_stock" : stkArray
		}

		$.ajax({
			type : 'post',
			url : "rest/updatestock",
			data : $objparam,
			dataType : 'json',
			success : function(data) {
				console.log(data);
			},
			error : function(err) {
				console.log(err);
			}
		});
	}
</script>
</html>