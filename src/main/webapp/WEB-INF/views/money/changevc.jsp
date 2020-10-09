<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/basicBox.css" type="text/css">
<link rel="stylesheet" href="resources/css/clock.css?afte"
	type="text/css">
<link rel="icon" href="resources/image/smallLogo.png" type="image/x-icon">
<title>SimpleOrder-시재변경</title>
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

#cashZone {
	border: 3px solid #2565a3;
	height: 795px;
	width: 800px;
	float: left;
	background-color: white;
}

table, tr, td, th {
	border: 3px solid #2565a3;
}

#cashZone table {
	width: 700px;
	height: 700px;
	position: absolute;
	margin-left: 50px;
	margin-top: 46px;
	border-collapse: collapse;
}

#cashZone th {
	width: 200px;
	font-size: 30px;
}

#cashZone td.leftTd {
	width: 99px;
}

td.leftTd input {
	width: 200px;
	height: 57px;
	border: 0px;
	font-size: 30px;
	text-align: center;
}

td.leftTd input:focus {
	outline: none;
}

td {
	font-size: 30px;
	text-align: center;
	font-weight: bold;
}

#vcZone table {
	border: 3px solid #2565a3;
	font-size: 25px;
	width: 650px;
	height: 800px;
	float: right;
	border-collapse: collapse;
	background-color: white;
	text-align: center;
}

#vcZone th {
	width: 200px;
}

#startVC {
	text-align: center;
}

#clock {
	margin-top: 5px;
	margin-left: 120px;
	width: 400px;
	height: 150px;
}

#date {
	font-size: 40px;
	margin-top: 20px;
}

#clock ul {
	width: 400px;
	margin-left: -40px;
}

#clock ul li {
	font-size: 40px;
}

#vcChangeText {
	width: 340px;
	height: 50px;
	text-align: center;
	font-size: 20px;
	border: 3px solid #2565a3;
}

input:focus, button:focus {
	outline: none;
}

#insertVC {
	text-align: center;
	border: 3px solid white;
	width: 180px;
	height: 70px;
	background-color: #2565a3;
	font-weight: bold;
	color: white;
	font-size: 25px;
}

#changeLog {
	text-align: center;
	border: 3px solid white;
	width: 180px;
	height: 70px;
	margin-left: 20px;
	background-color: #2565a3;
	font-weight: bold;
	color: white;
	font-size: 25px;
}

