<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/diary_za.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
$(function() {
    let d1 = $("#d1").val();
   d1 = parseInt(d1);
   let d2 = $("#d2").val();
   d2 = parseInt(d2);
   let d3 = $("#d3").val();
   d3 = parseInt(d3);
   let d4 = $("#d4").val();
   d4 = parseInt(d4); 
   
  google.charts.load('current', {packages: ['corechart']});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
     var data = new google.visualization.DataTable();
     data.addColumn('string', 'Topping');
     data.addColumn('number', '지출액');
     
     data.addRows([
                   ['5월', d4],
                   ['6월', d3],
                   ['7월', d2],
                   ['8월', d1]
                  
                  ]);
     var options = {'title':'월별 지출 금액',
              'width':800,
              'height':300,
              'colors' : ['#9acedf', '#9acedf', '#f3b49f', '#f6c7b6']
   
     };
     
     var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
     chart.draw(data, options);
  }
});
</script>



</head>



<body>

	<form action="diary.do" >
		<table>
			<tr>
				<td><select name="year_category">
						<option value="year">2021년</option>
				</select></td>
				<td>
				<select name="month_category">
						<option value="eight" <c:if test="${param.month_category == 'eight'}">selected='selected'</c:if> >8월</option>
						<option value="seven" <c:if test="${param.month_category == 'seven'}">selected='selected'</c:if> >7월</option>
						<option value="six" <c:if test="${param.month_category == 'six'}">selected='selected'</c:if> >6월</option>
						<option value="five" <c:if test="${param.month_category == 'five'}">selected='selected'</c:if> >5월</option>
				</select></td>
				<td><button>조회하기</button></td>
			</tr>
		</table>
	</form>

		
			<div id="chart_div"></div>
		<input type="hidden" id="d1" value="${sumPrice8}">
		<input type="hidden"  id="d2" value="${sumPrice7}">
		<input type="hidden"  id="d3" value="${sumPrice6}">
		<input type="hidden"  id="d4" value="${sumPrice5}">
	
	
	<c:if test="${param.month_category eq 'eight'}">
		<span>${sumPrice8}원</span>
	</c:if>
	<c:if test="${param.month_category eq 'six'}">
		<span>${sumPrice6}원</span>
	</c:if>	
	<c:if test="${param.month_category eq 'seven'}">
		<span>${sumPrice7}원</span>
	</c:if>
	<c:if test="${param.month_category eq 'five'}">
		<span>${sumPrice5}원</span>
	</c:if>	
	
			<table width="800px" id="itibang">
			<tr>
			<td>
			이번달에 가장 많이 이용한 쇼핑몰
			</td>
			</tr>
			<c:if test="${rank != null }">
			<tr> 
			<td width="600px">
					${rank.h_shopName } <br>
					${rank.h_productSum }원 <br>
			</td>	 	
			</tr>
			</c:if>
			</table>



	

	<c:forEach var="s" items="${shops }"> 
			<table width="800px" id="shop123">
			<tr> 
			<td><img src="resources/img/${s.h_file }" style="max-width: 100px"></td>
			<td width="600px">	${s.h_shopName } <br>
					${s.h_productName } <br>
					${s.h_productSum }원 <br>
					<fmt:formatDate value="${s.h_date }" pattern="yyyy-MM-dd"/> <br>
			</td>	 	
			</tr>
			</table>
	</c:forEach>



	<c:if test="${param.month_category eq 'eight'}">
 	<table id="tbl_review3">
			<tr>
				<td id="r_pageTd" align="center">

				<a href="diary.page.change?p=1&month_category=eight">[맨처음]</a>

				<c:forEach var="p" begin="1" end="${allPageCount }">
				<a href="diary.page.change?p=${p }&month_category=eight">[${p }]</a>
				</c:forEach>
				<a href="diary.page.change?p=${allPageCount }&month_category=eight">[맨끝]</a>
				
				</td>
			</tr>
	</table>
	</c:if>
		
	<c:if test="${param.month_category eq 'seven'}">
 	<table id="tbl_review3">
			<tr>
				<td id="r_pageTd" align="center">

				<a href="diary.page.change?p=1&month_category=seven">[맨처음]</a>

				<c:forEach var="p" begin="1" end="${allPageCount }">
				<a href="diary.page.change?p=${p }&month_category=seven">[${p }]</a>
				</c:forEach>
				<a href="diary.page.change?p=${allPageCount }&month_category=seven">[맨끝]</a>
				
				</td>
			</tr>
	</table>
	</c:if>

	<c:if test="${param.month_category eq 'six'}">
 	<table id="tbl_review3">
			<tr>
				<td id="r_pageTd" align="center">

				<a href="diary.page.change?p=1&month_category=six">[맨처음]</a>

				<c:forEach var="p" begin="1" end="${allPageCount }">
				<a href="diary.page.change?p=${p }&month_category=six">[${p }]</a>
				</c:forEach>
				<a href="diary.page.change?p=${allPageCount }&month_category=six">[맨끝]</a>
				
				</td>
			</tr>
	</table>
	</c:if>

	
	<c:if test="${param.month_category eq 'five'}">
 	<table id="tbl_review3">
			<tr>
				<td id="r_pageTd" align="center">

				<a href="diary.page.change?p=1&month_category=five">[맨처음]</a>

				<c:forEach var="p" begin="1" end="${allPageCount }">
				<a href="diary.page.change?p=${p }&month_category=five">[${p }]</a>
				</c:forEach>
				<a href="diary.page.change?p=${allPageCount }&month_category=five">[맨끝]</a>
				
				</td>
			</tr>
	</table>
	</c:if>






















</body>
</html>