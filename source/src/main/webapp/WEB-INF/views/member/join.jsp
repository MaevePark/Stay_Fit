<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/member.css" type="text/css">
    
    
<section class="contact-form spad">
	<div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>회원가입</h2>
                        <div>
                        	<p>회원가입을 하시면 <b>STAY FIT</b>에서 제공하는 다양한 서비스를 이용하실 수 있습니다.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div>
            	<h3>정보입력</h3> 
            	<p>
            		<strong class="point-red">*</strong>
            		필수입력항목
            	</p>
            </div>
            <form class="member-form-join" action="#" method="post">
            	<div class="row">
            		<div>
            			<span><strong class="point-red">*</strong>이메일</span>
            		</div>
            		<div>
            			<input type="text" id="email1"><span class="dash">@</span>
            			<select id="email2">
            				<option>선택</option>
            				<option value="gmail.com">gmail.com</option>
            				<option value="naver.com">naver.com</option>
            				<option value="hanmail.net">hanmail.net</option>
            				<option value="daum.net">daum.net</option>
            				<option value="nate.com">nate.com</option>
            				<option value="hotmail.com">hotmail.com</option>
            				<option value="h">직접입력</option>
            			</select>
            		</div>
            		<div>
            			<span><strong class="point-red">*</strong>인증번호</span>
            		</div>
            		<div>
            			<button onclick="#" name="btnChk" class="check">인증번호 전송</button>
            		</div>
            		<div>
            			<span><strong class="point-red">*</strong>닉네임</span>
            			<input type="text" id="Username">
            		</div>
            		<div>
            			<span><strong class="point-red">*</strong>비밀번호</span>
            			<input type="text" id="pwd1">
            		</div>
            		<div>
            			<span><strong class="point-red">*</strong>비밀번호 확인</span>
            			<input type="text" id="pwd2">
            		</div>
            		<div>
            			<button type="button">취소</button>
            			<button type="submit">확인</button>
            		</div>
            	</div>
            </form>
        </div>
	</div>
</section>