<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/qanda_za.css">
</head>
<body>
	<table id="allQnA">
	<thead>
		<tr>
				<th>no</th>
				<th>제목</th>
				<th>날짜</th>
				<th>글쓴이</th>
			</tr>
			</thead>
			<tbody>
	<c:forEach var="q" items="${qandas }">
			<tr>
				<td>${q.q_no }</td>
				<td><a href="qanda.view?q_no=${q.q_no}">${q.q_title }</a></td>
				<td><fmt:formatDate value="${q.q_date }" pattern="yyyy-MM-dd" /></td>
				<td>${q.q_writer }</td>
			</tr>
			<tr>
						 <c:forEach var="qr" items="${q.reply }">
						 <td class="ReQnA">:Re</td>
					<td class="ReQnA"><a href="qanda.view?qar_q_no=${qr.qar_q_no}" class="ReQnA">${qr.qar_q_title}</a></td>
							<td class="ReQnA">
						<fmt:formatDate value="${qr.qar_date }" pattern="yyyy-MM-dd"/></td>
					<td class="ReQnA">${qr.qar_q_writer}</td>
					</c:forEach>

				</tr>
			
			</c:forEach>
			</tbody>
		</table>	
	
	<a href="qanda.write" id="writeQ">글쓰기</a>
	
	
	 		<c:if test="${param.searchProduct eq null }">
	 	<table id="tbl_review3">
				<tr>
					<td id="r_pageTd" align="center">
	
					<a href="qanda.page.change?p=1">[맨처음]</a>
	
					<c:forEach var="p" begin="1" end="${allPageCount }">
					<a href="qanda.page.change?p=${p }">[${p }]</a>
					</c:forEach>
					
					<a href="qanda.page.change?p=${allPageCount }">[맨끝]</a>
					
					</td>
					
					
					
				</tr>
		</table>
	</c:if>
</body>
</html>