<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%--     <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mypagecategory.css" type="text/css"> --%>

<div class="col-lg-2 col-md-5">
	<div class="blog__sidebar">
		<div class="blog__sidebar__item">
			<h4>Categories</h4>
			<ul>
				<li><a href="<%=request.getContextPath()%>/mypage/wish">찜목록</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/cart">장바구니</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/order">구매기록</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/board?type=bookmark">북마크</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/board?type=likereply">공감한 댓글</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/board?type=myboard">작성한 글</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/board?type=myreply">작성한 댓글</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/profile">사용자 정보</a></li>
			</ul>
		</div>
	</div>
</div>