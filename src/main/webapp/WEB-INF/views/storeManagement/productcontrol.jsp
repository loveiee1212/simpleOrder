<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="resources/css/basicBox.css?after">
<link rel="icon" href="resources/image/smallLogo.png"
	type="image/x-icon">
<style type="text/css">
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
	width: 840px;
	height: 800px;
	float: left;
	background-color: white;
	overflow: auto;
}

#pListtable {
	background-color: white;
	border-collapse: collapse;
	width: 840px;
}

.innerdiv::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px grey;
}

.innerdiv::-webkit-scrollbar {
	width: 20px;
	background-color: white;
}

.innerdiv::-webkit-scrollbar-thumb {
	background-color: #2565a3;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#pListtable th {
	border: none;
	border-right: 3px solid white;
	width: 150px;
	height: 50px;
	margin: 30px;
	text-align: center;
	font-size: 25px;
	font-weight: bold;
	background-color: #2565a3;
	color: white;
}

#pListtable td {
	border: none;
	width: 150px;
	height: 50px;
	margin: 30px;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

#readyCreatProFrm {
    width: 150px;
	height: 60px;
	border: 3px solid white;
	background-color: #e3f2fd;
	font-weight : bold; 
	color : #1565c0;
	font-size: 20px;
	margin-top: 20px;
}

.aPUpdate {
	width: 100px;
	height: 50px;
	border: 3px solid white;
	background-color: #e3f2fd;
	font-weight: bold;
	color: #1565c0;
	font-size: 20px;
	margin-top: 10px;
}

.aPdelete {
	width: 100px;
	height: 50px;
	border: 3px solid #2565a3;
	background-color: white;
	color: red;
	font-size: 20px;
	font-weight: bold;
	margin-top: 10px;
}

.innerdiv2 {
	border: 3px solid #2565a3;
	width: 640px;
	height: 800px;
	float: left;
	background-color: white;
}

.basic {
	width: 640px;
	height: 180px;
	float: left;
}

.basic2 {
	width: 640px;
	height: 125px;
	float: left;
}

#updatetable th {
	width: 640px;
	height: 50px;
	font-size: 25px;
	text-align: center;
	background-color: #2565a3;
	color: white;
}

#select1 {
	width: 150px;
	height: 38px;
	font-size: 20px;
	border: 3px solid #2565a3;
}

#select2 {
	width: 150px;
	height: 38px;
	font-size: 20px;
	border: 3px solid #2565a3;
	margin-left: 70px;
}

#updateCategoriNAME {
	width: 250px;
	height: 40px;
	font-size: 18px;
	margin-left: 70px;
	border: 3px solid #2565a3;
}

#delete {
	width: 150px;
	height: 50px;
	border: 3px solid #2565a3;
	background-color: white;
	color: red;
	font-size: 20px;
	font-weight: bold;
	margin: 10px 30px;
}

#update {
	width: 150px;
	height: 50px;
	border: 3px solid white;
	background-color: #e3f2fd;
	font-weight : bold; 
	color : #1565c0;
	font-size: 20px;
	margin-left: 30px;
}

#createtable th {
	width: 640px;
	height: 50px;
	font-size: 25px;
	text-align: center;
	background-color: #2565a3;
	color: white;
}

#pdc_name {
	width: 250px;
	height: 40px;
	font-size: 18px;
	margin-top: 10px;
	margin-left: 70px;
	border: 3px solid #2565a3;
}

#add {
	width: 150px;
	height: 50px;
	border: 3px solid white;
	background-color: #e3f2fd;
	font-size: 20px;
	font-weight: bold;
	color: #1565c0;
	margin-top: 10px;
	margin-right: 20px;
}

.basic3 {
	width: 640px;
	height: 400px;
	float: left;
}

#producttable {
    width: 640px;
	height: 500px;
	border: none;
	border-top: 3px solid #2565a3;
}

#producttable th {
	width: 640px;
	height: 50px;
	font-size: 25px;
	text-align: center;
	background-color: #2565a3;
	color: white;
}

#producttable td {
	width: 100px;
	height: 40px;
	font-size: 20px;
	text-align: center;
	font-weight: bold;
}

#pd_code, #pd_name, #pd_price, #stk_stock {
	width: 200px;
	height: 40px;
	font-size: 20px;
	margin-bottom: 10px;
	border: 3px solid #2565a3;
	text-align: center;
}

.stockUse {
	width: 25px;
	height: 25px;
}

#pdfile {
	width: 250px;
	height: 50px;
	border: 3px solid white;
	font-size: 18px;
}

#productControllBtn {
    text-align: center;
    border: none;
    width: 635px;
    height: 50px;
    background-color: #e3f2fd;
    font-weight: bold;
    color: #1565c0;
    font-size: 23px;
    margin-top: -10px;
}

#Exit {
    text-align: center;
    border: none;
    width: 635px;
    height: 38px;
    background-color: #2565a3;
    font-weight: bold;
    color: white;
    font-size: 21px;
    margin-top: -5px;
}

