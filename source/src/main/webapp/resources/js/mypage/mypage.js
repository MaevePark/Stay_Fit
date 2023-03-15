window.onload = function() {
	//비밀번호 유효성 체크
	var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@!%*#?&])[A-Za-z\d@!%*#?&]{8,16}$/;
	$('#pw').keyup(function(event) {
		if(!$('#pw').val().test(regExp)) {
			document.getElementById('pwChkMsg').innerText = "비밀번호는 8~16자로 영문, 숫자, 특수 기호를 조합하여 입력해주세요.";
			
		} else {
			document.getElementById('pwChkMsg').innerText = "사용 가능한 비밀번호입니다.";
		}
	});
	
	
	
}

function changeProfImg() {
	if($('#profImgInputArea').childElementCount > 0) {
	} else {
		var parent = document.getElementById("profImgInputArea");
		const html = '<input type="file" name="profimg">';
		parent.innerHTML = html;
		
		if($('#submitBtn').length < 1) {
			parent = document.getElementById("submitBtnArea");
			const html = '<button type="submit" id="submitBtn">적용</button>';
			parent.innerHTML = html;
		}
	}
}

function changeName() {
	var parent = document.getElementById("profile_area");
	if($('#nameInputArea').childElementCount > 0) {
	} else {
			var parent = document.getElementById("nameInputArea");
			const html = '<input type="text" name="mname" placeholder="변경할 닉네임을 입력해주세요.">';
			parent.innerHTML = html;
			
			if($('#submitBtn').length < 1) {
				parent = document.getElementById("submitBtnArea");
				const html = '<button type="submit" id="submitBtn">적용</button>';
				parent.innerHTML = html;
			}
	}
}

function changePwd() {
	var parent = document.getElementById("profile_area");
	if($('#pwdInputArea').childElementCount > 0) {
	} else {
			var parent = document.getElementById("pwdInputArea");
			const html = '<input type="password" name="pwd" id="pw1" onkeyup="pwChk1()" placeholder="변경할 비밀번호를 입력해주세요.">'+
						'<span id="pwChkMsg1"></span>'+
						'<input type="password" name="pwd2" id="pw2" onkeyup="pwChk2()" placeholder="비밀번호를 다시 입력해주세요.">'+
						'<span id="pwChkMsg2"></span>'+
						'<input type="hidden" id="pwChkVal1" value="0">'+
						'<input type="hidden" id="pwChkVal2" value="0">';
			parent.innerHTML = html;
			
			if($('#submitBtn').length < 1) {
				parent = document.getElementById("submitBtnArea");
				const html = '<button type="button" id="submitBtn" onclick="changeProfile()">적용</button>';
				parent.innerHTML = html;
			}
	}
}



function pwChk1() {
	var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@!%*#?&])[A-Za-z\d@!%*#?&]{8,16}$/;
	var pw1 = document.getElementById("pw1");
	var pwChkMsg = document.getElementById('pwChkMsg1');
	var pwChkVal1 = document.getElementById("pwChkVal1");
	if(!regExp.test(pw1.value)) {
		pwChkMsg.innerText = "비밀번호는 8~16자로 영문, 숫자, 특수 기호를 조합하여 입력해주세요.";
		pwChkMsg.style.color = "red";
		pwChkVal1.value = 0;
	} else {
		pwChkMsg.innerText = "사용 가능한 비밀번호입니다.";
		pwChkMsg.style.color = "#7fad39";
		pwChkVal1.value = 1;
	}
}
function pwChk2() {
	var pw1 = document.getElementById("pw1");
	var pw2 = document.getElementById("pw2");
	var pwChkMsg = document.getElementById('pwChkMsg2');
	var pwChkVal2 = document.getElementById("pwChkVal2");
	if(pw1.value !== pw2.value) {
		pwChkMsg.innerText = "비밀번호가 일치하지 않습니다.";
		pwChkMsg.style.color = "red";
		pwChkVal2.value = 0;
	} else {
		pwChkMsg.innerText = "";
		pwChkVal2.value = 1;
	}
}


function changeProfile() {
	var pwChkVal1 = document.getElementById("pwChkVal1");
	var pwChkVal2 = document.getElementById("pwChkVal2");
	var form = document.getElementById("profileForm");
	if(pwChkVal1.length > 0 && pwChkVal2.length > 0) {
		if(pwChkVal1.value == 1 && pwChkVal2.value == 1) {
			form.submit();
		} else {
			alert("비밀번호를 확인해 주세요.");
		}
	} else {
		form.submit();
	}
	
}
