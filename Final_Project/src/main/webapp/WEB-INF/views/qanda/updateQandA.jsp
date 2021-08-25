<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/updateQandA_za.css">
<script type="text/javascript" src="resources/js/ISH.js"></script>
</head>
<body>
<h1>수정 페이지</h1>
<form action="qanda.update.do" name="QandAform" onsubmit="return QandA22();">
			<input type ="hidden" name ="q_no" value="${param.q_no}"> 
			<table id="QandAform">
			<tr>
				<td>제목</td>
				<td><input name="q_title" id="q_title"></td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td><input name="q_writer" value="${sessionScope.loginMember.b_id }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input name="q_contents" id="q_contents"></td>
			</tr>
		</table>
	<button>수정</button>
	</form>
</body>
</html>