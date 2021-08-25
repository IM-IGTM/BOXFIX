<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="resources/css/reservationForm_za.css">
<link rel="stylesheet" href="resources/css/reservation.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/ISH.js"></script>
<script>
	function findAddr() {
		new daum.Postcode(
				{
					oncomplete : function(data) {

						console.log(data);
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var jibunAddr = data.jibunAddress; // 지번 주소 변수
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('receiver_post').value = data.zonecode;
						if (roadAddr !== '') {
							document.getElementById("receiver_addr").value = roadAddr;
						} else if (jibunAddr !== '') {
							document.getElementById("receiver_detail_addr").value = jibunAddr;
						}
					}
				}).open();
	}
</script>
<script>
	function findAddr2() {
		new daum.Postcode(
				{
					oncomplete : function(data) {

						console.log(data);
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var jibunAddr = data.jibunAddress; // 지번 주소 변수
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sender_post').value = data.zonecode;
						if (roadAddr !== '') {
							document.getElementById("sender_addr").value = roadAddr;
						} else if (jibunAddr !== '') {
							document.getElementById("sender_detail_addr").value = jibunAddr;
						}
					}
				}).open();
	}
</script>
<script>
	$(function() {
		$('.trigger').on('click', function() {
			$('.modal-wrapper').toggleClass('open');
			$('.page-wrapper').toggleClass('blur-it');
			return false;
		});
	});
</script>
</head>

