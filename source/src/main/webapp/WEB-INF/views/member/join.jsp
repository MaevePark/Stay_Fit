<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/member.css"
	type="text/css">


<section class="contact-form spad">
	<div class="container">
		<div class="col-lg-12 mx-auto">
			<div class="contact__form__title">
				<h2 class="txt-h2">회원가입</h2>
				<p>
					회원가입을 하시면 <b>STAY FIT</b>에서 제공하는 다양한 서비스를 이용하실 수 있습니다.
				</p>
			</div>
			<div class="input-form col-md-12 mx-auto">
				<form class="validation-form" novalidate>
					<div class="member-form">
						<div class="row join-wrap">
							<div class="col-md-9 join-input-box">
								<label for="email" class="form-label">이메일</label> <input
									type="text" id="email1" class="form-control"
									placeholder="email@stayfit.com" value="" required>
								<div class="invalid-feedback">이메일을 입력해주세요.</div>
							</div>
							<div class="col-md-3 join-button-box">
								<button onclick="#" name="btnChk"
									class="member-btn btn btn-success">
									<span class="btn-txt">인증번호 전송</span>
								</button>
							</div>
							<div class="col-md-9 join-input-box">
								<label for="email" class="form-label">인증번호</label> <input
									type="text" id="codenumber" class="form-control" value=""
									required>
								<div class="invalid-feedback">인증번호를 입력해주세요.</div>
							</div>
							<div class="col-md-9 join-input-box">
								<label for="email" class="form-label">닉네임</label> <input
									type="text" id="username" class="form-control" value=""
									required>
							</div>
							<div class="invalid-feedback">닉네임을 입력해주세요.</div>
							<div class="col-md-9 join-input-box">
								<label for="email" class="form-label">비밀번호</label> <input
									type="text" id="pwd1" class="form-control" value="" required>
							</div>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
							<div class="col-md-9 join-input-box">
								<label for="email" class="form-label">비밀번호 확인</label> <input
									type="text" id="pwd2" class="form-control" value="" required>
							</div>
							<div class="invalid-feedback">비밀번호와 일치하지 않습니다. 다시 입력해주세요.</div>
							<div class="col-md-6 text-lg-start join-button-box">
								<button class="member-btn btn btn-secondary">취소</button>
							</div>
							<div class="col-md-6 text-lg-end join-button-box">
								<button class="member-btn btn btn-success">확인</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>