<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/tracking_za.css">
<script type="text/javascript">
/* function regShop() {
	let ok=confirm('등록되었습니다. 관리자의 승인을 기다려주세요.');
	if (ok) {
		
		location.href="shopReg.do";
	
	}
}
 */

function productPageChange(page){
	location.href="product.page.change?p=" + page;
}
	
	
	


</script> 




</head>
<body>


<h1> 택배 조회 </h1>



	
	

<!-- 주아야 이거는 검색창 -->	
		<form action="search.product" id="search">
				<table>
				<tr>
					<td>	
					<select name="searchProduct">
							<option value="productName" <c:if test="${param.searchProduct == 'productName'}">selected='selected'</c:if> >상품명</option>
							<option value="shopName" <c:if test="${param.searchProduct == 'shopName'}">selected='selected'</c:if> >쇼핑몰명</option>
					</select>
					</td>
					<td><input type="text" name="search" value="${param.search }"></td>
					<td><button>검색</button></td>
				</tr>
			</table>
		</form>
	
	

<!-- 이거는 배송 조회 테이블 -->

<c:forEach var="s" items="${shops}"> 
	
		<c:if test="${s.h_deliveryCode eq '01'}">
		<form action="http://info.sweettracker.co.kr/tracking/4" method="post">
		<table width="800px">
		<tr> 
		<td><img src="resources/img/${s.h_file}" style="max-width: 100px"></td>
		<td width="600px">	${s.h_shopName} <br>
		 		<input type="hidden" name="h_shopName" value="${s.h_shopName }" > <br>
				${s.h_productName} <br>
				<input type="hidden" name="h_productName" value="${s.h_productName } " > <br>
				<fmt:formatDate value="${s.h_date}" pattern="yyyy-MM-dd"/> <br>
				<input type="hidden" name="h_date" value="${s.h_date } " > <br>
				우체국택배 /
				<input type="hidden" name="h_deliveryCode" value="${s.h_deliveryCode } " > 
			 	${s.h_deliveryNumber} 
			 	<input type="hidden" name="h_deliveryNumber" value="${s.h_deliveryNumber } " > 
			 	배송완료
		</td>	 	
		<td><button type="submit" class="btn btn-default">조회</button></td>
		</tr>
		



<!-- 이거는 조회버튼 누르면 나오는 기존 api라서 css 필요 없는 부분 -->

			<div class="form-group">
              <!-- <label for="t_key">API key</label> -->
              <input type="hidden" class="form-control" id="t_key" name="t_key" value="EbuuJp60KZbdnKNZ80xQSg">
            </div>
            <div class="form-group">
              <!-- <label for="t_code">택배사 코드</label> -->
              <input type="hidden" class="form-control" name="t_code" id="t_code" value="${s.h_deliveryCode }" >
            </div>
            <div class="form-group">	
              <!-- <label for="t_invoice">운송장 번호</label> -->
             <input type="hidden" class="form-control" name="t_invoice" id="t_invoice" value="${s.h_deliveryNumber }">
            </div>
</table>
</form>
</c:if>

<!-- --------------------------------------------------------------------------------------------- -->


<!-- 밑에는 c:if 조건문인데 위에랑 같은 거라서 (배송조회 테이블) id값 다 똑같이 주면 돼 -->
	
		<c:if test="${s.h_deliveryCode eq '04'}">
		<form action="http://info.sweettracker.co.kr/tracking/5" method="post">
		<table width="800px">
		<tr> 
		<td><img src="resources/img/${s.h_file }" style="max-width: 100px"></td>
		<td width="600px">	${s.h_shopName } <br>
		 		<input type="hidden" name="h_shopName" value="${s.h_shopName }" > <br>
				${s.h_productName } <br>
				<input type="hidden" name="h_productName" value="${s.h_productName } " > <br>
				<fmt:formatDate value="${s.h_date }" pattern="yyyy-MM-dd"/> <br>
				<input type="hidden" name="h_date" value="${s.h_date } " > <br>
				CJ대한통운 /
				<input type="hidden" name="h_deliveryCode" value="${s.h_deliveryCode } " > 
			 	${s.h_deliveryNumber } 
			 	<input type="hidden" name="h_deliveryNumber" value="${s.h_deliveryNumber } " > 
			 	배송완료
		</td>	 	
		<td><button type="submit" class="btn btn-default">조회</button></td>
		</tr>