input:focus, button:focus, select:focus {
	outline: none;
}
#changeTema {
	width: 180px;
	height: 50px;
	background-color: #0D0D0D;
	color: #fcfaff;
	font-size: 20px;
	font-weight: bold;
	border-radius: 20px;
	float: right;
}
</style>
<title>SimpleOrder</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
<button type="button" id="changeTema" onclick="changeTema()">다크모드</button>
	<div id="baseBox">
		<div id="baseinnerBox">
			<div class="innerdiv">
				<table id="pListtable">
				</table>
			</div>
			<div class="innerdiv2">
				<div class="basic">
					<form action="" method='post' name='proCategoriUandD'>
						<table id="updatetable">
							<tr>
								<th colspan="2">카테고리 수정</th>
							</tr>
							<tr>
								<td><select class='categorilist'
									onchange="categoriUpdate(this)" id="select2">
								</select> <input hidden="hidden" type="text" id="updateCategoriCode"
									name='pdc_code' value='01'></td>
								<td><input type="button" id="delete" value="삭제"
									onclick='deleteProCategori()'></td>
							</tr>
							<tr>
								<td><input type="text" id="updateCategoriNAME"
									name='pdc_name'></td>
								<td><input type="button" id="update" value="수정"
									onclick='updateProCategori()'></td>
							</tr>
						</table>
					</form>
				</div>


				<div class="basic2">
					<form action="createProCategori" method="post">
						<table id="createtable">
							<tr>
								<th colspan="2">카테고리 등록</th>
							</tr>
							<tr>
								<td><input type="text" id="pdc_name" name='pdc_name'>
								</td>
								<td><input type="submit" id="add" value="추가"></td>
							</tr>
						</table>
					</form>
				</div>

				<div class="basic3">
					<form name="productControllForm" action="null" method="post"
						enctype=multipart/form-data>
						<table id="producttable">
							<tr>
								<th colspan="2">상품 등록</th>
							</tr>
							<tr>
								<td>상품 코드</td>
								<td>상품 이름</td>
							</tr>
							<tr>
								<td><input type="text" id="pd_code" name="pd_code"
									readonly="readonly"> <input type="hidden" id="pd_date"
									name="pd_date"></td>
								<td><input type="text" id="pd_name" name="pd_name"></td>
							</tr>
							<tr>
								<td>상품 카테고리</td>
								<td>상품 가격</td>
							</tr>
							<tr>
								<td><select class="categorilist" id="select1"
									name='pdc_code'></select></td>
								<td><input type="text" id="pd_price" name='pd_price'></td>
							</tr>
							<tr>
								<td>재고 사용 여부</td>
								<td>재고</td>
							</tr>
							<tr>
								<td>사용<input type="radio" class="stockUse" name="stockUse"
									value=true> 미사용<input type="radio" class="stockUse"
									name="stockUse" value=false checked="checked">
								</td>
								<td><input type="number" name="stk_stock" id="stk_stock"
									readonly="readonly"></td>
							</tr>
							<tr>
								<td>이미지</td>
								<td><input type="file" id="pdfile" name='pdfile'></td>
							</tr>
							<tr>
								<td colspan="2"><input type="button" value='추가'
									onclick="createProduct()" id='productControllBtn'></td>
							</tr>
							<tr>
								<td colspan="2"><button id="Exit" type="button"
										onclick="location.href='./posmain'">메인으로</button></td>
							</tr>
						</table>
					</form>
				</div>
				<div></div>
			</div>
		</div>
	</div>

</body>
<script>
//테마 시작
if ("${temaBlack}" == "") {
	temaBlack = false;
} else {
	temaBlack = JSON.parse('${temaBlack}');
}
changeTema();

function temaChange(temaBlack) {
	$.ajax({
		url : "rest/temaChange",
		type : "post",
		data : {
			"temaBlack" : temaBlack
		}
	})
	return !temaBlack;
}

