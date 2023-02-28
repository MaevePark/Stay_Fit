<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/member.css"
	type="text/css">

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
		<div class="member-form">
			<div class="member-wrap">
				<div class="login-input-box">
					<input type="text" class="underline login-txt" name="memail"
						placeholder="이메일 입력">
				</div>
				<div class="login-input-box">
					<input type="text" class="underline login-txt" name="mpw"
						placeholder="비밀번호 입력">
				</div>
				<div class="login-button-box">
					<a href="<%=request.getContextPath()%>/pwfind">비밀번호 찾기</a>
				</div>
				<div class="login-button-box">
					<button type="submit" class="btn member-btn btn-success">
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
					<button type="button" class="btn btn-success member-btn btn_naver">
						<div class="btn-content">
							<img
								src="<%=request.getContextPath()%>/resources/img/user/ico_sns_naver.png">
							<span>네이버로 로그인</span>
						</div>
					</button>
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
					<a href="<%=request.getContextPath()%>/join">회원가입</a>
				</div>
			</div>
		</div>
	</div>
	</div>
</section>