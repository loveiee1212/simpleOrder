<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>empSettingFrm</title>
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

#cListOption {
	text-align: center;
	border: 3px solid #2565a3;
	width: 350px;
	height: 70px;
	margin-left: 50px;
	margin-top: 15px;
	background-color: white;
	font-weight: bold;
	color: #2565a3;
	font-size: 25px;
}

#empListdiv {
	width: 900px;
	height: 400px;
	overflow: auto;
}

#empList {
	width: 800px;
	height: 400px;
	border: 3px solid #2565a3;
	background-color: white;
	text-align: center;
	font-size: 19px;
	margin: 20px 50px;
	font-weight: bold;
}

#empListdiv::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#empListdiv::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#empListdiv::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#empList th {
	font-size: 25px;
	background-color: #2565a3;
	color: white;
	height: 60px;
	width: 100px;
}

#frm table {
	width: 600px;
	height: 250px;
	margin: 0px 0px 0 80px;
}

#frm th {
	width: 200px;
	height: 30px;
	font-size: 20px;
	margin: 10px 100px;
}

input[type="text" i] {
	width: 300px;
	height: 30px;
	font-size: 20px;
	text-align: center;
	margin: 10px 30px;
	border: 3px solid #2565a3;
}

select {
	width: 310px;
	height: 40px;
	font-size: 20px;
	text-align: center;
	margin: 10px 30px;
	border: 3px solid #2565a3;
}

#addORupdate {
	text-align: center;
	border: 2px solid white;
	width: 310px;
	height: 70px;
	margin-left: 30px;
	margin-top: -2px;
	background-color: #2565a3;
	font-weight: bold;
	color: white;
	font-size: 25px;
}

#delect {
	text-align: center;
	border: 3px solid #2565a3;
	width: 310px;
	height: 70px;
	margin-left: 30px;
	margin-top: -2px;
	background-color: white;
	font-weight: bold;
	color: red;
	font-size: 25px;
}

#addbtn {
	text-align: center;
	border: 3px solid #2565a3;
	width: 100px;
	height: 50px;
	background-color: white;
	font-weight: bold;
	color: #2565a3;
	font-size: 20px;
}

#msg1 {
	width: 500px;
    color: #ff3d00;
    font-size: 20px;
    font-weight: bold;
    text-align: center;
}

#msg2 {
	width: 500px;
	color: #ff3d00;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
}

