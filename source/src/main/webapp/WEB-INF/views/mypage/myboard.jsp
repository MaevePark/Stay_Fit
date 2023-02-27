<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/mypagemyboard.css"
	type="text/css">

<!-- Blog Section Begin -->
<section class="blog spad">
	<div class="container">
		<div class="row">
			<!-- 마이페이지 카테고리 -->
			<jsp:include page="/WEB-INF/views/mypage/mypagecategory.jsp"></jsp:include>

			<div class="col-lg-10 col-md-7">


				<!-- 여기 조건에다 출력 조건까지 같이 넣어줄 예정 -->
				<%
					String type = request.getParameter("type");
					if (type.equals("bookmark")) {
				%>
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">마이페이지 /</span> 북마크
				</h4>
				<%
					} else if (type.equals("likereply")) {
				%>
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">마이페이지 /</span> 공감한 댓글
				</h4>
				<%
					} else if (type.equals("myboard")) {
				%>
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">마이페이지 /</span> 작성한 글
				</h4>
				<%
					} else if (type.equals("myreply")) {
				%>
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">마이페이지 /</span> 작성한 댓글
				</h4>
				<%
					}
				%>

				<div class="hero__search__form">
					<form action="#">
						<div class="hero__search__categories">
							<select name="boardCategory">
								<option value="1" selected>카테고리 전체</option>
								<option value="2">식단</option>
								<option value="3">팁&노하우</option>
								<option value="4">고민&질문</option>
							</select>
						</div>
						<div class="hero__search__categories">
							<select name="searchRange">
								<c:if test="${type.equals('likereply') || type.equals('myreply') }">
									<option value="1" selected>전체</option>
									<option value="2">댓글 내용</option>
									<option value="3">게시글 제목</option>
									<option value="4">게시글 내용</option>
								</c:if>
								<c:if test="${!type.equals('likereply') && !type.equals('myreply') }">
									<option value="1" selected>전체</option>
									<option value="2">제목</option>
									<option value="3">내용</option>
								</c:if>
								
							</select>
						</div>
						<input type="text" name="searchword" placeholder="검색어를 입력해주세요.">
						<button type="submit" class="site-btn">SEARCH</button>
					</form>
				</div>

				<div class="container-xl flex-grow-1 container-p-y">
					<!-- Basic Bootstrap Table -->
					<div class="card">
						<h5 class="card-header">Table Basic</h5>
						<div class="table-responsive text-nowrap">
							<table class="table">
								<thead>
									<tr>
										<th>Project</th>
										<th>Client</th>
										<th>Users</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">
									<tr>
										<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
											<strong>Angular Project</strong></td>
										<td>Albert Cook</td>
										<td>
											<ul
												class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
												<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
													data-bs-placement="top" class="avatar avatar-xs pull-up"
													title="" data-bs-original-title="Lilian Fuller"><img
													src="../assets/img/avatars/5.png" alt="Avatar"
													class="rounded-circle"></li>
												<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
													data-bs-placement="top" class="avatar avatar-xs pull-up"
													title="" data-bs-original-title="Sophia Wilkerson"><img
													src="../assets/img/avatars/6.png" alt="Avatar"
													class="rounded-circle"></li>
												<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
													data-bs-placement="top" class="avatar avatar-xs pull-up"
													title="" data-bs-original-title="Christina Parker"><img
													src="../assets/img/avatars/7.png" alt="Avatar"
													class="rounded-circle"></li>
											</ul>
										</td>
										<td><span class="badge bg-label-primary me-1">Active</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn p-0 dropdown-toggle hide-arrow"
													data-bs-toggle="dropdown">
													<i class="bx bx-dots-vertical-rounded"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"><i
														class="bx bx-edit-alt me-1"></i> Edit</a> <a
														class="dropdown-item" href="javascript:void(0);"><i
														class="bx bx-trash me-1"></i> Delete</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><i class="fab fa-react fa-lg text-info me-3"></i> <strong>React
												Project</strong></td>
										<td>Barry Hunter</td>
										<td>
											<ul
												class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
												<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
													data-bs-placement="top" class="avatar avatar-xs pull-up"
													title="" data-bs-original-title="Lilian Fuller"><img
													src="../assets/img/avatars/5.png" alt="Avatar"
													class="rounded-circle"></li>
												<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
													data-bs-placement="top" class="avatar avatar-xs pull-up"
													title="" data-bs-original-title="Sophia Wilkerson"><img
													src="../assets/img/avatars/6.png" alt="Avatar"
													class="rounded-circle"></li>
												<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
													data-bs-placement="top" class="avatar avatar-xs pull-up"
													title="" data-bs-original-title="Christina Parker"><img
													src="../assets/img/avatars/7.png" alt="Avatar"
													class="rounded-circle"></li>
											</ul>
										</td>
										<td><span class="badge bg-label-success me-1">Completed</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn p-0 dropdown-toggle hide-arrow"
													data-bs-toggle="dropdown">
													<i class="bx bx-dots-vertical-rounded"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"><i
														class="bx bx-edit-alt me-2"></i> Edit</a> <a
														class="dropdown-item" href="javascript:void(0);"><i
														class="bx bx-trash me-2"></i> Delete</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><i class="fab fa-vuejs fa-lg text-success me-3"></i>
											<strong>VueJs Project</strong></td>
										<td>Trevor Baker</td>
										<td>
											<ul
												class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
												<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
													data-bs-placement="top" class="avatar avatar-xs pull-up"
													title="" data-bs-original-title="Lilian Fuller"><img
													src="../assets/img/avatars/5.png" alt="Avatar"
													class="rounded-circle"></li>
												<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
													data-bs-placement="top" class="avatar avatar-xs pull-up"
													title="" data-bs-original-title="Sophia Wilkerson"><img
													src="../assets/img/avatars/6.png" alt="Avatar"
													class="rounded-circle"></li>
												<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
													data-bs-placement="top" class="avatar avatar-xs pull-up"
													title="" data-bs-original-title="Christina Parker"><img
													src="../assets/img/avatars/7.png" alt="Avatar"
													class="rounded-circle"></li>
											</ul>
										</td>
										<td><span class="badge bg-label-info me-1">Scheduled</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn p-0 dropdown-toggle hide-arrow"
													data-bs-toggle="dropdown">
													<i class="bx bx-dots-vertical-rounded"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"><i
														class="bx bx-edit-alt me-2"></i> Edit</a> <a
														class="dropdown-item" href="javascript:void(0);"><i
														class="bx bx-trash me-2"></i> Delete</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td><i class="fab fa-bootstrap fa-lg text-primary me-3"></i>
											<strong>Bootstrap Project</strong></td>
										<td>Jerry Milton</td>
										<td>
											<ul
												class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
												<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
													data-bs-placement="top" class="avatar avatar-xs pull-up"
													title="" data-bs-original-title="Lilian Fuller"><img
													src="../assets/img/avatars/5.png" alt="Avatar"
													class="rounded-circle"></li>
												<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
													data-bs-placement="top" class="avatar avatar-xs pull-up"
													title="" data-bs-original-title="Sophia Wilkerson"><img
													src="../assets/img/avatars/6.png" alt="Avatar"
													class="rounded-circle"></li>
												<li data-bs-toggle="tooltip" data-popup="tooltip-custom"
													data-bs-placement="top" class="avatar avatar-xs pull-up"
													title="" data-bs-original-title="Christina Parker"><img
													src="../assets/img/avatars/7.png" alt="Avatar"
													class="rounded-circle"></li>
											</ul>
										</td>
										<td><span class="badge bg-label-warning me-1">Pending</span></td>
										<td>
											<div class="dropdown">
												<button type="button"
													class="btn p-0 dropdown-toggle hide-arrow"
													data-bs-toggle="dropdown">
													<i class="bx bx-dots-vertical-rounded"></i>
												</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="javascript:void(0);"><i
														class="bx bx-edit-alt me-2"></i> Edit</a> <a
														class="dropdown-item" href="javascript:void(0);"><i
														class="bx bx-trash me-2"></i> Delete</a>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!--/ Basic Bootstrap Table -->
				</div>

				<!-- 페에징 -->
				<jsp:include page="/WEB-INF/views/paging.jsp" />
			</div>
		</div>
	</div>
</section>
<!-- Blog Section End -->