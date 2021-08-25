<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/js/member.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/joinSelect_za.css">
</head>
<body>
	<table class="joinSelect">
		<h2>회원가입</h2>
		<tr>
			<td id="">
			회원 종류에 따라 회원가입 절차가 다릅니다.<br> 
			고객님께서 해당되는 유형을 선택하여 회원가입을 진행해 주시기 바랍니다.
			</td>
		</tr>
	</table>
	<table class="joinSelect">
		<tr>
			<td><button onclick="joinGo()" id="joinGo">개인 / 일반 회원 가입</button>
			<button onclick="joinCompany()" id="joinCompany">단체 / 법인 회원 가입</button></td>
		</tr>
	</table>
</body>
</html>