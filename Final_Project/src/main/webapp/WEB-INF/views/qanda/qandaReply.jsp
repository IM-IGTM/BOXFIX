<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/writeQandA_za.css">
<script type="text/javascript" src="resources/js/ISH.js"></script>
</head>
<body> 
	<form action="qanda.reply.go?q_no=${q_no }" id="QandAform" name="QandAform" onsubmit="return QandA();">
	<input type ="hidden" name ="q_no" value="${param.q_no}"> 
		<table id="QandAform">
			<tr>
			<td class="WriteQA">제목</td>
				<td><input name="qar_q_title" id="qar_q_title" value="문의 주신 내용에 대한 답변입니다."></td>
			</tr>
			<tr>
				<td class="WriteQA">글쓴이</td>
				<td><input name="qar_q_writer" value="${sessionScope.loginMember.b_id }" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="WriteQA">내용</td>
				<td><textarea name="qar_q_comment" id="qar_q_comment"></textarea><input type="hidden" name="qar_q_no" value="${param.qar_q_no }"> </td>
			</tr>
			<tr>
				<td><a href="qanda.home">목록</a></td>
				<td>
					<button>등록</button>
				</td>
				
			</tr>
		</table>
	</form>
</body>
</html>