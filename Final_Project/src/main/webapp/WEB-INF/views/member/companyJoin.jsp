<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/companyJoin_za.css">
<script type="text/javascript" src="resources/js/join.js"></script>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript">
$(function() {
	//아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$('#c_id').blur(function() {
		// id = "id_reg" / name = "userId"
		var c_id = $('#c_id').val();
		$.ajax({
			url : 'companyIdCheck?c_id='+ c_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : " + data);							
				
		if (data == 1) {
		// 1 : 아이디가 중복되는 문구
			$("#id_check").text("사용중인 아이디입니다 :p");
			$("#id_check").css("color", "red");
			$("#reg_submit").attr("disabled", true);
		} else {
				if(idJ.test(c_id)){
				// 0 : 아이디 길이 / 문자열 검사
					$("#id_check").text("");
					$("#reg_submit").attr("disabled", false);
				} else if(c_id == ""){
					$('#id_check').text('아이디를 입력해주세요 :)');
					$('#id_check').css('color', 'red');
					$("#reg_submit").attr("disabled", true);				
				} else {
					$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
					$('#id_check').css('color', 'red');
					$("#reg_submit").attr("disabled", true);
				}
			}
		}, error : function() {
						console.log("실패");
						}
		});
	});
		
	$("#c_pw").keyup(function() {
		if (pwJ.test($('#c_pw').val())) {
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
	
	$("#c_pw2").keyup(function() {
		if($('#c_pw').val() != $(this).val()){
			$('#pw2_check').text('비밀번호가 일치하지 않습니다 :(');
			$('#pw2_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
		} else {
			$('#pw2_check').text('');
			$("#reg_submit").attr("disabled", false);
		}
	});
	
	$("#c_name").blur(function() {
		if (comnameJ.test($(this).val())) {
			console.log(comnameJ.test($(this).val()));
			$("#name_check").text('');
			$("#reg_submit").attr("disabled", false);
		} else {
			$('#name_check').text('사명을 확인해주세요');
			$('#name_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
		}
	});	
	
	$('#c_phone').keyup(function(){
		if(phoneJ.test($(this).val())){
			console.log(nameJ.test($(this).val()));
			$("#phone_check").text('');
			$("#reg_submit").attr("disabled", false);
		} else {
			$('#phone_check').text('휴대폰번호를 확인해주세요 :)');
			$('#phone_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
		}
	});
	
	$("#c_topname").blur(function() {
		if (nameJ.test($(this).val())) {
			console.log(nameJ.test($(this).val()));
			$("#topname_check").text('');
			$("#reg_submit").attr("disabled", false);
		} else {
			$('#topname_check').text('이름을 확인해주세요');
			$('#topname_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
		}
	});
	
	$('#c_comnumber').keyup(function(){
		if(comnumJ.test($(this).val())){
			console.log(nameJ.test($(this).val()));
			$("#comnum_check").text('');
			$("#reg_submit").attr("disabled", false);
		} else {
			$('#comnum_check').text('사업자번호를 확인해주세요 :)');
			$('#comnum_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);
		}
	});
});		
</script>
<script type="text/javascript">
function check() {
	if (($('#c_id').val() == '')) {
		alert("아이디를 입력하세요")
        $('#c_id').focus();
        return false;
	} 
	
	if (($('#c_pw').val() == '')) {
		alert("비밀번호를 입력하세요")
        $('#c_pw').focus();
        return false;
	}
	
	if (($('#c_pw2').val() == '')) {
		alert("비밀번호를 입력하세요")
        $('#c_pw2').focus();
        return false;
	} 
	
	if (($('#c_name').val() == '')) {
		alert("단체 이름을 입력하세요")
        $('#c_name').focus();
        return false;
	}
	
	if (($('#c_mail').val() == '')) {
		alert("메일을 입력하세요")
        $('#c_mail').focus();
        return false;
	} 
	
	if (($('#c_phone').val() == '')) {
		alert("휴대폰 번호를 입력하세요")
        $('#c_phone').focus();
        return false;
	} 
	
	if (($('#c_topname').val() == '')) {
		alert("단체 대표자명을 입력하세요")
        $('#c_topname').focus();
        return false;
	} 
	
	if (($('#c_cumber').val() == '')) {
		alert("이름을 입력하세요")
        $('#c_cumnumber').focus();
        return false;
	}
}	
</script>
</head>
<body>

	<h3>단체 회원가입</h3>
	<form name="CompanyJoinForm" action="member.company.join" method="post" onsubmit="return check()">

		<table>
			<tr>
				<td class="idpwkaku">단체 회원 아이디/비밀번호</td>
			</tr>
			<tr>
				<td><input name="c_id" id="c_id" placeholder="아이디"></td>
			</tr>
			<tr>
				<td id="id_check"></td>
			</tr>
			<tr>
				<td><input type="password" name="c_pw" id="c_pw"
					placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td id="pw_check"></td>
			</tr>
			<tr>
				<td><input type="password" name="c_pw2" id="c_pw2"
					placeholder="비밀번호 재확인"></td>
			</tr>
			<tr>
				<td id="pw2_check"></td>
			</tr>
		</table>
		<table>
			<tr>
				<td class="idpwkaku">단체 확인 정보<br> 아이디/비밀번호를 찾을 때 활용되는 중요한
					정보입니다. 정확히 입력해 주세요
				</td>
			</tr>
			<tr>
				<td><input name="c_name" id="c_name" placeholder="단체 이름"></td>
			</tr>
			<tr>
				<td id="name_check"></td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td><input name="c_mail" id="c_mail" placeholder="단체 확인 이메일 주소">
					<input type="button" name="confirmMail" id="confirmMail"
					onclick="companyEmailSend()" value="인증"></td>
			</tr>
			<tr>
				<td><input name="c_phone" id="c_phone"
					placeholder="휴대전화 ('-' 없이 번호만 입력해 주세요 )"></td>
			</tr>
			<tr>
				<td id="phone_check"></td>
			</tr>
		</table>
		<table id="companyConfirm">
			<tr>
				<td class="idpwkaku">단체 확인 부가정보</td>
			</tr>
			<tr>
				<td><input name="c_topname" id="c_topname"
					placeholder="단체 대표자명"></td>
			</tr>
			<tr>
				<td id="topname_check"></td>
			</tr>
			<tr>
				<td><input name="c_comnumber" id="c_comnumber"
					placeholder="사업자 등록번호"></td>
			</tr>
			<tr>
				<td id="comnum_check"></td>
			</tr>
		</table>
		<table>
			<tr>
				<td colspan="2"><button id="reg_submit">가입</button></td>
			</tr>
		</table>
	</form>
</body>
</html>