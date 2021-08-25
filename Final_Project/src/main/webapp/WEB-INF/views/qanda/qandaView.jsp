<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/qandaView_za.css">
<head>
<script>
function del(no) {
	let ok = confirm('삭제하시겠습니까?')
	if(ok){
		location.href="qanda.del.do?q_no="+no;
	}
}
function del2(no) {
	let ok = confirm('삭제하시겠습니까?')
	if(ok){
		location.href="qandaR.del.do?qar_q_no="+no;
	}
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/qandaView_za.css">
</head>
<body>
	<table id="QView">
		<tr>
			<td>no</td>
			<td>
			<c:if test="${qq.qar_q_comment eq null}">
			${q.q_no}
			</c:if>
			<c:if test="${qq.qar_q_comment ne null}">re</c:if>
			</td>
		</tr>
		<tr>
			<td>날짜</td>
			<td><fmt:formatDate value="${q.q_date }" pattern="yyyy-MM-dd" />
				<fmt:formatDate value="${qq.qar_date }" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${q.q_title }${qq.qar_q_title}</td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td>${q.q_writer }${qq.qar_q_writer}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${q.q_contents }${qq.qar_q_comment}</td>
		</tr>


	</table>
	<div>
	
		<button onclick="location.href='qanda.home'">목록</button>
		<c:if test="${sessionScope.loginMember.b_id eq q.q_writer }">
			<button onclick="location.href='qanda.update.go?q_no=${q.q_no}'">수정</button>
		</c:if>
		<!-- admin 삭제 버튼 -->
		<c:if test="${sessionScope.loginMember.b_id eq qq.qar_q_writer}">
			<button onclick="del2(${qq.qar_q_no})">삭제</button>
		</c:if>
		<c:if test="${sessionScope.loginMember.b_id eq q.q_writer }">
			<button onclick="del(${q.q_no})">삭제</button>
		</c:if>
		<c:if test="${sessionScope.loginMember.b_id eq 'admin'}">
			<button onclick="location.href='qanda.reply.do?qar_q_no=${q.q_no}'">답글</button>
		</c:if>
	</div>
</body>
</html>