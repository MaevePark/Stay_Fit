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
                        <button type="button" onclick="location.href='<%=request.getContextPath() %>/board/list?bcid=0'" style="margin-right: 20px; height: 30px; width: 30px; border: 1px solid rgb(232, 232, 232); background: #F3F6FA;">+</button>
                    </div>

					<!-- <span><button type="button" onclick="location.href='board/list?bcid=0'" class="btn btn-sm btn-notice">+</button>
					</span> -->
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


<!-- Blog Section Begin -->
<section class="blog spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-5">
				<div class="blog__sidebar">
					<div class="blog__sidebar__search">
						<form action="#">
							<input type="text" placeholder="Search...">
							<button type="submit">
								<span class="icon_search"></span>
							</button>
						</form>
					</div>
					<div class="blog__sidebar__item">
						<h4>Categories</h4>
						<ul>
							<li><a href="#">All</a></li>
							<li><a href="#">Beauty (20)</a></li>
							<li><a href="#">Food (5)</a></li>
							<li><a href="#">Life Style (9)</a></li>
							<li><a href="#">Travel (10)</a></li>
						</ul>
					</div>
					<div class="blog__sidebar__item">
						<h4>Recent News</h4>
						<div class="blog__sidebar__recent">
							<a href="#" class="blog__sidebar__recent__item">
								<div class="blog__sidebar__recent__item__pic">
									<img
										src="<%=request.getContextPath()%>/resources/img/blog/sidebar/sr-1.jpg"
										alt="">
								</div>
								<div class="blog__sidebar__recent__item__text">
									<h6>
										09 Kinds Of Vegetables<br /> Protect The Liver
									</h6>
									<span>MAR 05, 2019</span>
								</div>
							</a> <a href="#" class="blog__sidebar__recent__item">
								<div class="blog__sidebar__recent__item__pic">
									<img
										src="<%=request.getContextPath()%>/resources/img/blog/sidebar/sr-2.jpg"
										alt="">
								</div>
								<div class="blog__sidebar__recent__item__text">
									<h6>
										Tips You To Balance<br /> Nutrition Meal Day
									</h6>
									<span>MAR 05, 2019</span>
								</div>
							</a> <a href="#" class="blog__sidebar__recent__item">
								<div class="blog__sidebar__recent__item__pic">
									<img
										src="<%=request.getContextPath()%>/resources/img/blog/sidebar/sr-3.jpg"
										alt="">
								</div>
								<div class="blog__sidebar__recent__item__text">
									<h6>
										4 Principles Help You Lose <br />Weight With Vegetables
									</h6>
									<span>MAR 05, 2019</span>
								</div>
							</a>
						</div>
					</div>
					<div class="blog__sidebar__item">
						<h4>Search By</h4>
						<div class="blog__sidebar__item__tags">
							<a href="#">Apple</a> <a href="#">Beauty</a> <a href="#">Vegetables</a>
							<a href="#">Fruit</a> <a href="#">Healthy Food</a> <a href="#">Lifestyle</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-8 col-md-7">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<img
									src="<%=request.getContextPath()%>/resources/img/blog/blog-2.jpg"
									alt="">
							</div>
							<div class="blog__item__text">
								<ul>
									<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
									<li><i class="fa fa-comment-o"></i> 5</li>
								</ul>
								<h5>
									<a href="#">6 ways to prepare breakfast for 30</a>
								</h5>
								<p>Sed quia non numquam modi tempora indunt ut labore et
									dolore magnam aliquam quaerat</p>
								<a href="#" class="blog__btn">READ MORE <span
									class="arrow_right"></span></a>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<img
									src="<%=request.getContextPath()%>/resources/img/blog/blog-3.jpg"
									alt="">
							</div>
							<div class="blog__item__text">
								<ul>
									<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
									<li><i class="fa fa-comment-o"></i> 5</li>
								</ul>
								<h5>
									<a href="#">Visit the clean farm in the US</a>
								</h5>
								<p>Sed quia non numquam modi tempora indunt ut labore et
									dolore magnam aliquam quaerat</p>
								<a href="#" class="blog__btn">READ MORE <span
									class="arrow_right"></span></a>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<img
									src="<%=request.getContextPath()%>/resources/img/blog/blog-1.jpg"
									alt="">
							</div>
							<div class="blog__item__text">
								<ul>
									<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
									<li><i class="fa fa-comment-o"></i> 5</li>
								</ul>
								<h5>
									<a href="#">Cooking tips make cooking simple</a>
								</h5>
								<p>Sed quia non numquam modi tempora indunt ut labore et
									dolore magnam aliquam quaerat</p>
								<a href="#" class="blog__btn">READ MORE <span
									class="arrow_right"></span></a>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<img
									src="<%=request.getContextPath()%>/resources/img/blog/blog-4.jpg"
									alt="">
							</div>
							<div class="blog__item__text">
								<ul>
									<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
									<li><i class="fa fa-comment-o"></i> 5</li>
								</ul>
								<h5>
									<a href="#">Cooking tips make cooking simple</a>
								</h5>
								<p>Sed quia non numquam modi tempora indunt ut labore et
									dolore magnam aliquam quaerat</p>
								<a href="#" class="blog__btn">READ MORE <span
									class="arrow_right"></span></a>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<img
									src="<%=request.getContextPath()%>/resources/img/blog/blog-4.jpg"
									alt="">
							</div>
							<div class="blog__item__text">
								<ul>
									<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
									<li><i class="fa fa-comment-o"></i> 5</li>
								</ul>
								<h5>
									<a href="#">The Moment You Need To Remove Garlic From The
										Menu</a>
								</h5>
								<p>Sed quia non numquam modi tempora indunt ut labore et
									dolore magnam aliquam quaerat</p>
								<a href="#" class="blog__btn">READ MORE <span
									class="arrow_right"></span></a>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<img
									src="<%=request.getContextPath()%>/resources/img/blog/blog-6.jpg"
									alt="">
							</div>
							<div class="blog__item__text">
								<ul>
									<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
									<li><i class="fa fa-comment-o"></i> 5</li>
								</ul>
								<h5>
									<a href="#">Cooking tips make cooking simple</a>
								</h5>
								<p>Sed quia non numquam modi tempora indunt ut labore et
									dolore magnam aliquam quaerat</p>
								<a href="#" class="blog__btn">READ MORE <span
									class="arrow_right"></span></a>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="product__pagination blog__pagination">
							<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"><i
								class="fa fa-long-arrow-right"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Blog Section End -->
