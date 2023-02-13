<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/member.css" type="text/css">
    
<section class="contact-form spad">
	<div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>로그인</h2>
                        <div>
                        	<p>이메일과 비밀번호를 입력해주세요.</p>
                        </div>
                    </div>
                </div>
            </div>
            <form class="member-form-login" action="#">
                <div>
                    <div class="col-lg-6 col-md-6">
                        <input type="text" placeholder="이메일 입력">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <input type="text" placeholder="비밀번호 입력">
                    </div>
                    <div class="col-lg-3 text-center">
                    	<a href="<%=request.getContextPath()%>/pwfind">비밀번호 찾기</a>
                        <button type="submit" class="site-btn">로그인</button>
                        <button type="button">카카오톡으로 로그인</button>
						<button type="button">네이버로 로그인</button>
						<button type="button">구글로 로그인</button>
						<a href="<%=request.getContextPath()%>/join">회원가입</a>
                    </div>
                </div>
            </form>
        </div>
	</div>
</section>