<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mypagemyboard.css" type="text/css">

<!-- Blog Section Begin -->
<section class="blog spad">
	<div class="container">
		<div class="row">
			<!-- 건강관리 페이지 카테고리 -->
			<jsp:include page="/WEB-INF/views/health/healthcategory.jsp"></jsp:include>

			<div class="col-lg-10 col-md-10">
				<div class="row">



					<div class="hero__search__form">
						<form action="#">
							<div class="hero__search__categories">
								<select name="">
									<option value="1" selected>전체</option>
									<option value="2">서울특별시</option>
									<option value="3">부산광역시</option>
									<option value="4">인천광역시</option>
									<option value="5">대전광역시</option>
									<option value="6">대구광역시</option>
									<option value="7">광주광역시</option>
									<option value="8">울산광역시</option>
									<option value="9">경기도</option>
									<option value="10">전라도</option>
									<option value="11">경상도</option>
									<option value="12">강원도</option>
									<option value="13">충청도</option>
									<option value="14">제주도</option>
								</select>
							</div>
							<!--                                 <div class="hero__search__categories">
                                	<select name="">
                                    	<option value="1" selected>전체</option>
                                    	<option value="2">작성자</option>
                                    	<option value="3">제목</option>
                                    </select>
                                </div> -->
							<input type="text" placeholder="검색어를 입력해주세요.">
							<button type="submit" class="site-btn">SEARCH</button>
						</form>
					</div>

					<div class="container-xl flex-grow-1 container-p-y">
						<!-- Basic Bootstrap Table -->
						<div class="card">
							<h5 class="card-header">인바디 측정 보건소 </h5>
							<div class="table-responsive text-nowrap">
								<table class="table">
									<thead>
										<tr>
											<th>측정장소</th>
											<th colspan="3">주소</th>
											<th>전화번호</th>
											<th>위치</th>
										</tr>
									</thead>
									<tbody class="table-border-bottom-0">
									<!-- 보건소 list 시작 -->

										<tr>
											<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
												<strong>강남구 보건소</strong></td>
											<td colspan="3">주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소</td>
											<td><span class="badge bg-label-primary me-1">02-000-0000</span></td>
											<td>
												<!-- 위치 링크 시작 -->
												<div class="">
													<a class="" href=""></a>
												</div> 
												<!-- 위치 링크 끝 -->
											</td>
										</tr>
										<tr>
											<td><i class="fab fa-react fa-lg text-info me-3"></i> <strong>강남구
													보건소</strong></td>
											<td colspan="3">주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소</td>
											<td><span class="badge bg-label-success me-1">02-000-0000</span></td>
											<td>
												<!-- 위치 링크 시작 -->
												<div class="">
													<a class="" href=""></a>
												</div> 
												<!-- 위치 링크 끝 -->
											</td>
										</tr>
										<tr>
											<td><i class="fab fa-vuejs fa-lg text-success me-3"></i>
												<strong>강남구 보건소</strong></td>
											<td colspan="3">주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소</td>
											<td><span class="badge bg-label-info me-1">02-000-0000</span></td>
											<td>
												<!-- 위치 링크 시작 -->											
												<div class="">
													<a class="" href=""></a>
												</div> 
												<!-- 위치 링크 끝 -->
											</td>
										</tr>
										<tr>
											<td><i class="fab fa-bootstrap fa-lg text-primary me-3"></i>
												<strong>강남구 보건소</strong></td>
											<td colspan="3">주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소</td>
											<td><span class="badge bg-label-warning me-1">02-000-0000</span></td>
											<td>
												<!-- 위치 링크 시작 -->
												<div class="">
													<a class="" href=""></a>
												</div> 
												<!-- 위치 링크 끝 -->
											</td>
										</tr>
									
									<!-- 보건소 list 끝 -->
									</tbody>
								</table>
							</div>
						</div>
						<!--/ Basic Bootstrap Table -->
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