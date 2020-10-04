<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sellpage-판매</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
<link rel="stylesheet" type="text/css"
	href="resources/css/basicBox.css?after">
<style>
body {
	background-color: #e3f2fd;
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

div {
	display: block;
	float: left;
}

div #seat {
	clear: both;
	margin-top: 30px;
}

#outerdiv {
	width: 1850px;
	height: 950px;
	margin: 20px;
}

.leftdiv {
	border: 3px solid #81d4fa;
	width: 1200px;
	height: 800px;
	float: left;
}

.tab {
	overflow: hidden;
	background-color: #f1f1f1;
}

.category {
	font-size: 20px;
	background-color: white;
	color: #1565c0;
	font-weight: bold;
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
	background-color: #90caf9;
}

.tables {
	border: 3px solid #81d4fa;
	width: 120px;
	height: 100px;
	float: left;
	margin: 15px;
	opacity: 0.5;
	background-color: silver;
	font-size: 25px;
	float: left;
}

#rightdiv {
	width: 250px;
	height: 800px;
	background-color: white;
	border: 3px solid #81d4fa;
	margin-left: 10px;
}

.clickdiv {
	text-align: center;
	width: 220px;
	height: 100px;
	margin-left: 15px;
	margin-top: 10px;
	border: 1px solid white;
	background-color: #81d4fa;
	color: white;
	font-weight: bold;
}

.clickdiv p {
	padding-top: 10px;
}

p {
	font-size: 25px;
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
	width: 1600px;
	height: 1000px;
	background: #000;
	opacity: 0.5;
	filter: alpha(opatable = 50);
	z-index: 100;
	height: 1000px;
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
	border: 3px solid #81d4fa;
	width: 1200px;
	height: 250px;
	overflow: auto;
	border-collapse: collapse;
}

#r_middle::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: white;
}

#r_middle::-webkit-scrollbar {
	width: 10px;
	background-color: #81d4fa;
}

#r_middle::-webkit-scrollbar-thumb {
	background-color: #81d4fa;
	background-image: -webkit-gradient(linear, 0 0, 0 100%, color-stop(.5, rgba(255, 255, 255,
		.2)), color-stop(.5, transparent), to(transparent));
}

#r_middle th, #r_middle tr {
	width: 300px;
	height: 50px;
	text-align: center;
	border: 3px solid #81d4fa;
	scrollbar-width: none;
	border-left-color: white;
	border-right-color: white;
	font-size: 18px;
}

#r_middle th {
	border-top-color: white;
}

#r_footer {
	width: 1200px;
	height: 300px;
	font-size: 20px;
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
	border: 1px solid white;
	background-color: #81d4fa;
	color: white;
	width: 30px;
	height: 20px;
	text-align: center;
	padding: 20px;
	float: left;
	font-size: 20px;
	font-weight: bold;
}

#r_infotable tr, #r_infotable th {
	width: 150px;
	height: 85px;
	text-align: center;
}

#r_infotable td {
	height: 75px;
}

#r_infotable {
	margin-left: 10px;
	margin-top: 15px;
}

#r_infotable input {
	width: 150px;
	height: 30px;
	border: 3px solid #81d4fa;
	text-align: center;
}

textarea {
	border: 3px solid #81d4fa;
}

#r_infotable button {
	width: 100px;
	height: 50px;
}

#r_date {
	border: 3px solid #81d4fa;
	text-align: center;
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
	margin-top: 20px;
	margin-bottom: 10px;
}

#hours {
	margin-left: 25px;
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

#worktd input {
	width: 90px;
	height: 50px;
	font-size: 18px;
	font-weight: bold;
}

#btn1, #upbtn, #dtbtn {
	width: 100px;
	border: 3px solid #81d4fa;
	background-color: #81d4fa;
	color: white;
}

#upbtn {
	margin-left: 20px;
}

#rebtn, #dtbtn {
	margin-left: 15px;
}

#btn2, #rebtn {
	width: 100px;
	border: 3px solid #81d4fa;
	background-color: white;
	color: #81d4fa;
}

input:focus {
	outline: none;
}

#rsvm_memo:focus {
	outline: none;
}

input, #rsvm_memo {
	font-size: 20px;
}

i {
	margin-top: -5px;
}

#frm {
	font-size: 20px;
}

#movediv {
	border: 2px solid skyblue;
	background-color: white;
	margin-left: 320px;
	width: 600px;
	height: 150px;
	position: absolute;
	width: 600px;
	display: none;
}

#movediv p {
	margin-left: 0px;
	margin-top: 30px;
}

#cancelbutton {
	width: 70px;
	height: 50px;
	border: 3px solid #81d4fa;
	background-color: white;
	color: #81d4fa;
	margin-left: 500px;
}

