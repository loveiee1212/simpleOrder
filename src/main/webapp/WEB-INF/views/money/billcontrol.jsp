<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>영수증관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="icon" href="resources/image/smallLogo.png"
	type="image/x-icon">
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

.innerdiv {
	border: 3px solid #2565a3;
	width: 740px;
	height: 800px;
	float: left;
	background-color: white;
}

#b_topbox {
	width: 700px;
	height: 150px;
	margin-left: 30px;
	margin-top: 20px;
}

#b_topbox h1 {
	margin-left: 20px;
}

#searchbills tr, #searchbills th, #searchbills td {
	width: 150px;
	height: 30px;
	font-size: 20px;
}

#b_date {
	border: 3px solid #2565a3;
	height: 30px;
	font-size: 20px;
}

#b_code {
	border: 3px solid #2565a3;
	height: 40px;
	font-size: 20px;
}

#search {
	width: 130px;
	padding: 10px;
	margin-left: 10px;
	font-size: 22px;
	font-weight: bold;
	border: 3px solid white;
	color: white;
	background-color: #2565a3;
	border: 3px solid white;
	margin-left: 10px;
}

#b_middlebox {
	border: 3px solid #2565a3;
	width: 680px;
	height: 580px;
	margin-left: 30px;
	margin-top: 15px;
	overflow: auto;
	overflow-x: hidden;
	border-collapse: collapse;
}

#b_middlebox::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#b_middlebox::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#b_middlebox::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

.sellKeyBasicTable td {
    width: 150px;
    height: 150px;
    font-size: 20px;
    font-weight: bold;
    text-align: center;
    border: 3px solid #2565a3;
}

#b_middlebox th {
	background-color: #2565a3;
	color: white;
	width: 130px;
	height: 50px;
	font-size: 20px;
	text-align: center;
}

#b_middlebox td {
	width: 130px;
	height: 80px;
	font-size: 20px;
	text-align: center;
	font-weight: bold;
}

#companyList {
	font-size: 20px;
	font-weight: bold;
}

#bill_info {
	border: 3px solid #2565a3;
	width: 600px;
	height: 450px;
	margin-top: 40px;
	margin-left: 65px;
	overflow: auto;
	overflow-x: hidden;
}

#bill_info::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

#bill_info::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

#bill_info::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#proTable {
	width: 400px;
	height: 150px;
	text-align: center;
	margin-left: 100px;
	font-size: 20px;
	font-weight: bold;
}

#payTable {
	width: 600px;
	height: 120px;
	text-align: right;
	font-size: 20px;
	padding-right: 20px;
}

#payTable th {
	float: left;
}

#takeActionbox {
	width: 700px;
	height: 260px;
	float: left;
	margin-top: 10px;
	margin-left: 27px;
}

.takeAction {
	border: 3px solid white;
	background-color: #2565a3;
	color: white;
	width: 270px;
	height: 70px;
	text-align: center;
	margin: 10px;
	margin-left: 40px;
	float: left;
}

.takeAction2 {
	border: 3px solid white;
	background-color: #e3f2fd;
	color: #1565c0;
	width: 270px;
	height: 70px;
	text-align: center;
	margin: 10px;
	margin-left: 40px;
	float: left;
}

.takeAction3 {
	border: 3px solid #2565a3;
	background-color: white;
	color: red;
	width: 270px;
	height: 70px;
	text-align: center;
	margin: 10px;
	margin-left: 40px;
	float: left;
}

.takeAction p, .takeAction2 p, .takeAction3 p {
	margin-top: 20px;
	font-size: 25px;
	font-weight: bold;
}

#Exit {
	text-align: center;
	border: 2px solid white;
	width: 605px;
	height: 70px;
	background-color: #2565a3;
	font-weight: bold;
	color: white;
	font-size: 25px;
	float: right;
	margin-top: 10px;
	margin-right: 50px;
}

input:focus, button:focus, select:focus {
	outline: none;
}

#cashbills{
    width: 450px;
    height: 300px;
    border: 3px solid #2565a3;
    background-color: white;
    position: absolute;
    margin-top: 15%;
    margin-left: 40%;
    display: none;
    font-size: 25px;
    text-align: center;
    font-weight: bold;
    padding-top: 20px;
}

input[type="radio" i] {
    width: 30px;
    height: 30px;
}

#cashbillsmoney {
    width: 250px;
    height: 50px;
    border: 3px solid #2565a3;
    margin-top: 30px;
    font-size: 25px;
    text-align: center;
    font-weight: bold;
}

