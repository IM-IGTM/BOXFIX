<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/mailConfirm_za.css">
</head>
<body>

<form action="mail.confirm.do${dice }" method="post">
	<table>
		<tr>
			<td id="mailI">인증번호를 입력 입력하세요</td>
		</tr>
		</table>
		<table>
		<tr>	
			 <td id="mailinput"><input name="numberConfirm" placeholder="인증번호를 입력하세요"></td>
			<td id="kakuning"><button >확인</button></td>
		</tr>
	</table>
</form>
</body>
</html>