<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			
			<jsp:include page="/WEB-INF/views/shop/shopcategory.jsp"></jsp:include>
			
			
			<div class="col-lg-10 col-md-7">
				<!-- Hero Section Begin -->
				<section class="hero hero-normal">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div class="hero__search">
									<div class="hero__search__form">
										<form action="#">
											<select name="">
												<option value="1" selected>카테고리 전체</option>
												<option value="2" <%if(request.getParameter("searchProduct").equals("1")) {%>selected<%}; %>>>Fresh Meat</option>
												<option value="3">Vegetables</option>
												<option value="4">Fruit & Nut Gifts</option>
											</select>
											
											<input type="text" name="searchProduct" id="searchProduct" placeholder="검색어를 입력해주세요.">
											<button type="submit" class="site-btn">SEARCH</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- Hero Section End -->


				<div class="product__discount">
					<div class="section-title product__discount__title">
						<h2>Sale Off</h2>
					</div>
					<div class="row">
						<div class="product__discount__slider owl-carousel">
							<div class="col-lg-4">
								<div class="product__discount__item">
									<div class="product__discount__item__pic set-bg"
										data-setbg="<%=request.getContextPath()%>/resources/img/product/discount/pd-1.jpg">
										<div class="product__discount__percent">-20%</div>
										<ul class="product__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<div class="product__discount__item__text">
										<span>Dried Fruit</span>
										<h5>
											<a href="#">Raisin’n’nuts</a>
										</h5>
										<div class="product__item__price">
											$30.00 <span>$36.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="product__discount__item">
									<div class="product__discount__item__pic set-bg"
										data-setbg="<%=request.getContextPath()%>/resources/img/product/discount/pd-2.jpg">
										<div class="product__discount__percent">-20%</div>
										<ul class="product__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<div class="product__discount__item__text">
										<span>Vegetables</span>
										<h5>
											<a href="#">Vegetables’package</a>
										</h5>
										<div class="product__item__price">
											$30.00 <span>$36.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="product__discount__item">
									<div class="product__discount__item__pic set-bg"
										data-setbg="<%=request.getContextPath()%>/resources/img/product/discount/pd-3.jpg">
										<div class="product__discount__percent">-20%</div>
										<ul class="product__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<div class="product__discount__item__text">
										<span>Dried Fruit</span>
										<h5>
											<a href="#">Mixed Fruitss</a>
										</h5>
										<div class="product__item__price">
											$30.00 <span>$36.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="product__discount__item">
									<div class="product__discount__item__pic set-bg"
										data-setbg="<%=request.getContextPath()%>/resources/img/product/discount/pd-4.jpg">
										<div class="product__discount__percent">-20%</div>
										<ul class="product__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<div class="product__discount__item__text">
										<span>Dried Fruit</span>
										<h5>
											<a href="#">Raisin’n’nuts</a>
										</h5>
										<div class="product__item__price">
											$30.00 <span>$36.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="product__discount__item">
									<div class="product__discount__item__pic set-bg"
										data-setbg="<%=request.getContextPath()%>/resources/img/product/discount/pd-5.jpg">
										<div class="product__discount__percent">-20%</div>
										<ul class="product__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<div class="product__discount__item__text">
										<span>Dried Fruit</span>
										<h5>
											<a href="#">Raisin’n’nuts</a>
										</h5>
										<div class="product__item__price">
											$30.00 <span>$36.00</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="product__discount__item">
									<div class="product__discount__item__pic set-bg"
										data-setbg="<%=request.getContextPath()%>/resources/img/product/discount/pd-6.jpg">
										<div class="product__discount__percent">-20%</div>
										<ul class="product__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
									<div class="product__discount__item__text">
										<span>Dried Fruit</span>
										<h5>
											<a href="#">Raisin’n’nuts</a>
										</h5>
										<div class="product__item__price">
											$30.00 <span>$36.00</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="product__item">
							<div class="product__item__pic set-bg"
								data-setbg="<%=request.getContextPath()%>/resources/img/product/product-1.jpg">
								<ul class="product__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="#"><i class="fa fa-retweet"></i></a></li>
									<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="product__item__text">
								<h6>
									<a href="#">Crab Pool Security</a>
								</h6>
								<h5>$30.00</h5>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="product__item">
							<div class="product__item__pic set-bg"
								data-setbg="<%=request.getContextPath()%>/resources/img/product/product-2.jpg">
								<ul class="product__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="#"><i class="fa fa-retweet"></i></a></li>
									<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="product__item__text">
								<h6>
									<a href="#">Crab Pool Security</a>
								</h6>
								<h5>$30.00</h5>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="product__item">
							<div class="product__item__pic set-bg"
								data-setbg="<%=request.getContextPath()%>/resources/img/product/product-3.jpg">
								<ul class="product__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="#"><i class="fa fa-retweet"></i></a></li>
									<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="product__item__text">
								<h6>
									<a href="#">Crab Pool Security</a>
								</h6>
								<h5>$30.00</h5>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="product__item">
							<div class="product__item__pic set-bg"
								data-setbg="<%=request.getContextPath()%>/resources/img/product/product-4.jpg">
								<ul class="product__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="#"><i class="fa fa-retweet"></i></a></li>
									<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="product__item__text">
								<h6>
									<a href="#">Crab Pool Security</a>
								</h6>
								<h5>$30.00</h5>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="product__item">
							<div class="product__item__pic set-bg"
								data-setbg="<%=request.getContextPath()%>/resources/img/product/product-5.jpg">
								<ul class="product__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="#"><i class="fa fa-retweet"></i></a></li>
									<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="product__item__text">
								<h6>
									<a href="#">Crab Pool Security</a>
								</h6>
								<h5>$30.00</h5>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="product__item">
							<div class="product__item__pic set-bg"
								data-setbg="<%=request.getContextPath()%>/resources/img/product/product-6.jpg">
								<ul class="product__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="#"><i class="fa fa-retweet"></i></a></li>
									<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="product__item__text">
								<h6>
									<a href="#">Crab Pool Security</a>
								</h6>
								<h5>$30.00</h5>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="product__item">
							<div class="product__item__pic set-bg"
								data-setbg="<%=request.getContextPath()%>/resources/img/product/product-7.jpg">
								<ul class="product__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="#"><i class="fa fa-retweet"></i></a></li>
									<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="product__item__text">
								<h6>
									<a href="#">Crab Pool Security</a>
								</h6>
								<h5>$30.00</h5>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="product__item">
							<div class="product__item__pic set-bg"
								data-setbg="<%=request.getContextPath()%>/resources/img/product/product-8.jpg">
								<ul class="product__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="#"><i class="fa fa-retweet"></i></a></li>
									<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="product__item__text">
								<h6>
									<a href="#">Crab Pool Security</a>
								</h6>
								<h5>$30.00</h5>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="product__item">
							<div class="product__item__pic set-bg"
								data-setbg="<%=request.getContextPath()%>/resources/img/product/product-9.jpg">
								<ul class="product__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="#"><i class="fa fa-retweet"></i></a></li>
									<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="product__item__text">
								<h6>
									<a href="#">Crab Pool Security</a>
								</h6>
								<h5>$30.00</h5>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="product__item">
							<div class="product__item__pic set-bg"
								data-setbg="<%=request.getContextPath()%>/resources/img/product/product-10.jpg">
								<ul class="product__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="#"><i class="fa fa-retweet"></i></a></li>
									<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="product__item__text">
								<h6>
									<a href="#">Crab Pool Security</a>
								</h6>
								<h5>$30.00</h5>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="product__item">
							<div class="product__item__pic set-bg"
								data-setbg="<%=request.getContextPath()%>/resources/img/product/product-11.jpg">
								<ul class="product__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="#"><i class="fa fa-retweet"></i></a></li>
									<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="product__item__text">
								<h6>
									<a href="#">Crab Pool Security</a>
								</h6>
								<h5>$30.00</h5>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6">
						<div class="product__item">
							<div class="product__item__pic set-bg"
								data-setbg="<%=request.getContextPath()%>/resources/img/product/product-12.jpg">
								<ul class="product__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="#"><i class="fa fa-retweet"></i></a></li>
									<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="product__item__text">
								<h6>
									<a href="#">Crab Pool Security</a>
								</h6>
								<h5>$30.00</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="product__pagination">
					<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"><i
						class="fa fa-long-arrow-right"></i></a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Product Section End -->
