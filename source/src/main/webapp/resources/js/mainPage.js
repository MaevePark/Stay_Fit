function sendCart(el) {
	var selector = el;
	var pid = selector.dataset.pid;
	$.ajax({
		url:"mypage/minsertcart"
		, method:"get"
		, data: {
			pid: pid
			,pcount: 1
		} 
		, dataType: "json"
		, success: function(result) {
			console.log(result);
			if(result == 1) {
				alert("장바구니에 추가되었습니다.");
			}else if(result == 2) {
				alert("이미 장바구니에 등록된 상품입니다.");
			}
			
		}
		, error: function(request, status, errordata) {
			alert("error code: "+request.status +"\n"
					+"message: "+request.responseText +"\n"
					+"error: "+errordata+"\n");
		}
	});
}

function sendWish(el) {
	var selector = el;
	var pid = selector.dataset.pid;
	$.ajax({
		url:"mypage/insertwish"
		, method:"get"
		, data: {
			pid: pid
		} 
		, dataType: "json"
		, success: function(result) {
			console.log(result);
			if(result == 1) {
				alert("찜목록에 추가되었습니다.");
			} else if(result == 2) {
				alert("이미 찜목록에 등록된 상품입니다.");
			} else if(result == 3) {
				alert("로그인 이후 사용 가능한 기능입니다.");
				location.href="member/login";
			}
			
		}
		, error: function(request, status, errordata) {
			alert("error code: "+request.status +"\n"
					+"message: "+request.responseText +"\n"
					+"error: "+errordata+"\n");
		}
	});
}



