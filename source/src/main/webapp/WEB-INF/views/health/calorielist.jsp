<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
					<!-- 칼로리 처방 받기 시작  -->
					<div class="tbl-y-wrap r5">
						<table class="table-health">
							<colgroup>
								<col style="width: 144px">
								<col style="width: 650px">
							</colgroup>
							<tbody>
								<tr>
									<th>총 감량기간</th>
									<td>
										<c:choose>
											<c:when test="${healthInfoVo.goal_term_type == 'M'}">
												${healthInfoVo.goal_term} 개월
											</c:when>
											<c:when test="${healthInfoVo.goal_term_type == 'D'}">
	    										${healthInfoVo.goal_term} 일
	  										</c:when>
										</c:choose>
				
										<%-- <span id="GOAL_TERM">${healthInfoVo.goal_term }</span> --%>
									</td>
								</tr>
								<tr>
									<th>현재체중</th>
									<td class="lh30"><span id="WEIGHT">${healthInfoVo.weight} kg</span></td>
								</tr>
								<tr>
									<th>목표체중</th>
									<td class="lh30"><span id="GOAL_WEIGHT">${healthInfoVo.goal_weight} kg</span></td>
								</tr>
								<tr>
									<th>표준체중</th>
									<td class="p-bk"><span id="AV_WEIGHT">${healthInfoVo.st_weight_float} kg</span></td>
								</tr>
								<tr>
									<th>미용체중</th>
									<td class="p-bk"><span id="AV_WEIGHT">${healthInfoVo.be_Weight_float} kg</span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 하루 소비 칼로리 시작 -->
					<h5>
						하루 소비 칼로리 <span class="p-org" id="ALL_MET"></span>
					</h5>
					<div class="tbl-y-wrap r5">
						<table class="table-health">
							<colgroup>
								<col style="width: 144px">
								<col style="width: 650px">
							</colgroup>
							<tbody>
								<tr>
									<td><span id="BASIC_MET" class="green" style="width: 557px;"> 
											<img alt=""	src="<%=request.getContextPath()%>/resources/img/health/bg_calorie_green.gif">
											${healthInfoVo.bmr }</span>
											
										<span id="ACTIVE_MET" class="yellow" style="width: 55px;">
											<img alt=""	src="<%=request.getContextPath()%>/resources/img/health/bg_calorie_yellow.gif">
											${healthInfoVo.amr }</span>
											
											
										<span id="DIGEST_MET" class="orange" style="width: 68px;">
											<img alt=""	src="<%=request.getContextPath()%>/resources/img/health/bg_calorie_orange.gif">
											${healthInfoVo.digestionEnergy }</span>									
											<em class="frame"></em>
									</td>
								</tr>
							</tbody>
						</table>
						<p>
							<img
								src="<%=request.getContextPath()%>/resources/img/health/txt_calorie.gif"
								alt="초록:기초대사량,노랑:활동대사량,주황:소화를 위한 에너지">
						</p>
					</div>
					<!-- 하루 소비 칼로리 끝-->

					<!-- 처방 칼로리 시작 -->
					<h5>처방 칼로리</h5>
					<table class="table-health">
						<colgroup>
							<col style="width: 400px">
							<col style="width: 650px">
						</colgroup>
						<tbody>
							<tr>
								<th>하루 동안 섭취해야 할 음식 칼로리</th>
								<td><span id="DAY_EAT_CAL">${healthInfoVo.day_eat_cal } kcal</span></td>
							</tr>
							<tr>
								<th>하루 동안 운동으로 소모해야 할 운동 칼로리</th>
								<td><span id="DAY_EXERCISE_CAL">${healthInfoVo.day_exercise_cal } kcal</span></td>
							</tr>
						</tbody>
					</table>
					<!-- 처방 칼로리 끝 -->
				</div>
				<!-- 칼로리 처방 받기 끝 -->

				<!-- 칼로리 처방 다시하기 버튼 시작 -->
				<div class="col-lg-12 text-center">
					<a href="<%=request.getContextPath()%>/health/caloriewrite" class="site-btn">다시하기</a>
				</div>
				<!-- 칼로리 처방 다시하기 버튼 끝 -->
			</div>
		</div>
	</div>

</section>
<!-- Blog Section End -->
