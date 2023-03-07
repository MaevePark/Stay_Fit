<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage.css">


<!-- Blog Section Begin -->
<section class="blog spad">
	<div class="container">
		<div class="row">
			<!-- 마이페이지 카테고리 -->
			<jsp:include page="/WEB-INF/views/mypage/mypagecategory.jsp"></jsp:include>

			<div class="col-lg-10 col-md-7">

				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">마이페이지 /</span> 구매기록
				</h4>

				<div class="container-xl flex-grow-1 container-p-y">
					<!-- Basic Bootstrap Table -->
					<div class="card">
						<div class="table-responsive text-nowrap">
							<table class="table" id="orderTable">
								<thead>
									<tr>
										<th>상품명</th>
										<th>가격</th>
										<th>수량</th>
										<th>총액</th>
										<th>상품 페이지</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">
									<c:if test="${orderList.size() > 0 }">
										<c:forEach items="${orderList }" var="list">
											<tr>
												<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
													<span>${list.PNAME }</span>
												</td>
												<td><span>${list.PPRICE }원</span></td>
												<td><span>${list.OCOUNT }</span></td>
												<td><span>${list.OCOUNT * list.PPRICE }</span></td>
												<td><button onclick="location.href='${list.PLINK }'"><span>상품 페이지로 이동</span></button></td>
											</tr>
										</c:forEach>
									
										
									</c:if>
									
									<c:if test="${orderList.size() <= 0 }">
										<tr>
											<td colspan="5"><h5>구매기록이 없습니다.</h5></td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					<!--/ Basic Bootstrap Table -->
				</div>
				<c:if test="${orderList.size() > 0 }">
					<!-- 페에징 -->
					<jsp:include page="/WEB-INF/views/paging.jsp" />
				</c:if>
				
				
			</div>
		</div>
	</div>
</section>
<!-- Blog Section End -->