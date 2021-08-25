<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/join_za.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/join.js"></script>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript">
	$(function() {
		//아이디 유효성 검사(1 = 중복 / 0 != 중복)
		$('#b_id').blur(function() {
			// id = "id_reg" / name = "userId"
			var b_id = $('#b_id').val();
			$.ajax({
				url : 'idCheck?b_id=' + b_id,
				type : 'get',
				success : function(data) {
					console.log("1 = 중복o / 0 = 중복x : " + data);
				if (data == 1){ 
				// 1 : 아이디가 중복되는 문구
					$("#id_check").text("사용중인 아이디입니다 :p");
					$("#id_check").css("color","red");
					$("#reg_submit").attr("disabled", true);
				} else {
					if (idJ.test(b_id)) {
					// 0 : 아이디 길이 / 문자열 검사
					$("#id_check").text("");
					$("#reg_submit").attr("disabled", false);
				} else if (b_id == "") {
					$('#id_check').text('아이디를 입력해주세요 :)');
					$('#id_check').css('color','red');
					$("#reg_submit").attr("disabled", true);
				} else {
					$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
					$('#id_check').css('color','red');
					$("#reg_submit").attr("disabled", true);
				}
			}
		}, error : function() {
					console.log("실패");
					}
		});
	});

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

	$("#b_name").blur(function() {
		if (nameJ.test($(this).val())) {
			console.log(nameJ.test($(this).val()));
			$("#name_check").text('');
			$("#reg_submit").attr("disabled", false);
		} else {
			$('#name_check').text('이름을 확인해주세요');
			$('#name_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
		}
	});

	$('#b_phone').keyup(function() {
		if (phoneJ.test($(this).val())) {
			console.log(nameJ.test($(this).val()));
			$("#phone_check").text('');
			$("#reg_submit").attr("disabled", false);
		} else {
			$('#phone_check').text('휴대폰번호를 확인해주세요 :)');
			$('#phone_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
		}
	});
});		
</script>
<script type="text/javascript">
	function check() {
		if (($('#b_id').val() == '')) {
			alert("아이디를 입력하세요")
	        $('#b_id').focus();
	        return false;
		} 
		
		if (($('#b_pw').val() == '')) {
			alert("비밀번호를 입력하세요")
	        $('#b_pw').focus();
	        return false;
		} 
		
		if (($('#b_pw2').val() == '')) {
			alert("비밀번호를 입력하세요")
	        $('#b_pw2').focus();
	        return false;
		} 
		
		if (($('#b_name').val() == '')) {
			alert("이름을 입력하세요")
	        $('#b_name').focus();
	        return false;
		} 
		
		if (($('#birth1').val() == '') || ($('#birth2').val() == 'none') || ($('#birth3').val() == '')) {
			alert("생년월일을 입력하세요")
	        $('#birth1').focus();
	        return false;
		} 
		
		if (($("input[name='b_gender']:radio:checked").length < 1)) {
			alert("성별을 선택하세요")
			return false;
		} 
		
		if (($('#b_mail1').val() == '') || ($('#b_mail2').val() == '')) {
			alert("메일을 입력하세요")
	        $('#b_mail1').focus();
	        return false;
		}
		
		if (($('#b_addr1').val() == '') || ($('#b_addr2').val() == '') || ($('#b_addr3').val() == '') || ($('#b_addr4').val() == '')) {
			alert("주소을 입력하세요")
	        $('#b_addr4').focus();
	        return false;
		}
		
		if (($('#b_phone').val() == '')) {
			alert("휴대폰 번호를 입력하세요")
	        $('#b_phone').focus();
	        return false;
		}
	}	
</script>
</head>
<body>
	<form name=joinForm action="member.join" method="post" onsubmit="return check()">
		<h3>회원가입</h3>

		<table>
			<tr>
				<td class="joinbox">아이디</td>
				<td><input name="b_id" id="b_id"></td>
			</tr>
			<tr>
				<td id="id_check"></td>
			</tr>
			<tr>
				<td class="joinbox">비밀번호</td>
				<td><input type="password" name="b_pw" id="b_pw"></td>
			</tr>
			<tr>
				<td id="pw_check"></td>
			</tr>
			<tr>
				<td class="joinbox">비밀번호 확인</td>
				<td><input type="password" name="b_pw2" id="b_pw2"></td>
			</tr>
			<tr>
				<td id="pw2_check"></td>
			</tr>
			<tr>
				<td class="joinbox">이름</td>
				<td><input name="b_name" id="b_name"></td>
			</tr>
			<tr>
				<td id="name_check"></td>
			</tr>
			<tr>
				<td class="joinbox">생년월일</td>
				<td id="b_birth1"><input id="birth1" name="b_birht1" placeholder="년(4자)"></td>
				<td id="b_birth2">
				<select id="birth2"  name="b_birth2">
					<option value="none">월</option>
					<option>1</option><option>2</option><option>3</option>
					<option>4</option><option>5</option><option>6</option>
					<option>7</option><option>8</option><option>9</option>
					<option>10</option><option>11</option><option>12</option>
				</select>
				</td>
				<td><input name="b_birht3" id="birth3"></td>
			</tr>
			<tr>
				<td id="birth_check"></td>
			</tr>
			<tr>
				<td class="joinbox">성별</td>
				<td>남<input id="b_gender" name="b_gender" type="radio" value="남"><br> 
					여<input id="b_gender" name="b_gender" type="radio" value="여">
				</td>
			</tr>
			<tr>
				<td class="joinbox">이메일</td>
				<td id="emailC"><input name="b_mail1" id="b_mail1">&nbsp;&nbsp;&nbsp;@</td>
				<td><input name="b_mail2" id="b_mail2"></td>
				<td id="emailC2"><select id="b_mail3" onchange="selectMail()">
						<option>이메일 선택</option>
						<option>naver.com</option><option>gmail.com</option>
						<option>nate.com</option><option>hanmail.net</option>
						<option>직접입력</option>
				</select>
				</td>
				<td id="email"><input type="button" name="confirmMail" id="confirmMail" onclick="emailSend()" value="인증번호 보내기"></td>
			<tr>
				<td class="joinbox">주소</td>
				<td class="joinbox1">
					<input name="b_addr1" id="b_addr1" onclick="address()" placeholder="우편번호">&nbsp;&nbsp;
					<input type="button" onclick="address()" value="우편번호 검색"></td>
				<td>
					<input name="b_addr2" id="b_addr2" placeholder="도로명주소">
					<input name="b_addr3" id="b_addr3" placeholder="지번주소"> 
					<span id="guide" style="color: #999; display: none"></span>
					<input name="b_addr4" id="b_addr4" placeholder="상세주소"> 
					<input name="b_addr5" id="b_addr5" placeholder="참고항목">
					</td>
			</tr>
			<tr>
				<td class="joinbox">휴대전화 <br>('-' 없이 번호만 입력해 주세요 )
				</td>
				<td><input name="b_phone" id="b_phone"></td>
			</tr>
			<tr>
				<td id="phone_check"></td>
			</tr>
			<tr>
				<td colspan="2"><button id="reg_submit">가입</button></td>
			</tr>
		</table>
	</form>	
</body>
</html>