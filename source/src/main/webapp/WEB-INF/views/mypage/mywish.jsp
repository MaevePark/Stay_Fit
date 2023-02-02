<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
            	<!-- 마이페이지 카테고리 -->
                <jsp:include page="/WEB-INF/views/mypage/mypagecategory.jsp"></jsp:include>

				<div class="col-lg-8 col-md-7">
					<div class="row">
						
						<h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">마이페이지 /</span> 찜목록
						</h4>
						
						<div class="row">
							<div class="col-lg-4 col-md-6 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"
										data-setbg="<%=request.getContextPath() %>/resources/img/product/product-1.jpg">
										<ul class="product__item__pic__hover">
											<li><a href="#">X</a></li>
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
										data-setbg="<%=request.getContextPath() %>/resources/img/product/product-2.jpg">
										<ul class="product__item__pic__hover">
											<li><a href="#">X</a></li>
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
										data-setbg="<%=request.getContextPath() %>/resources/img/product/product-3.jpg">
										<ul class="product__item__pic__hover">
											<li><a href="#">X</a></li>
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
										data-setbg="<%=request.getContextPath() %>/resources/img/product/product-4.jpg">
										<ul class="product__item__pic__hover">
											<li><a href="#">X</a></li>
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
										data-setbg="<%=request.getContextPath() %>/resources/img/product/product-5.jpg">
										<ul class="product__item__pic__hover">
											<li><a href="#">X</a></li>
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
										data-setbg="<%=request.getContextPath() %>/resources/img/product/product-6.jpg">
										<ul class="product__item__pic__hover">
											<li><a href="#">X</a></li>
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