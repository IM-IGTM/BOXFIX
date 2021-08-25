<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/findMemberRe_za.css">
<script type="text/javascript" src="resources/js/member.js"></script>
</head>
<body>
<table>
	<tr>
		<td>회원님의 아이디는<br> ${b.b_id } 입니다.</td>
	</tr>
	<tr>
		<td><button onclick="closeFindId()">확인</button></td>
	</tr>
</table>
</body>
</html>