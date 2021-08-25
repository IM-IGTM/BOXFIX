<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/info_za.css">
<script type="text/javascript" src="resources/js/join.js"></script>
<script type="text/javascript" src="resources/js/member.js"></script>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<form name="joinForm" action="member.update" method="post">
		<table id="memberinfo">
			<tr>
				<td colspan="5" id="MemberInfo"><b>회원정보</b></td>
			</tr>
			<tr>
				<td class="memInfo">아이디</td>
				<td><input name="b_id" value="${sessionScope.loginMember.b_id }" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="memInfo">비밀번호</td>
				<td><input type="password" name="b_pw" id="b_pw" value="${sessionScope.loginMember.b_pw }"></td>
			</tr>
			<tr>
				<td id="pw_check1"></td>
			</tr>
			<tr>
				<td class="memInfo">비밀번호 확인</td>
				<td><input type="password" name="b_pw2" id="b_pw2"></td>
			</tr>
			<tr>
				<td id="pw_check2"></td>
			</tr>
			<tr>
				<td class="memInfo">이름</td>
				<td><input name="b_name" value="${sessionScope.loginMember.b_name }"></td>
			</tr>

				<tr>
				<td class="memInfo">이메일</td>
				<td><input name="b_mail1" value="${mail[0] }"></td>
				<td>@</td>
				<td><input id="b_mail2" name="b_mail2" value="${mail[1] }"></td>
				<td>
				<select id="b_mail3" onchange="selectMail()">
				<option >이메일 선택</option>
				<option>naver.com</option>
				<option>gmail.com</option>
				<option>nate.com</option>
				<option>hanmail.net</option>
				<option>직접입력</option>
				</select>
				</td>
			</tr>
			<tr>
				<td class="memInfo">주소</td>
				<td colspan="4">
				<input name="b_addr1" id="b_addr1" value="${addr[0] }" onclick="address()" placeholder="우편번호">
				<input type="button" onclick="address()" value="우편번호"><br>
				<input name="b_addr2" id="b_addr2" value="${addr[1] }" placeholder="도로명주소">
				<input name="b_addr3" id="b_addr3" value="${addr[2] }" placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input name="b_addr4" id="b_addr4" value="${addr[3] }" placeholder="상세주소">
				<input name="b_addr5" id="b_addr5" value="${addr[4] }" placeholder="참고항목">
				</td>
			</tr>			
			<tr>
				<td class="memInfo">연락처</td>
				<td><input name="b_phone" value="${sessionScope.loginMember.b_phone }"></td>
			</tr>
			<tr>
				<td id="phone_check"></td>
			</tr>			
			<tr>
				<td colspan="5">
				<button>수정</button>
				<button type="button" onclick="byebye()">탈퇴</button></td>
			</tr>
		</table>
	</form>
</body>
</html>