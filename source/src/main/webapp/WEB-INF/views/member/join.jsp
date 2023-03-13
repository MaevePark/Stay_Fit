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
				<form name="form" id="joinform" method="post" action="<%=request.getContextPath()%>/member/joinAction">
					<div class="member-form">
						<div class="row join-wrap">
							<div class="col-md-9 join-input-box">
								<label for="email" class="form-label">이메일</label> <input
									type="text" name="memail" id="memail" class="form-control" pattern="[^-\s]+" onkeyup="checkMail()"
									placeholder="email@stayfit.com" value="">
									<input type="hidden" id="mailChkVal" value="0">
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
									onkeyup="checkCode(this.value); this.value=this.value.replace(/[^0-9]/g,'')"
									onblur="this.value=this.value.replace(/[^0-9]/g,'')"
									onchange=""
									type="text" maxlength="6" name="cdnum" id="cdnum" class="form-control"
									value="" disabled>
								<input type="hidden" id="mailCodeChkVal" value="0">
							</div>
							<div class="col-md-9 join-input-box">
								<span id="mail-check-msg"></span>
							</div>
							<div class="col-md-9 join-input-box">
								<label for="mname" class="form-label">닉네임</label> <input
									type="text" name="mname" id="mname" class="form-control"
									value="" maxLength=12>
							</div>
							<div class="col-md-9 join-input-box">
								<span class="name_check_ok">사용 가능한 닉네임입니다.</span>
								<span class="name_check_already">사용 불가한 닉네임입니다. 다시 입력해주세요.</span>
							</div>
							<div class="col-md-9 join-input-box">
								<label for="pwd1" class="form-label">비밀번호</label> <input
									type="password" name="mpw" id="pwd1" class="form-control" autocomplete="off"
									value="" maxLength=16 onkeyup="pwChk1(this)">
								<input type="hidden" value="0" id="pwChkVal1">
							</div>
							<div class="col-md-9 join-input-box">
								<label for="pwd2" class="form-label">비밀번호 확인</label> <input
									type="password" name="pwd2" id="pwd2" class="form-control" autocomplete="off"
									value="" maxLength=16 onkeyup="pwChk2(this)">
								<input type="hidden" value="0" id="pwChkVal2">
							</div>
							<div class="col-md-6 text-lg-start join-button-box">
								<a href="/stayfit/member/login"
									class="member-btn btn btn-secondary">취소</a>
							</div>
							<div class="col-md-6 text-lg-end join-button-box">
								<button type="button" class="member-btn btn btn-success"
									id="btnJoin" onclick="joinMember()">확인</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<script>
var code;
function joinCheck() {
//     if (!checkEmail(form.memail.value)) {
//     	console.log("checkEmail ok");
//     	return false;
//     } else if (!checkCdnum(form.cdnum.value)){
//     	console.log("checkCdnum ok");
//     	return false;
//     } else if (!checkName(form.mname.value)) {
//     	console.log("checkName ok")
//         return false;
//     } else if (!checkPassword(form.pwd1.value, form.pwd2.value)) {
//     	console.log("checkPassword ok")
//         return false;
//     }  else if (!checkMail()) { // checkMail 함수가 false를 반환하면 실행
//         return false;
//     } else 
	if($('#mailCodeChkVal').val() != 1) {
    	return false;
    } else if($('#mailChkVal').val() != 1) {
    	return false;
    } else if($('#pwChkVal1').val() != 1) {
    	return false;
    } else if($('#pwChkVal2').val() != 1) {
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
	$('#cdnum').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-msg');
		const emailInput = $('#memail');
		
		
		if(inputCode === code){
			$resultMsg.html('인증 성공');
			$resultMsg.css('color','green');
			$('#btnChkMail').attr('disabled',true);
		}else{
			try{
				code;
			}catch(e){
				alert('인증번호를 이메일을 통해 받아주세요.');
			}
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!');
			$resultMsg.css('color','red');
			$(this).focus();
			return false;
		}
	});
	return true;
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

$('#btnChkMail').click(function(){
	var email = $('#memail').val(); // 이메일 주소값 얻어오기!
	console.log('이메일 : ' + email); // 이메일 오는지 확인
	var checkInput = $('#cdnum') // 인증번호 입력하는곳 
	var mailChkVal = $('#mailChkVal').val();

	if(mailChkVal == 1) {
		$.ajax({
			type : 'post',
			url : 'send',
			async: false,
			data : {
				memail : email
				},
			dataType : 'json',
			success : function (data) {
				console.log("data : " +  data);
				code = data;
				if(isNaN(code)) {
					alert("이메일 전송에 실패하였습니다. 다시 시도해주세요.");
				} else{
					alert("이메일이 전송되었습니다. 메일함을 확인해 주세요. \n 기다려도 메일이 오지 않는다면 메일 주소 혹은 스팸함을 확인해 주세요.");
					checkInput.attr('disabled',false);
					$('#memail').attr('readonly', true);
				}
			}			
		});
	} else {
		alert("사용 불가한 이메일입니다. 다시 입력해주세요.");
	}
}); 

