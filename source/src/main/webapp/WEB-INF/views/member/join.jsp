<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/member.css"
	type="text/css">


<section class="join-form">
	<div class="container">
		<div class="col-lg-12 mx-auto">
			<div class="contact__form__title">
				<h2 class="txt-h2">회원가입</h2>
				<p>
					회원가입을 하시면 <b>STAY FIT</b>에서 제공하는 다양한 서비스를 이용하실 수 있습니다.
				</p>
			</div>
			<div class="input-form col-md-12 mx-auto">
				<form name=form class="validation-form" id="joinform" method="POST" onsubmit="return joinCheck()">
					<div class="member-form">
						<div class="row join-wrap">
							<div class="col-md-9 join-input-box">
								<label for="email" class="form-label">이메일</label> <input
									type="text" name="memail" id="memail" class="form-control" pattern="[^-\s]+" onkeyup="checkMail()"
									placeholder="email@stayfit.com" value="">
							</div>
							<div class="col-md-3 join-button-box">
								<button type="button" id="btnChkMail" name="btnChkMail"
									class="member-btn btn btn-success">
									<span class="btn-txt">인증번호 전송</span>
								</button>
							</div>
							<div class="col-md-9 join-input-box">
							<span class="mail_check_ok" style="display: none">사용 가능한 이메일입니다.</span>
							<span class="mail_check_already" style="display: none">사용 불가한 이메일입니다. 다시 입력해주세요.</span>
							</div>
							<div class="col-md-9 join-input-box">
								<label for="cdnum" class="form-label">인증번호</label> <input 
									onkeydown="this.value=this.value.replace(/[^0-9]/g,'')"
									onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
									onblur="this.value=this.value.replace(/[^0-9]/g,'')"
									type="text" maxlength="6" name="cdnum" id="cdnum" class="form-control"
									value="">
							</div>
							<div class="col-md-9 join-input-box">
								<span id="mail-check-msg"></span>
							</div>
							<div class="col-md-9 join-input-box">
								<label for="mname" class="form-label">닉네임</label> <input
									type="text" name="mname" id="mname" class="form-control" oninput="checkName"
									value="" maxLength=12>
							</div>
							<div class="col-md-9 join-input-box">
								<span class="name_check_ok">사용 가능한 닉네임입니다.</span>
								<span class="name_check_already">사용 불가한 닉네임입니다. 다시 입력해주세요.</span>
							</div>
							<div class="col-md-9 join-input-box">
								<label for="pwd1" class="form-label">비밀번호</label> <input
									type="password" name="mpw" id="pwd1" class="form-control" autocomplete="off"
									value="" maxLength=16>
							</div>
							<div class="col-md-9 join-input-box">
								<label for="pwd2" class="form-label">비밀번호 확인</label> <input
									type="password" name="pwd2" id="pwd2" class="form-control" autocomplete="off"
									value="" maxLength=16>
							</div>
							<div class="col-md-6 text-lg-start join-button-box">
								<a href="/stayfit/member/login"
									class="member-btn btn btn-secondary">취소</a>
							</div>
							<div class="col-md-6 text-lg-end join-button-box">
								<button type="submit" class="member-btn btn btn-success"
									id="btnJoin">확인</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<script>

function joinCheck() {
    if (!checkEmail(form.memail.value)) {
        return false;
    } else if (!checkCdnum(form.cdnum.value)){
    	return false;
    } else if (!checkName(form.mname.value)) {
        return false;
    } else if (!checkPassword(form.pwd1.value, form.pwd2.value)) {
        return false;
    } else{
        return true;	
    }
}
//공백확인 함수
function checkExistData(value, dataName) {
    if (value == "") {
        alert(dataName + " 입력해주세요!");
        return false;
    }
    return true;
}

function checkEmail(memail) {
    //이메일이 입력되었는지 확인하기
    if (!checkExistData(memail, "이메일을")){
    	form.memail.focus();
    	return false;	
    }

    var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{2,3}$/;
    if (!emailRegExp.test(memail)) {
        alert("이메일 형식이 올바르지 않습니다.");
        form.memail.focus();
        return false;
    }
    return true; //확인이 완료되었을 때
}