#Exit {
	text-align: center;
	border: 3px solid #2565a3;
	width: 150px;
	height: 70px;
	margin-left: 20px;
	background-color: white;
	font-weight: bold;
	color: #2565a3;
	font-size: 25px;
}
</style>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<div id="cashZone">
				<table id="cashTable">
					<tr>
						<th>100000원</th>
						<td class="leftTd"><input id="10" class="num" type="number"
							placeholder="갯수입력" min="0" maxlength="4" oninput="checkMaxLenth(id)"
							onchange="carculate(100000,value,'100000tx'),vctext()"></td>
						<td><div><span id="100000tx" class="cash"></span></div></td>
					</tr>
					<tr>
						<th>50000원</th>
						<td class="leftTd"><input id="09" class="num" type="number"
							min="0" placeholder="갯수입력" maxlength="4" oninput="checkMaxLenth(id)"
							onchange="carculate(50000,value,'50000tx'), vctext()"></td>
						<td><div><span id="50000tx" class="cash"></span></div></td>
					</tr>
					<tr>
						<th>10000원</th>
						<td class="leftTd"><input id="08" class="num" type="number"
							min="0" placeholder="갯수입력" maxlength="4" oninput="checkMaxLenth(id)"
							onchange="carculate(10000,value,'10000tx'), vctext()"></td>
						<td><div><span id="10000tx" class="cash"></span></div></td>
					</tr>
					<tr>
						<th>5000원</th>
						<td class="leftTd"><input id="07" class="num" type="number"
							min="0" placeholder="갯수입력" maxlength="4" oninput="checkMaxLenth(id)"
							onchange="carculate(5000,value,'5000tx'), vctext()"></td>
						<td><div><span id="5000tx" class="cash"></span></div></td>
					</tr>
					<tr>
						<th>1000원</th>
						<td class="leftTd"><input id="06" class="num" type="number"
							min="0" placeholder="갯수입력" maxlength="4" oninput="checkMaxLenth(id)"
							onchange="carculate(1000,value,'1000tx'), vctext()"></td>
						<td><div><span id="1000tx" class="cash"></span></div></td>
					</tr>
					<tr>
						<th>500원</th>
						<td class="leftTd"><input id="05" class="num" type="number"
							min="0" placeholder="갯수입력" maxlength="4" oninput="checkMaxLenth(id)"
							onchange="carculate(500,value,'500tx'), vctext()"></td>
						<td><div><span id="500tx" class="cash"></span></div></td>
					</tr>
					<tr>
						<th>100원</th>
						<td class="leftTd"><input id="04" class="num" type="number"
							min="0" placeholder="갯수입력" maxlength="4" oninput="checkMaxLenth(id)"
							onchange="carculate(100,value,'100tx'), vctext()"></td>
						<td><div><span id="100tx" class="cash"></span></div></td>
					</tr>
					<tr>
						<th>50원</th>
						<td class="leftTd"><input id="03" class="num" type="number"
							min="0" placeholder="갯수입력" maxlength="4" oninput="checkMaxLenth(id)"
							onchange="carculate(50,value,'50tx'), vctext()"></td>
						<td><div><span id="50tx" class="cash"></span></div></td>
					</tr>
					<tr>
						<th>10원</th>
						<td class="leftTd"><input id="02" class="num" type="number"
							min="0" placeholder="갯수입력" maxlength="4" oninput="checkMaxLenth(id)"
							onchange="carculate(10,value,'10tx'), vctext()"></td>
						<td><div><span id="10tx" class="cash"></span></div></td>
					</tr>
					<tr>
						<th>5원</th>
						<td class="leftTd"><input id="01" class="num" type="number"
							min="0" placeholder="갯수입력" maxlength="4" oninput="checkMaxLenth(id)"
							onchange="carculate(5,value,'5tx'), vctext()"></td>
						<td><div><span id="5tx" class="cash"></span></div></td>
					</tr>
					<tr>
						<th>1원</th>
						<td class="leftTd"><input id="00" class="num" type="number"
							value="0" min="0" placeholder="갯수입력"  maxlength="4" oninput="checkMaxLenth(id)"
							onchange="carculate(1,value,'1tx'), vctext()"></td>
						<td><div><span id="1tx" class="cash"></span></div></td>
					</tr>
				</table>
			</div>
			<div id="vcZone">
				<table id="vcTable">
					<tr>
						<td colspan="2">
							<div id="clock">
								<div id="date"></div>
								<ul>
									<li id="hours"></li>
									<li class="point">:</li>
									<li id="min"></li>
									<li class="point">:</li>
									<li id="sec"></li>
								</ul>
							</div>
						</td>
					</tr>
					<tr>
						<th>이전시재</th>
						<td><div><span id="startVC"></span></div></td>
					</tr>
					<tr>
						<th>변경시재</th>
						<td><div><span id="changeVC"></span></div></td>
					</tr>
					<tr>
						<th>시재차</th>
						<td><div><span id="difference"></span></div></td>
					</tr>
					<tr>
						<th colspan="2">시재 변경 사유</th>
					</tr>
					<tr>
						<td colspan="2"><input type="text" id="vcChangeText" maxlength="100"></td>
					</tr>
					<tr>
						<td colspan="2"><button id="insertVC" onclick="insertVC()">시재저장</button>
						<button id="changeLog" onclick="changeLog()">시재변경내역</button>
						<button id="Exit" onclick="location.href='posmain'">나가기</button></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function(){
		getStartVC();
	})
	
	//글 길이 확인
	function checkMaxLenth(id){
		if($("#"+id).val().length > $("#"+id).attr("maxlength")){
			$("#"+id).val($("#"+id).val().slice(0, $("#"+id).attr("maxlength")));
		}
	}
	
	//시제 계산
	function carculate(money, num, position) {
		var result = money * num;
		$("#" + position).text(result);
	}

	function vctext() {
		var sum = 0;
		for (var i = 0; i < $(".cash").length; i++) {
			sum += ($(".cash").eq(i).text()) * 1;
		}
			$("#changeVC").text(sum);
			//시제차 텍스트 찍기
			$("#difference").text($("#changeVC").text()-$("#startVC").text());
	}
	
	//시작시재 불러오기
	function getStartVC() {
		$.ajax({
			type : "get",
			url : "rest/getstartvc",
			dataType : "json",
			success : function(data) {
				$("#startVC").text(data);
			}
		});
	}
	
	//환전시재 입력하기
	function insertVC() {
		if(confirm("시재를 변경하시겠습니까?")){
		
			var arr = new Array();
		
			var obj = new Object();
			obj.vcc_memo = $("#vcChangeText").val();
			arr.push(obj);
		
			for (var i = 0; i < $(".num").length; i++) {
				var obj = new Object();
				obj.cu_code = $(".num").eq(i).attr("id");
				obj.vcd_cnt = $(".num").eq(i).val();
				if (obj.vcd_cnt != "") {
					arr.push(obj);
				}
			}
			var jArr = JSON.stringify(arr);

			$.ajax({
				type : "post",
				url : "rest/insertchangevc",
				data : jArr,
				contentType : "application/json; charset=UTF-8",
				dataType : "json",
				success : function(data) {
					if (data == "success") {
						alert("시제가 변경되었습니다.");
						location.href = "changevc";
					} else if (data == "error") {
						alert("시제변경에 실패했습니다.");
					} else if (data == "end"){
						if(confirm("영업이 종료되었습니다.\r\n영업을 시작하시겠습니까?\r\n'확인'을 누르시면 시작시재로 이동합니다.")){
							location.href = "StartVC";
						}
					}
				}
			});
		}
	}
</script>

<script type="text/javascript">
	//시재변경 내역보기
	function changeLog() {
		$.ajax({
			type : "get",
			url : "changelog",
			dataType : "html",
			success : function(data) {
				$("#baseinnerBox").html(data);
			}
		});
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		clockOn();
	})
	//시계

	function clockOn() {
		var monthNames = [ "01", "02", "03", "04", "05", "06", "07", "08",
				"09", "10", "11", "12" ];
		var dayNames = [ "일", "월", "화", "수", "목", "금", "토" ]
		var newDate = new Date();
		newDate.setDate(newDate.getDate());
		$('#date').html(
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
</script>
</html>