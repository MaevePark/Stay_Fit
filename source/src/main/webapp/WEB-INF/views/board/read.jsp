<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/boardread.css" type="text/css">

	<!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
            	<!-- 게시판 카테고리 -->
                <jsp:include page="/WEB-INF/views/board/boardcategory.jsp"></jsp:include>
                
                <div class="col-lg-8 col-md-7">
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
								<td><fmt:formatDate pattern="YY/MM/DD" value="${read.bcreate}"/></td>
							</tr>
						
							<!-- 컨텐츠  -->
							<tr>
								<td colspan="2">
									<div class="col-lg-8 col-md-7 order-md-1 order-1">
					                    <div class="blog__details__text">
					                        <%-- <img src="<%=request.getContextPath() %>/resources/img/blog/details/details-pic.jpg" alt=""> --%>
					                        <p>${read.bcontent}</p>
					                              <br>
					                              <br>
					                              <br>
					                              <br>
					                              
					                    </div>
					                    
					                </div>
								</td>
							</tr>
							
						</table>
						
						<!-- 버튼 -->
						<div id="button_parent">
							<!-- 수정, 삭제 버튼은 본인이 작성한 글일때만 출력. -->
							<button type="button" class="site-btn" onclick="">수정</button>
							<button type="button" class="site-btn" onclick="">삭제</button>
							<button type="button" class="site-btn" onclick="location.href='list?bcid=${read.bcid}'">목록</button>
						</div>
						
                        	<br>
                        	<br>
                       <div id="replyArea">
                        	<!-- 게시글 이모티콘 -->
                        	<div>
                        		<div id="emote">
                        			<label for="4"><input type="radio" id="4" name="" value="5"><span>북마크</span></label>
                        			<label for="0"><input type="radio" id="0" name="" value="0">
                        			<%-- <img src="<%=request.getContextPath()%>/resources/img/board-read/happy3.png"> --%>
                        			<span>도움됐어요</span></label>
                        			<label for="1"><input type="radio" id="1" name="" value="1"><span>응원해요</span></label>
                        			<label for="2"><input type="radio" id="2" name="" value="2"><span>궁금해요</span></label>
                        			<label for="3"><input type="radio" id="3" name="" value="3"><span>대단해요</span></label>
                        			<label for="4"><input type="radio" id="4" name="" value="4"><span>멋있어요</span></label>
                        		</div>
                        	</div>
                        	<br>
			
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
									<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</div>	
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
									<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</div>	
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
									<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</div>	
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
    <!-- Blog Section End -->