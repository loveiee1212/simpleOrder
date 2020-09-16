<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sellpage-판매</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style>
body {
	padding: 0;
}

#baseBox {
	border: 1px solid black;
	float: left;
	padding: 2%;
	transform: translate(-50%, 0%);
	margin: 0% 50%;
}

#baseinnerBox {
	float: left;
	border: pink 1px solid;
	width: 1500px;
	height: 800px;
	padding: 30px;
}

div {
	display: block;
	float: left;
}

#outerdiv {
	width: 1850px;
	height: 950px;
	margin: 20px;
}

.leftdiv {
	border: 1px solid black;
	width: 1200px;
	height: 800px;
	float: left;
}

.tab {
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

.category {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	height: 80px;
	width: 100px;
}

.tab button:hover {
	background-color: #ddd;
}

.tables {
	border: 1px solid black;
	width: 250px;
	height: 200px;
	float: left;
	margin: 15px;
	opacity: 0.5;
	background-color: silver;
	
}

#rightdiv {
	width: 200px;
	height: 900px;
}

.clickdiv {
	text-align: center;
	border: 1px solid black;
	width: 200px;
	height: 95px;
	margin-left: 50px;
	margin-top: 15px;
	border: 1px solid black;
}

.clickdiv p {
	padding-top: 20px;
}

#reservation {
	display: none;
	position: fixed;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}

#reservation.open {
	display: block;
}

#reservation #bg_layer {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: 0.5;
	filter: alpha(opatable = 50);
	z-index: 100
}

#contents_layer {
	position: absolute;
	top: 27%;
	left: 23%;
	width: 1200px;
	height: 700px;
	margin: -150px 0 0 -194px;
	padding: 28px 28px 0 28px;
	border: 2px solid #555;
	background: #fff;
	z-index: 200;
	line-height: normal;
	white-space: normal;
}

#r_header {
	width: 1200px;
	height: 130px;
}

#r_middle {
	border: 1px solid black;
	width: 1200px;
	height: 250px;
	overflow: auto;
}

#r_middle th, #r_middle tr, #r_middle td {
	width: 300px;
	height: 50px;
	text-align: center;
	border: 1px solid black;
}

#r_footer {
	width: 1200px;
	height: 300px;
}

#r_info {
	width: 850px;
	height: 300px;
	float: left;
	margin-left: 30px;
}

#keypad {
	width: 300px;
	height: 300px;
	float: left;
}

#keypad ul li {
	list-style: none;
	border: 1px solid black;
	width: 30px;
	height: 20px;
	text-align: center;
	padding: 20px;
	float: left;
}

#r_infotable tr, #r_infotable th {
	width: 150px;
	height: 85px;
	text-align: center;
}

#r_infotable td {
	width: 250px;
	height: 75px;
}

#r_infotable {
	margin-left: 10px;
	margin-top: 15px;
}

#r_infotable input {
	width: 120px;
	height: 30px;
}

#r_infotable button {
	width: 100px;
	height: 50px;
}

.pagebutton {
	border: 1px solid black;
	width: 100px;
	height: 100px;
	float: left;
	margin-left: 25px;
	margin-top: 60px;
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

#point {
	position: relative;
	padding-left: 10px;
	padding-right: 10px;
}

.tList {
	display: none;
}

.blockCtg {
	display: block;
}
</style>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<div class="leftdiv">
				<div class="tab"></div>
				<div id="seat"></div>
			</div>
			<!--  -->
			<div id="rightdiv">
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
				<div class="clickdiv" onclick="reservation()">
					<p>예약</p>
				</div>
				<div class="clickdiv">
					<p>환전</p>
				</div>
				<div class="clickdiv" onclick="jointable()">
					<p>단체</p>
				</div>
				<div class="clickdiv">
					<p>이동</p>
				</div>
				<div class="clickdiv" onclick="location.href='bill'">
					<p>영수증 관리</p>
				</div>
				<div class="clickdiv" id="main" onclick="location.href='posmain'">
					<p>나가기</p>
				</div>
			</div>

		</div>

		<form action=""></form>


		<div id="reservation">
			<div id="bg_layer"></div>
			<div id="contents_layer">
				<div id="r_header">
					<h1>예약목록</h1>
					<form action="#">
					예약일 선택 <input type="date" name="r_date" id="rsv_date" /> <input
						type="button" onclick="searchReserv()" value="검색" />
					<input type="reset" value="새로고침" /> <br />
					</form>
				</div>
				<div id="r_middle">
					<table id="reservtable">
					</table>
				</div>
				<div id="r_footer">
					<div id="r_info">
						<table id="r_infotable">
							<tr>
								<th>예약일자</th>
								<td><input type="text" name="r_date" id="r_date" /></td>
								<th>예약시간</th>
								<td><input type="text" name="r_time" id="r_time" /></td>
							</tr>
							<tr>
								<th>성함</th>
								<td><input type="text" name="r_name" id="r_name" /></td>
								<th>연락처</th>
								<td><input type="text" name="r_phone" id="r_phone" /></td>
							</tr>
							<tr>
								<th>메모</th>
								<td colspan="2"><textarea
										style="width: 330px; height: 70px;" name="r_memo" id="r_memo"></textarea></td>
								<td><button type="button" onclick="updatereserv()">저장하기</button></td>
							</tr>
						</table>

					</div>
					<div id="keypad">
						<ul>
							<li value="1">1</li>
							<li value="2">2</li>
							<li value="3">3</li>
							<li value="4">4</li>
							<li value="5">5</li>
							<li value="6">6</li>
							<li value="7">7</li>
							<li value="8">8</li>
							<li value="9">9</li>
							<li onclick="reset()" value="11">CE</li>
							<li value="0">0</li>
							<li onclick="backspace()" value="12">C</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>


