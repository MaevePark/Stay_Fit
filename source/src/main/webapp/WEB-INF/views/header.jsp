<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="header__top__right">
						
							<c:choose>
								<c:when test="${sessionScope.memail == null}">
									<div class="header__top__right__auth">
										<a href="<%=request.getContextPath()%>/member/login"><i class="fa fa-user"></i> 로그인</a>
									</div>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${fn:contains(sessionScope.mrole, 'M')}">
				                            <div class="header__top__right__auth">
				                                <a href="<%=request.getContextPath()%>/mypage"><i class="fa fa-user"></i> 마이페이지</a>
				                            </div>
		                            	</c:when>
										<c:when test="${fn:contains(sessionScope.mrole, 'A')}">
				                            <div class="header__top__right__auth">
				                                <a href="<%=request.getContextPath()%>/admin/dashboard" target="_blank"><i class="fa fa-user"></i> 관리자페이지</a>
				                            </div>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<div class="header__top__right__auth">
				                                <a href="<%=request.getContextPath()%>/seller/product" target="_blank"><i class="fa fa-user"></i> 판매자페이지</a>
				                            </div>
		                            	</c:otherwise>
		                            </c:choose>	
									<div class="header__top__right__auth">
										<a href="<%=request.getContextPath()%>/logout"><i class="fa fa-user"></i> 로그아웃</a>
									</div>
								</c:otherwise>
							</c:choose>
							
							<div class="header__top__right__auth">
                                <a href="<%=request.getContextPath()%>/mypage/wish"><i class="fa fa-heart"></i></a>
                            </div>
							<div class="header__top__right__auth">
                                <a href="<%=request.getContextPath()%>/mypage/cart"><i class="fa fa-shopping-bag"></i></a>
                            </div>	
                            
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/resources/img/STAY_FIT_logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-9">
					<nav class="header__menu">
						<ul>
							<li class="active"><a href="<%=request.getContextPath()%>/shop">상품</a></li>
							<li><a href="<%=request.getContextPath()%>/board/list?bcid=0">게시판</a>
								<ul class="header__menu__dropdown">
									<li><a href="<%=request.getContextPath()%>/board/list?bcid=0">공지사항</a></li>
									<li><a href="<%=request.getContextPath()%>/board/list?bcid=1">식단</a></li>
									<li><a href="<%=request.getContextPath()%>/board/list?bcid=2">팁&노하우</a></li>
									<li><a href="<%=request.getContextPath()%>/board/list?bcid=3">고민&질문</a></li>
								</ul>
							</li>
							<li><a a href="<%=request.getContextPath()%>/health/caloriewrite">건강관리</a>
								<ul class="header__menu__dropdown">
									<li><a href="<%=request.getContextPath()%>/health/caloriewrite">칼로리 처방 받기</a></li>
									<li><a href="<%=request.getContextPath()%>/health/bmiwrite">BMI 지수 조회</a></li>
									<li><a href="<%=request.getContextPath()%>/health/centerlist">보건소 조회</a></li>
								</ul>
							</li>
							<li><a href="<%=request.getContextPath()%>/diary">다이어리</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
<!-- Header Section End -->
