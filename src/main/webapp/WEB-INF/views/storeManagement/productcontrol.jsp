<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<style type="text/css">
div.basic{
	float: left;
	border: 1px black solid;
}
</style>
<title>productControl-상품관리</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<div class="basic">
		<table id="pListtable">

		</table>
	</div>
	<div class="basic">
		<table>
			<tr>
				<th colspan="2">상품 등록</th>
			</tr>
			<tr>
				<th>상품 코드</th>
				<th>상품 이름</th>
			</tr>
			<tr>
				<th> <input type="text"> </th>
				<th> <input type="text"> </th>
			</tr>
			<tr>
				<th>상품 카테고리</th>
				<th>상품 가격</th>
			</tr>
			<tr>
				<th> <input type="text"> </th>
				<th> <input type="text"> </th>
			</tr>
			<tr>
				<th>재고 사용 여부</th>
				<th>재고</th>
			</tr>
			<tr>
				<th> 사용<input type="radio" name="stockUse" value=true> 미사용<input type="radio" name="stockUse" value=false> </th>
				<th> <input type="number" name="stockNum" id="stockNum">  </th>
			</tr>
			<tr>
				<th>이미지</th>
				<th> <input type="file"> </th>
			</tr>
		</table>
	</div>

</body>
<script>

	getproList();
	function getproList() {
		$.ajax({
			type : "post",
			url : "rest/getsproductlist",
			dataType : 'json',
			success : function(result) {
				console.log(result);
				$("#pListtable").html(result.pList);
			},
		});
	}
	
	$("input:radio").change(function(){ //재고 사용 여부
		if(!$("input:radio[value=true]").is(":checked")){
			$("#stockNum").attr("readonly","readonly");
			$("#stockNum").val("");
		}else{
			$("#stockNum").removeAttr("readonly");
		}
	})
	function updateproFrm() {
		
	}

</script>
</html>