input:focus, button:focus {
	outline: none;
}
</style>
</head>
<body>
	<input type="button" onclick="fireEmpList(this)" value="퇴사자 목록"
		id="cListOption">
	<div id="empListdiv">
		<table id="empList">
		</table>
	</div>
	<form name="empSettingForm" action=null id="frm" method="post" onsubmit="return empFrm()">
		<input id="method" type="hidden" name="_method" value="null">
		<table>
			<tr>
				<th>직원 코드</th>
				<th>직원 이름</th>
			</tr>
			<tr>
				<td><input id="getEmpCode" name="emp_code" type="text"
					readonly="readonly" class="empsetting"></td>
				<td><input id="getEmpName" name="emp_name" type="text"
					class="empsetting" maxlength="4" onkeydown="keyEvt()"></td>
			</tr>
			<tr><td></td>
			<td id="msg1"></td></tr>
			<tr>
				<th>직원 비밀번호</th>
				<th>직원 직급</th>
			</tr>
			<tr>
				<td><input id="getEmpPw" name="emp_pw" type="text"
					class="empsetting" maxlength="4" onkeydown="keyEvt()" onkeypress="onlyNum(this)" numberOnly="true"></td>
				<td><select id="getEmpPosition" name="pst_position"
					class="empsetting">
				</select></td>
			</tr>
			<tr><td id="msg2"></td></tr>
			<tr>${error}
			</tr>

			<tr>
				<td><input name="addORupdate" id="addORupdate" type="button"
					value="1" onclick="1"></td>
				<td><input id="delect" type="button" value="해고"
					onclick='fireEmpInfo()' hidden="hidden"></td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	getEmpList(1); // 상태가 1인 emp 노출
	
	function empFrm() { // 추가 버튼 누르면 액션 변경
		return false;
	}

	createempSetting();

	function nowEmpList(data) {
		getEmpList(1); // 상태 1 emp 노출
		data.value = '퇴사자 목록';
		data.attributes[1].value = 'fireEmpList(this)';
	}
	function fireEmpList(data) {
		getEmpList(-1); // 상태 -1인 emp 노출
		data.value = '직원 목록';
		data.attributes[1].value = 'nowEmpList(this)';
		$("#getEmpPosition").html("");
		$("#delect").attr("hidden", "hidden");
	}
	function createempSetting() { // 새로운 emp 추가 Frm 을 제공
		$("#delect").attr("hidden", "hidden");
		addORupdate.attributes[4].value = 'createEmpInfo()';
		addORupdate.value = '추가하기';

		$.ajax({
			url : "rest/createEmpSetting",
			type : "get",
			dataType : "json",
			success : function(data) {
				$("#getEmpPosition").html("");
				$("#getEmpPosition").append(data.positionList);
				$("#getEmpCode").val(data.emp_code);
			}
		})
	}

	var pw = document.getElementById("getEmpPw");
	function createEmpInfo() { // form 액션 변경 후 서비밋 (추가)
		empSettingForm.action = 'createEmpInfo';
		$("#method").val("post");
		if (empFrm()==false){ //추가 버튼 누르면 유효성 검사
		if ($('#getEmpName').val() == "") {
			document.getElementById("msg1").innerHTML = "직원 이름을 입력해주세요!!";
			$('#getEmpName').focus();
			return false;
		}else if ($('#getEmpPw').val() == "") {
			document.getElementById("msg2").innerHTML = "직원 비밀번호를 입력해주세요!!";
			$('#getEmpPw').focus();
			return false;
		}else if (pw.value.length < 4) {
			document.getElementById("msg2").innerHTML = "직원 비밀번호 4자리를 입력해주세요!!";
			pw.focus();
			return false;
		}	
		empSettingForm.submit();
		return false;
		}
	}

	function updateEmpInfo() { // form 엑션 변경 후 서브밋 (수정)
		empSettingForm.action = 'updateEmpInfo';
		$("#method").val("patch");
		empSettingForm.submit();

	}
	function fireEmpInfo() { // form 엑션 변경 후 서브밋 (해고)
		if (confirm("직원을 해고시키시겠습니까? 한번 해고된 직원 데이터는 복직으로 돌리수없습니다.")) {
			$("#method").val("patch");
			empSettingForm.action = 'fireEmpInfo';
			empSettingForm.submit();
		}
	}

	function getEmpList(status) { // 세션의 저장된 사업체 코드로 직원의 목록 출력
		$.ajax({
			url : "rest/getEmpList",
			type : "get",
			data : {
				"emp_status" : status
			},
			dataType : "json",
			success : function(data) {
				$("#empList").html(data.empList);
			},
		})
	}

	function empInfosetting(index) { // 아래 버튼을 수정 기능추가 및 명명, 수정하기 위해 정보 긁어오기, 삭제 버튼 활성
		addORupdate.attributes[4].value = 'updateEmpInfo()'
		addORupdate.value = '수정';
	console.log($("#cListOption").val() == '직원 목록');
	console.log($("#"+index).children().eq(1).html() == '00000');
	console.log($("#"+index).children().eq(1).html());
		if ($("#cListOption").val() != '직원 목록' && $("#"+index).children().eq(1).html() != '00000') {
			$("#delect").removeAttr("hidden")
		}
		$("#method").val("patch");
		$.ajax({
			url : "rest/getPositionList",
			type : "get",
			data : {
				"empPosition" : $("#" + index).children()[3].innerText
			},
			dataType : "json",
			success : function(data) {
				$("#getEmpPosition").html("");
				$("#getEmpPosition").append(data.positionList);
			}
		})
		$("#getEmpName").val($("#" + index).children()[0].innerText);
		$("#getEmpCode").val($("#" + index).children()[1].innerText);
		$("#getEmpPw").val($("#" + index).children()[2].innerText);
	}
	
	//숫자만 입력하는 함수
	function onlyNum(obj) {
		if ((event.keyCode < 48) || (event.keyCode > 57))
			event.returnValue = false;

		$(document).on("keyup", "input:text[numberOnly]", function() {
			$(this).val($(this).val().replace(/[^0-9]/gi, ""));
		});
	}
	
	// 오류메세지 뜨고 난후 입력하면 공백처리
	function keyEvt() {
		document.getElementById("msg1").innerHTML = " ";
		document.getElementById("msg2").innerHTML = " ";
	}
	
	var sortType = 'asc'; 

	function sortContent(index) {
	    var table = $("#empList");

	    sortType = (sortType =='asc')?'desc' : 'asc';

	    var checkSort = true;
	    var rows = table[0].rows;
	    console.log(rows)

	    while (checkSort) { // 현재와 다음만 비교하기때문에 위치변경되면 다시 정렬해준다.
	        checkSort = false;

	        for (var i = 1; i < (rows.length-1); i++) {
	           var fCell = rows[i].cells[index].innerHTML.toUpperCase();
	            var sCell = rows[i + 1].cells[index].innerHTML.toUpperCase();
	console.log(fCell);
	console.log(sCell);

	            var row = rows[i];
	            // 오름차순<->내림차순 ( 이부분이 이해 잘안됬는데 오름차순이면 >, 내림차순이면 < 이고 if문의 내용은 동일하다 )
	            if ( (sortType == 'asc' && fCell > sCell) || 
	                    (sortType == 'desc' && fCell < sCell) ) {

	                row.parentNode.insertBefore(row.nextSibling, row);
	                checkSort = true;
	            }
	        }
	    }
	}
</script>
</html>