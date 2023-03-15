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
						<span>이메일</span> <input type="text" class="input-box" id="email1" name="email1"
							placeholder="email@stayfit.com">
					</div>
					<div class="col-md-12">
						<input type="hidden" id="pwFindVal" value="0">
					</div>
					<div class="col-md-12">
						<button id="btnPwFind" class="member-btn btn btn-success">확인</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script>
$("#btnPwFind").click(function(){
	var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{2,3}$/;
	var email = $("#email1").val();
	var pwFindVal = $('#pwFindVal').val();
	if(!email){
		alert("이메일을 입력해주세요.");
		$("#email1").focus();
		return false;
	}if (!emailRegExp.test(email)) {
        alert("이메일 형식이 올바르지 않습니다.");
        $("#email1").focus();
        return false;
    }
	if(pwFindVal == 1) {
		$.ajax({
			type : 'post',
			url : 'sendpw',
			async: false,
			data : {
				memail : email
				},
			dataType : 'json',
			success : function (data) {
				console.log("data : " +  data);
				newpw = data;
				if(isNaN(newpw)) {
					alert("이메일 전송에 실패하였습니다. 다시 시도해주세요.");
				} else{
					alert("이메일이 전송되었습니다. 메일함을 확인해 주세요.\n메일이 오지 않는다면 메일 주소 혹은 스팸함을 확인해 주세요.");
				}
			}			
		});
	} else {
		alert("사용 불가한 이메일입니다. 다시 입력해주세요.");
	}
});
</script>