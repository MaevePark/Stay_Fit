<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/mypage.css"
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
					<form action="<%=request.getContextPath() %>/mypage/board?searchword=${searchword}" method="get">
						<input type="hidden" name="type" value="${type }">
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
						<input type="text" name="searchword" placeholder="검색어를 입력해주세요." value="${searchword }">
						<button type="submit" class="site-btn">SEARCH</button>
					</form>
				</div>

				<div class="container-xl flex-grow-1 container-p-y">
					<!-- Basic Bootstrap Table -->
					<div class="card">
						<div class="table-responsive text-nowrap">
							<table class="table">
								<thead>
									<c:choose>
										<c:when test="${!type.equals('likereply') && !type.equals('myreply') }">
											<tr>
												<th>게시판</th>
												<th>제목</th>
												<th>작성자</th>
												<th>조회수</th>
												<th>작성일</th>
											</tr>
										</c:when>
										<c:when test="${type.equals('likereply') || type.equals('myreply') }">
											<tr>
												<th>댓글 내용</th>
												<th>작성일자</th>
												<th>게시글</th>
											</tr>
										</c:when>
									</c:choose>
									
								</thead>
								<tbody class="table-border-bottom-0">
									<c:if test="${fn:length(boardList) > 0 }">
										<c:choose>
											<c:when test="${type.equals('bookmark') }">
												<c:forEach items="${boardList }" var="list">
													<tr>
														<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
															<c:if test="${list.BCID  == 0}"><span>식단</span></c:if>
															<c:if test="${list.BCID  == 1}"><span>팁&노하우</span></c:if>
															<c:if test="${list.BCID  == 2}"><span>고민&질문</span></c:if>
														</td>
														<td>${list.BTITLE }</td>
														<td>${list.MNAME }</td>
														<td><span>${list.BVIEWCOUNT }</span></td>
														<td><span>${list.BCREATE }</span></td>
													</tr>
												</c:forEach>
											</c:when>
											<c:when test="${type.equals('likereply') }">
												<c:forEach items="${boardList }" var="list">
													<tr>
														<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
															<span>${list.RCONTENT }</span>
														</td>
														<td><span>${list.RCREATE }</span></td>
														<td><span>${list.BTITLE }</span></td>
													</tr>
												</c:forEach>
											</c:when>
											<c:when test="${type.equals('myboard') }">
												<c:forEach items="${boardList }" var="list">
													<tr>
														<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
															<c:if test="${list.BCID  == 0}"><span>식단</span></c:if>
															<c:if test="${list.BCID  == 1}"><span>팁&노하우</span></c:if>
															<c:if test="${list.BCID  == 2}"><span>고민&질문</span></c:if>
														</td>
														<td>${list.BTITLE }</td>
														<td>${list.MNAME }</td>
														<td><span>${list.BVIEWCOUNT }</span></td>
														<td><span>${list.BCREATE }</span></td>
													</tr>
												</c:forEach>
											</c:when>
											<c:when test="${type.equals('myreply') }">
												<c:forEach items="${boardList }" var="list">
													<tr>
														<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
															<span>${list.RCONTENT }</span>
														</td>
														<td><span>${list.RCREATE }</span></td>
														<td><span>${list.BTITLE }</span></td>
													</tr>
												</c:forEach>
											</c:when>
										</c:choose>
									</c:if>
									<c:if test="${fn:length(boardList) <= 0 }">
										<tr>
											<c:choose>
												<c:when test="${type.equals('bookmark')}">
													<td colspan="5">등록된 북마크가 없습니다.</td>
												</c:when>
												<c:when test="${type.equals('likereply')}">
													<td colspan="3">공감한 댓글이 없습니다.</td>
												</c:when>
												<c:when test="${type.equals('myboard')}">
													<td colspan="5">작성한 글이 없습니다.</td>
												</c:when>
												<c:when test="${type.equals('myreply')}">
													<td colspan="3">작성한 댓글이 없습니다.</td>
												</c:when>
											</c:choose>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					<!--/ Basic Bootstrap Table -->
				</div>
				<!-- 페에징 -->
				<c:if test="${fn:length(boardList) > 0 }">
					<div class="col-lg-12">
						<div class="product__pagination blog__pagination">
							<c:if test="${pagingMap.start != 1}">
								<a href="<%=request.getContextPath()%>/${urlpattern }?type=${type }&page=1"> << </a>
							</c:if>
							<c:if test="${pagingMap.currentPage != 1}">
								<a href="<%=request.getContextPath()%>/${urlpattern }?type=${type }&page=${pagingMap.currentPage -1}"> < </a>
							</c:if>
							
							
							<c:forEach begin="${pagingMap.start }" end="${pagingMap.end }" var="num">                                
								<a href="<%=request.getContextPath()%>/${urlpattern }?type=${type }&page=${num}">${num}</a>
							</c:forEach>
							
							
							<c:if test="${pagingMap.currentPage != pagingMap.totalPageCnt}">
								<a href="<%=request.getContextPath()%>/${urlpattern }?type=${type }&page=${pagingMap.currentPage +1}"> > </a>
							</c:if>
							<c:if test="${pagingMap.end != pagingMap.totalPageCnt}">
								<a href="<%=request.getContextPath()%>/${urlpattern }?type=${type }&page=${pagingMap.totalPageCnt }"> >> </a>
							</c:if>
						</div>
					</div>
				</c:if>
				
			</div>
		</div>
	</div>
</section>
<!-- Blog Section End -->