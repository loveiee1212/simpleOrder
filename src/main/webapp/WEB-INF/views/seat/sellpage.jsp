<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sellpage-판매</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

.tab button {
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

.tab button.active {
	background-color: #ccc;
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
	font-size: 25px;
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
.noneCtg {
  display: none;
}
.blockCtg{
 display : block;
}
</style>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<div class="leftdiv">
				<div class="tab">
				</div>
				<div id="table">
				</div>
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

		<div id="reservation">
			<div id="bg_layer"></div>
			<div id="contents_layer">
				<div id="r_header">
					<h1>예약목록</h1>
					예약일 선택 <input type="date" name="r_date" />
					<button>검색</button>
					<br />
				</div>
				<div id="r_middle">
					<table id="reservtable">
						<tr>
							<th style="width: 80px;">No.</th>
							<th>연락처</th>
							<th>성함</th>
							<th>예약일시</th>
							<th>비고</th>
							<th style="width: 120px;">구분</th>
						</tr>
					</table>
				</div>
				<div id="r_footer">
					<div id="r_info">
						<table id="r_infotable">
							<tr>
								<th>예약일자</th>
								<td><input type="text" name="r_date" /></td>
								<th>예약시간</th>
								<td><input type="text" name="r_time" /></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><input type="text" name="r_phone" id="r_phone" /></td>
								<th>예약현황</th>
								<td><input type="text" name="r_state" /></td>
							</tr>
							<tr>
								<th>비고</th>
								<td colspan="2"><textarea
										style="width: 330px; height: 70px;"></textarea></td>
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

	/* ajax를 이용해 설정한 테이블 갯수 가져오기 */
	function getTablelist(){
		
	$.ajax({
		type : "post",
		url : "rest/gettablelist",
		dataType : 'json',
		success : function(result) {
			for(var i in result){
				console.log(result[i]);
				console.log(result[i].tnumList);
				$("div.tab").append(result[i].category);
				$("#table").append("<div id='table"+i+"' class='noneCtg'>")
				for(var key in result[i]){
					console.log(result[i][key].x);
					console.log(result[i][key].y);
					var xy = (result[i][key].x)*(result[i][key].y);
					for(var a=1; a<=xy;a++){
						$("#table"+i).append("<div class='tables' id='tnum"+a+"' data-code="+a+">"+a+"</div>");
						//console.log($(".tables").data("code"));
							console.log($("#tnum"+a).data("code"));
						for(var b in result[i].tnumList){
							if(a==result[i].tnumList[b]){
								$("#tnum"+a).css( "background-color", "white");
								$("#tnum"+a).css( "opacity", "100");
							} 
						}
					}
				}
				//console.log(result[i].category);
				//console.log(result[i].tsize.x);
				//console.log(result[i].tsize.y);
			}

		},
		error : function(err) {
			console.log(err);
		}
	});
	}

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
	}

	/* 카테고리를 클릭 시 테이블 리스트 노출 */
	function opentable(evt, category) {
		var tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}
		/* var nCtg = document.getElementsByClassName("noneCtg");
		for(i =0; i < nCtg.length;i++){
			nCtg[i].className = nCtg[i].className.replace("noneCtg","blockCtg");
		} */
		 document.getElementById(category).style.display = "block";
		evt.currentTarget.className += " active";
		/* var data = [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11' ];
		var str = "";
		for ( var key in data) {
			str += "<div class='tables' data-code='0001'>" + data[key] + "</div>";
		}
		str += "<div class='pagebutton'><i class='material-icons' style='font-size:100px;'>keyboard_arrow_left</i></div>";
		str += "<div class='pagebutton'><i class='material-icons' style='font-size:100px;'>keyboard_arrow_right</i></div>";
		$("#table").html(str); */
	};

	$(".tables").click(function() {
		console.log(1);
	})

	/* 클릭하면 모달박스 노출 / 예약 정보 조회 */
	function reservation() {
		$('#reservation').addClass('open');
		/* $.ajax({
			type : "get",
			url : "getreservlist",
			data : {tablenum : tablenum},
			dataType : 'json',
			success : function(result){
				console.log(result);
				$("reservtable").append(result);
			},
			error : function(err){
				console.log(err);
			}
		}); -- > ajax활용하여 예약테이블 정보 가져오기 */
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