window.onload = function() {
	
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
			const html = '<input type="text" name="mname">';
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
			const html = '<input type="password" name="pwd">'+
						'<input type="password" name="pwd2">';
			parent.innerHTML = html;
			
			if($('#submitBtn').length < 1) {
				parent = document.getElementById("submitBtnArea");
				const html = '<button type="submit" id="submitBtn">적용</button>';
				parent.innerHTML = html;
			}
	}
}