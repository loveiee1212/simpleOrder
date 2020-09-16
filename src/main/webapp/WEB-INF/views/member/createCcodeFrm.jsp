<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ce_email} 사업자 아이디 만들기</title>
<style type="text/css">
req{
color: red;
}
</style>
</head>
<body>
<form action="createCcodeAcount" onsubmit="return test()" method="post">
<h2>${ce_email}</h2>
<input id="c_code" name="c_code" value="${cCodeInfo.c_code }" type="text" placeholder="사업자 번호" ><br/>
<input id="c_pw" name="c_pw" type="password" placeholder="사업자 비밀번호"><br/>
<input id="c_name" name="c_name" value="${cCodeInfo.c_name}"  type="text" placeholder="사업장 상호"><br/>
<input id="c_address" name="c_address" value="${cCodeInfo.c_address}" type="text" placeholder="사업장 주소"> <req>이것도 작업 부탁드립니다,</req><br/> 
<input id="c_phone" name="c_phone" value="${cCodeInfo.c_phone}" type="text" placeholder="사업장 전화번호"><br/>

<input id="emp_name" name="emp_name" value="${cCodeInfo.emp_name}" type="text" placeholder="사업자 대표 명"><br/>
<input  type="submit" value="사업장 추가">
<input type="button" value="뒤로가기" onclick="location.href = 'cList'">
<error> ${cCodeInfo.error}</error>

</form>
</body>
<script type="text/javascript">
function test() {
	return true;
}
</script>
</html>