// $('#cdnum').blur(function () {
// 	const inputCode = $(this).val();
// 	const $resultMsg = $('#mail-check-msg');
// 	const emailInput = $('#memail');
	
	
// 	if(inputCode === code){
// 		$resultMsg.html('인증 성공');
// 		$resultMsg.css('color','green');
// 		$('#btnChkMail').attr('disabled',true);
// 	}else{
// 		try{
// 			code;
// 		}catch(e){
// 			alert('인증번호를 이메일을 통해 받아주세요.');
// 		}
// 		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!');
// 		$resultMsg.css('color','red');
// 		$(this).focus();
// 		return false;
// 	}
// });

function checkMail(){
	var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{2,3}$/;
	var memail = $('#memail').val();
	var isMailValid = false;
	var mailChkVal = $('#mailChkVal');
	$.ajax({
		url:'mailChk',
		type:'post',
		data:{memail : memail},
		success:function(result){
			if(result == 0 && emailRegExp.test(memail)){
				var ok = document.getElementsByClassName("mail_check_ok")[0];
				console.log(ok);
				$('.mail_check_ok').css("display","");
				$('.mail_check_already').css("display", "none");
				isMailValid = true; // memail이 유효한 경우 true 반환
				mailChkVal.val(1);
				$('#btnChkMail').attr('disabled',false);
				$('#mailCodeChkVal').val(0);
			}else{
				var already = document.getElementsByClassName("mail_check_already")[0];
				console.log(already);
				$('.mail_check_already').css("display","");
				$('.mail_check_ok').css("display", "none");
				form.memail.focus();
				isMailValid = false;
				mailChkVal.val(0);
				$('#btnChkMail').attr('disabled',false);
				$('#mailCodeChkVal').val(0);
			}
			return isMailValid;
		},
		error:function(){
			alert("DB 접속 에러");
		}
	});
	
};

function checkCode(codeInput) {
	var $resultMsg = $('#mail-check-msg');
	var emailInput = $('#memail');
	
	
	if(codeInput == code){
		$resultMsg.html('인증 성공');
		$resultMsg.css('color','green');
		$('#btnChkMail').attr('disabled',true);
		$('#mailCodeChkVal').val(1);
	}else{
		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!');
		$resultMsg.css('color','red');
		$('#mailCodeChkVal').val(0);
	}
}


function pwChk1(el) {
	var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@!%*#?&])[A-Za-z\d@!%*#?&]{8,16}$/;
	var pwChkVal1 = $('#pwChkVal1');
	var pw1 = document.getElementById("pwd1");
	var pw1_parent = pw1.parentNode;
	var new_child = document.createElement("span");
	new_child.setAttribute("id", "popChild_1");
	if($('#popChild_1').length > 0) {
		var popChild = document.getElementById('popChild_1');
		if(!regExp.test(pw1.value)) {
			popChild.innerText = "비밀번호는 8~16자로 영문, 숫자, 특수 기호를 조합하여 입력해주세요.";
			popChild.style.color = "red";
			pwChkVal1.val(0);
		} else {
			popChild.innerText = "사용 가능한 비밀번호입니다.";
			popChild.style.color = "#7fad39";
			pwChkVal1.val(1);
		}
	} else {
		pw1_parent.appendChild(new_child);
		var popChild = document.getElementById('popChild_1');
		if(!regExp.test(pw1.value)) {
			popChild.innerText = "비밀번호는 8~16자로 영문, 숫자, 특수 기호를 조합하여 입력해주세요.";
			popChild.style.color = "red";
			pwChkVal1.val(0);
		} else {
			popChild.innerText = "사용 가능한 비밀번호입니다.";
			popChild.style.color = "#7fad39";
			pwChkVal1.val(1);
		}
	}
}
function pwChk2(el) {
	var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@!%*#?&])[A-Za-z\d@!%*#?&]{8,16}$/;
	var pwChkVal2 = $('#pwChkVal2');
	var pw1 = document.getElementById("pwd1");
	var pw2 = document.getElementById("pwd2");
	var pw2_parent = pw2.parentNode;
	var new_child = document.createElement("span");
	new_child.setAttribute("id", "popChild_2");
	if($('#popChild_2').length > 0) {
		var popChild = document.getElementById('popChild_2');
		if(pw1.value != pw2.value) {
			popChild.innerText = "비밀번호가 일치하지 않습니다.";
			popChild.style.color = "red";
			pwChkVal2.val(0);
		} else {
			popChild.innerText = "비밀번호가 일치합니다.";
			popChild.style.color = "#7fad39";
			pwChkVal2.val(1);
		}
	} else {
		pw2_parent.appendChild(new_child);
		var popChild = document.getElementById('popChild_2');
		if(pw1.value != pw2.value) {
			popChild.innerText = "비밀번호가 일치하지 않습니다.";
			popChild.style.color = "red";
			pwChkVal2.val(0);
		} else {
			popChild.innerText = "비밀번호가 일치합니다.";
			popChild.style.color = "#7fad39";
			pwChkVal2.val(1);
		}
	}
}

function joinMember() {
	if(!joinCheck()) {
		//false
		alert("실패!!");
	} else {
		//true
		$('#joinform').submit();
	}
	
}



</script>