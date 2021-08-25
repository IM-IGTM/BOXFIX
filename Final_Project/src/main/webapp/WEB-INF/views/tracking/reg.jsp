<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/reg_za.css">
<script type="text/javascript">
function regShop() {
	let ok=confirm('등록되었습니다. 관리자의 승인을 기다려주세요.');
	if (ok) {
		
		location.href="shopReg.do";
	
	}
}


	


</script> 



</head>
<body>


	<form action="shopReg.do" onsubmit="regShop()">
		<table>
			<tr>
				<td><select name="sp_category">
						<option value="">--필수입력--</option>
						<option value="coffee">커피</option>
						<option value="pet">펫</option>
						<option value="workout">운동</option>
						<option value="etc">기타</option>
				</select></td>
				<td><input type="text" name="sp_name"  placeholder="상호"></td>
				<td><button>등록</button></td>
			</tr>
		</table>
	</form>

	




</body>
</html>