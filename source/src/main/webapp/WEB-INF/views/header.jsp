<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">

                            <div class="header__top__right__auth">
                                <a href="<%=request.getContextPath()%>/mypage/myprofile"><i class="fa fa-user"></i> 마이페이지</a>
                            </div>
						
							<div class="header__top__right__auth">
								<a href="<%=request.getContextPath()%>/logout"><i class="fa fa-user"></i> Logout</a>
							</div>
						
							<div class="header__top__right__auth">
                                <a href="<%=request.getContextPath()%>/mypage/mywish"><i class="fa fa-heart"></i></a>
                            </div>
                            
							<div class="header__top__right__auth">
                                <a href="<%=request.getContextPath()%>/mypage/mycart"><i class="fa fa-shopping-bag"></i></a>
                            </div>
						
						<!-- 비회원, 로그아웃
							<div class="header__top__right__auth">
								<a href="<%=request.getContextPath()%>/login"><i class="fa fa-user"></i> Login</a>
							</div>
						 -->	
							
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
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li class="active"><a href="<%=request.getContextPath()%>/shop">상품</a></li>
							<li><a href="#">게시판</a>
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
							<li><a href="<%=request.getContextPath()%>/">보건소</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
<!-- Header Section End -->