function checkCdnum(cdnum) {
	if(!checkExistData(cdnum,"인증번호를")){
		form.cdnum.focus();
		return false;
	}
}

function checkPassword(pwd1, pwd2) {
    //비밀번호가 입력되었는지 확인하기
    if (!checkExistData(pwd1, "비밀번호를")){
    	form.pwd1.focus();
        return false;
    }
    //비밀번호 확인이 입력되었는지 확인하기
    if (!checkExistData(pwd2, "비밀번호 확인을")){
    	form.pwd2.focus();
        return false;
    }

    var password1RegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@!%*#?&])[A-Za-z\d@!%*#?&]{8,16}$/; //비밀번호 유효성 검사
    if (!password1RegExp.test(pwd1)) {
        alert("비밀번호는 8~16자로 영문, 숫자, 특수 기호를 조합하여 입력해주세요.");
        form.pwd1.focus();
        return false;
    }
    //비밀번호와 비밀번호 확인이 맞지 않다면..
    if (pwd1 != pwd2) {
        alert("비밀번호와 일치하지 않습니다. 다시 입력해주세요.");
        form.pwd2.focus();
        return false;
    }
    return true; //확인이 완료되었을 때
}
function checkName(mname) {
    if (!checkExistData(mname, "닉네임을")){
    	form.mname.focus();
    	return false;
    }
        
    var nameRegExp = /^[가-힣a-zA-Z0-9]{2,12}$/;
    if (!nameRegExp.test(mname)) {
        alert("닉네임은 2~12자의 한글, 영문, 숫자를 입력해주세요.");
        form.mname.focus();
        return false;
    }
    return true; //확인이 완료되었을 때
}

$('#btnChkMail').click(function(){
	var eamil = $('#memail').val(); // 이메일 주소값 얻어오기!
	console.log('이메일 : ' + eamil); // 이메일 오는지 확인
	var checkInput = $('#cdnum') // 인증번호 입력하는곳 
	
	$.ajax({
		type : 'post',
		url : 'send',
		async: false,
		data : {
			memail : eamil
			},
		dataType : 'json',
		success : function (data) {
			console.log("data : " +  data);
			code = data;
			if(isNaN(code)) {
				alert("이메일 전송에 실패하였습니다. 다시 시도해주세요.");
			} else{
				alert("이메일이 전송되었습니다. 메일함을 확인해 주세요.");
				checkInput.attr('disabled',false);
			}
		}			
	});
}); 

$('#cdnum').blur(function () {
	const inputCode = $(this).val();
	const $resultMsg = $('#mail-check-msg');
	const emailInput = $('#memail');
	
	if(inputCode === code){
		$resultMsg.html('인증 성공');
		$resultMsg.css('color','green');
		$('#btnChkMail').attr('disabled',true);
		$('#memail').attr('readonly',true);
		$('#cdnum').attr('disabled', true);
	}else{
		try{
			code;
		}catch(e){
			alert('인증번호를 이메일을 통해 받아주세요.');
		}
		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!');
		$resultMsg.css('color','red');
	}
});

function checkMail(){
	var memail = $('#memail').val();
	$.ajax({
		url:'mailChk',
		type:'post',
		data:{memail : memail},
		success:function(result){
			if(result == 0){
				var ok = document.getElementsByClassName("mail_check_ok")[0];
				console.log(ok);
				$('.mail_check_ok').css("display","");
				$('.mail_check_already').css("display", "none");
				console.log(memail);
			}else{
				var already = document.getElementsByClassName("mail_check_already")[0];
				console.log(already);
				$('.mail_check_already').css("display","");
				$('.mail_check_ok').css("display", "none");
			}
		},
		error:function(){
			alert("회원가입 중 오류가 발생했습니다.")
		}
	});
};

</script>