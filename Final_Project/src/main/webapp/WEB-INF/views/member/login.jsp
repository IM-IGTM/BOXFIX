<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/login_za.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script type="text/javascript" src="resources/js/member.js"></script>
<script type="text/javascript" src="resources/js/socialLogin.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript">
	Kakao.init('9ce00d52bfdafca3f0d312fec0056b7b'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오로그인
	function kakaoLogin() {
		Kakao.Auth.login({
			scope : 'profile_nickname, account_email, gender',
			success : function(response) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
						console.log(response)
					},
					fail : function(error) {
						console.log(error)
					},
				})
			},
			fail : function(error) {
				console.log(error)
			},
		})
	}
	function kakaoLogout() {
		if (Kakao.Auth.getAccessToken()) {
			Kakao.API.request({
				url : '/v1/user/unlink',
				success : function(response) {
					console.log(response)
				},
				fail : function(error) {
					console.log(error)
				},
			})
			Kakao.Auth.setAccessToken(undefined)
		}
	}
</script>
<script type="text/javascript">
<!-- 네이버 스크립트 -->
	function naverLogin() {
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "eeR_yxFkPXPON42ufsBp", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl : "http://localhost/boxfix/", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup : false,
			callbackHandle : true
		});

		naverLogin.init();

		window.addEventListener('load', function() {
			naverLogin.getLoginStatus(function(status) {
				if (status) {
					var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.

					console.log(naverLogin.user);

					if (email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	}

	var testPopUp;
	function openPopUp() {
		testPopUp = window.open("https://nid.naver.com/nidlogin.logout",
				"_blank",
				"toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
	}
	function closePopUp() {
		testPopUp.close();
	}

	function naverLogout() {
		openPopUp();
		setTimeout(function() {
			closePopUp();
		}, 1000);

	}
</script>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript">
	$(function() {
		
		$("#loginbut").click(function() {
			let checkBox = $("#checkedCom").is(":checked");
			if(checkBox == true){
				$("#myForm").attr("action", "member.company.login")
				$("#b_id").attr("name", "c_id")
				$("#b_pw").attr("name", "c_pw")
			}else{
				$("#myForm").attr("action", "member.login")
				$("#b_id").attr("name", "b_id")
				$("#b_pw").attr("name", "b_pw")
			}
			$("#myForm").submit();
		});
	});
</script>
</head>
<body>
	<form name="loginForm" method="post" id="myForm">
	

		<table class="loginbox">
			<tr>
				<td class="idpw" colspan="2"><input id="b_id"
					placeholder="ID"></td>
			</tr>
			<tr>
				<td class="idpw" colspan="2"><input id="b_pw"
					type="password" placeholder="PW"></td>
			</tr>
			<tr>
				<td><input name="checkedCom" id="checkedCom" type="checkbox">기업
					로그인</td>
				<td><input name="autologin" type="checkbox">로그인 상태 유지</td>
			</tr>
			<tr>
				<td><button type="button" id="loginbut">로그인</button></td>
				<td><button id="joinbut" type="button" onclick="joinSelectGo()">회원가입</button></td>
				
			</tr>
			<tr>
				<td><button id="findId" type="button" onclick="findID1()">아이디찾기</button></td>
				<td><button id="findPw" type="button" onclick="findPW1()">비밀번호찾기</button></td>
			</tr>
		</table>
		<p>
		<table class="loginApi">
			<tr>
				<td>
					<button type="button" id="kakao" onclick="kakaoLogin()">카카오로
						로그인</button>
					<button type="button" id="naverIdLogin_loginButton"
						onclick="naverLogin()">네이버로 로그인</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>