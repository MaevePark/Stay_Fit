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
					<button type="button" class="btn btn-warning member-btn btn_kakao">
						<div class="btn-content">
							<img
								src="<%=request.getContextPath()%>/resources/img/user/ico_sns_kakao.png">
							<span>카카오톡으로 로그인</span>
						</div>
					</button>
				</div>
				<div class="login-button-box">
						<div id="naverIdLogin" class="btn-content btn btn-success member-btn btn_naver">
							<img
								src="<%=request.getContextPath()%>/resources/img/user/ico_sns_naver.png">
							<span>네이버로 로그인</span>
						</div>
				</div>
				<div class="login-button-box">
					<button type="button" class="btn member-btn btn_google">
						<div class="btn-content">
							<img
								src="<%=request.getContextPath()%>/resources/img/user/ico_sns_google.png">
							<span>구글로 로그인</span>
						</div>
					</button>
				</div>
				<div class="login-button-box">
					<a href="<%=request.getContextPath()%>/member/join">회원가입</a>
				</div>
			</div>
		</div>
		</form>
	</div>
</section>

<script type="text/javascript">
		$("#btnLogin").click(function(){
			var memail = $("#memail").val();
			var mpw = $("#mpw").val();
			var msg = "${msg}"
				if(msg!=""){
					alert(msg)
				}
			if(!memail){
				alert("이메일을 입력해주세요.");
				$("#memail").focus();
				return;
			}
			if(!mpw){
			alert("비밀번호를 입력해주세요.");
			$("#mpw").focus();
			return;
			}
			document.loginform.action="<%=request.getContextPath()%>/member/login";
			document.loginform.method="post";
			document.loginform.submit();
		})
	})
	
	
</script>
<<script>
	
</script>

<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript">
    var naverLogin = new naver.LoginWithNaverId(
        {
            clientId: "3WF51Ev5Mq2BJbhlLBD4",
              // 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
            callbackUrl: "http://localhost:8090/member/naverLogin",
              // 본인의 callBack url로 수정하세요.
            isPopup: false,
        }
    );
naverLogin.init();
</script>