#cashname{
    width: 250px;
    height: 50px;
    border: 3px solid #2565a3;
    margin-top: 20px;
    font-size: 25px;
    text-align: center;
    font-weight: bold;
}

#sendcashbills {
    width: 350px;
    height: 60px;
    border: 3px solid #2565a3;
    background-color: #2565a3;
    color: white;
    margin-top: 20px;
    font-size: 25px;
    text-align: center;
    font-weight: bold;
}
#background{
width : 91.5%;
height : 90.5%;
background-color: #ddd;
opacity: 0.5;
position: absolute;
display: none;
}

#repay,#changepay{
display : none;
}
</style>
</head>
<body>
	<div id="baseBox">
		<div id="baseinnerBox">
			<div class="innerdiv">
				<div id="b_topbox">
					<h1>영수증 관리</h1>
					<table id="searchbills">
						<tr>
							<th>영업일 선택</th>
							<td><input type="date" name="b_date" id="b_date" /></td>
							<td rowspan="2"><button type="button" id="search"
									onclick="searchbills()">조회</button></td>
						</tr>
						<tr>
							<th>주문번호</th>
							<td><input type="text" name="b_code" id="b_code" /></td>
						</tr>


					</table>
				</div>
				<div id="b_middlebox">${bList}</div>

			</div>

			<div class="innerdiv">
				<div id="bill_info" class="bottombox">
					<!-- 상호이름 상단노출 -->
					<center>
						<h1 id='titlename'></h1>
					</center>
					<div id='top_info'>
						<div id='companyList'></div>
						<input type="hidden" id='hidden_status'/>
						<div id='middle_info'>
							<div id='proList'></div>
							<div id='bottom_info'></div>
						</div>
					</div>
				</div>
				<div id="takeActionbox" class="bottombox">
					<div class="takeAction" id='print_for_bill'>
						<p>재출력</p>
					</div>
					<div class="takeAction" id='bills_for_cash'>
						<p>현금 영수증</p>
					</div>
					<div class="takeAction" id='changepay'>
						<p>결제 변경</p>
					</div>
					<div class="takeAction2" id='print_for_emp'>
						<p>직원 재출력</p>
					</div>
					<div class="takeAction3" id='cancelpay'>
						<p>결제 취소</p>
					</div>
					<div class="takeAction2" id='repay' style="color: #2565a3;">
						<p>재매출</p>
					</div>
					<button id="Exit" type="button"
						onclick="location.href='./sellpage'">뒤로가기</button>
				</div>
			</div>
			<div id="background">
			</div>
			<div id="cashbills">
			<input type="radio" name='checktype'  value='1'/>개인소득공제용
			<input type="radio" name='checktype' value='2'>사업자지출증빙용
			<br/>
			금액 <input type='number' id='cashbillsmoney' readonly="readonly"/><br/>
			번호 <input type='text' id='cashname' placeholder="숫자 입력"/><br/>
			<input type='button' onclick='sendcashbills()' id='sendcashbills' value='현금영수증 발급'>
			</div>
		</div>
	</div>
</body>
<script>

var sortType = 'asc'; 

function sortContent(index) {
    var table = $("#billsList");

    sortType = (sortType =='asc')?'desc' : 'asc';

    var checkSort = true;
    var rows = table[0].rows;

    while (checkSort) { // 현재와 다음만 비교하기때문에 위치변경되면 다시 정렬해준다.
        checkSort = false;

        for (var i = 1; i < (rows.length-1); i++) {
           var fCell = rows[i].cells[index].innerHTML.toUpperCase();
            var sCell = rows[i + 1].cells[index].innerHTML.toUpperCase();

            var row = rows[i];

            // 오름차순<->내림차순 ( 이부분이 이해 잘안됬는데 오름차순이면 >, 내림차순이면 <이고 if문의 내용은 동일하다 )
            if ( (sortType == 'asc' && fCell > sCell) || 
                    (sortType == 'desc' && fCell < sCell) ) {

                row.parentNode.insertBefore(row.nextSibling, row);
                checkSort = true;
            }
        }
    }
}




