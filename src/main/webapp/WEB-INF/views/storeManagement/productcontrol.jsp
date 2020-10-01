<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<style type="text/css">
div.basic {
	float: left;
	border: 1px black solid;
}
</style>
<title>productControl-상품관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<div class="basic">
		<table id="pListtable">
		</table>
	</div>

	<div class="basic">
	<form action="" method ='post' name='proCategoriUandD'>
		<table>
			<tr>
				<th colspan="2">카테고리 수정</th>
			</tr>
			<tr>
				<td>
					<select class='categorilist' onchange="categoriUpdate(this)" id="select2">
					</select>
					<input hidden="hidden" type="text" id="updateCategoriCode"  name='pdc_code' value ='01'>
				</td>
				<td>
					<input type="button" value="삭제" onclick ='deleteProCategori()'>  
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="updateCategoriNAME" name ='pdc_name'>
				</td>
				<td>
					<input type="button" value="수정" onclick ='updateProCategori()'>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	
	<div class="basic">
	<form action="createProCategori" method="post">
		<table>
			<tr>
				<th colspan="2">카테고리 등록</th>
			</tr>
			<tr>
				<td>
					<input type="text" name ='pdc_name'>
				</td>
				<td>
					<input type="submit" value="추가">
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	<div class="basic">
		<form name="productControllForm" action="null" method="post" enctype = multipart/form-data>
			<table>
				<tr>
					<th colspan="2">상품 등록</th>
				</tr>
				<tr>
					<th>상품 코드</th>
					<th>상품 이름</th>
				</tr>
				<tr>
					<th><input type="text" id="pd_code" name="pd_code" readonly="readonly"> <input type="hidden" id="pd_date" name="pd_date"></th>
					<th><input type="text" id="pd_name" name="pd_name"></th>
				</tr>
				<tr>
					<th>상품 카테고리</th>
					<th>상품 가격</th>
				</tr>
				<tr>
					<th>
					<select class="categorilist" id="select1" name='pdc_code'></select>
					
					</th>
					<th><input type="text" id="pd_price" name='pd_price'></th>
				</tr>
				<tr>
					<th>재고 사용 여부</th>
					<th>재고</th>
				</tr>
				<tr>
					<th>
						사용<input type="radio" name="stockUse" value=true>
						미사용<input type="radio" name="stockUse" value=false checked="checked">
					</th>
					<th><input type="number" name="stk_stock" id="stk_stock"
						readonly="readonly"></th>
				</tr>
				<tr>
					<th>이미지</th>
					<th><input type="file" name='pdfile'></th>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value='추가' onclick="createProduct()" id='productControllBtn'></td>
				</tr>
			</table>
		</form>
	</div>
	<div></div>

</body>
<script>
	//모든 상품 노출
	getproList();
	//카테고리 가져오기
	getProCategoriList();

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
	
	function categoriUpdate(ele){
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
		$("#select1").children().prop("selected",false);
		console.log($("#select1").children("option[value='"+ele.dataset.pdc_code+"']").prop("selected",true));
		$("#productControllBtn").val("수정").attr("onclick","updateProduct()");
		
		
	}

	function readyCreatProFrm() { // 새로운 상품 등록 폼 재공
		productControllForm.reset();
		$("#pd_code").val(getNewPd_code('01'));
		$("#productControllBtn").val('추가').attr("onclick","createProduct()");
		
		
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
			$form.append("<input name = 'pdc_code' value ='"+ele.dataset.pdc_code+"'>");
			$form.append("<input name = 'pd_code' value ='"+ele.dataset.pd_code+"'>");
			$form.append("<input name = 'pd_date' value ='"+ele.dataset.pd_date+"'>");
			$("body").append($form);
			deleteProductForm.submit();
		}
	}
	
	function deleteProCategori(){ // 카테고리 삭제
		if(confirm("카테고리를 삭제하시겠습니까?")){
			let pdc_code = $("#updateCategoriCode").val();
			if(pdc_code == '01'){
				alert("기본 카테고리는 삭제할수없습니다.");
				return ;
			}
			proCategoriUandD.action = 'proCategoriDelete';
			proCategoriUandD.submit();
		}
	}
	function updateProCategori(){ // 카테고리 이름 수정
		let pdc_code = $("#updateCategoriCode").val();
		productControllForm.action = 'proCategoriUpdate';
		productControllForm.submit();
	}
	
	function createProduct(){ // 상품 생성
		productControllForm.action = 'createProduct';
		productControllForm.submit();
	}
	
	function updateProduct(){ // 상품 수정
		console.log("aa");
		productControllForm.action = 'updateProduct';
		productControllForm.submit();
	}
</script>
</html>