<script>
	clockon();
	getTablelist();

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
	
	/* 상세정보 예약시간/일자 input timepicker 와 datepicker로 변환 */
	$(document).ready(function(){
	    $('#r_time').timepicker({
	    	 timeFormat:'HH:mm',
	         controlType:'select',
	         oneLine:true,
	    });
	    $("#r_date").datepicker({});
	});

	

	/* ajax를 이용해 설정한 테이블 갯수 가져오기 */
	function getTablelist() {

		$.ajax({
			type : "post",
			url : "rest/gettablelist",
			dataType : 'json',
			success : function(result) {
				for ( var i in result) {
					//테이블 가로 X 세로 길이 구하기
					var xylength = (result[i].sc_x) * (result[i].sc_y);
					//테이블 카테고리 추가하기
					$("div.tab").append(result[i].sc_name);
					//seat div 에 카테고리 갯수만큼 div 생성
					$("#seat").append("<div id='table"+i+"' class='tList'>");
					for (var a = 1; a <= xylength; a++) {
					//생성한 div에 테이블 가로X 세로 길이(테이블 갯수)만큼 div 생성하기
						$("#table" + i).append(
								"<div class='tables' id='tnum"+i+a+"' data-code="+a+">"
										+ a + "</div>");
						for ( var b in result[i].tlist) {
							if (a == result[i].tlist[b]) {
								//생성한 div가 활성화 된 테이블 번호와 같으면 css스타일 설정하기
								$("#tnum" + i + a).css("background-color",
										"white");
								$("#tnum" + i + a).css("opacity", "100");
							}
						}
					}

				}

				console.log(result);

			},
			error : function(err) {
				console.log(err);
			}
		});
	};
	
	/* 테이블 카테고리 클릭시 오픈 */
	function opentable(evt, categoryname) {
		console.log(1);
		var table = $("div[id*='table']");
		console.log(table.length);
		for (var i = 0; i < table.length; i++) {
			table[i].className = table[i].className
					.replace("blockCtg", "tList");
		}

		console.log($("#" + categoryname).attr('class'));
		if ($("#" + categoryname).attr('class') == 'tList') {
			$("#" + categoryname).attr('class', 'blockCtg');
		}
	};

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
		}, 1000);

		setInterval(function() {
			var minutes = new Date().getMinutes();
			$("#min").html((minutes < 10 ? "0" : "") + minutes);
		}, 1000);

		setInterval(function() {
			var hours = new Date().getHours();
			$("#hours").html((hours < 10 ? "0" : "") + hours);
		}, 1000);
	};

	/* 클릭하면 모달박스 노출 / 예약 정보 조회 */
	function reservation() {
		$('#reservation').addClass('open');
		$.ajax({
			type : "get",
			url : "rest/getreservlist",
			dataType : 'json',
			success : function(result) {
				console.log(result);
				$("#reservtable").html(result.reservList);

				/* 리스트 출력 성공 -> 특정 행 클릭 시 상세정보(수정)에 정보 출력 */
				$("#reservtable tr").click(function() {
					var tdArr = new Array();
					var tr = $(this);
					var td = tr.children();
					console.log($(this).data("code"));
					console.log(tr.text());
					//tr의 css색을 화이트로 clear
					$("#reservtable tr").css('background-color', 'white');
					//선택한 tr의 색을 회색으로 설정
					tr.css('background-color', '#ddd');

					/* tr 행의 정보들을 Arr에 담음 */
					td.each(function(i) {
						tdArr.push(td.eq(i).text());
					});

					console.log("배열에 담긴 값 : " + tdArr);
					/* 배열에 담긴 값을 상세정보에 출력 */
					var r_phone = td.eq(1).text();
					var r_name = td.eq(2).text();
					var r_date = td.eq(3).text().slice(0, 10);
					var r_time = td.eq(3).text().slice(11, 16);
					var r_memo = td.eq(4).text();
					console.log(r_phone);
					console.log(r_date);
					console.log(r_time);
					$("#r_phone").val(r_phone);
					$("#r_name").val(r_name);
					//datepicker UI 를 이용해 r_date의 정보를 setDate 시킴
					$("#r_date").datepicker("setDate", r_date);
					$("#r_time").val(r_time);
					$("#r_memo").val(r_memo);
				});
			},
			error : function(err) {
				console.log(err);
			}
		});
	}

	/* 특정일 조회시 검색되는 예약정보 출력  */
	function searchReserv() {
		console.log($("r_date").val());
		$.ajax({
			type : "post",
			url : "rest/searchreserv",
			data : {
				rsv_date : $("#rsv_date").val()
			},
			dataType : 'json',
			success : function(result) {
				console.log(result);
				$("#reservtable").html(result.reservList);
				
				
				/* 리스트 출력 성공 -> 특정 행 클릭 시 상세정보(수정)에 정보 출력 */
				$("#reservtable tr").click(function() {
					var tdArr = new Array();
					var tr = $(this);
					var td = tr.children();
					console.log(tr.text());
					$("#reservtable tr").css('background-color', 'white');
					tr.css('background-color', '#ddd');

					/* tr 행의 정보들을 Arr에 담음 */
					td.each(function(i) {
						tdArr.push(td.eq(i).text());
					});

					console.log("배열에 담긴 값 : " + tdArr);
					/* 배열에 담긴 값을 상세정보에 출력 */
					var r_phone = td.eq(1).text();
					var r_name = td.eq(2).text();
					var r_date = td.eq(3).text().slice(0, 10);
					var r_time = td.eq(3).text().slice(11, 16);
					var r_memo = td.eq(4).text();
					console.log(r_phone);
					console.log(r_date);
					console.log(r_time);
					$("#r_phone").val(r_phone);
					$("#r_name").val(r_name);
					$("#r_date").datepicker("setDate", r_date);
					$("#r_time").val(r_time);
					$("#r_memo").val(r_memo);
				});

			},
			error : function(err) {
				console.log(err);
			}
		});
	}

	/* 모달 박스 뒤 백그라운드 클릭 시 모달박스 해제 */
	var $layerW = $('#reservation');
	$layerW.find('#bg_layer').on('mousedown', function(evt) {
		$layerW.removeClass('open');
	});
	//esc키 입력 시 모달박스 해제
	$(document).keydown(function(evt) {
		if (evt.keyCode != 27) {
			return;
		} else if ($layerW.hasClass('open')) {
			$layerW.removeClass('open');
		}
	});

	/* 키패드 입력 */
	var str = "";
	$("#keypad ul li").click(function() {
		if ($(this).val() == 11 || $(this).val() == 12) {
			return;
		}
		console.log($(this).val());
		str += $(this).val();
		//console.log(str);
		$("#r_phone").val(str);
	});

	function reset() {
		$("#r_phone").val("");
		str = "";
	}

	function backspace() {
		console.log("length" + str.substr(0, str.length - 1));
		$("#r_phone").val(str.substr(0, str.length - 1));
		str = $("#r_phone").val();
	}

	/* 키패드 입력 end */

	/* 예약 수정 완료하기 */
	function updatereservinfo() {
		/* $.ajax({
			type : 'post',
			url : "updateservinfo",
			data : "",
			dataType : 'json',
			success : function(data){
				console.log(data);
			},
			error : function(err){
				
			}
		}); */
	}

	/* 환전클릭 */
	function changemoney() {
		console.log("moneychange.");
	};

	/* 단체클릭 */
	function jointable() {
		var $table = $(".tables");
		var tnum = [];
		console.log($table.length);
		for (var i = 0; i < $table.length; i++) {
			console.log($(".tables").data("code"));
			tnum.push($(".tables").data("code"));
		}
		console.log(tnum);
		location.href = "./sao?tnum=" + tnum;
	};

	/* 이동클릭 */
	function changetable() {
		/* $.ajax({
			type : 'post',
			url : "updatetablenum",
			data : { "btNum" : tableNum , "atNum" : tableNum }
			dataType : 'json',
			success : function(result){
				console.log(result);
			},
			error : function(error){
				console.log(error);
			}
		}); */
	};
</script>
</html>