function searchbills(){
	var date = $("#b_date").val();
	var code = $("#b_code").val();
	var obj = {
			"date":date,
			"code":code
	}
	$.ajax({
		type : 'post',
		url : 'rest/searchbills',
		data : obj,
		dataType : 'json',
		success : function(data){
			$("#b_middlebox").html(data.result);
			
			let bd_date = "";
			let oac_num = "";
			let oac_status = "";
			let obj = {};
			let cashvalue = 0;
			
			$(".bList_tr").click(function() {
				let tr = $(this);
				let td = tr.children();
				/* tr 행의 정보들을 Arr에 담음 */
				$("tr").css('background-color', 'white');
				tr.css('background-color', '#ddd');
				bd_date = td.children("#bd_date").val();
				oac_num = td.children("#oac_num").val();
				oac_status = td.children("#oac_status").data('code');
				cashvalue = Number(tr.children("#getcashvalue").text());
				obj = {
					"bd_date" : bd_date,
					"oac_num" : oac_num,
					"oac_status" : oac_status
				}
				console.log(obj);
				 $.ajax({
					type : 'post',
					url : 'rest/getdetailbill',
					data : obj,
					dataType : 'json',
					success : function(data) {
						$("#titlename").html(data.companyName);
						$("#companyList").html(data.companyList);
						$("#hidden_status").val(data.oac_status);
						$("#proList").html(data.productList);
						$("#bottom_info").html(data.paymentList);
						$("#uctcredit").html(Number($("#all_total").text())-$("#total").val());
						
						
						let status = $("#hidden_status").val();
						
						//선택한 주문번호가 결제이거나 외상일 떄
						if(oac_status==-1){
							$("#bills_for_cash").css("color","white");
						$("#cancelpay").css("color","red");
						$("#repay").css("color","#81d4fa");
						
						}else{
							$("#bills_for_cash").css("color","#ddd");
							$("#cancelpay").css("color","#ddd");
							$("#repay").css("color","#ddd");	
						}
						
						if(oac_status==1){
							$("#print_for_emp").css('color','#1565C0');
						}else{
							$("#print_for_emp").css('color','#ddd');
						}
						
						
						$("#print_for_bill").click(function(){
							
							var url = "print?bd_date="+obj.bd_date+"&oac_num="+obj.oac_num+"&oac_status="+obj.oac_status+"&ptype=1";
					        var name = "popup test";
					        var option = "width = 350, height = 400, top = 100, left = 200, location = no"
					           window.open(url, name, option);
						})
						
						$("#print_for_emp").click(function(){
		if(oac_status!=1){
			return false;
		}else{
			 var url = "print?bd_date="+obj.bd_date+"&oac_num="+obj.oac_num+"&oac_status="+obj.oac_status+"&ptype=0";
	         var name = "popup test";
	         var option = "width = 350, height = 400, top = 100, left = 200, location = no"
	            window.open(url, name, option);
		}
	})
	
			$("#bills_for_cash").click(function(){
		if(oac_status!=-1){
			return false;
		}else{			
		if(cashvalue<=0){
			alert("현금 결제만 현금영수증이 가능합니다.");
		}else{		
				$("#cashbillsmoney").val(cashvalue);
				$("#cashbills").css("display","block");
				$("#background").css("display","block");
			}
		}
	})
						
					}

		
				 })
	})
			
		}
	});
}


