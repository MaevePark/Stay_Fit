<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/calendar/lib/main.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/calendar/lib/calendar.css"
	type="text/css">
<% if(request.getSession().getAttribute("mid") == null){ %>
<script>
window.onload = function() {
    location.href = "<%=request.getContextPath()%>/member/login";
}
</script>
<%} else {%>

<%}%>
<%if(request.getSession().getAttribute("mid") != null) {
    int mid = (int) request.getSession().getAttribute("mid");
    %>
<input type="hidden" id="mid" name="mid" value="<%=mid%>">
<%}%>

<section class="blog spad">
	<div>
		<div id='calendar'></div>
	</div>
	
	
	
	<div id="calendar-modal" class="modal fade" data-backdrop="static" 
		data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
		<!-- Add Modal -->
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">다이어리 작성하기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal Body -->
				<form id="diary-form">
				<div class="modal-body modal-box">
					<div class="weight-group">
						<span class="modal-txt">몸무게 : </span> 
						<input type="text" class="diary-modal-input"
							id="weight-input" onkeydown="this.value=this.value.replace(/[^\.0-9]/g,'')"
							onkeyup="this.value=this.value.replace(/[^\.0-9]/g,'')"
							onkeypress="return isNumberKey(event)"
							onblur="this.value=this.value.replace(/[^-\.0-9]/g,'')">
							<span>&nbsp;&nbsp;kg</span>
					</div>
					<div class="btn-group-toggle radio-group" data-toggle="buttons">
						<label class="rounded-circle btn btn-light btn-kcal"
							for="breakfast"> <input type="radio" class="kcal-radio"
							name="breakfast" id="breakfast" checked> kcal
						</label> <label class="rounded-circle btn btn-light btn-kcal" for="lunch">
							<input type="radio" class="kcal-radio" name="lunch" id="lunch">
							kcal
						</label> <label class="rounded-circle btn btn-light btn-kcal" for="dinner">
							<input type="radio" class="kcal-radio" name="dinner" id="dinner">kcal
						</label>
						<div>
							<span class="kcal-txt">아침</span> <span class="kcal-txt">점심</span>
							<span class="kcal-txt">저녁</span>
						</div>
						<label class="rounded-circle btn btn-light btn-kcal" for="snack1">
							<input type="radio" class="kcal-radio" name="snack1" id="snack1"
							data-toggle="buttons"> kcal
						</label> <label class="rounded-circle btn btn-light btn-kcal"> <input
							type="radio" class="kcal-radio" name="snack2" id="snack2">
							kcal
						</label> <label class="rounded-circle btn btn-light btn-kcal"> <input
							type="radio" class="kcal-radio" name="snack3" id="snack3">
							kcal
						</label>
						<div>
							<span class="kcal-txt2">오전간식</span> <span class="kcal-txt2">오후간식</span><span
								class="kcal-txt">야식</span>
						</div>
					</div>
					<div class="search-group">
						<input type="text" class="diary-modal-input" data-toggle="modal" data-target="#search-meal" placeholder="식단메뉴 검색">
							<table id="mealTable" class="table table-striped table-hover">
								<thead>
									<tr>
										<th class="menu_name" scope="col" class="td-menu">식단 메뉴</th>
										<th class="sersize" scope="col">1회 제공량</th>
										<th class="td-kcal" scope="col">섭취 칼로리</th>
										<th class="remove_col" scope="col">제거</th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
						<input type="text" class="diary-modal-input" data-toggle="modal" data-target="#search-training" placeholder="운동 검색">
							<table id="exerciseTable" class="table table-striped table-hover">
								<thead>
									<tr>
										<th class="menu_name" scope="col" class="td-menu">운동 종류</th>
										<th class="duration" scope="col">시간</th>
										<th class="td-kcal" scope="col">소모 칼로리</th>
										<th class="remove_col" scope="col">제거</th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</div>
					</div>
				<div class="modal-footer">
					<button type="button" class="btn-cancel btn btn-danger" data-dismiss="modal">취소</button>
					<button type="submit" class="btn-add btn btn-success">등록</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 식단메뉴 검색 모달 -->
	<div id="search-meal" class="modal fade" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<!-- Add Modal -->
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">식단메뉴 검색</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal Body -->
				<div class="modal-body">
					<form method="get" name="searchMeal">
						<div class="input-group">
							<input type="text" class="form-control" id="searchMeal" placeholder="식단 메뉴명에 대한 검색어를 입력하세요.">
							<div class="input-group-append">
								<button type="button" class="btn btn-secondary" id="btnSrcMeal">
								<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</form>
						<table class="search-meal-table table table-striped table-hover"
							style="vertical-align: middle">
							<thead>
							<tr>
							<th class="menu_name" scope="col">음식명</th>
							<th scope="col">1회 제공량</th>
							<th scope="col">섭취 칼로리</th>
							<th scope="col">추가</th>
							</tr>
							</thead>
							<tbody>
					
							</tbody>
						</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 운동 검색 모달 -->
	<div id="search-training" class="modal fade" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<!-- Add Modal -->
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">운동 검색</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal Body -->
				<div class="modal-body">
					<form method="post" name="searchExrc">
						<div class="input-group">
							<input type="text" class="form-control" id="searchExrc" placeholder="운동 종류에 대한 검색어를 입력하세요.">
							<div class="input-group-append">
								<button type="button" class="btn btn-secondary" id="btnSrcExrc">
								<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</form>
						<table class="search-exrc-table table table-striped table-hover"
							style="vertical-align: middle">
							<thead>
							<tr>
							<th class="exrc_name" scope="col">운동</th>
							<th scope="col">단위</th>
							<th scope="col">소모 칼로리</th>
							<th scope="col">추가</th>
							</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>
				</div>
			</div>
		</div>
	</div>

	<!--업데이트 모달-->
</section>

<script
	src="<%=request.getContextPath()%>/resources/calendar/lib/main.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/calendar/lib/calendar.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/calendar/lib/calendarAction.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@4.2.0/dist/chart.umd.min.js"></script>
