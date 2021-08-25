<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/findMemberPw_za.css">
<script type="text/javascript" src="resources/js/join.js"></script>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript">
$(function() {
	$("#b_pw").keyup(function() {
		if (pwJ.test($('#b_pw').val())) {
			console.log('true');
			$('#pw_check').text('');
			$("#reg_submit").attr("disabled", false);
		} else {
			console.log('false');
			$('#pw_check').text('숫자  or 문자로만 8~12자리 입력 해 주세요');
			$('#pw_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);

		}
	});

	$("#b_pw2").keyup(function() {
		if ($('#b_pw').val() != $(this).val()) {
			$('#pw2_check').text('비밀번호가 일치하지 않습니다 :(');
			$('#pw2_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
		} else {
			$('#pw2_check').text('');
			$("#reg_submit").attr("disabled", false);
		}
	});
	
});
</script>
</head>
<body>
<form action="member.pw.change" method="post">
	<table>
		<tr>
			<td>새로운 비밀번호를 입력하세요<input id="b_pw" name ="b_pw" type="password"></td>
		</tr>
		<tr>
			<td id="pw_check"></td>
		</tr>
		<tr>
			<td>새로운 비밀번호를 한번 더 입력하세요<input id="b_pw2"  name="b_pw2" type="password"></td>
		</tr>
		<tr>
			<td id="pw2_check"></td>
		</tr>
		<tr>
			<td><button id="reg_submit">확인</button></td>
		</tr>
</table>
</form>
</body>
</html>