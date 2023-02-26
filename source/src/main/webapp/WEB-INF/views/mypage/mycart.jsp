<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/mycart.css"
	type="text/css">

<!-- Shoping Cart Section Begin -->
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
										<td class="shoping__cart__item"><img
											src="${list.PIMAGE }"
											alt="">
											<h5>${list.PNAME }</h5></td>
										<td class="shoping__cart__price">${list.PPRICE }원</td>
										<td class="shoping__cart__quantity">
											<div class="quantity">
												<div class="pro-qty">
													<input type="text" value="${list.PCOUNT }">
												</div>
											</div>
										</td>
										<td class="shoping__cart__total">${list.PPRICE * list.PCOUNT }</td>
										<td class="shoping__cart__go_to_buy">
											<button type="button" onclick="location.href='${list.PLINK }'">구매하러 가기</button>
										</td>
										<td class="shoping__cart__item__close"><span
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
							<li>Subtotal <span>각 태그 인덱스별로 자바스크립트에서 합산 ㄱㄱ</span></li>
							<li>Total <span>위와 동일!</span></li>
						</c:if>
						<c:if test="${cartList.size() == 0 }">
							<li>Subtotal <span>-</span></li>
							<li>Total <span>-</span></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Shoping Cart Section End -->