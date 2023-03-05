window.onload = function() {
	
	$('.delWish').click(function() {
		delWish(this);
	});
	
	$('.fa-shopping-cart').click(function() {
		sendCart(this);
	});
	
	
}




function delWish(el) {
	var selector = el;
	var pid = selector.dataset.pid;
	var mid = document.getElementById('mid').value;
	$.ajax({
		url:"delwish"
		, method:"get"
		, data: {
			pid: pid
			,mid: mid
		} 
		, dataType: "json"
		, success: function(result) {
			console.log(result);
			location.href="wish";
			//loadWish(mid);
		}
		, error: function(request, status, errordata) {
			alert("error code: "+request.status +"\n"
					+"message: "+request.responseText +"\n"
					+"error: "+errordata+"\n");
		}
	});
}

function sendCart(el) {
	var selector = el;
	var pid = selector.dataset.pid;
	var mid = document.getElementById('mid').value;
	$.ajax({
		url:"insertcart"
		, method:"get"
		, data: {
			pid: pid
			,mid: mid
			,pcount: 1
		} 
		, dataType: "json"
		, success: function(result) {
			console.log(result);
			location.href="wish";
			
		}
		, error: function(request, status, errordata) {
			alert("error code: "+request.status +"\n"
					+"message: "+request.responseText +"\n"
					+"error: "+errordata+"\n");
		}
	});
}


function loadWish(el) {
//	$.ajax({
//		url:"loadwish"
//		, method:"get"
//		, dataType: "json"
//		, data: {
//			mid : el
//		}
//		, dataType: "json"
//		, success: function(result) {
//			console.log(result);
//			console.log(document.querySelector(".container .row div .row"));
//			const parent = document.querySelector(".container .row div .row");
//			parent.innerHTML = '<c:if test="${wishList.size() > 0 }">'+
//									'<c:forEach items="${wishList }" var="list">'+
//									'<div class="col-lg-4 col-md-6 col-sm-6">'+
//										'<div class="product__item">'+
//											'<div class="product__item__pic set-bg"'+
//												'data-setbg="${list.pimage }">'+
//												'<ul class="product__item__pic__hover">'+
//													'<li><a class="delWish" data-pid="${list.pid }">X</a></li>'+
//													'<li><a class="fa fa-shopping-cart" data-pid="${list.pid }"></a></li>'+
//												'</ul>'+
//											'</div>'+
//											'<div class="product__item__text">'+
//												'<h6>'+
//													'<a href="#">${list.pname }</a>'+
//												'</h6>'+
//												'<h5>${list.pprice }원</h5>'+
//											'</div>'+
//										'</div>'+
//									'</div>'+
//								'</c:forEach>'+
//								'<!-- 페에징 -->'+
//								'<jsp:include page="/WEB-INF/views/paging.jsp" />'+
//							'</c:if>'+
//							'<c:if test="${wishList.size() <= 0 }">'+
//								'<h3>찜목록에 등록된 상품이 없습니다.</h3>'+
//							'</c:if>';
//		}
//		, error: function(request, status, errordata) {
//			alert("error code: "+request.status +"\n"
//					+"message: "+request.responseText +"\n"
//					+"error: "+errordata+"\n");
//		}
//	});
	
}













