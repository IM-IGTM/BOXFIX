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
	<form action="qanda.register" name="QandAform" onsubmit="return QandA();">
		<table id="QandAform">
			<tr>
				<td class="WriteQA">제목</td>
				<td><input name="q_title" id="q_title"></td>
			</tr>
			<tr>
				<td class="WriteQA">글쓴이</td>
				<td><input name="q_writer" value="${sessionScope.loginMember.b_id }" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="WriteQA">내용</td>
				<td><textarea name="q_contents" id="q_contents"></textarea></td>
			</tr>
		</table>
		<table id="QandAformB">
			<tr>
				<td><a href="qanda.home">목록</a></td>
				<td>
					<button>등록</button>
				</td>
				<!-- 비밀글 체크박스 하면 비밀번호 입력하는 input 박스가 있는 페이지로 forward -->
				<!-- 그 글에 해당하는 거에 나오게 not null 빼기 옵션에서 -->
				<!-- check 로그인 마냥 db 들여다볼 수 있게 -->
				<!-- if로 해서 맞을 때는 값을 볼 수 있게 / 아니면 안되게  -->
			</tr>
		</table>
	</form>
</body>
</html>