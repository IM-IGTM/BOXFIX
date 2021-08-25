<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/home_za.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
</head>
<body>
	<header>
		<a id="boxfix" href="home.go"><img class="logo"
			src="resources/img/fipro1.jpg"></a>
		<table id="loginArea">
			<tr>
				<td><jsp:include page="${loginPage}"></jsp:include></td>
			</tr>
		</table>
	</header>
	<nav>
		<ul>
		<c:if test="${sessionScope.companyLoginMember.c_id != Empty}">
			<li class="mainH"><a href="shopReg.go"id="a1">쇼핑몰등록</a></li></c:if>
			<li class="mainH"><a href="home.go"id="a2">택배 조회</a></li>
			<c:if test="${sessionScope.loginMember.b_id eq 'nyanya'}">
			<li class="mainH"><a
				href="diary.do?year_category=year&month_category=eight"id="a3">다이어리</a></li></c:if>
			<c:if test="${sessionScope.loginMember.b_id eq 'admin'}">
			<li class="mainH"><a href="shopReg.getAll.go"id="a4">쇼핑몰등록 확인</a></li></c:if>
			<!-- 위에 2개 아직 css 안됨! -->
			<li class="mainH"><a href="reservation.go" id="a5">택배 예약 시스템</a></li>
			<li class="mainH"><a href="qanda.home" id="a6">Q&A</a></li>
			<li class="mainH"><a href="courierList.get" id="a7">택배사</a></li>
		</ul>

	</nav>
	<hr>

	<table id="site">
		<tr>
			<td><jsp:include page="${contentPage}"></jsp:include></td>
		</tr>
	</table>

	<!-- 주아야 여기가 추가된 부분이야/사진보낸 부분 -->
	<table id="boxfix">
		<tr>
			<td>
				<h2>BOXFIX</h2>
			</td>
			<td>오시는 길 : 서울시 중구<br> TEL : 02-3434-3434 | FAX :
				02-3403-2323 | E-Mail : boxfix@gmail.com <br> Copyrightⓒ2021
				boxfix Co.,Ltd. All rights reserved
			</td>
			<td><a
				href="https://map.kakao.com/link/to/솔데스크,37.56949555658729, 126.98599586837359"><img
					src="resources/img/kakao_map.png" style="max-width: 50px"></a></td>
		</tr>
	</table>

</body>
</html>