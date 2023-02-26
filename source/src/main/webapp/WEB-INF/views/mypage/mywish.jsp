<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
// window.onload = function() {
// 	$.ajax({
// 		url:
// 		,type:
// 		,async:
// 		,data:{}
// 		,dataType:
// 		,success:
// 		,error:
// 	});
// }
</script>

<!-- Blog Section Begin -->
<input type="hidden" name="mid" value="3">
<section class="blog spad">
	<div class="container">
		<div class="row">
			<!-- 마이페이지 카테고리 -->
			<jsp:include page="/WEB-INF/views/mypage/mypagecategory.jsp"></jsp:include>

			<div class="col-lg-10 col-md-7">

				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">마이페이지 /</span> 찜목록
				</h4>

				<div class="row">
				
					<c:forEach items="${wishList }" var="list">
						<div class="col-lg-4 col-md-6 col-sm-6">
							<div class="product__item">
								<div class="product__item__pic set-bg"
									data-setbg="${list.pimage }">
									<ul class="product__item__pic__hover">
										<li><a href="#">X</a></li>
									</ul>
								</div>
								<div class="product__item__text">
									<h6>
										<a href="#">${list.pname }</a>
									</h6>
									<h5>${list.pprice }원</h5>
								</div>
							</div>
						</div>
					</c:forEach>
					
					<!-- 페에징 -->
					<jsp:include page="/WEB-INF/views/mypage/paging.jsp" />
					
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Blog Section End -->