.sumorchange {
	width: 150px;
	height: 90px;
	border: 3px solid #81d4fa;
	background-color: white;
	color: #81d4fa;
	margin-top : 60px;
	margin-left: 100px;
	display: none;
	float : left;
}

</style>
</head>
<body>

	<div id="baseBox">
		<div id="movediv">
			<center>
			<p id="movep">이동시킬 테이블을 클릭해주세요</p>
			</center>
			<button id='cancelbutton'>취소</button>
			<br/>
			<input type="button" class="sumorchange" value="합석" data-code="1"/>
			<input type="button" class="sumorchange" value="자리교체" data-code="2"/>
		</div>
		<div id="baseinnerBox">
			<div class="leftdiv">
				<div class="tab"></div>
				<div id="seat"></div>
			</div>
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
				<div class="clickdiv" onclick='changetable()'>
					<p>이동</p>
				</div>
				<div class="clickdiv" onclick="location.href='./billcontrol'">
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
					<form action="#" id="frm">
						예약일 선택 <input type="date" name="r_date" id="r_date" /> <input
							type="button" id="btn1" onclick="searchReserv()" value="검색" /> <input
							type="button" id="btn2" onclick="reservation()" value="새로고침" />
						<br />
					</form>
				</div>
				<div id="r_middle">
					<table id="reservtable"></table>
				</div>
				<div id="r_footer">
					<div id="r_info">
						<form>
							<table id="r_infotable">
								<tr>
									<th>예약일자</th>
									<input type="hidden" name="rsv_code" id="rsv_code" />
									<td><input type="text" name="rsv_date" id="rsv_date" /></td>
									<th>예약시간</th>
									<td><input type="text" name="rsv_time" id="rsv_time" /></td>
								</tr>
								<tr>
									<th>성함</th>
									<td><input type="text" name="rsv_name" id="rsv_name"
										maxlength="5" /></td>
									<th>연락처</th>
									<td><input type="text" name="rsv_phone" id="rsv_phone"
										maxlength="11" /></td>
								</tr>
								<tr>
									<th>메모</th>
									<td colspan="2"><textarea
											style="width: 330px; height: 70px;" name="rsvm_memo"
											id="rsvm_memo"></textarea></td>
									<td id="worktd"><input type="button" id="upbtn"
										onclick="updateReserv()" value='등록' /> <input type="reset"
										id="rebtn" value="새로고침" /></td>
								</tr>
							</table>
						</form>
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
							<li onclick="backspace()" value="12"><i
								class="fa fa-arrow-left" style="font-size: 25px"></i></li>
							<li value="0">0</li>
							<li onclick="reset()" value="11"><i class="fa fa-times"
								style="font-size: 25px"></i></li>
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
	console.log()
	if ('' != '${error}') {
		alert("주문이 정상적으로 처리 되지않았습니다. 다시 시도해 주세요");
	}

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
	$(document).ready(function() {
		$('#rsv_time').timepicker({
			timeFormat : 'HH:mm',
			controlType : 'select',
			oneLine : true,
		});
		$("#rsv_date").datepicker({});

	});

	/* ajax를 이용해 설정한 테이블 갯수 가져오기 */
	function getTablelist() {

		$.ajax({
			type : "post",
			url : "rest/gettablelist",
			dataType : 'json',
			success : function(result) {
				$("div.tab").append(result.ctginfo);
				$("#seat").append(result.tableinfo);
				for ( var a in result.list) {
					for ( var b in result.list[a].tlist) {
						//생성한 div가 활성화 된 테이블 번호와 같으면 css스타일 설정하기
						if (result.list[a].tlist[b] < 10) {
							$("#tnum" + "0" + (parseInt(a) + 1)+ result.list[a].tlist[b]).css({"background-color" : "white",'visibility' : 'visible'});
							$("#tnum" + "0" + (parseInt(a) + 1)+ result.list[a].tlist[b]).css("opacity", "100");}
						$("#tnum" + result.list[a].tlist[b]).css({"background-color" : "white",'visibility' : 'visible'});
						$("#tnum" + result.list[a].tlist[b]).css("opacity","100");
					}
				}
				$("#table0").attr("class", "blockCtg");
				getorderList();
				$(".tables").click(function() {
				var tSplit = $(this).data("code").split("-");
				var sc_code = tSplit[0];
				var st_num = tSplit[1];
				var oac_num = $(this).children("#oac_num").val();
				location.href = "./sellandorder?sc_code=" + sc_code+ "&st_num=" + st_num + "&oac_num="+ oac_num;
				});

			}
		});
	};

	function getorderList() {
		$.ajax({
		type : 'get',
		url : 'rest/getorderlist',
		data : {"oac_status" : 1},
		dataType : 'json',
		success : function(data) {
			console.log(data);
			for(var i in data){
				$("#tnum"+(data[i].sc_code)+(data[i].st_num)).append("<input type='hidden' id='oac_num' value='"+data[i].oac_num+"'/>");
				$("#tnum"+(data[i].sc_code)+(data[i].st_num)).append("<br/>"+data[i].pd_name+" "+data[i].oh_cnt);
			}
		}
	});
	}
	/* 테이블 카테고리 클릭시 오픈 */
	function opentable(evt, categoryname) {
		var table = $("div[id*='table']");
		for (var i = 0; i < table.length; i++) {
			table[i].className = table[i].className.replace("blockCtg", "tList");
		}
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
		$('#Date').html(newDate.getFullYear() + " " + monthNames[newDate.getMonth()]+ " " + newDate.getDate() + " "+ dayNames[newDate.getDay()]);
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
		$("#reservtable").html(result.reservList);
		/* 리스트 출력 성공 -> 특정 행 클릭 시 상세정보(수정)에 정보 출력 */
		$("#reservtable tr").click(function() {
		var tdArr = new Array();
		var tr = $(this);
		var td = tr.children();
		$("#upbtn").val("수정");
		$("#dtbtn").remove();
		$("#worktd").append("<input type='button' id='dtbtn'  onclick='deleteReserv()' value='삭제'>");
		//tr의 css색을 화이트로 clear
		$("#reservtable tr").css('background-color','white');
		//선택한 tr의 색을 회색으로 설정
		tr.css('background-color', '#ddd');
		/* tr 행의 정보들을 Arr에 담음 */
		td.each(function(i) {tdArr.push(td.eq(i).text());});
		console.log("배열에 담긴 값 : " + tdArr);
		/* 배열에 담긴 값을 상세정보에 출력 */
		var rsv_code = $(this).data("code");
		var rsv_phone = td.eq(1).text();
		var rsv_name = td.eq(2).text();
		var rsv_date = td.eq(3).text().slice(0, 10);
		var rsv_time = td.eq(3).text().slice(11, 16);
		var rsvm_memo = td.eq(4).text();
		$("#rsv_code").val(rsv_code);
		$("#rsv_phone").val(rsv_phone);
		$("#rsv_name").val(rsv_name);
		//datepicker UI 를 이용해 r_date의 정보를 setDate 시킴
		$("#rsv_date").datepicker("setDate", rsv_date);
		$("#rsv_time").val(rsv_time);
		$("#rsvm_memo").val(rsvm_memo);
		});
		}
		});
	}

	/* 특정일 조회시 검색되는 예약정보 출력  */
	function searchReserv() {
		console.log($("#rsv_date").val());
		$.ajax({
			type : "post",
			url : "rest/searchreserv",
			data : {rsv_date : $("#r_date").val()},
			dataType : 'json',
			success : function(result) {
			$("#reservtable").html(result.reservList);
			/* 리스트 출력 성공 -> 특정 행 클릭 시 상세정보(수정)에 정보 출력 */
			$("#reservtable tr").click(function() {
			var tdArr = new Array();
			var tr = $(this);
			var td = tr.children();
			/* tr 행의 정보들을 Arr에 담음 */
			td.each(function(i) {tdArr.push(td.eq(i).text());});
			$("#upbtn").val("수정");
			$("#dtbtn").remove();
			$("#worktd").append("<input type='button' id='dtbtn'  onclick='deleteReserv()' value='삭제'>");
			$("#reservtable tr").css('background-color','white');
			tr.css('background-color', '#ddd');
			/* 배열에 담긴 값을 상세정보에 출력 */
			var rsv_code = $(this).data("code");
			var rsv_phone = td.eq(1).text();
			var rsv_name = td.eq(2).text();
			var rsv_date = td.eq(3).text().slice(0, 10);
			var rsv_time = td.eq(3).text().slice(11, 16);
			var rsvm_memo = td.eq(4).text();
			$("#rsv_code").val(rsv_code);
			$("#rsv_phone").val(rsv_phone);
			$("#rsv_name").val(rsv_name);
			$("#rsv_date").datepicker("setDate", rsv_date);
			$("#rsv_time").val(rsv_time);
			$("#rsvm_memo").val(rsvm_memo);
				});
			}
		});
	}

	/* 새로고침 클릭 시 예약 화면 초기화 */
	$("#rebtn").click(function() {
		$("#upbtn").val("등록");
		$("#dtbtn").remove();
		$("#rsv_code").val(null);
		$("#reservtable tr").css('background-color', 'white');
	});

	/* 예약 수정 완료하기 */
	function updateReserv() {
		var rsv_code = $("#rsv_code").val();
		var rsv_phone = $("#rsv_phone").val();
		var rsv_name = $("#rsv_name").val();
		var rsv_date = $("#rsv_date").val() + " " + $("#rsv_time").val();
		var rsvm_memo = $("#rsvm_memo").val();
		var objparam = {
				"rsv_code" : rsv_code,
				"rsv_phone" : rsv_phone,
				"rsv_phone" : rsv_phone,
				"rsv_name" : rsv_name,
				"rsv_date" : rsv_date,
				"rsvm_memo" : rsvm_memo
		};
		$.ajax({
			type : 'post',
			url : "rest/updatereserv",
			data : objparam,
			dataType : 'json',
			success : function(data) {
				alert(data.result);
				reservation();
			},
			error : function(err) {
			}
		});
	}

	function deleteReserv() {
		$.ajax({
			type : 'post',
			url : "rest/deletereserv",
			data : {"rsv_code" : $("#rsv_code").val()},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				alert(data.result);
				reservation();
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
		$("#rsv_phone").val(str);
	});

	function reset() {
		$("#rsv_phone").val("");
		str = "";
	}

	function backspace() {
		console.log("length" + str.substr(0, str.length - 1));
		$("#rsv_phone").val(str.substr(0, str.length - 1));
		str = $("#rsv_phone").val();
	}

	/* 키패드 입력 end */

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
		location.href = "./sao?tnum=" + tnum;
	};

	/* 이동클릭 */
	function changetable() {
		$(".tables").off();
		$("#movediv").css('display', 'block');
		$(".tables").on("click",function() {
			var firstcode = $(this).data("code");
			var firstoac_num = $(this).children("#oac_num").val();
			console.log("첫번째로 선택된 값:" + firstcode + firstoac_num);
			console.log($(this).children("#oac_num").val() == null);
			if ($(this).children("#oac_num").val() == null) {
				$("#movep").html("주문중인 테이블만 이동이 가능합니다.");
				return false;
			} else {
				$(this).css("border", "3px solid #0756FF");
				movetable(firstcode, firstoac_num);
			}
		});
	};
	$("#cancelbutton").click(function() {
		location.reload();
		$(".tables").off();
		$(".tables").on();
		changetable()
		$("#movediv").css('display', 'none');
		$(".tables").css("border", "3px solid #81d4fa");
		$("#movep").text("이동시킬 테이블을 클릭해주세요");
		$("#movebutton").css("display", 'block');
		$("#gomove").css("display", 'none');

	});
	function movetable(firstcode, firstoac_num) {
		console.log("넘어온 값:" + firstcode + firstoac_num)
		$("#movep").text("이동할 위치의 테이블을 클릭해주세요");
		$("#movebutton").css("display", 'none');
		$("#gomove").css("display", 'block');
		$(".tables").one("click",function() {
			if ($(this).children("#oac_num").val() != null) {
				var secondcode = $(this).data("code");
				var secondoac_num = $(this).children("#oac_num").val();
				$(this).css("border", "3px solid #F9484B");
				$("#movep").text("합석 또는 서로이동을 선택해주세요");
				$(".sumorchange").css("display", 'block');
				$(".sumorchange").click(function(){
					var changetype = $(this).data("code");
				$("#movep").text("잠시만 기다려 주십시오.");
				$(".sumorchange").css("display","none");
				changeseatajax(firstcode,firstoac_num,secondcode,secondoac_num,changetype);
				});
			} else {
			var secondcode = $(this).data("code");
			changeseatajax(firstcode,firstoac_num,secondcode,null,"0");
			$("#movep").text("잠시만 기다려 주십시오.");
			$(this).css("border", "3px solid #F9484B");
			}
		});
	}
		function changeseatajax(firstcode,firstoac_num,secondcode,secondoac_num,changetype){
			console.log(firstcode);
			console.log(secondcode);
			console.log(firstoac_num);
			console.log(secondoac_num);
			console.log(changetype);
			var objparam = {
					"fcode" : firstcode,
					"foac_num" :firstoac_num ,
					"scode" : secondcode ,			
					"soac_num" : secondoac_num,	
					"type" : changetype
			}
			console.log("objparam:"+objparam);
			$.ajax({
				type : 'post',
				url : "rest/changeseat",
				data : objparam,
				dataType : 'json',
				success : function(result){
					console.log(result);
					$("#movep").html(result.result);
					$("#cancelbutton").css("display","none");
					setTimeout(function(){location.reload();},1500);
				}
			}) 
		}
</script>
</html>