<body>
	<h1 class="reserva2">택배 예약 시스템</h1>
	<table class="reserva2">
		<tr>
			<td id="h2"><h2>개인택배예약</h2></td>
		</tr>
	</table>
	<form id="ReservationForm" name="ReservationForm"
		action="reservation.form" onsubmit="return reservation2();">
		<table class="reserva2">
			<tr>
				<td class="toptd">STEP 02<br> 개인정보 수집 및 이용 안내
				</td>
			</tr>
		</table>
		<table class="tb1"
			style="border: 2px solid #9acedf; border-radius: 10px;">
			<tr>
				<td class="std">수집 항목*[필수]</td>
				<td class="sltd">보내는 분/받는 분의 이름, 연락처(휴대폰번호 또는 전화번호), 주소</td>
			</tr>
			<tr>
				<td class="std">수집 및 이용 목적</td>
				<td class="sltd">배송 서비스 제공 계약, 서비스 고객 본인 확인, <br> 물품 배송,
					요금 결제, 화물사고 처리 및 배상
				</td>
			</tr>
			<tr>
				<td class="std">보유 및 이용기간</td>
				<td class="sltd">배송 서비스 제공 및 요금 결제/정산 완료 후 5년(법정 보존 기간)</td>
			</tr>
		</table>
		<table class="tb1"
			style="border: 2px solid #9acedf; border-radius: 10px;">
			<tr>
				<td class="std">수집 항목 [선택]</td>
				<td class="sltd">보내는 분의 이메일, 비밀번호</td>
			</tr>
			<tr>
				<td class="std">수집 및 이용 목적</td>
				<td class="sltd">홈페이지를 통한 택배 예약확인 및 취소 서비스 제공</td>
			</tr>
			<tr>
				<td class="std">보유 및 이용기간</td>
				<td class="sltd">예약 접수 및 처리 후 3개월, 소비자 불만/분쟁 처리 후 3년(법정 보존 기간)</td>
			</tr>
		</table>

		<table style="margin-bottom: 9px">
			<tr>
				<td class="toptd">STEP 03<br>보내는 분, 받는 분, 상품 정보 입력
				</td>
			</tr>
		</table>
		<table class="tb1"
			style="border: 2px solid #9acedf; border-radius: 10px; height: 350px">
			<tr>
				<td id="gong"><h3>예약 시 참고사항</h3> <br> - 방문일정 : 접수일자 +
					1일(영업일 기준) 일요일‚ 공휴일은 방문하지 않습니다.<br> <br> - 취급주의상품은 보호재포장을
					필요로 하며 신청상품에 따라 예약 취소 할 수 있습니다.<br> <br> - 상품인수를 위한 방문
					희망일은 해당 집배점의 사정에 따라 변동될 수 있습니다.<br> <br> - 오전/오후 및 특정시간을
					지정하여 방문 요청하실 경우 반영되지 않습니다.<br> <br>(예: 오전에 꼭 와주세요. 오후에만
					사람이 있습니다. 2∼3시경 방문요망 등)<br> <br> - 택배기사 방문이 2∼3일 지연되는 경우
					및 방문시간 확인은 관할 집배점이나 고객센터(1588-1255)로 문의바랍니다.<br></td>
			</tr>
		</table>
		<hr>
		<table>
			<tr>
				<td><h2>택배 신청서 작성</h2></td>
			</tr>
		</table>
		<table class="totaku">
			<tr>
				<td class="from">보내는 분</td>
			</tr>
			<tr>
				<td class="sm">보내시는 고객님의 정보를 정확하게 입력해주세요.</td>
			</tr>
		</table>
		<table id="SenderInformation">

			<tr>
				<td class="namep">이름</td>
				<td><input class="input1" type="text" name="sender_name"
					value="${sessionScope.loginMember.b_name }"></td>
			</tr>
			<tr>
				<td class="namep">휴대폰 번호</td>
				<td><input class="input1" type="text" name="sender_phone"
					value="${sessionScope.loginMember.b_phone }">
			</tr>
			<tr>
				<td class="namep">주소</td>
				<td><input class="input1" name="sender_post"
					id="sender_post" type="text" placeholder="우편번호" readonly
					onclick="findAddr2()"> <br> <input class="input1"
					name="sender_addr" id="sender_addr" type="text" readonly
					placeholder="주소"> <br> <input class="input1"
					id="sender_detail_addr" name="sender_detail_addr" type="text"
					placeholder="상세주소"></td>
			</tr>
		</table>
		<table class="totaku">
			<tr>
				<td class="from">받으시는 분</td>
			</tr>
			<tr>
				<td class="sm">받으시는 고객님의 정보를 정확하게 입력해주세요.</td>
			</tr>
		</table>
		<table id="ReceiverInformation">
			<tr>
				<td class="namep">이름</td>
				<td><input class="input1" type="text" name="receiver_name"
					id="receiver_name"></td>
			</tr>
			<tr>
				<td class="namep">휴대폰 번호</td>
				<td><input class="input1" type="text" name="receiver_phone"
					id="receiver_phone">
			</tr>
			<tr>
				<td class="namep">주소</td>
				<td><input class="input1" name="receiver_post"
					id="receiver_post" type="text" placeholder="우편번호" readonly
					onclick="findAddr()"> <br> <input class="input1"
					name="receiver_addr" id="receiver_addr" type="text" readonly
					placeholder="주소"> <br> <input class="input1"
					id="receiver_detail_addr" name="receiver_detail_addr" type="text"
					placeholder="상세주소"></td>
			</tr>
		</table>
		<table id="productInformation">
			<tr>
				<td class="from">상품 정보 - 상품정보를 정확하게 입력해주세요.</td>
			</tr>
		</table>
		<!-- Button -->
		<div class="page-wrapper">
			<a class="btn trigger" href="#">상품 정보 유의사항 보기 ></a>
			<p>
				<input type="checkbox" name="c1" class="normal"><label
					for="c1" class="normal">유의사항 안내를 확인하였으며 이에 동의합니다.</label> <br>
			<div class="lastbox">
				상품명&nbsp;&nbsp;&nbsp; <input type="text" name="product_name"
					id="product_name">
			</div>
			<br>

			<div class="lastbox">
				상품가격 &nbsp;&nbsp;&nbsp;<input type="text" name="product_price"
					id="product_price"> &nbsp;&nbsp;원
			</div>
			<br>

			<div class="lastbox">
				상품부피&nbsp;&nbsp;&nbsp; <select name="product_volume1"
					id="product_volume1">
					<option value="">선택</option>
					<option value="극소">극소</option>
					<option value="소">소</option>
					<option value="중">중</option>
					<option value="대">대</option>
				</select>
			</div>
			<br>

			<div class="lastbox">
				특이사항 기재&nbsp;&nbsp;&nbsp; <input type="text"
					name="product_uniqueness" id="product_uniqueness" maxlength='8' placeholder="8글자 이내(공백 포함)">
			</div>
			<br>
			<div class="lastbox">
				방문희망일&nbsp;&nbsp;&nbsp; <input type="date" name="register_date"
					id="register_date">
			</div>
			<br>

			<div class="lastbox">
				결제방식&nbsp; &nbsp;&nbsp;<select name="product_volume2">
					<option value="선불">선불</option>
					<option value="후불">후불</option>
				</select>
			</div>
			<br>
			<button id="reserOk">예약 신청하기</button>
		</div>
	</form>



	<!-- Modal -->
	<div class="modal-wrapper">
		<div class="modal">
			<div class="head">
				<a class="btn-close trigger" href="#"> <i class="fa fa-times"
					aria-hidden="true">X</i>
				</a>
			</div>
			<div
				style="text-align: center; font-family: Iro; visibility: visible; height: 200px; width: 98%; border: 2px solid #9acedf; border-radius: 4px; margin: 5px 5px 5px 5px;">
				<div style="overflow: scroll;" "class="content">
					<div class="good-job" style="height: 183px;">
						<i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 상품정보 상품정보를
						정확하게 입력해주세요.
						<hr>
						고객이 선택한 운임과 실제 상품정보(상품, 무게, 박스타입)가 상이할 경우 운임변동이 발생할 수 있으며, 취급 불가품에
						대해서는 집화가 거절 될 수 있습니다.
						<hr>

						1. 상품정보<br> - 상품명은 자세히 기재하여 주시기 바랍니다. (예: 의류, 도서, 신발, 키보드)<br>
						2. 상품가격<br> - 2박스 이상 예약하실 경우, 1박스당 상품가격을 기재하여 주시기 바랍니다.<br>
						- 보내는 상품의 가격이 1박스(Box)당 300만원을 초과할 경우, 택배 접수가 불가합니다.<br> 3.
						포장수량<br> - 최대 9개까지 가능합니다.<br> <br> <br> <br>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>