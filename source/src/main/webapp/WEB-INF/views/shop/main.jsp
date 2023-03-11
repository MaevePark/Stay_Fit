<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src='<%=request.getContextPath() %>/resources/js/shop/shop.js'></script>


<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<!-- 상품 카테고리 -->
			<jsp:include page="/WEB-INF/views/shop/shopcategory.jsp"></jsp:include>
			
			
			<div class="col-lg-10 col-md-7">
				<!-- Hero Section Begin -->
				<div class="hero__search__form">
					<form action="<%=request.getContextPath() %>/shop/main" method="get">
						<c:set var="productC" value="${searchMap.productCategory}"></c:set>
						<div class="hero__search__categories">
							<select name="productCategory">
								<option value="0">전체</option>
								<c:forEach items="${categoryList }" var="cList">
										<c:choose>
											<c:when test="${cList.cid == productC }">
												<option value="${cList.cid }" selected>${cList.cname }</option>
											</c:when>
											<c:when test="${cList.cid != productC }">
												<option value="${cList.cid }">${cList.cname }</option>
											</c:when>
										</c:choose>
									
								</c:forEach>
							</select>
						</div>
						
						
						<input type="text" name="searchProduct" id="searchProduct" placeholder="상품명을 검색해 주세요.">
						<button type="submit" class="site-btn">SEARCH</button>
					</form>
				</div>
				<!-- Hero Section End -->


				<!-- TODO 검색이 되지 않았다는 조건하에 세일메뉴 생성 -->
				<!-- 세일항목 캐러셀 -->
				<jsp:include page="/WEB-INF/views/shop/saleList.jsp" />



				<div class="row">
					<c:forEach items="${productList }" var="product">
						<div class="col-lg-4 col-md-6 col-sm-6">
							<div class="product__item">
								<div class="product__item__pic set-bg"
									data-setbg="${product.pimage }">
									<ul class="product__item__pic__hover">
										<li><a class="addWish" data-pid="${product.pid }" onclick="addWish(this)"><i class="fa fa-heart"></i></a></li>
										<li><a class="fa fa-shopping-cart" data-pid="${product.pid }" onclick="addCart(this)"></a></li>
									</ul>
								</div>
								<div class="product__item__text">
									<h6>
										<a href="#">${product.pname }</a>
									</h6>
									<h5>${product.pprice }원</h5>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				
				
<%-- 				<c:if test="${productList.size > 0 }"> --%>
<!-- 					페에징 -->
<%-- 					<jsp:include page="/WEB-INF/views/paging.jsp" /> --%>
<%-- 				</c:if> --%>
				
				


			</div>
		</div>
	</div>
</section>
<!-- Product Section End -->
