<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/calorielist.css"
	type="text/css">

<!-- Blog Section Begin -->
<section class="blog spad">
	<div class="container">
		<div class="row">
			<!-- 건강관리 페이지 카테고리 -->
			<jsp:include page="/WEB-INF/views/health/healthcategory.jsp"></jsp:include>

			<div class="col-lg-8 col-md-7">
				<div class="row">

					<h4 class="fw-bold py-3 mb-4">
						<span class="text-muted fw-light">건강관리 /</span> 칼로리 처방 받기
					</h4>
					<!-- 칼로리 처방 시작  -->
					<div class="tbl-y-wrap r5">
						<table class="table-health">
							<colgroup>
								<col style="width: 144px">
								<col style="width: 650px">
							</colgroup>
							<tbody>
								<tr>
									<th>총 감량기간</th>
									<td><span id="GOAL_TERM"><%=request.getParameter("goal_term")%></span></td>
								</tr>
								<tr>
									<th>현재체중</th>
									<td class="lh30"><span id="WEIGHT"><%=request.getParameter("weight")%></span></td>
								</tr>
								<tr>
									<th>목표체중</th>
									<td class="lh30"><span id="GOAL_WEIGHT"><%=request.getParameter("goal_weight")%></span></td>
								</tr>
							</tbody>
						</table>
					</div>

					<p class="bul-tip bdb-dotted" id="AV_WEIGHT">
						<span class="p-bk">표준체중 9.9</span> / 미용 추천 체중 <span class="p-bk">3.9</span>
						입니다.
					</p>
					<h5>
						하루 소비 칼로리는 <span class="p-org" id="ALL_MET">1085kcal</span>
					</h5>
					<div class="r5 box calorie">
						<div class="inner clfix">
							<span id="BASIC_MET" class="green" style="width: 557px;">888</span>
							<span id="ACTIVE_MET" class="yellow" style="width: 55px;">88</span>
							<span id="DIGEST_MET" class="orange" style="width: 68px;">108</span>
							<em class="frame"></em>
						</div>
						<p>
							<img
								src="<%=request.getContextPath()%>/resources/img/health/txt_calorie.gif"
								alt="초록:기초대사량,노랑:활동대사량,주황:소화를 위한 에너지">
						</p>
					</div>
					<h5>처방 칼로리</h5>
					<table class="table-health">
						<colgroup>
							<col style="width: 400px">
							<col style="width: 650px">
						</colgroup>
						<tbody>
							<tr>
								<th>하루 동안 섭취해야 할 음식 칼로리</th>
								<td><span id="DAY_EAT_CAL"></span></td>
							</tr>
							<tr>
								<th>하루 동안 운동으로 소모해야 할 칼로리</th>
								<td><span id="DAY_EXERCISE_CAL"></span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 칼로리 처방  끝 -->

				<!-- 칼로리 처방 다시하기 버튼 시작 -->
				<div class="col-lg-12 text-center">
					<button type="submit" class="site-btn">다시하기</button>
				</div>
				<!-- 칼로리 처방 다시하기 버튼 끝 -->
			</div>
		</div>
	</div>

</section>
<!-- Blog Section End -->
