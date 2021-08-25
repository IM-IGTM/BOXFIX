<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/loginSuccess_za.css">
<script type="text/javascript" src="resources/js/member.js"></script>
</head>
<body>
<table >
		<tr>
			<td id="sessionMember">
			${sessionScope.loginMember.b_id}<br>
			${sessionScope.loginMember.b_name}님
			</td>
		</tr>
		<tr>
			<td>
				<button onclick="memberInfoGo()">회원정보</button>
			</td>
			<td>
				<button onclick="logout()">로그아웃</button>
			</td>
		</tr>
	</table>
	
</body>
</html>