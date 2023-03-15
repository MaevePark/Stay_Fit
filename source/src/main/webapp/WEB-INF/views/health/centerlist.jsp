<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Blog Section Begin -->
<section class="blog spad">
	<div class="container">
		<div class="row">
			<!-- 건강관리 페이지 카테고리 -->
			<jsp:include page="/WEB-INF/views/health/healthcategory.jsp"></jsp:include>

			<div class="col-lg-10 col-md-10">
				<div class="row">
					<h4 class="fw-bold py-3 mb-4">
						<span class="text-muted fw-light">건강관리 /</span> 보건소 조회
					</h4>
					<div class="hero__search__form">
						<!-- 검색 시작 -->
						<form action="<%=request.getContextPath()%>/health/centerlist"
							name="search_form" method="get">
							<div class="hero__search__categories">
								<select name="search" id="search">
								    <option value="" ${empty search ? 'selected="selected"' : ''}>전체</option>
								    <option value="서울특별시" ${search == '서울특별시' ? 'selected="selected"' : ''}>서울특별시</option>
								    <option value="부산광역시" ${search == '부산광역시' ? 'selected="selected"' : ''}>부산광역시</option>
								    <option value="인천광역시" ${search == '인천광역시' ? 'selected="selected"' : ''}>인천광역시</option>
								    <option value="대전광역시" ${search == '대전광역시' ? 'selected="selected"' : ''}>대전광역시</option>
								    <option value="대구광역시" ${search == '대구광역시' ? 'selected="selected"' : ''}>대구광역시</option>
								    <option value="광주광역시" ${search == '광주광역시' ? 'selected="selected"' : ''}>광주광역시</option>
								    <option value="울산광역시" ${search == '울산광역시' ? 'selected="selected"' : ''}>울산광역시</option>
								    <option value="경기도" ${search == '경기도' ? 'selected="selected"' : ''}>경기도</option>
								    <option value="전라도" ${search == '전라도' ? 'selected="selected"' : ''}>전라도</option>
								    <option value="경상도" ${search == '경상도' ? 'selected="selected"' : ''}>경상도</option>
								    <option value="강원도" ${search == '강원도' ? 'selected="selected"' : ''}>강원도</option>
								    <option value="충청도" ${search == '충청도' ? 'selected="selected"' : ''}>충청도</option>
								    <option value="제주도" ${search == '제주도' ? 'selected="selected"' : ''}>제주도</option>
								</select>						
							</div>							
							<input type="text" name="keyword" id="keyword" value="${keyword}" placeholder="지역을 입력해주세요.">
							<button type="submit" class="site-btn">SEARCH</button>
							<!-- 검색 끝 -->
						</form>
					</div>
					<div class="container-xl flex-grow-1 container-p-y">
						<!-- Basic Bootstrap Table -->
						<div class="card">
							<div class="table-responsive text-nowrap">
								<table class="table">
									<thead>
										<tr>
											<th>지역</th>
											<th colspan="2">측정장소</th>
											<th colspan="3">주소</th>
											<th colspan="2">전화번호</th>
											<th>위치</th>
										</tr>
									</thead>
									<tbody class="table-border-bottom-0">
										<c:choose>
											<c:when test="${empty centerList }">
												<tr>
													<td colspan="9" align="center">데이터가 없습니다.</td>
												</tr>
											</c:when>
											<c:when test="${!empty centerList}">
												<!-- 보건소 list 시작 -->
												<c:forEach var="center" items="${centerList }">
													<tr>													
														<!-- 지역 이름 -->														
														<td>${center.lname }</td>
														<!-- 측정 장소  -->
														<td colspan="2">${center.hplace }</td>
														<!-- 주소 -->
														<td colspan="3">${center.haddr }</td>
														<!-- 전화번호 -->
														<td colspan="2">${center.hpnum }</td>
														<!-- kakao map 링크 시작 -->
														<td id="map">
															<a id="maplink" onclick="healthCenterMap ('${center.hplace }','${center.haddr }');"><img
																	src="<%=request.getContextPath()%>/resources/img/health/btn_spot.gif"
																	alt="위치">
															</a>															
														</td>													
														<!-- kakao map 링크 끝 -->
													</tr>
												</c:forEach>
												<!-- 보건소 list 끝 -->
											</c:when>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
						<!--/ Basic Bootstrap Table -->
					</div>
					<!-- 페이징 시작 -->
					<div class="col-lg-12">
						<div class="product__pagination">
							<c:if test="${pagingMap.start != 1}">
								<a href="<%=request.getContextPath()%>/${urlpattern }?search=${search}&keyword=${keyword}&page=1">
									&laquo; </a>
							</c:if>
							<c:if test="${pagingMap.currentPage != 1}">
								<a	href="<%=request.getContextPath()%>/${urlpattern }?search=${search}&keyword=${keyword}&page=${pagingMap.currentPage -1}">
									&lt; </a>
							</c:if>

							<c:forEach begin="${pagingMap.start }" end="${pagingMap.end }"
								var="num">
								<a	href="<%=request.getContextPath()%>/${urlpattern }?search=${search}&keyword=${keyword}&page=${num}">${num}
								</a>
							</c:forEach>

							<c:if test="${pagingMap.currentPage != pagingMap.totalPageCnt}">
								<a	href="<%=request.getContextPath()%>/${urlpattern }?search=${search}&keyword=${keyword}&page=${pagingMap.currentPage +1}">
									&gt; </a>
							</c:if>
							<c:if test="${pagingMap.end != pagingMap.totalPageCnt}">
								<a	href="<%=request.getContextPath()%>/${urlpattern }?search=${search}&keyword=${keyword}&page=${pagingMap.totalPageCnt }">
									&raquo; </a>
							</c:if>
						</div>
					</div>
					<!-- 페이징 끝 -->
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Blog Section End -->
<!-- 서비스 키 시작 !노출 주의! -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=373fbab82f1b76357a0cb714502f860d&libraries=services"></script>
<!-- 서비스 키 끝 !노출 주의! -->
<script>
//<--------------------------------------------------------------------
// 1. kakao map 이동 시작
function healthCenterMap(location_name, haddress) {
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(haddress, function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
			var latitude = result[0].y; // 위도
			var longitude = result[0].x; // 경도
			// link/map/장소이름,위도,경도 새로운 창으로 열기
	        window.open("https://map.kakao.com/link/map/" +
	    		location_name + ","	+ latitude + "," + longitude); 
	    } 
	});    
}
// 1. kakao map 이동 끝
//-------------------------------------------------------------------->
</script>