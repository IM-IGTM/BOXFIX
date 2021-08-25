<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/info_za.css">
<script type="text/javascript" src="resources/js/member.js"></script>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
</head>
<body>
<form name="joinForm" action="member.company.update" method="post">
		<table id="CompanyInfo">
			<tr>
				<td colspan="2"><b>회원정보</b></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input name="c_id" value="${sessionScope.companyLoginMember.c_id }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="c_pw" id="c_pw" value="${sessionScope.companyLoginMember.c_pw }"></td>
			</tr>
			<tr>
				<td id="pw_check1"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="c_pw2" id="c_pw2"></td>
			</tr>
			<tr>
				<td id="pw_check2"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="c_name" value="${sessionScope.companyLoginMember.c_name }"></td>
			</tr>
				<tr>
				<td>이메일</td>
				<td><input name="c_mail" value="${sessionScope.companyLoginMember.c_mail }"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input name="c_phone" value="${sessionScope.companyLoginMember.c_phone }"></td>
			</tr>
			<tr>
				<td>단체 대표자명</td>
				<td><input name="c_topname" value="${sessionScope.companyLoginMember.c_topname }"></td>
			</tr>
			<tr>
				<td>사업자 등록번호</td>
				<td><input name="c_cumnumber" value="${sessionScope.companyLoginMember.c_comnumber }" readonly="readonly"></td>
			</tr>
			<tr>
				<td colspan="2">
				<button>수정</button>
				<button type="button" onclick="byebyeCom()">탈퇴</button></td>
			</tr>
		</table>
	</form>
</body>
</html>