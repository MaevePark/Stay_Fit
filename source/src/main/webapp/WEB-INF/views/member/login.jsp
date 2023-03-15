<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section class="contact-form spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="contact__form__title">
					<h2 class="txt-h2">로그인</h2>
					<div>
						<p>이메일과 비밀번호를 입력해주세요.</p>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 로그인 정보 입력 폼 시작-->
		<form name="loginform">
		<div class="member-form">
			<div class="member-wrap">
				<div class="login-input-box">
					<input type="text" class="underline login-txt" id="memail" name="memail"
						placeholder="이메일 입력">
				</div>
				<div class="login-input-box">
					<input type="password" class="underline login-txt" id="mpw" name="mpw"
						placeholder="비밀번호 입력">
				</div>
				<div class="login-button-box">
					<a href="<%=request.getContextPath()%>/member/pwfind">비밀번호 찾기</a>
				</div>
				<div class="login-button-box">
					<button type="submit" id="btnLogin" class="btn member-btn btn-success">
						<span>로그인</span>
					</button>
				</div>
				<div class="login-button-box">
						<div onclick="kakaoLogin();" class="btn-content btn btn-warning member-btn btn_kakao">
							<a href="javascript:void(0)">
								<img
								src="<%=request.getContextPath()%>/resources/img/user/ico_sns_kakao.png">
								<span>카카오톡으로 로그인</span>
							</a>
						</div>
				</div>
				<div class="login-button-box">
						<div id="naverIdLogin_loginButton" class="btn-content btn btn-success member-btn btn_naver">
								<a href="javascript:void(0)">
									<img
									src="<%=request.getContextPath()%>/resources/img/user/ico_sns_naver.png">
									<span>네이버로 로그인</span>
								</a>
						</div>
				</div>
				<div class="login-button-box">
						<div id="GgCustomLogin" class="btn-content btn member-btn btn_google">
							<a href="javascript:void(0)">
								<img
								src="<%=request.getContextPath()%>/resources/img/user/ico_sns_google.png">
								<span>구글로 로그인</span>
							</a>
						</div>
				</div>
				<div class="login-button-box">
					<a href="<%=request.getContextPath()%>/member/join">회원가입</a>
				</div>
			</div>
		</div>
		</form>
		<!-- 로그인 정보 입력 폼 끝-->
	</div>
</section>

<script type="text/javascript">

//로그인
		$("#btnLogin").click(function(){
			var msg = "${msg}"
			var memail = $("#memail").val();
			var mpw = $("#mpw").val();
			
			if(!memail){
				alert("이메일을 입력해주세요.");
				$("#memail").focus();
				return false;
			}
			var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{2,3}$/;
			if (!emailRegExp.test(memail)) {
		        alert("이메일 형식이 올바르지 않습니다.");
		        $("#memail").focus();
		        return false;
		    }
			if(!mpw){
			alert("비밀번호를 입력해주세요.");
			$("#mpw").focus();
			return false;
			}
			if(msg!=""){
				alert(msg);
			}
			document.loginform.action="<%=request.getContextPath()%>/member/login";
			document.loginform.method="post";
			document.loginform.submit();
		});
	
	
</script>

<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type="text/javascript">
    var naverLogin = new naver.LoginWithNaverId(
        {
            clientId: "3WF51Ev5Mq2BJbhlLBD4",
              // 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
            callbackUrl: "http://localhost:8090/member/naverLogin",
              // 본인의 callBack url로 수정하세요.
            isPopup: false,
            callbackHandle: true
        }
    );
    
naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    		
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});

var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
}
</script>
<script>
Kakao.init('aa23d89c369fa7835b6a5a051d1cfdc4'); //발급받은  javascript키
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
</script>
<script>

//처음 실행하는 함수
function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	})
}

function onSignIn(googleUser) {
	var access_token = googleUser.getAuthResponse().access_token
	$.ajax({
    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
		url: 'https://people.googleapis.com/v1/people/me'
        // key에 자신의 API 키를 넣습니다.
		, data: {personFields:'birthdays', key:'AIzaSyBOdmeC4SOSzXmPGLEM2vZueqiBSWKg3wk', 'access_token': access_token}
		, method:'GET'
	})
	.done(function(e){
        //프로필을 가져온다.
		var profile = googleUser.getBasicProfile();
		console.log(profile)
	})
	.fail(function(e){
		console.log(e);
	})
}
function onSignInFailure(t){		
	console.log(t);
}
</script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>