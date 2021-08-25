function joinSelectGo(){
	location.href='joinSelect.go';
}

function joinGo() {
	location.href='member.join.go';
}

function logout() {
	let ok = confirm('로그아웃 하시겠습니까?');
	if(ok){
		location.href='member.logout';
	}
}

function memberInfoGo() {
	location.href='member.info.go';
}

function byebye() {
	if(confirm('정말 탈퇴 하시겠습니까??')){
		location.href='member.bye';
	}
}

function joinCompany() {
	location.href='member.company.join.go';	
}

function companyInfoGo() {
	location.href='member.company.info.go';
}

function byebyeCom() {
	if(confirm('정말 탈퇴 하시겠습니까??')){
		location.href='member.company.bye';
	}
}

function findID1() {
	var findIdPopup = window.open('member.id.find.go','','width=550px, height=300px');
}

function findPW1() {
	var findPwPopup = window.open('member.pw.find.go','','width=550px, height=300px');
}

function closeFindId(){
	self.close();
}

function closeFindPw(){
	self.close();
}