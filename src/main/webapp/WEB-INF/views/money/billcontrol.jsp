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

.innerdiv {
	border: 1px solid black;
	width: 745px;
	height: 800px;
	float: left;
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
}

#searchbills button {
	width: 70px;
	heigth: 25px;
	margin-left: 10px;
}

#b_middlebox {
	border: 1px solid black;
	width: 680px;
	height: 580px;
	margin-left: 30px;
	margin-top: 15px;
	overflow: auto;
}

#b_middlebox tr, #b_middlebox th, #b_middlebox td {
	border: 1px solid black;
	width: 110px;
	height: 30px;
	text-align: center;
}

#bill_info {
	border: 1px solid black;
	width: 600px;
	height: 450px;
	margin-top: 50px;
	margin-left: 65px;
}

#takeActionbox {
	width: 700px;
	height: 260px;
	float: left;
	margin-top: 30px;
	margin-left: 27px;
}

.takeAction {
	border: 1px solid black;
	width: 165px;
	height: 100px;
	text-align: center;
	margin: 10px;
	margin-left: 40px;
	float: left;
}

.takeAction p {
	margin-top: 35px;
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
							<td rowspan="2"><button type="button"
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
					<center><h1 id='titlename'></h1></center>
					<div id='top_info'>
					<div id='companyList'>
					</div>
					<div id='middle_info'>
						<div id='proList'>
							</div>
							<div id='bottom_info'>
						</div>
					</div>
					</div>
				</div>
				<div id="takeActionbox" class="bottombox">
					<div class="takeAction">
						<p>재출력</p>
					</div>
					<div class="takeAction">
						<p>현금 영수증</p>
					</div>
					<div class="takeAction">
						<p>결제 변경</p>
					</div>
					<div class="takeAction">
						<p>직원 재출력</p>
					</div>
					<div class="takeAction">
						<p>결제 취소</p>
					</div>
					<div class="takeAction">
						<p>재매출</p>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
<script>
	//searchbills();

	$(".bList_tr").click(function() {
		var tr = $(this);
		var td = tr.children();
		/* tr 행의 정보들을 Arr에 담음 */
		$("tr").css('background-color', 'white');
		tr.css('background-color', '#ddd');
		var bd_date = td.children("#bd_date").val();
		var oac_num = td.children("#oac_num").val();
		var oac_status = td.children("#oac_status").data('code');
		var obj = {
			"bd_date" : bd_date,
			"oac_num" : oac_num,
			"oac_status" : oac_status
		}
		$.ajax({
			type : 'post',
			url : 'rest/getdetailbill',
			data : obj,
			dataType : 'json',
			success : function(data) {
				$("#titlename").text(data.companyName);
				$("#companyList").html(data.companyList);
				$("#proList").html(data.productList);
				//받아왔던 금액 계산
				if(oac_status=="-1"){			
					//현금계산이 0 이라면 == 카드결제
				if(td.children("#cashcard").data("code")==0){
					$("#t_pay").text("카드결제금액");
					$("#tpayment").text(td.children("#cashcard").val());
				}
				/* 카드계산이 0 이라면 == 현금결제 */
				else{
					$("#t_pay").text("현금결제금액");
					$("#tpayment").text(td.children("#cashcard").data("code"));
				}
					$("#tgetpay").html(tr.children("#getCashvalue").text());
				}
			}
		})

	});

	/* function searchbills(){
		$.ajax({
			type : "post",
			url : "",
			data : {"b_date":b_date,"b_code":b_code},
			dataType : "json",
			success : function(result){
				console.log(result);
			},
			error : function(err){
				console.log(err);
			}
		});
	} --> 조회 시 ajax를 이용하여 조회하기*/
</script>
</html>