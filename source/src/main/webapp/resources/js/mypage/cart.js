window.onload = function() {
	
}
	

function loadCart(el) {
	$.ajax({
		url:"loadcart"
		, method:"get"
		, dataType: "json"
		, data: {
			mid : el
		}
		, dataType: "json"
		, success: function(result) {
			console.log(result);
			var cartList = result.cartList;
			const parent = document.querySelector(".shoping__cart__table table tbody");
			var html = "";
			
			if(cartList.length > 0) {
				for(let i=0; i<cartList.length; i++) {
					var list = cartList[i];
					html += '<tr>'+
								'<td class="shoping__cart__item"><img src="'+list.PIMAGE+'" alt="product_img">'+
									'<h5>'+list.PNAME+'</h5></td>'+
								'<td class="shoping__cart__price">'+list.PPRICE+'원</td>'+
								'<td class="shoping__cart__quantity">'+
									'<div class="quantity">'+
										'<div class="pro-qty">'+
											'<input type="text" class="pcount" value="'+list.PCOUNT+'" data-pid="'+list.PID+'">'+
										'</div>'+
									'</div>'+
								'</td>'+
								'<td class="shoping__cart__total">'+list.PNAME*list.PCOUNT+'</td>'+
								'<td class="shoping__cart__go_to_buy">'+
									'<button type="button" onclick="insertRecord('+list.PID+')">구매하러 가기</button>'+
								'</td>'+
								'<td class="shoping__cart__item__close" data-pid='+list.PID+' onclick="delCart(this)"><span '+
									'class="icon_close"></span></td>'+
							'</tr>';
				}
			} else {
				html +='<tr>'+
							'<td colspan="5">장바구니에 등록된 상품이 없습니다.</td>'+
						'</tr>';
			}
			parent.innerHTML = html;
			
			var proQty = $('.pro-qty');
		    proQty.prepend('<span class="dec qtybtn">-</span>');
		    proQty.append('<span class="inc qtybtn">+</span>');
		    proQty.on('click', '.qtybtn', function () {
		        var $button = $(this);
		        var oldValue = $button.parent().find('input').val();
		        if ($button.hasClass('inc')) {
		            var newVal = parseFloat(oldValue) + 1;
		        } else {
		            // Don't allow decrementing below zero
		            if (oldValue > 0) {
		                var newVal = parseFloat(oldValue) - 1;
		            } else {
		                newVal = 0;
		            }
		        }
		        $button.parent().find('input').val(newVal);
		        updateCart(this);
		    });
			
		}
		, error: function(request, status, errordata) {
			alert("error code: "+request.status +"\n"
					+"message: "+request.responseText +"\n"
					+"error: "+errordata+"\n");
		}
	});
	
	
}



function delCart(el) {
	console.log(el);
	var selector = el;
	var pid = selector.dataset.pid;
	console.log(pid);
	var mid = document.getElementById('mid').value;
	$.ajax({
		url:"delcart"
		, method:"get"
		, data: {
			pid: pid
			,mid: mid
		} 
		, dataType: "json"
		, success: function(result) {
			console.log(result);
			loadCart(mid);
		}
		, error: function(request, status, errordata) {
			alert("error code: "+request.status +"\n"
					+"message: "+request.responseText +"\n"
					+"error: "+errordata+"\n");
		}
	});
}

$( document ).ready( function() {
	var proQty = $('.pro-qty');
    proQty.on('click', '.qtybtn', function () {
    	updateCart(this);
    });
});

function updateCart(el) {
	var selector = el;
	var parent = selector.parentNode
	console.log("parent : "+parent);
	console.log(parent.querySelector('input'));
	var pid = parent.querySelector('input').dataset.pid;
	var pcount = parent.querySelector('input').value;
	console.log(pcount);
	var mid = document.getElementById('mid').value;
	$.ajax({
		url:"updatepcount"
		, method:"get"
		, data: {
			pid: pid
			,mid: mid
			, pcount: pcount
		} 
		, dataType: "json"
		, success: function(result) {
			console.log(result);
		}
		, error: function(request, status, errordata) {
			alert("error code: "+request.status +"\n"
					+"message: "+request.responseText +"\n"
					+"error: "+errordata+"\n");
		}
	});
}

function insertRecord(pid, url) {
	var mid = document.getElementById('mid').value;
	console.log("pid : "+pid);
	var pcount = document.querySelector('.pcount[data-pid=\"'+pid+'\"]').value
	console.log("pcount : "+pcount);
	//주문기록으로 insert
	$.ajax({
		url:"insertOrder"
		, method:"get"
		, data: {
			pid: pid
			, pcount: pcount
			, mid: mid
		}
		, dataType: "json"
		, success: function(result) {
			console.log(result);
			if(result == 1) {
				loadCart(mid);
				window.open(url);
			} else if(result == 2) {
				alert("재고가 충분하지 않습니다. 죄송합니다.");
			}
			
		}
		, error: function(request, status, errordata) {
			alert("error code: "+request.status +"\n"
					+"message: "+request.responseText +"\n"
					+"error: "+errordata+"\n");
		}
	});
	
	
}