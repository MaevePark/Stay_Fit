<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/css/boardread.css"
	type="text/css">

<!-- Blog Section Begin -->
<section class="blog spad">
	<div class="container">
		<div class="row">
			<!-- 게시판 카테고리 -->
			<jsp:include page="/WEB-INF/views/board/boardcategory.jsp"></jsp:include>

			<div class="col-lg-10 col-md-10">
				<div class="row">

					<div class="hero__search__form">
						<form action="#">
							<div class="hero__search__categories">
								<select name="">
									<option value="1" selected>카테고리 전체</option>
									<option value="2">식단</option>
									<option value="3">팁&노하우</option>
									<option value="4">고민&질문</option>
								</select>
							</div>
							<div class="hero__search__categories">
								<select name="">
									<option value="1" selected>전체</option>
									<option value="2">작성자</option>
									<option value="3">제목</option>
								</select>
							</div>
							<input type="text" placeholder="검색어를 입력해주세요.">
							<button type="submit" class="site-btn">SEARCH</button>
						</form>
					</div>

					<table id="readContent">
						<!-- 타이틀1  -->
						<tr>
							<td>${read.btitle}</td>
							<td>${read.bviewcount}</td>

						</tr>
						<!-- 타이틀1  -->
						<tr>
							<td>${read.mname}</td>
							<td><fmt:formatDate pattern="YY/MM/DD"
									value="${read.bcreate}" /></td>
						</tr>

						<!-- 컨텐츠  -->
						<tr>
							<td colspan="2" style="min-width: 500px">
								<p>${read.bcontent}</p>
							</td>
						</tr>

					</table>

					<!-- 게시글 이모티콘 -->
						<div class="container" id="emotion">
							<form>
								<div id="emote" class="row" >
									<label for="0" class="col text-center"> <input
										type="radio" id="0" name="emotion" value="0">
										<p>감사해요</p>
									</label> <label for="1" class="col text-center"> <input
										type="radio" id="1" name="emotion" value="1">
										<p>응원해요</p>
									</label> <label for="2" class="col text-center"> <input
										type="radio" id="2" name="emotion" value="2">
										<p>궁금해요</p>
									</label> <label for="3" class="col text-center"> <input
										type="radio" id="3" name="emotion" value="3">
										<p>대단해요</p>
									</label> <label for="4" class="col text-center"> <input
										type="radio" id="4" name="emotion" value="4">
										<p>멋있어요</p>
									</label>
								</div>
							</form>
						</div>
					<!-- 게시글 이모티콘 여기까지 -->
					
					
					<!-- 버튼 -->
					<div id="button_parent">
						<!-- 수정, 삭제 버튼은 본인이 작성한 글일때만 출력. -->
						<%-- <c:if test="${sessionScope.principal.mid == board.user }"> --%>
							<input type="hidden" id="board-bcid" value="${read.bid }"/>
							<button type="button" class="site-btn" id="btn-upd" onclick="">수정</button>
							<button class="site-btn" id="btn-del" onclick="boardDelete(${read.bid})">삭제</button>
						<%-- </c:if> --%>
						<button type="button" class="site-btn"
							onclick="location.href='list?bcid=${read.bcid}'">목록</button>
					</div>
					<!--버튼 여기까지  -->

					
					<!-- 북마크 보류-->
					<!-- <label for="bookmark"> <input type="radio" id="bookmark"
						name="" value="5">
						<p>북마크</p>
					</label> -->
					<!-- 북마크 여기까지  -->


					<!--게시글 이모티콘 삭제예정  -->
					<!-- <div class="container">
						<form>
							<div id="emote" class="">
								<label for="0"> <input type="radio" id="0"
									name="emotion" value="0">
									<p>도움됐어요</p>
								</label>
							</div>
						</form>
					</div> -->
					<!--게시글 이모티콘 삭제예정 여기까지 -->

					<div id="replyArea">
						<!-- 댓글 -->
						<!-- 댓글 작성  -->
						<!-- <div id="hero__search__form" class="comment-write">
                        		<form id="comment-data">	
                        			<texttarea id="comment" class="textarea" placeholder="댓글등록" >
                        			</texttarea>
                        		</form>
                        	</div> -->
						<div class="hero__search__form">
							<form action="#">
								<input type="text" placeholder="댓글을 작성해주세요">
								<button type="submit" class="site-btn">댓글 등록</button>
							</form>
						</div>

						<!--댓글 리스트  -->
						<table id="readReply">
							<tr>
								<td>
									<div class="blog__sidebar__recent__item__pic">
										<img
											src="<%=request.getContextPath()%>/resources/img/user/user-mini.png"
											alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<span>USER</span>
										<div>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit.</div>
									</div>
								</td>
								<td>YYYY.MM.DD</td>
							</tr>
							<tr>
								<td>
									<div class="blog__sidebar__recent__item__pic">
										<img
											src="<%=request.getContextPath()%>/resources/img/user/user-mini.png"
											alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<span>USER</span>
										<div>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit.</div>
									</div>
								</td>
								<td>YYYY.MM.DD</td>
							</tr>
							<tr>
								<td>
									<div class="blog__sidebar__recent__item__pic">
										<img
											src="<%=request.getContextPath()%>/resources/img/user/user-mini.png"
											alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<span>USER</span>
										<div>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit.</div>
									</div>
								</td>
								<td>YYYY.MM.DD</td>
							</tr>

						</table>

					</div>




				</div>
			</div>
		</div>
	</div>
</section>
<script>
function boardDelete(bid){
	let bid=${read.bid};
	//let writer=${read.mid} //사용자와 작성자가 동일할경우
	location.href="delete?bid="+bid;
}
</script>
<!-- Blog Section End -->