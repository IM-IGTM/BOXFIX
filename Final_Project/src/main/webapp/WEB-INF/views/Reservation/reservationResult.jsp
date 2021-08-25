<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/reservationResult_za.css">
</head>
<body>


<!-- 검색 기능 있어야됨 / 정렬 기능도 필요 / 같이 등록한 상품은 같이 조회가 되도록 해야됨 (서브 쿼리로 연결 필요) -->

	<table id="result">
		<tr>
			<td class="reh2">받는 분 정보</td>
		</tr>
		<tr>
			<td class="resultTd">
		
받는 분 성함 : ${param.receiver_name }<br>
받는 분 번호 :${param.receiver_phone }<br>
받는 분 주소 : ${param.receiver_addr }<br>
<hr>

	</td>
		</tr>
	</table>
	<table id="result2">
		<tr>
			<td class="reh2">보내는 상품</td>
		</tr>
		<tr>
			<td id="result2">
			
보내시는 상품명 : ${param.product_name }<br>
보내시는 상품의 가격 : ${param.product_price }<br>
보내시는 상품의 부피 : ${param.product_volume1 }<br>
상품 상자 크기 : ${param.product_volume2 }<br>
특이사항 기재 : ${param.product_uniqueness }<br>
방문 신청 일자 : ${param.register_date }<br>
<hr>

	</td>
		</tr>
	</table> 
	
<body>
</html>