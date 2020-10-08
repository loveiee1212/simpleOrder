<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changeworktime</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<link rel="stylesheet" href="resources/css/basicBox.css" type="text/css">
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

#empList {
	margin: 15px;
	height: 740px;
	width: 300px;
	border: 3px solid #81d4fa;
	float: left;
	font-size: 18px;
}

#changeBox {
	margin: 15px;
	height: 740px;
	width: 600px;
	border: 3px solid #81d4fa;
	float: right;
}

#empCode {
    border: 1px solid #81d4fa;
	width: 150px;
	height: 40px;
    margin: 15px;
    font-size: 20px;
	text-align: center;
	padding-top: 20px;
}

#empName {
    border: 1px solid #81d4fa;
	width: 150px;
	height: 40px;
    margin: 30px 15px 15px;
    font-size: 20px;
	text-align: center;
	padding-top: 20px;
}

#change div {
	display: inline-block;
	border: 1px solid #81d4fa;
	width: 150px;
	height: 40px;
	margin: 20px 15px 10px;
	font-size: 20px;
	text-align: center;
	padding-top: 20px;
}

#change input {
	border: 0px;
	width: 300px;
	height: 50px;
	margin: 15px;
	font-size: 20px;
	text-align: center;
}

#btn1 {
    width: 340px;
    height: 60px;
    border: 1px solid white;
    outline: 0;
    background-color: #81d4fa;
    font-size: 20px;
    font-weight: bold;
    color: white;
    margin: 100px 40px 0 130px;
}

#onoff {
	width: 140px;
	height: 50px;
	border: 2px solid white;
	margin-left: 2px;
	margin-bottom: 30px;
	outline: 0;
	background-color: #81d4fa;
	font-size: 20px;
	font-weight: bold;
	color: white;
}

#on {
	width: 150px;
	height: 50px;
	border: 3px solid #81d4fa;
	outline: 0;
	background-color: white;
	color: #81d4fa;
	font-size: 20px;
	font-weight: bold;
}

#originalTime {
	border: 3px solid #81d4fa;
	width: 500px;
	height: 150px;
	margin: 15px;
	margin: 20px 50px;
}

