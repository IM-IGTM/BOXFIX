<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/regcheck_za.css">
</head>
 <script type="text/javascript">
function approvalcheck() {
	let ok=confirm('승인하시겠습니까?')
	if (ok) {
		
		location.href="shopReg.getAll.check";
	
	}
}
</script> 
<body>
<h2 id="h2">쇼핑몰등록요청 리스트</h2>

<c:forEach var="s" items="${shops }"> 
 <form action=""> 
<table>
<tr>
<td> 쇼핑몰 번호 </td><br>
<td> ${s.sp_no } </td>
<td> <input type="hidden" name="sp_no" value="${s.sp_no }" > <td>
<td> 쇼핑몰 카테고리 </td><br>
<td> ${s.sp_category } </td>
<td> <input type="hidden" name="sp_category" value="${s.sp_category }" > <td>
<td> 쇼핑몰 상호 </td><br>
<td> ${s.sp_name } </td>
<td> <input type="hidden" name="sp_name" value="${s.sp_name }" > <td>
</tr>
</table>
  <button onsubmit="approvalcheck()"> 승인 </button> 
 <!-- <button > 승인 </button> -->
 </form> 
</c:forEach>
</body>
</html>