let bd_date = "";
let oac_num = "";
let oac_status = "";
let obj = {};
let cashvalue = 0;




	$(".bList_tr").click(function() {
				let tr = $(this);
				let td = tr.children();
				/* tr 행의 정보들을 Arr에 담음 */
				$("tr").css('background-color', 'white');
				tr.css('background-color', '#ddd');
				bd_date = td.children("#bd_date").val();
				oac_num = td.children("#oac_num").val();
				oac_status = td.children("#oac_status").data('code');
				cashvalue = Number(tr.children("#getcashvalue").text());
				obj = {
					"bd_date" : bd_date,
					"oac_num" : oac_num,
					"oac_status" : oac_status
				}
				console.log(obj);
				 $.ajax({
					type : 'post',
					url : 'rest/getdetailbill',
					data : obj,
					dataType : 'json',
					success : function(data) {
						$("#titlename").html(data.companyName);
						$("#companyList").html(data.companyList);
						$("#hidden_status").val(data.oac_status);
						$("#proList").html(data.productList);
						$("#bottom_info").html(data.paymentList);
						$("#uctcredit").html(Number($("#all_total").text())-$("#total").val());
						
						
						let status = $("#hidden_status").val();
						
						//선택한 주문번호가 결제이거나 외상일 떄
						if(oac_status==-1){
							$("#bills_for_cash").css("color","white");
						$("#cancelpay").css("color","red");
						$("#repay").css("color","#81d4fa");
						
						}else{
							$("#bills_for_cash").css("color","#ddd");
							$("#cancelpay").css("color","#ddd");
							$("#repay").css("color","#ddd");	
						}
						
						if(oac_status==1){
							$("#print_for_emp").css('color','#1565C0');
						}else{
							$("#print_for_emp").css('color','#ddd');
						}
						
						
					}

		
				 })
	})
	
	//현금영수증
	$("#bills_for_cash").click(function(){
		if(oac_status!=-1){
			return false;
		}else{			
		if(cashvalue<=0){
			alert("현금 결제만 현금영수증이 가능합니다.");
		}else{		
				$("#cashbillsmoney").val(cashvalue);
				$("#cashbills").css("display","block");
				$("#background").css("display","block");
			}
		}
	})
	
	
	
	
	
	
	//프린트영수증
	$("#print_for_bill").click(function(){
		
		var url = "print?bd_date="+obj.bd_date+"&oac_num="+obj.oac_num+"&oac_status="+obj.oac_status+"&ptype=1";
        var name = "popup test";
        var option = "width = 500, height = 400, top = 100, left = 200, location = no"
           window.open(url, name, option);
	})
	
	
	$("#print_for_emp").click(function(){
		if(oac_status!=1){
			return false;
		}else{
			 var url = "print?bd_date="+obj.bd_date+"&oac_num="+obj.oac_num+"&oac_status="+obj.oac_status+"&ptype=0";
	         var name = "popup test";
	         var option = "width = 500, height = 400, top = 100, left = 200, location = no"
	            window.open(url, name, option);
		}
	})
	
	
	
	$("#cancelpay").click(function(){
		if(oac_status!=-1){
		return false;
		}else{
			cancelpay(obj);
		}
		
});
	
	$("#repay").click(function(){
		if(oac_status!=-1){
		return false;
		}else{
			repay(obj);
		}
	});
	 function cancelpay(obj){
		if(confirm("결제 취소 시 해당하는 모든 상품이 반품 처리 됩니다. 취소하시겠습니까 ?")){
		$.ajax({
			type : 'post',
			url : 'rest/cancelpay',
			data : obj,
			dataType : 'json',
			success : function(result){
				alert(result.result);
				location.reload();
			}
		});
		}else{
			alert("실행이 취소되었습니다.");
		}
	} 
	 
	 /* function repay(obj){
		 if(confirm("재매출 시 해당하는 모든 상품이 반품 처리 됩니다. 재매출 처리 하시겠습니까 ?")){
				$.ajax({
					type : 'post',
					url : 'rest/cancelpay',
					data : obj,
					dataType : 'json',
					success : function(result){
						location.href = "./resell?bd_date=" + obj.bd_date + "&oac_num="+ obj.oac_num+ "&oac_status=-2";
					}
				});
				}else{
					alert("실행이 취소되었습니다.");
				}
	 
	 } */
	 
	 //현금영수증 작업
	 function sendcashbills(){
			if($('input[name="checktype"]:checked').val()==undefined){
				alert("소득공제 또는 지출증빙 여부선택은 필수입니다.");
				return false;
			}
			if(oac_status!=-1){
				return false;
			}
			if($("#cashname").val()==""){
				alert("공백 입력은 허용되지 않습니다.");
				return false;
			}
			if($('input[name="checktype"]:checked').val()==1&&$("#cashname").val().length<11){
				alert("11자 이상입력해주세요.");
				return false;
			}
			if($('input[name="checktype"]:checked').val()==2&&$("#cashname").val().length<12){
				alert("12자이상 입력해주세요.");
				return false;
			}
			$("#cashbills").css("display","none");
			$("#background").css("display","none");
			 var url = "sendcashbills?bd_date="+obj.bd_date+"&oac_num="+obj.oac_num+"&oac_status="+obj.oac_status+"&cashamount="+$("#cashbillsmoney").val()+"&cash_name="+$("#cashname").val()+"&type="+$('input[name="checktype"]:checked').val();
	         var name = "popup bills";
	         var option = "width = 500, height = 450, top = 100, left = 200, location = no,status = no,menubar =no,directoris=no"
	            window.open(url, name, option);
	         
		}
	 
	 $("#background").click(function(){
		 $("#cashbills").css("display","none");
		 $("#background").css("display","none");
	 })
</script>
</html>