<!-- 이거는 조회버튼 누르면 나오는 기존 api라서 css 필요 없는 부분 -->

			<div class="form-group">
              <!-- <label for="t_key">API key</label> -->
              <input type="hidden" class="form-control" id="t_key" name="t_key" value="EbuuJp60KZbdnKNZ80xQSg">
            </div>
            <div class="form-group">
              <!-- <label for="t_code">택배사 코드</label> -->
              <input type="hidden" class="form-control" name="t_code" id="t_code" value="${s.h_deliveryCode }" >
            </div>
            <div class="form-group">	
              <!-- <label for="t_invoice">운송장 번호</label> -->
             <input type="hidden" class="form-control" name="t_invoice" id="t_invoice" value="${s.h_deliveryNumber }">
            </div>
</table>
</form>
</c:if>




<!-- 밑에는 c:if 조건문인데 위에랑 같은 거라서 id값 다 똑같이 주면 돼 -->
		
		<c:if test="${s.h_deliveryCode eq '05'}">
		<form action="http://info.sweettracker.co.kr/tracking/5" method="post">
		<table width="800px">
		<tr> 
		<td><img src="resources/img/${s.h_file }" style="max-width: 100px"></td>
		<td width="600px">	${s.h_shopName } <br>
		 		<input type="hidden" name="h_shopName" value="${s.h_shopName }" > <br>
				${s.h_productName } <br>
				<input type="hidden" name="h_productName" value="${s.h_productName } " > <br>
				<fmt:formatDate value="${s.h_date }" pattern="yyyy-MM-dd"/> <br>
				<input type="hidden" name="h_date" value="${s.h_date } " > <br>
				한진택배 /
				<input type="hidden" name="h_deliveryCode" value="${s.h_deliveryCode } " > 
			 	${s.h_deliveryNumber } 
			 	<input type="hidden" name="h_deliveryNumber" value="${s.h_deliveryNumber } " > 
			 	배송완료
		</td>	 	
		<td><button type="submit" class="btn btn-default">조회</button></td>
		</tr>
		
		


<!-- 이거는 조회버튼 누르면 나오는 기존 api라서 css 필요 없는 부분 -->

			<div class="form-group">
              <!-- <label for="t_key">API key</label> -->
              <input type="hidden" class="form-control" id="t_key" name="t_key" value="EbuuJp60KZbdnKNZ80xQSg">
            </div>
            <div class="form-group">
              <!-- <label for="t_code">택배사 코드</label> -->
              <input type="hidden" class="form-control" name="t_code" id="t_code" value="${s.h_deliveryCode }" >
            </div>
            <div class="form-group">	
              <!-- <label for="t_invoice">운송장 번호</label> -->
             <input type="hidden" class="form-control" name="t_invoice" id="t_invoice" value="${s.h_deliveryNumber }">
            </div>
</table>
</form>
</c:if>


</c:forEach>


	<c:if test="${param.searchProduct eq null }">
	 	<table id="tbl_review3">
				<tr>
					<td id="r_pageTd" align="center">
	
					<a href="product.page.change?p=1">[맨처음]</a>
	
					<c:forEach var="p" begin="1" end="${allPageCount }">
					<a href="product.page.change?p=${p }">[${p }]</a>
					</c:forEach>
					
					<a href="product.page.change?p=${allPageCount }">[맨끝]</a>
					
					</td>
				</tr>
		</table>
	</c:if>

	<c:if test="${param.searchProduct eq 'productName'}">
	 	<table id="tbl_review3">
			<tr>
				<td id="r_pageTd" align="center">

				<a href="product.page.change?p=1&searchProduct=productName&search=${param.search }">[맨처음]</a>

				<c:forEach var="p" begin="1" end="${allPageCount }">
				<a href="product.page.change?p=${p }&searchProduct=productName&search=${param.search }">[${p }]</a>
				</c:forEach>
				
				<a href="product.page.change?p=${allPageCount }&searchProduct=productName&search=${param.search }">[맨끝]</a>
				
				</td>
			</tr>
		</table>
	</c:if>

	<c:if test="${param.searchProduct eq 'shopName'}">
	 	<table id="tbl_review3">
			<tr>
				<td id="r_pageTd" align="center">

				<a href="product.page.change?p=1&searchProduct=shopName&search=${param.search }">[맨처음]</a>

				<c:forEach var="p" begin="1" end="${allPageCount }">
				<a href="product.page.change?p=${p }&searchProduct=shopName&search=${param.search }">[${p }]</a>
				</c:forEach>
				
				<a href="product.page.change?p=${allPageCount }&searchProduct=shopName&search=${param.search }">[맨끝]</a>
				
				</td>
			</tr>
		</table>
	</c:if>


</body>
</html>