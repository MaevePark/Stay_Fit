<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src='<%=request.getContextPath() %>/resources/js/mypage/mypage.js'></script>

<%System.out.println(request.getSession().getAttribute("mid")); %>


<!-- Blog Section Begin -->

<%if(request.getSession().getAttribute("mid") != null) {
	
	int mid = (int) request.getSession().getAttribute("mid");
	%>
<input type="hidden" id="mid" name="mid" value="<%=mid%>">
<%}%>




<section class="blog spad">
	<div class="container">
		<div class="row">
			<!-- 마이페이지 카테고리 -->
			<jsp:include page="/WEB-INF/views/mypage/mypagecategory.jsp"></jsp:include>

			<div class="col-lg-10 col-md-7">
				<h4 class="fw-bold py-3 mb-4">
					<span class="text-muted fw-light">마이페이지 /</span> 사용자 정보
				</h4>
				
				<div style="border: 1px solid black; height: 1200px;">
					<form action="<%=request.getContextPath() %>/mypage/updateProfile" method="post" enctype="multipart/form-data">
						<div id="profile_area">
							<div>
								<div>
									<div>
										<img alt="profile_img" src="${mypageMember.profimg}">
									</div>
									<div>
										<button type="button" onclick="changeProfImg()">프로필 사진 변경</button>
									</div>
								</div>
								<div id="nameArea">
									<span>닉네임 : ${mypageMember.mname}</span>
									<button type="button" onclick="changeName()">닉네임 변경</button>
								</div>
								<div id="pwdArea">
									<button type="button" onclick="changePwd()">비밀번호 변경</button>
								</div>
								<div>
									<span>
										<a href="">회원 탈퇴</a>
									</span>
								</div>
							</div>
							<div id="editArea">
								<div id="profImgInputArea"></div>
								<div id="nameInputArea"></div>
								<div id="pwdInputArea"></div>
								<div id="submitBtnArea"></div>
							</div>
							
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Blog Section End -->