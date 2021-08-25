//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{8,12}$/; 
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	// 회사이름 정규식
	var comnameJ = /^[A-Za-z가-힣0-9]{1,20}$/;
	// 사업자번호 정규식
	var comnumJ = /^[0-9]{10}$/;
// 주소 api
function address() {
    new daum.Postcode({
    oncomplete: function(data) {

        var roadAddr = data.roadAddress; // 도로명 주소 변수
        var extraRoadAddr = ''; // 참고 항목 변수

        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
            extraRoadAddr += data.bname;
        }
        if(data.buildingName !== '' && data.apartment === 'Y'){
           extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        if(extraRoadAddr !== ''){
            extraRoadAddr = ' (' + extraRoadAddr + ')';
        }

        document.getElementById("b_addr1").value = data.zonecode;
        document.getElementById("b_addr2").value = roadAddr;
        document.getElementById("b_addr3").value = data.jibunAddress;
        
        if(roadAddr !== ''){
            document.getElementById("b_addr5").value = extraRoadAddr;
        } else {
            document.getElementById("b_addr5").value = '';
        }

    }
}).open();
}

// 이메일 선택	
function selectMail() {
	if(document.getElementById("b_mail3").value == "directly") {
		document.getElementById("b_mail2").value = "";
		document.getElementById("b_mail2").focus;
	} else{
		document.getElementById("b_mail2").value = document.getElementById("b_mail3").value;
	}
}

// 메일 인증 팝업
function emailSend(){
	let n = document.getElementById("b_mail1").value;
	let m = document.getElementById("b_mail2").value;

	if(n == '' || m == ''){
		alert('메일주소를 입력하세요')
		return false;
	} else{
	var popup = window.open('mail.send.go?mail=' + n + '@' + m, 'popup','width=550px, height=300px');
	}
}

// 메일 인증 번호 확인 
function numberConfirm(){
	let n = document.getElementById("numberOfConfirm").value;	
	location.href='mail.confirm.do?numberConfirm=' + n;
	
}

// 기업 메일 인증
function companyEmailSend(){
	let nn = document.getElementById("c_mail").value;
	
	if(nn ==''){
		alert('메일 주소를 입력하세요');
		return false;		
	} else { 
		var popup = window.open('mail.send.go?mail=' + nn, 'popup', 'width=550px, height=300px');
	}
}

// 개인 회원 메일 인증 완료
function finishMailCheck() {
	self.close();
} 


 



		