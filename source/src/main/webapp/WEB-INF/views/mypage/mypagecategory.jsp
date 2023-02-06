<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%--     <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mypagecategory.css" type="text/css"> --%>

<div class="col-lg-2 col-md-5">
	<div class="blog__sidebar">
		<div class="blog__sidebar__item">
			<h4>Categories</h4>
			<ul>
				<li><a href="<%=request.getContextPath()%>/mypage/mywish">찜목록</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/mycart">장바구니</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/myproduct">구매기록</a></li>
				<li><a
					href="<%=request.getContextPath()%>/mypage/myboard?type=bookmark">북마크</a></li>
				<li><a
					href="<%=request.getContextPath()%>/mypage/myboard?type=likereply">공감한
						글</a></li>
				<li><a
					href="<%=request.getContextPath()%>/mypage/myboard?type=myboard">작성한
						글</a></li>
				<li><a href="<%=request.getContextPath()%>/mypage/myprofile">사용자
						정보</a></li>
			</ul>
		</div>
	</div>
</div>