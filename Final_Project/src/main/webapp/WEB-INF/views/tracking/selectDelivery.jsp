<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="h" items="${historys }">
${h.h_deliveryCode}
${h.h_deliveryNumber}
</c:forEach>

<!-- 이 페이지는 아마 css 안 해도 될 거야  -->

<form action="http://info.sweettracker.co.kr/tracking/5" method="post">
            <div class="form-group">
              <!-- <label for="t_key">API key</label> -->
              <input type="hidden" class="form-control" id="t_key" name="t_key" value="EbuuJp60KZbdnKNZ80xQSg">
            </div>
            <div class="form-group">
              <label for="t_code">택배사 코드</label>
              <input type="text" class="form-control" name="t_code" id="t_code" value="04" readonly="readonly">
            </div>
            <div class="form-group">	
              <label for="t_invoice">운송장 번호</label>
             <input type="text" class="form-control" name="t_invoice" id="t_invoice" value="${h.h_deliveryNumber }">
            </div>
            <button type="submit" class="btn btn-default">조회하기</button>
        </form>
</body>
</html>