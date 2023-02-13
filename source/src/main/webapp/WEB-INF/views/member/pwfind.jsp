<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/member.css" type="text/css">
    
<section class="contact-form spad">
	<div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>비밀번호 찾기</h2>
                        <div>
                        	<p>입력하신 이메일로 임시 비밀번호를 전송해드립니다. 이메일을 입력해주세요.</p>
                        </div>
                    </div>
                </div>
            </div>
            <form class="member-form-pwfind" action="#">
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
                	
                </div>
            </form>
        </div>
	</div>
</section>