<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/member.css"
	type="text/css">

<section class="contact-form spad">
	<div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="contact__form__title">
						<h2 class="txt-h2">비밀번호 찾기</h2>
						<div>
							<p>입력하신 이메일로 임시 비밀번호를 전송해드립니다. 이메일을 입력해주세요.</p>
						</div>
					</div>
				</div>
			</div>
			<form class="member-form" action="#">
				<div class="member-wrap">
					<div class="col-md-12">
						<span>이메일</span> <input type="text" class="input-box" id="email1"
							placeholder="email@stayfit.com">
					</div>
					<div class="col-md-12">
						<button class="member-btn btn btn-success">확인</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>