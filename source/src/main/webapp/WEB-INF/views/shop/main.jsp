<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src='<%=request.getContextPath() %>/resources/js/shop.js'></script>

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<!-- 상품 카테고리 -->
			<jsp:include page="/WEB-INF/views/shop/shopcategory.jsp"></jsp:include>
			
			
			<div class="col-lg-10 col-md-7">
				<!-- Hero Section Begin -->
				<div class="hero__search__form">
					<form action="<%=request.getContextPath() %>/shop" method="get">
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
						<input type="text" name="searchProduct" id="searchProduct" placeholder="상품명을 검색해 주세요." value="${searchMap.searchProduct }">
						<button type="submit" class="site-btn">SEARCH</button>
					</form>
				</div>
				<!-- Hero Section End -->
				
				
				<c:if test="${(searchMap.productCategory == 0 || searchMap.productCategory == null) && (searchMap.searchProduct == '' || searchMap.searchProduct == null)}">
					<!-- 세일항목 캐러셀 -->
					<jsp:include page="/WEB-INF/views/shop/saleList.jsp" />
				</c:if>
				



				<div class="row">
					<c:if test="${fn:length(productList) > 0 }">
						<c:forEach items="${productList }" var="product">
							<div class="col-lg-4 col-md-6 col-sm-6">
								<c:choose>
									<c:when test="${product.psale > 0}">									
										<div class="product__item">
											<div class="product__item__pic set-bg" data-setbg="${product.pimage }">
												<ul class="product__item__pic__hover">
													<li><a class="addWish" data-pid="${product.pid }" onclick="addWish(this)"><i class="fa fa-heart"></i></a></li>
													<li><a class="fa fa-shopping-cart" data-pid="${product.pid }" onclick="addCart(this)"></a></li>
												</ul>
											</div>
											<div class="product__discount__item__text">
												<span>${product.cname }</span>
												<h5>
													<a href="${product.plink }" target="_blank">${product.pname }</a>
												</h5>
												
												<c:set var="sale" value="${(100 - product.psale) }"></c:set>
												<fmt:formatNumber var="finalPrice" value="${Math.floor((product.pprice * sale)/100/10)*10}" pattern="###,###,##0" />
												<fmt:formatNumber var="price" value="${product.pprice}" pattern="###,###,##0" />
												<div class="product__item__price">
													${finalPrice }원 <span>${price }원</span><p style="display:inline-block; width:30px; margin-left:10px; color:red; font-size: 20px; font-weight:bold;">  -${product.psale }%</p>
												</div>
											</div>
										</div>
									</c:when>
									
									<c:when test="${product.psale <= 0}">
										<div class="product__item">
											<div class="product__item__pic set-bg" data-setbg="${product.pimage }">
												<ul class="product__item__pic__hover">
													<li><a class="addWish" data-pid="${product.pid }" onclick="addWish(this)"><i class="fa fa-heart"></i></a></li>
													<li><a class="fa fa-shopping-cart" data-pid="${product.pid }" onclick="addCart(this)"></a></li>
												</ul>
											</div>
											
											<div class="product__item__text">
												<h6>
													<a href="${product.plink }" target="_blank">${product.pname }</a>
												</h6>
												<fmt:formatNumber var="price" value="${product.pprice}" pattern="###,###,##0" />
												<h5>${price }원</h5>
											</div>
										</div>
									</c:when>
								</c:choose>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${fn:length(productList) <= 0 }">
						<div id="resultZero">
							<h4>찾으시는 상품이 없습니다.</h4>
						</div>
					</c:if>
				</div>
				
				
				<c:if test="${fn:length(productList) > 0 }">
					<!-- 페이징 -->
					<div class="col-lg-12">
						<div class="product__pagination blog__pagination">
							<c:if test="${pagingMap.start != 1}">
								<a href="<%=request.getContextPath()%>/${urlpattern }?page=1&productCategory=${searchMap.productCategory}&searchProduct=${searchMap.searchProduct}"> << </a>
							</c:if>
							<c:if test="${pagingMap.currentPage != 1}">
								<a href="<%=request.getContextPath()%>/${urlpattern }?page=${pagingMap.currentPage -1}&productCategory=${searchMap.productCategory}&searchProduct=${searchMap.searchProduct}"> < </a>
							</c:if>
							
							
							<c:forEach begin="${pagingMap.start }" end="${pagingMap.end }" var="num">                                
								<a href="<%=request.getContextPath()%>/${urlpattern }?page=${num}&productCategory=${searchMap.productCategory}&searchProduct=${searchMap.searchProduct}">${num}</a>
							</c:forEach>
							
							
							<c:if test="${pagingMap.currentPage != pagingMap.totalPageCnt}">
								<a href="<%=request.getContextPath()%>/${urlpattern }?page=${pagingMap.currentPage +1}&productCategory=${searchMap.productCategory}&searchProduct=${searchMap.searchProduct}"> > </a>
							</c:if>
							<c:if test="${pagingMap.end != pagingMap.totalPageCnt}">
								<a href="<%=request.getContextPath()%>/${urlpattern }?page=${pagingMap.totalPageCnt }&productCategory=${searchMap.productCategory}&searchProduct=${searchMap.searchProduct}"> >> </a>
							</c:if>
						</div>
					</div>
				</c:if>
				
				


			</div>
		</div>
	</div>
</section>
<!-- Product Section End -->
