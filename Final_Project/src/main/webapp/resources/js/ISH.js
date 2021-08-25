
function cAll() {
            if ($("#checkAll").is(':checked')) {
                $("input[type=checkbox]").prop("checked", true);
            } else {
                $("input[type=checkbox]").prop("checked", false);
            }
        }


function CheckForm(agree){
	
	
var chk1=document.frmJoin.c1.checked;
var chk2=document.frmJoin.c2.checked;
var chk3=document.frmJoin.c3.checked;


    if(!chk1){
            alert('약관1에 동의해 주세요');
            return false;
        } 
        if(!chk2) {
            alert('약관2에 동의해 주세요');
            return false;
        }if(!chk3) {
            alert('약관3에 동의해 주세요');
            return false;
}


}

function reservation2(){
	
	var ch1 = document.ReservationForm.receiver_name;
	var ch2 = document.ReservationForm.receiver_phone;
	var ch3 = document.ReservationForm.receiver_post;
	var ch4 = document.ReservationForm.product_name;
	var chk1 = document.ReservationForm.c1.checked;
	var ch5 = document.ReservationForm.product_price;
	var ch6 = document.ReservationForm.product_volume1;
	var ch7 = document.ReservationForm.product_uniqueness;
	var ch8 = document.ReservationForm.register_date;

if(ch1.value == '' || ch1.value == null ){
    alert( '받으시는 분 이름을 입력해주세요.' );
   return false;
}if(ch2.value == '' || ch2.value == null ){
    alert( '받으시는 분 번호를 입력해주세요.' );
    return false;
}if(ch3.value == '' || ch3.value == null ){
    alert( '받으시는 분 주소를 입력해주세요.' );
    return false;
}if(ch4.value == '' || ch4.value == null ){
    alert( '상품 이름을 입력해주세요.' );
    return false;
} if(!chk1){
            alert('약관에 동의해 주세요');
            return false;
}if(ch5.value == '' || ch5.value == null ){
    alert( '상품 가격을 써주세요.' );
    return false;
}if(ch6.value == '' || ch6.value == null ){
    alert( '상품 부피를 선택해주세요.' );
    return false;
}if(ch7.value == '' || ch7.value == null ){
    alert( '특이사항을 기재해주세요.');
    return false;
}if(ch8.value == '' || ch8.value == null ){
    alert( '방문 날짜를 선택해주세요.' );
    return false;
}
}


function QandA(){
	
	var ch1 = document.QandAform.qanda_title;
	var ch2 = document.QandAform.qanda_contents;
	var ch3 = document.QandAform.qanda_pw;
	
	if(ch1.value == '' || ch1.value == null ){
    alert( '제목을 입력해주세요.' );
    return false;
	}if(ch2.value == '' || ch2.value == null ){
    alert( '내용을 입력해주세요.' );
    return false;
	}  

}

function QandA22(){
	
	var ch1 = document.QandAform.q_title;
	var ch2 = document.QandAform.q_contents;
	
	if(ch1.value == '' || ch1.value == null ){
    alert( '제목을 입력해주세요.' );
    return false;
	}if(ch2.value == '' || ch2.value == null ){
    alert( '내용을 입력해주세요.' );
    return false;
	}  

}