#originalTime span {
	margin: 15px;
	margin-top: 50px;
	font-size: 20px;
}
</style>
</head>
<body>
	<div id="empList">
		<label><button id="onoff" onclick="acvbutton()">재직자보기</button></label>
		<label><button id="on" onclick="allbutton()">모든직원보기</button></label> <br />
		<span id="activation"></span> <span id="inactive"></span>
	</div>
	<div id="changeBox">
		<div id="empInfo">
			<div id="empCode">
				<span id="emp_code">사번</span>
				<span id="pst_position">직위</span>
			</div>
			<div id="empName">
				<span id="emp_name">사원명</span>
			</div>
		</div>
		<div id="change">
			<div class="bd_date">영업일</div>
			<input type="date" name="bd_date" id="bd_date"><br>
			<div class="goLeave">출근</div>
			<input type="datetime-local" name="ad_inTime" id="ad_inTime">
			<div class="goLeave">퇴근</div>
			<input type="datetime-local" name="ad_outTime" id="ad_outTime">
		</div>
		<div id="button">
			<label><button id="btn1" onclick="updateWorkTime()">변경</button></label>
		</div>

	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		getEmpList();
	})

	//직원 버튼 토글(재직자,퇴사자)
	function acvbutton() {
		$("#onoff").text("퇴직자보기");
		$("#onoff").attr("onclick", "inacvbutton()");
		$("#activation").attr("style", "display:inline");
		$("#inactive").attr("style", "display:none");
	}
	function inacvbutton() {
		$("#onoff").text("재직자보기");
		$("#onoff").attr("onclick", "acvbutton()");
		$("#activation").attr("style", "display:none");
		$("#inactive").attr("style", "display:inline");
	}
	function allbutton() {
		$("#activation").attr("style", "display:inline");
		$("#inactive").attr("style", "display:inline");
	}

	//직원 리스트 불러오기
	function getEmpList() {
		$.ajax({
			type : "get",
			url : "rest/getemplist",
			dataType : "json",
			success : function(data) {
				$("#activation").text("");
				$("#inactive").text("");
				for ( var i in data) {
					var emp_code = data[i].EMP_CODE;
					var emp_name = data[i].EMP_NAME;

					if (data[i].EMP_STATUS == "1") {
						$("#activation").append(
								$("<input type='radio' name='emp' id='"
										+ emp_code + "' value='" + emp_code
										+ "' onclick='empInfo(" + emp_code
										+ ")'/>"));
						$("#activation").append(
								$("<span>").html(
										"　" + emp_code + '　　' + emp_name));
						if (data[i].AD_INTIME != null) {
							if (data[i].AD_OUTTIME != null) {
								$("#activation").append(
										$("<span style='color:red'>").html(
												"　　퇴근"));
							} else if (data[i].AD_OUTTIME == null) {
								$("#activation").append(
										$("<span style='color:red'>").html(
												"　　출근"));
							}
						} else if (data[i].AD_INTIME == null) {
							$("#activation")
									.append(
											$("<span style='color:red'>").html(
													"　　미출근"));
						}
						$("#activation").append($("<br/><br/>"));

					}

					if (data[i].EMP_STATUS == "-1") {
						$("#inactive").append(
								$("<input type='radio' name='emp' id='"
										+ emp_code + "' value='" + emp_code
										+ "'onclick='empInfo(" + emp_code
										+ ")'/>"));
						$("#inactive").append(
								$("<span style='color:gray'>").html(
										"　" + emp_code + '　　' + emp_name));
						$("#inactive").append($("<br/><br/>"));

					}
				}
			},
			error : function(err) {
				console.log(err);
			}
		});
	}

	//직원정보불러오기
	function empInfo(emp_code) {
		$.ajax({
			type : "get",
			url : "rest/getempinfo",
			data : {
				emp_code : emp_code
			},
			dataType : "json",
			success : function(data) {
				$("#emp_code").html(data.EMP_CODE);
				$("#pst_position").html(data.PST_NAME);
				$("#emp_name").html(data.EMP_NAME);
			},
			error : function(err) {
				console.log(err);
			}
		});
	}

	//출퇴근시간 불러오기
	$("#bd_date").change(
			function() {
				$.ajax({
					type : "get",
					url : "rest/getadtime",
					data : {
						"emp_code" : $("#emp_code").text(),
						"bd_date" : $(this).val(),
					},
					dataType : "json",
					success : function(data) {
						if (data != null) {
							var ad_inTime = data.AD_INTIME;
							ad_inTime = moment(ad_inTime).format(
									"YYYY-MM-DDTHH:mm:ss");
							$("#ad_inTime").val(ad_inTime);
							if (data.AD_OUTTIME != null) {
								var ad_outTime = data.AD_OUTTIME;
								ad_outTime = moment(ad_outTime).format(
										"YYYY-MM-DDTHH:mm:ss");
								$("#ad_outTime").val(ad_outTime);
							}
						}
						if (data == null) {
							alert("출근기록이 없습니다.");
						}
					},
					error : function(err) {
						console.log(err);
					}
				});
			})

	//출퇴근시간 변경하기
	function updateWorkTime() {
		var ad_inTime = moment($("#ad_inTime").val()).format(
				"YYYY-MM-DD HH:mm:ss");
		var ad_outTime = moment($("#ad_outTime").val()).format(
				"YYYY-MM-DD HH:mm:ss");
		$.ajax({
			type : "post",
			url : "rest/updateworktime",
			data : {
				"emp_code" : $("#emp_code").text(),
				"bd_date" : $("#bd_date").val(),
				"ad_inTime" : ad_inTime,
				"ad_outTime" : ad_outTime
			},
			dataType : "json",
			success : function(data) {
				if (data == "1") {
					alert("시간이 변경되었습니다.");
					getEmpList();
				}else if(data == "err"){
					alert("시간변경에 실패했습니다.");
				}
			}
		});
	}
</script>

</html>