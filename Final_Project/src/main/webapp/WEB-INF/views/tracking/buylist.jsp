<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 승인된 쇼핑몰 리스트</h1>
<c:forEach var="s" items="${shops }"> 
<form action="shopReg.getAll.do">
<table>
<tr>
<td> 쇼핑몰 카테고리 </td><br>
<td> ${s.sp_category } </td>
<td> <input type="hidden" name="sp_category" value="${s.sp_category }"> <td>
<td> 쇼핑몰 상호 </td><br>
<td> ${s.sp_name } </td>
<td> <input type="hidden" name="sp_name" value="${s.sp_name }"> <td>
</tr>
</table>
<button> 구매이력조회 </button>
</form>
</c:forEach>
</body>
</html>