function changeTema() {
	if (temaBlack) {
		$('#changeTema').text("화이트모드");
		before = $("style").html();
		after = before.replaceAll("#0D0D0D", "#24619E");
		after = after.replaceAll("#2565a3", "#2B2B2B");
		after = after.replaceAll("#e3f2fd", "#141414");
		after = after.replaceAll("#ffffff", "#404040");
		after = after.replaceAll("#1565c0", "#F0F0F0");
		after = after.replaceAll("#90caf9", "#4F4F4F");
		after = after.replaceAll("#000000", "#F7F7F7");
		$("style").html(after);
		temaBlack = temaChange(true);
	} else {
		$('#changeTema').text("다크모드");
		before = $("style").html();
		after = before.replaceAll("#24619E", "#0D0D0D");
		after = after.replaceAll("#2B2B2B", "#2565a3");
		after = after.replaceAll("#141414", "#e3f2fd");
		after = after.replaceAll("#404040", "#ffffff");
		after = after.replaceAll("#F0F0F0", "#1565c0");
		after = after.replaceAll("#4F4F4F", "#90caf9");
		after = after.replaceAll("#F7F7F7", "#000000");
		$("style").html(after);
		temaBlack = temaChange(false);
	}
}
//테마 끝
	//모든 상품 노출
	getproList();
	//카테고리 가져오기
	getProCategoriList();
	
	var sortType = 'asc'; 

	function sortContent(index) {
	    var table = $("#pListtable");

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
	
	

	//재고 사용 여부 채크
	$("input:radio").change(function() { //재고 사용 여부
		if (!$("input:radio[value=true]").is(":checked")) {
			$("#stk_stock").attr("readonly", "readonly");
			$("#stk_stock").val("");
		} else {
			$("#stk_stock").removeAttr("readonly");
		}
	})
	// 상품 카테고리 변경시
	$("#select1").change(function() {
		let pdc_code = $("#select1").children("option:checked").val();
		$("#pd_code").val(getNewPd_code(pdc_code));
	})

	function categoriUpdate(ele) {
		let pdc_code = $(ele).children("option:checked").val();
		$("#updateCategoriCode").val(pdc_code);
	}

	function getproList() {
		$.ajax({
			type : "get",
			url : "rest/getsproductlist",
			dataType : 'json',
			success : function(listmap) {
				$("#pListtable").html(listmap.pList);
				$("#pd_code").val(getNewPd_code('01'));
			},
		});
	}
	// 카테고리 리스트를 셀렉트 박스로
	function getProCategoriList() {
		$.ajax({
			type : "get",
			url : "rest/getProCategoriList",
			dataType : 'json',
			success : function(listmap) {
				$(".categorilist").html(listmap.categoriList)
			}
		})
	}

	function getProInfo(ele) { //상품의 정보 로드 , 상품 업데이트 폼 제공
		if ('null' == ele.dataset.stk_stock) {
			$("input:radio").eq(1).prop("checked", true);
			$("input:radio").eq(0).prop("checked", false);
			$("#stk_stock").attr("readonly", "readonly");
			$("#stk_stock").val("");
		} else {
			$("#stk_stock").val(ele.dataset.stk_stock);
			$("input:radio").eq(0).prop("checked", true);
			$("input:radio").eq(1).prop("checked", false);
			$("#stk_stock").removeAttr("readonly");
		}
		$("#pd_code").val(ele.dataset.pd_code);
		$("#pdc_code").val(ele.dataset.pdc_code);
		$("#pd_date").val(ele.dataset.pd_date);
		$("#pd_name").val(ele.dataset.pd_name);
		$("#pd_price").val(ele.dataset.pd_price);
		ele.dataset.pdc_code;
		$("#select1").children().prop("selected", false);
		console.log($("#select1").children(
				"option[value='" + ele.dataset.pdc_code + "']").prop(
				"selected", true));
		$("#productControllBtn").val("수정").attr("onclick", "updateProduct()");
		$(productControllForm).append($("<input type ='hidden' name = 'before_pdc_code' value = '"+ele.dataset.pdc_code+"'>"));
		$(productControllForm).append($("<input type ='hidden' name = 'before_pd_code' value = '"+ele.dataset.pd_code+"'>"));

	}

	function readyCreatProFrm() { // 새로운 상품 등록 폼 재공
		productControllForm.reset();
		$("#pd_code").val(getNewPd_code('01'));
		$("#productControllBtn").val('추가').attr("onclick", "createProduct()");

	}

	function getNewPd_code(pdc_code) {
		var result = "0";
		$.ajax({
			url : "rest/getProductofNumber",
			type : "get",
			async : false,
			data : {
				"pdc_code" : pdc_code
			},
			success : function(data) {
				result = data;
			}
		})
		return result;
	}
	function deleteProduct(ele) { // 상풍 삭제 메소드
		if (confirm("상품을 삭제하시겠습니까?")) {
			ele = $(ele).prev()[0];
			$form = $("<form name ='deleteProductForm' action = 'deleteProduct' method='post' hidden = 'hidden'>");
			$form
					.append("<input name = 'before_pdc_code' value ='"+ele.dataset.pdc_code+"'>");
			$form
					.append("<input name = 'before_pd_code' value ='"+ele.dataset.pd_code+"'>");
			$form
					.append("<input name = 'pd_date' value ='"+ele.dataset.pd_date+"'>");
			$("body").append($form);
			
			deleteProductForm.submit();
		}
	}

	function deleteProCategori() { // 카테고리 삭제
		if (confirm("카테고리를 삭제하시겠습니까?")) {
			let pdc_code = $("#updateCategoriCode").val();
			if (pdc_code == '01') {
				alert("기본 카테고리는 삭제할수없습니다.");
				return;
			}
			proCategoriUandD.action = 'proCategoriDelete';
			proCategoriUandD.submit();
		}
	}
	function updateProCategori() { // 카테고리 이름 수정
		let pdc_code = $("#updateCategoriCode").val();
		proCategoriUandD.action = 'proCategoriUpdate';
		proCategoriUandD.submit();
	}

	function createProduct() { // 상품 생성
		productControllForm.action = 'createProduct';
		productControllForm.submit();
	}

	function updateProduct() { // 상품 수정
		console.log("aa");
		productControllForm.action = 'updateProduct';
		productControllForm.submit();
	}
</script>
</html>