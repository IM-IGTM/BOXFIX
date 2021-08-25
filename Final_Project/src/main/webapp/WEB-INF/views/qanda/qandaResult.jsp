<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/qandaResult_za.css">
</head>
<body>
<h2 id="Qresult">${r }</h2>
<a href="qanda.write" class="atag">새로운 글쓰기</a>
<a href="qanda.home" class="atag">목록으로</a>
<a href="qanda.view?q_no+"${q_no} class="atag"></a>
</body>
</html>