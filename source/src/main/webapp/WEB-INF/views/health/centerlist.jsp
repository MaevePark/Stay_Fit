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
						<form action="#">
							<div class="hero__search__categories">
								<select>
									<option value="0" selected>전체</option>
									<option value="1">서울특별시</option>
									<option value="2">부산광역시</option>
									<option value="3">인천광역시</option>
									<option value="4">대전광역시</option>
									<option value="5">대구광역시</option>
									<option value="6">광주광역시</option>
									<option value="7">울산광역시</option>
									<option value="8">경기도</option>
									<option value="9">전라도</option>
									<option value="10">경상도</option>
									<option value="11">강원도</option>
									<option value="12">충청도</option>
									<option value="13">제주도</option>
								</select>
							</div>

							<input type="text" placeholder="검색어를 입력해주세요.">
							<button type="submit" class="site-btn">SEARCH</button>
						</form>
					</div>

					<div class="container-xl flex-grow-1 container-p-y">
						<!-- Basic Bootstrap Table -->
						<div class="card">
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
										<c:forEach var="centerList" items="${centerList }">
											<tr>
												<!-- 측정 장소  -->
												<td>${centerList.hplace }</td>
												<!-- 주소 -->
												<td colspan="3">${centerList.haddr }</td>
												<!-- 전화번호 -->
												<td>${centerList.hpnum }</td>
												<!-- 위치 링크 시작 -->
												<td id="map"><a id="maplink" style="cursor: pointer"
													onclick="healthCenterMap (
													    <c:if test="${centerList.lid eq 1 }">'강남구 보건소', '37.51630311339761', '127.04227756939835'</c:if>
													    <c:if test="${centerList.lid eq 2 }">'강서구 보건소', '35.180235150684716', '128.9572976673653'</c:if>
													    <c:if test="${centerList.lid eq 3 }">'강화군 보건소', '37.73728494653745', '126.48474092791898'</c:if>
													    <c:if test="${centerList.lid eq 4 }">'대덕구 보건소', '36.44482868764453', '127.426551314056'</c:if>
													    <c:if test="${centerList.lid eq 5 }">'남구 보건소', '35.85390139676481', '128.59152247146537'</c:if>
													    <c:if test="${centerList.lid eq 6 }">'광산구 보건소', '35.139648146235686', '126.79363757877468'</c:if>
													    <c:if test="${centerList.lid eq 7 }">'남구 보건소', '35.54535773288751', '129.33632823698335'</c:if>
													    <c:if test="${centerList.lid eq 8 }">'가평군 보건소', '37.83350180940176', '127.51060217146764'</c:if>
													    <c:if test="${centerList.lid eq 9 }">'강진군 보건소', '34.63833473188551', '126.77573097122912'</c:if>
													    <c:if test="${centerList.lid eq 10 }">'거제시 보건소', '34.89168827150237', '128.6365616019532'</c:if>
													    <c:if test="${centerList.lid eq 11 }">'강릉시 보건소', '37.74281029073316', '128.88275019847094'</c:if>
													    <c:if test="${centerList.lid eq 12 }">'계룡시 보건소', '36.27307427576665', '127.2500603578764'</c:if>
													    <c:if test="${centerList.lid eq 13 }">'서귀포시 동부 보건소', '33.27562881836351', '126.70342326443737'</c:if>													    
													  );"><img
														src="<%=request.getContextPath()%>/resources/img/health/btn_spot.gif"
														alt="위치"> </a></td>
												<!-- 위치 링크 끝 -->
											</tr>
										</c:forEach>
										<!-- 보건소 list 끝 -->
									</tbody>
								</table>
							</div>
						</div>
						<!--/ Basic Bootstrap Table -->
					</div>
					<!-- 페이징 시작 -->
					<div class="col-lg-12">
						<div class="product__pagination ">
							<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"><i
								class="fa fa-long-arrow-right"></i></a>
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