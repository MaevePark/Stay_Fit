<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mycart.css" type="text/css">
<script src='<%=request.getContextPath() %>/resources/js/mypage/cart.js'></script>


<!-- Shoping Cart Section Begin -->
<input type="hidden" name="mid" id="mid" value="3">
<section class="shoping-cart spad">
	<div class="container">
		<div class="row">
			<!-- 마이페이지 카테고리 -->
			<jsp:include page="/WEB-INF/views/mypage/mypagecategory.jsp"></jsp:include>

			<div class="col-lg-10">
			
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">마이페이지 /</span> 장바구니
				</h4>
			
			
				<div class="shoping__cart__table">
					<table>
						<thead>
							<tr>
								<th class="shoping__product">Products</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Total</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${cartList.size() != 0 }">
								<c:forEach items="${cartList }" var="list">
									<tr>
										<td class="shoping__cart__item"><img src="${list.PIMAGE }" alt="product_img">
											<h5>${list.PNAME }</h5></td>
										<td class="shoping__cart__price">
											<c:if test="${list.PSALE != 0 }">
												<c:set var="sale" value="${(100 - list.PSALE) }"></c:set>
												<div>
													<span>${list.PPRICE }원</span>
												</div>
												<div>
													<span>${list.PSALE }%</span>
												</div>
												<span class="price">${(list.PPRICE * sale)/100/10*10}</span><span>원</span>
												<c:set var="cost" value="${(list.PPRICE * sale)/100}"></c:set>
											</c:if>
											
											<c:if test="${list.PSALE == 0 }">
												<span class="price">${list.PPRICE/10*10 }</span><span>원</span>
												<c:set var="cost" value="${list.PPRICE }"></c:set>
											</c:if>
										</td>
										<td class="shoping__cart__quantity">
											<div class="quantity">
												<div class="pro-qty">
													<input type="text" class="pcount" value="${list.PCOUNT }" data-pid="${list.PID }">
												</div>
											</div>
											<div><span>재고수량 : ${list.PSTOCK }</span></div>
										</td>
										<td class="shoping__cart__total"><span>${cost * list.PCOUNT /10*10 }</span>원</td>
										<td class="shoping__cart__go_to_buy">
											<c:set var="plink" value="${list.PLINK }"></c:set>
											<button type="button" onclick="insertRecord(${list.PID }, '${plink }')">구매하러 가기</button>
										</td>
										<td class="shoping__cart__item__close" data-pid="${list.PID }" onclick="delCart(this)"><span
											class="icon_close"></span></td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${cartList.size() == 0 }">
								<tr>
									<td colspan="5">장바구니에 등록된 상품이 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<div class="shoping__checkout">
					<h5>Cart Total</h5>
					<ul>
						<c:if test="${cartList.size() != 0 }">
							<li>Total <span id="fullCost"> 
							<c:set var="totalPrice" value="0" />
							<c:forEach items="${cartList }" var="item">
								<c:set var="price" value="${item.PPRICE}" />
								<c:set var="quantity" value="${item.PCOUNT}" />
								<c:set var="sale" value="${100 - item.PSALE}" />
								<c:set var="itemTotal" value="${(price * sale)/100/10*10 * quantity}" />
								<c:set var="totalPrice" value="${totalPrice + itemTotal}" />
							</c:forEach>
							${totalPrice}원
							</span></li>
						</c:if>
						<c:if test="${cartList.size() == 0 }">
							<li>Total <span>-</span></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Shoping Cart Section End -->