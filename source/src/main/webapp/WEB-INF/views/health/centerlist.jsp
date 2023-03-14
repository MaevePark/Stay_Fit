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
								<select name="category" id="category">
								    <option value="" ${empty category ? 'selected="selected"' : ''}>전체</option>
								    <option value="서울특별시" ${category == '서울특별시' ? 'selected="selected"' : ''}>서울특별시</option>
								    <option value="부산광역시" ${category == '부산광역시' ? 'selected="selected"' : ''}>부산광역시</option>
								    <option value="인천광역시" ${category == '인천광역시' ? 'selected="selected"' : ''}>인천광역시</option>
								    <option value="대전광역시" ${category == '대전광역시' ? 'selected="selected"' : ''}>대전광역시</option>
								    <option value="대구광역시" ${category == '대구광역시' ? 'selected="selected"' : ''}>대구광역시</option>
								    <option value="광주광역시" ${category == '광주광역시' ? 'selected="selected"' : ''}>광주광역시</option>
								    <option value="울산광역시" ${category == '울산광역시' ? 'selected="selected"' : ''}>울산광역시</option>
								    <option value="경기도" ${category == '경기도' ? 'selected="selected"' : ''}>경기도</option>
								    <option value="전라도" ${category == '전라도' ? 'selected="selected"' : ''}>전라도</option>
								    <option value="경상도" ${category == '경상도' ? 'selected="selected"' : ''}>경상도</option>
								    <option value="강원도" ${category == '강원도' ? 'selected="selected"' : ''}>강원도</option>
								    <option value="충청도" ${category == '충청도' ? 'selected="selected"' : ''}>충청도</option>
								    <option value="제주도" ${category == '제주도' ? 'selected="selected"' : ''}>제주도</option>
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
														<!-- 위치 링크 시작 -->
														<td id="map">
															<a id="maplink" onclick="healthCenterMap (															
															    <c:if test="${center.lid == 1 }">'강남구 보건소', '37.51630311339761', '127.04227756939835'</c:if>															    														    
															    <c:if test="${center.lid == 2 }">'강서구 보건소', '35.180235150684716', '128.9572976673653'</c:if>
															    <c:if test="${center.lid == 3 }">'강화군 보건소', '37.73728494653745', '126.48474092791898'</c:if>
															    <c:if test="${center.lid == 4 }">'대덕구 보건소', '36.44482868764453', '127.426551314056'</c:if>
															    <c:if test="${center.lid == 5 }">'남구 보건소', '35.85390139676481', '128.59152247146537'</c:if>
															    <c:if test="${center.lid == 6 }">'광산구 보건소', '35.139648146235686', '126.79363757877468'</c:if>
															    <c:if test="${center.lid == 7 }">'남구 보건소', '35.54535773288751', '129.33632823698335'</c:if>
															    <c:if test="${center.lid == 8 }">'가평군 보건소', '37.83350180940176', '127.51060217146764'</c:if>
															    <c:if test="${center.lid == 9 }">'강진군 보건소', '34.63833473188551', '126.77573097122912'</c:if>
															    <c:if test="${center.lid == 10 }">'거제시 보건소', '34.89168827150237', '128.6365616019532'</c:if>
															    <c:if test="${center.lid == 11 }">'강릉시 보건소', '37.74281029073316', '128.88275019847094'</c:if>
															    <c:if test="${center.lid == 12 }">'계룡시 보건소', '36.27307427576665', '127.2500603578764'</c:if>
															    <c:if test="${center.lid == 13 }">'서귀포시 동부 보건소', '33.27562881836351', '126.70342326443737'</c:if>															    													
															  );"><img
																	src="<%=request.getContextPath()%>/resources/img/health/btn_spot.gif"
																	alt="위치">
															</a>															
														</td>													
														<!-- 위치 링크 끝 -->
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
								<a href="<%=request.getContextPath()%>/${urlpattern }?category=${category}&keyword=${keyword}&page=1">
									<< </a>
							</c:if>
							<c:if test="${pagingMap.currentPage != 1}">
								<a	href="<%=request.getContextPath()%>/${urlpattern }?category=${category}&keyword=${keyword}&page=${pagingMap.currentPage -1}">
									< </a>
							</c:if>

							<c:forEach begin="${pagingMap.start }" end="${pagingMap.end }"
								var="num">
								<a	href="<%=request.getContextPath()%>/${urlpattern }?category=${category}&keyword=${keyword}&page=${num}">${num}
								</a>
							</c:forEach>

							<c:if test="${pagingMap.currentPage != pagingMap.totalPageCnt}">
								<a	href="<%=request.getContextPath()%>/${urlpattern }?category=${category}&keyword=${keyword}&page=${pagingMap.currentPage +1}">
									> </a>
							</c:if>
							<c:if test="${pagingMap.end != pagingMap.totalPageCnt}">
								<a	href="<%=request.getContextPath()%>/${urlpattern }?category=${category}&keyword=${keyword}&page=${pagingMap.totalPageCnt }">
									>> </a>
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
<script>
//<--------------------------------------------------------------------
// 1. kakao map 이동 시작
function healthCenterMap(location_name, latitude, longitude) {
	window.open("https://map.kakao.com/link/map/" +
			// link/map/장소이름,위도,경도 새로운 창으로 열기
			location_name + ","	+ latitude + "," + longitude); 
			
}
// 1. kakao map 이동 끝
//-------------------------------------------------------------------->
</script>