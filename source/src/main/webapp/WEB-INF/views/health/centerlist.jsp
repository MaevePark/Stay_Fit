<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mypagemyboard.css" type="text/css">
<%-- [[${centerList }]] --%>
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
								<select name="lid" id="lid">
									<option value="0">전체</option>
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
									<c:forEach var="centerList" items="${centerList }">
										<tr>
											<td>${centerList.hplace }</td> <!-- 측정 장소  -->
											<td colspan="3">${centerList.haddr }</td> <!-- 주소 -->
											<td>${centerList.hpnum }</td> <!-- 전화번호 -->
						
											<!-- 위치 링크 시작 -->			
											<td>													
												<a id="map" style="cursor:pointer" onclick="setHealthMap('강남구 보건소', '37.51630311339761', '127.04227756939835');">
													<img src="<%=request.getContextPath()%>/resources/img/health/btn_spot.gif" alt="위치"></a>
											</td>
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
<script>
//<--------------------------------------------------------------------
// 1. kakao map 이동 시작
function setHealthMap(location_name, latitude, longitude) {
	window.open ("https://map.kakao.com/link/map/" + 
			location_name+"," + latitude+"," + longitude); // link/map/장소이름,위도,경도 새로운 창으로 열기
}
// 1. kakao map 이동 끝
//-------------------------------------------------------------------->
</script>