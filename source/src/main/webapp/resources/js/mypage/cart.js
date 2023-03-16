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
					if(list.PSALE != 0) {
						var sale = (100 - list.PSALE);
						html += '<tr>'+
									'<td class="shoping__cart__item"><img src="'+list.PIMAGE+'" alt="product_img">'+
										'<h5>'+list.PNAME+'</h5></td>'+
									'<td class="shoping__cart__price">'+
										'<div>'+
											'<span>'+list.PPRICE+'원</span>'+
										'</div>'+
										'<div>'+
											'<span>'+list.PSALE+'%</span>'+
										'</div>'+
										'<span class="price">'+Math.floor((list.PPRICE * sale)/100/10)*10+'</span><span>원</span>'+
									'</td>'+
									'<td class="shoping__cart__quantity">'+
										'<div class="quantity">'+
											'<div class="pro-qty">'+
												'<input type="text" class="pcount" value="'+list.PCOUNT+'" data-pid="'+list.PID+'">'+
											'</div>'+
										'</div>'+
										'<div><span>재고수량 : '+list.PSTOCK+'</span></div>'+
									'</td>'+
									'<td class="shoping__cart__total"><span>'+(list.PPRICE * sale)/100*list.PCOUNT/10*10+'</span>원</td>'+
									'<td class="shoping__cart__go_to_buy">'+
										'<button type="button" onclick="insertRecord('+list.PID+')">구매하러 가기</button>'+
									'</td>'+
									'<td class="shoping__cart__item__close" data-pid='+list.PID+' onclick="delCart(this)"><span '+
										'class="icon_close"></span></td>'+
								'</tr>';
					} else {
						html += '<tr>'+
									'<td class="shoping__cart__item"><img src="'+list.PIMAGE+'" alt="product_img">'+
										'<h5>'+list.PNAME+'</h5></td>'+
									'<td class="shoping__cart__price">'+
										'<span class="price">'+Math.floor(list.PPRICE/10)*10+'</span><span>원</span>'+
									'<td class="shoping__cart__quantity">'+
										'<div class="quantity">'+
											'<div class="pro-qty">'+
												'<input type="text" class="pcount" value="'+list.PCOUNT+'" data-pid="'+list.PID+'">'+
											'</div>'+
										'</div>'+
										'<div><span>재고수량 : '+list.PSTOCK+'</span></div>'+
									'</td>'+
									'<td class="shoping__cart__total"><span>'+list.PPRICE*list.PCOUNT/10*10+'</span>원</td>'+
									'<td class="shoping__cart__go_to_buy">'+
										'<button type="button" onclick="insertRecord('+list.PID+', '+list.PLINK+')">구매하러 가기</button>'+
									'</td>'+
									'<td class="shoping__cart__item__close" data-pid='+list.PID+' onclick="delCart(this)"><span '+
										'class="icon_close"></span></td>'+
								'</tr>';
					}
				}
			} else {
				html +='<tr>'+
							'<td colspan="5">장바구니에 등록된 상품이 없습니다.</td>'+
						'</tr>';
			}
			parent.innerHTML = html;
			
			var totalClass = document.getElementsByClassName('shoping__cart__total');
			var totalCost = 0;
			for(var i=0; i<totalClass.length; i++) {
				console.log(i+"번째 값 : "+totalClass[i].querySelector('span').innerText);
				totalCost += parseInt(totalClass[i].querySelector('span').innerText);
			}
			document.getElementById("fullCost").innerText = totalCost +"원";
			
			
			
			
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
			
			var totalPrice = parent.parentNode.parentNode.parentNode.querySelector('.shoping__cart__total');
			var finalPrice = parent.parentNode.parentNode.parentNode.querySelector('.shoping__cart__price').querySelector('.price');
			totalPrice.querySelector('span').innerHTML = numberWithCommas(finalPrice.value * pcount);
			totalPrice.querySelector('input').value = finalPrice.value * pcount;
			
			var totalClass = document.getElementsByClassName('shoping__cart__total');
			var totalCost = 0;
			for(var i=0; i<totalClass.length; i++) {
				console.log(i+"번째 값 : "+totalClass[i].querySelector('input').value);
				totalCost += parseInt(totalClass[i].querySelector('input').value);
			}
			console.log(totalCost);
			document.getElementById("fullCost").innerText = numberWithCommas(totalCost) +"원";
			
		}
		, error: function(request, status, errordata) {
			alert("error code: "+request.status +"\n"
					+"message: "+request.responseText +"\n"
					+"error: "+errordata+"\n");
		}
	});
}
function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function insertRecord(pid, url) {
	var mid = document.getElementById('mid').value;
	console.log("pid : "+pid);
	var pcount = document.querySelector('.pcount[data-pid=\"'+pid+'\"]').value
	console.log("pcount : "+pcount);
	console.log(url);
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