<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Categories Section Begin -->
<section class="categories">
	<div class="container">
		<div class="row">
			<div class="categories__slider owl-carousel">
				<div class="col-lg-3">
					<div class="categories__item set-bg"
						data-setbg="<%=request.getContextPath()%>/resources/img/main/meal.jpg">
						<h5>
							<a href="#">맞춤식단</a>
						</h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg"
						data-setbg="<%=request.getContextPath()%>/resources/img/main/salad.jpg">
						<h5>
							<a href="#">샐러드</a>
						</h5>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="categories__item set-bg"
						data-setbg="<%=request.getContextPath()%>/resources/img/main/meal3.jpg">
						<h5>
							<a href="#">인기상품</a>
						</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Categories Section End -->


<!-- 미니 게시판 시작 -->
<section class="latest-product spad">
	<div class="container">
		<div class="row">
			<!--공지사항 -->
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<div style="display:flex; justify-content: space-between;">
                        <h4>공지사항</h4>
                        <button class="btn-notice" type="button" onclick="location.href='<%=request.getContextPath() %>/board/list?bcid=0'" >+</button>
                    </div>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<!--공지사항 list   -->
							<c:choose>
								<c:when test="${empty notice }">
									<a href="#" class="latest-product__item">
										<div class="blog__sidebar__recent__item__text">
											<h6>데이터가 없습니다</h6>
										</div>
									</a>
								</c:when>
								<c:when test="${!empty notice}">
									<c:forEach var="no" items="${notice}" begin="0" end="4"
										step="1">
										<a
											href="<%=request.getContextPath()%>/board/read.do?bid=${no.bid}"
											class="latest-product__item">
											<div class="blog__sidebar__recent__item__text">
												<h6>${no.btitle}</h6>
												<span><fmt:formatDate pattern="YY/MM/dd"
														value="${no.bcreate}" /><span>
											</div>
										</a>
									</c:forEach>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<!-- 공지사항 끝 -->
			<!-- 인기글 (공지사항제외)  -->
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>인기글</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<c:choose>
								<c:when test="${empty popular }">
									<a href="#" class="latest-product__item">
										<div class="blog__sidebar__recent__item__text">
											<h6>데이터가 없습니다</h6>
										</div>
									</a>
								</c:when>
								<c:when test="${!empty recent}">
									<c:forEach var="po" items="${popular}" begin="0" end="4"
										step="1">
										<a
											href="<%=request.getContextPath()%>/board/read.do?bid=${po.bid}"
											class="latest-product__item">
											<div class="blog__sidebar__recent__item__pic">
												<img src="${po.profimg }" alt=""
													style="width: 40px; height: 40px; border-radius: 50%">
											</div>
											<div class="blog__sidebar__recent__item__text">
												<h6>${po.btitle}</h6>
												<span>${po.bcname}|${po.mname}<span>
											</div>
										</a>
									</c:forEach>
								</c:when>
							</c:choose>
						</div>
						<div class="latest-prdouct__slider__item">
							<c:choose>
								<c:when test="${empty recent }">
									<a href="#" class="latest-product__item">
										<div class="blog__sidebar__recent__item__text">
											<h6>데이터가 없습니다</h6>
										</div>
									</a>
								</c:when>
								<c:when test="${!empty recent}">
									<c:forEach var="re" items="${recent}" begin="5" end="9"
										step="1">
										<a
											href="<%=request.getContextPath()%>/board/read.do?bid=${re.bid}"
											class="latest-product__item">
											<div class="blog__sidebar__recent__item__pic">
												<img src="${re.profimg }" alt=""
													style="width: 40px; height: 40px; border-radius: 50%">
											</div>
											<div class="blog__sidebar__recent__item__text">
												<h6>${re.btitle}</h6>
												<span>${re.bcname}|${re.mname}<span>
											</div>
										</a>
									</c:forEach>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<!-- 인기글 (공지사항제외) 끝 -->
			<!-- 최신글(공지사항 제외)  -->
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>최신글</h4>
					<div class="latest-product__slider owl-carousel">
						<!-- 최신글 list   -->
						<div class="latest-prdouct__slider__item">

							<c:choose>
								<c:when test="${empty recent }">
									<a href="#" class="latest-product__item">
										<div class="blog__sidebar__recent__item__text">
											<h6>데이터가 없습니다</h6>
										</div>
									</a>
								</c:when>
								<c:when test="${!empty recent}">
									<c:forEach var="re" items="${recent}" begin="0" end="4"
										step="1">
										<a
											href="<%=request.getContextPath()%>/board/read.do?bid=${re.bid}"
											class="latest-product__item">
											<div class="blog__sidebar__recent__item__pic">
												<img src="${re.profimg }" alt=""
													style="width: 40px; height: 40px; border-radius: 50%">
											</div>
											<div class="blog__sidebar__recent__item__text">
												<h6>${re.btitle}</h6>
												<span>${re.bcname}|${re.mname}<span>
											</div>
										</a>
									</c:forEach>
								</c:when>
							</c:choose>
						</div>
						<div class="latest-prdouct__slider__item">
							<c:choose>
								<c:when test="${empty recent }">
									<a href="#" class="latest-product__item">
										<div class="blog__sidebar__recent__item__text">
											<h6>데이터가 없습니다</h6>
										</div>
									</a>
								</c:when>
								<c:when test="${!empty recent}">
									<c:forEach var="re" items="${recent}" begin="5" end="9"
										step="1">
										<a
											href="<%=request.getContextPath()%>/board/read.do?bid=${re.bid}"
											class="latest-product__item">
											<div class="blog__sidebar__recent__item__pic">
												<img src="${re.profimg }" alt=""
													style="width: 40px; height: 40px; border-radius: 50%">
											</div>
											<div class="blog__sidebar__recent__item__text">
												<h6>${re.btitle}</h6>
												<span>${re.bcname}|${re.mname}<span>
											</div>
										</a>
									</c:forEach>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<!-- 최신글(공지사항 제외)끝  -->
		</div>
	</div>
</section>
<!-- 미니 게시판 끝 -->
<!-- 세일항목 캐러셀 -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-7">


				<jsp:include page="/WEB-INF/views/shop/saleList.jsp" />
			</div>
		</div>
	</div>
</section>
