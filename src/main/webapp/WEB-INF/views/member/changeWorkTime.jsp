<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changeWorkTime</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/basicBox.css" type="text/css">
<style>
#empList {
	margin: 15px;
	height: 740px;
	width: 300px;
	border: 1px solid olive;
	float: left;
}


#changeBox {
	margin: 15px;
	height: 740px;
	width: 600px;
	border: 1px solid olive;
	float: right;
}

#empInfo div {
	border: 1px solid lime;
	width: 150px;
	height: 50px;
	margin: 15px;
	font-size: 20px;
	text-align: center;
}

#change div {
	display: inline-block;
	border: 1px solid lime;
	width: 150px;
	height: 50px;
	margin: 15px;
	font-size: 20px;
	text-align: center;
}

#change input {
	border: 0px;
	width: 300px;
	height: 50px;
	margin: 15px;
	font-size: 20px;
	text-align: center;
}

#button button {
	border: 1px solid black;
	width: 150px;
	height: 50px;
	background-color: white;
	font-size: 20px;
	margin-right: 40px;
	margin-left: 15px;
	margin-top: 30px;
}

#originalTime {
	border: 1px solid black;
	width: 500px;
	height: 150px;
	margin: 15px;
	margin-top: 40px;
}

#originalTime span {
	margin: 15px;
	margin-top: 50px;
	font-size: 20px;
}
</style>
</head>
<body>
	<div id="calendar">
		<div id="empList">
			<label><button id="onoff" onclick="acvbutton()">재직자보기</button></label>
			<label><button id="on" onclick="allbutton()">모든직원보기</button></label>
			<br/>
			<span id="activation"></span>
			<span id="inactive"></span>
		</div>
		<form id="changeBox">
			<div id="empInfo">
				<div id="empCode">
					<span id="emp_code" name="emp_code">사번</span>
					<span id="pst_position">직위</span>
				</div>
				<div id="empName">
					<span id="emp_name" name="emp_name">사원명</span>
				</div>
			</div>
			<div id="change">
				<div class="bd_date">영업일</div>
				<input type="date" name="bd_date" id="bd_date">
				<div class="goLeave">출근</div>
				<input type="datetime-local" name="ad_inTime" id="ad_inTime" value="2020-09-15T16:58">
				<div class="goLeave">퇴근</div>
				<input type="datetime-local" name="ad_outTime" id="ad_outTime">
			</div>
			<div id="button">
				<label><button>변경</button></label> <label><button>취소</button></label>
			</div>
			<div id="originalTime">
				<span>기존 출근 시간</span> <br /> <span>기존 퇴근 시간</span>
			</div>
		</form>
	</div>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		getEmpList();
	})
	//직원 버튼 토글(재직자,퇴사자)
	function acvbutton(){
			$("#onoff").text("퇴직자보기");
			$("#onoff").attr("onclick","inacvbutton()");
			$("#activation").attr("style","display:inline");
			$("#inactive").attr("style","display:none");
	}
	function inacvbutton(){
			$("#onoff").text("재직자보기");
			$("#onoff").attr("onclick","acvbutton()");
			$("#activation").attr("style","display:none");
			$("#inactive").attr("style","display:inline");
	}
	function allbutton(){
		$("#activation").attr("style","display:inline");
		$("#inactive").attr("style","display:inline");
	}
	
	
	//직원 리스트 불러오기
	function getEmpList() {
		$.ajax({
			type : "get",
			url: "rest/getemplist",
			data : {c_code : "123123123123"},
			dataType : "json",
			success : function(data){
				for (var i in data){
					var emp_code = data[i].EMP_CODE;
					var emp_name = data[i].EMP_NAME;

					if (data[i].EMP_STATUS == "1"){
						$("#activation").append($("<input type='radio' name='emp' id='"+emp_code+"' value='"+emp_code+"' onclick='empInfo("+emp_code+")'/>"));
						$("#activation").append($("<span>").html("　"+emp_code+'　　'+emp_name));
						if(data[i].AD_OUTTIME != null){
							$("#activation").append($("<span style='color:red'>").html("　　퇴근"));
						} else if(data[i].AD_OUTTIME == null){
							$("#activation").append($("<span style='color:red'>").html("　　출근"));
						}
						$("#activation").append($("<br/><br/>"));
					
					}

					if(data[i].EMP_STATUS == "-1"){
						$("#inactive").append($("<input type='radio' name='emp' id='"+emp_code+"' value='"+emp_code+"'onclick='empInfo("+emp_code+")'/>"));
						$("#inactive").append($("<span style='color:gray'>").html("　"+emp_code+'　　'+emp_name));
						$("#inactive").append($("<br/><br/>"));
						
					}
				}
			},
			error : function(err){
				console.log(err);
			}
		});
	}
	
	//직원정보불러오기
	function empInfo(emp_code){
		$.ajax({
			type : "get",
			url : "rest/getempinfo",
			data : {emp_code : emp_code, c_code : "123123123123"},
			dataType : "json",
			success : function(data){
				$("#emp_code").html(data.EMP_CODE);
				$("#pst_position").html(data.PST_NAME);
				$("#emp_name").html(data.EMP_NAME);
			},
			error : function(err){
				console.log(err);
			}
		});
	}
	console.log($("#ad_inTime").val());
	//출퇴근시간 불러오기
	$("#bd_date").change(function(){
		$.ajax({
			type: "get",
			url : "rest/getadtime",
			data : {emp_code : $("#emp_code").text(), bd_date : $(this).val(), c_code : "123123123123"},
			dataType : "json",
			success : function(data){
				if(data!=null){
					var ad_inTime = data.AD_INTIME;
					var ad_outTime = data.AD_OUTTIME;
					changeDate(ad_inTime);
				}
				if(data == null){
					alert("출근기록이 없습니다.");
				}
			},
			error : function(err){
				console.log(err);
			}
		});
	})
</script>

</html>