<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Blog Section Begin -->
<section class="blog spad">
	<div class="container">
		<div class="row">
			<!-- 건강관리 페이지 카테고리 -->
			<jsp:include page="/WEB-INF/views/health/healthcategory.jsp"></jsp:include>

			<div class="col-lg-8 col-md-7">
				<div class="row">

					<h4 class="fw-bold py-3 mb-4">
						<span class="text-muted fw-light">건강관리 /</span> BMI 지수 확인
					</h4>
					<!-- BMI 지수 확인  시작  -->
					<table class="table-health">
						<colgroup>
							<col style="width: 150px">
							<col style="width: 650px">
						</colgroup>
						<tbody>
							<tr>
								<th>성별</th>
								<td><%= request.getParameter("sex") %></td>
							</tr>
							<tr>
								<th>연령</th>
								<td></td>
							</tr>
							<tr>
								<th>키</th>
								<td><%= request.getParameter("stature") %></td>
							</tr>
							<tr>
								<th>몸무게</th>
								<td><%= request.getParameter("weight") %></td>
							</tr>
						</tbody>
					</table>
					<div>
						<p>
							<span>비만도 기준</span> : <span>18.5 미만 저체중</span><span> /
								18.5 ~ 22.9 정상</span><span> / 23.0 ~ 24.9 과체중</span><span> /
								25.0 이상 비만</span>
						</p>
					</div>
					<table class="table-health">
						<colgroup>
							<col style="width: 150px">
							<col style="width: 650px">
						</colgroup>
						<tbody>
							<tr>
								<th>당신의 BMI 지수</th>
								<td></td>
							</tr>
						</tbody>
					</table>
					<!-- BMI 지수 확인  끝 -->

					<!-- 다시하기 버튼 시작 -->
					<div class="col-lg-12 text-center">
						<a href="<%=request.getContextPath()%>/health/bmiwrite" class="site-btn">다시하기</a>
					</div>
					<!-- 다시하기 버튼 끝 -->
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Blog Section End -->
