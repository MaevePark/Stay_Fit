<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
            	<!-- 게시판 카테고리 -->
                <jsp:include page="/WEB-INF/views/board/boardcategory.jsp"></jsp:include>
                
                <div class="col-lg-10 col-md-10">
                    <div class="row">
                        
                        <% String boardTitle = "";
                        switch(request.getParameter("bcid")) {
							case "0":
								boardTitle = "공지사항";
								break;
								
							case "1":
								boardTitle = "식단";
								break;
								
							case "2":
								boardTitle = "팁&노하우";
								break;
								
							case "3":
								boardTitle = "고민&질문";
								break;
							}%>
                        <h4 class="fw-bold py-3 mb-4">
							<span class="text-muted fw-light">게시판 /</span> <%=boardTitle %>
							
						</h4>
                        
                        
                        <!-- 검색창 시작 -->
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    <select name="">
                                    	<option value="0" <%if(request.getParameter("bcid").equals("0")){ %> selected <%} %>>공지사항</option>
                                    	<option value="1" <%if(request.getParameter("bcid").equals("1")){ %> selected <%} %>>식단</option>
                                    	<option value="2" <%if(request.getParameter("bcid").equals("2")){ %> selected <%} %>>팁&노하우</option>
                                    	<option value="3" <%if(request.getParameter("bcid").equals("3")){ %> selected <%} %>>고민&질문</option>
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
                        <!-- 검색창 끝 -->
                        
                        <!--식단에만 포함  이미지만 보이는 버튼-->
                        <!-- <label for="thumbnale"><input type="checkbox" id="thumbnale" name="" value="" checked> 이미지 첨부 글 포함</label> -->
                        
                        <!--  <div class="container-xl flex-grow-1 container-p-y"> -->
                        
	                        <!-- Basic Bootstrap Table -->
							 <div class="" style="border: none; width:100%">
								
								<div class="table-responsive text-nowrap" >
									<table class="table">
										<thead>
											<tr>
												<th>게시판</th>
												<th>제목</th>
												<th>작성자</th>
												<th>조회수</th>
												<th>작성일</th>
											</tr>
										</thead>

										<tbody class="table-border-bottom-0">
										<!--여기부터   -->
											<c:choose>
												<c:when test="${empty boardlist }" >
													<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
												</c:when> 
												<c:when test="${!empty boardlist}">
													<c:forEach var="list" items="${boardlist}">
														<tr>
															<td>${list.bcname}</td>
															<td><a href="<%=request.getContextPath()%>/board/read.do?bid=${list.bid}" style="color: #626262;">${list.btitle}</a></td>
															<td>${list.mname}</td>
															<td>${list.bviewcount}</td>
															<td><fmt:formatDate pattern="YY/MM/DD HH:MM" value="${list.bcreate}"/></td>		
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										<!--여기까지   -->
										</tbody>
										
									</table>
									
								</div>
							</div> 
							<!--/ Basic Bootstrap Table -->
							
			<%-- <div class="" style="width:100%">
				<div class="row"  >
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<img
									src="<%=request.getContextPath()%>/resources/img/blog/blog-2.jpg"
									alt="">
							</div>
							<div class="blog__item__text">
								<ul>
									<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
									<li><i class="fa fa-comment-o"></i> 5</li>
								</ul>
								<h5>
									<a href="#">Lorem ipsum dolor sit amet, consectetur..</a>
								</h5>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<img
									src="<%=request.getContextPath()%>/resources/img/blog/blog-2.jpg"
									alt="">
							</div>
							<div class="blog__item__text">
								<ul>
									<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
									<li><i class="fa fa-comment-o"></i> 5</li>
								</ul>
								<h5>
									<a href="#">Lorem ipsum dolor sit amet, consectetur..</a>
								</h5>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<img
									src="<%=request.getContextPath()%>/resources/img/blog/blog-2.jpg"
									alt="">
							</div>
							<div class="blog__item__text">
								<ul>
									<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
									<li><i class="fa fa-comment-o"></i> 5</li>
								</ul>
								<h5>
									<a href="#">Lorem ipsum dolor sit amet, consectetur..</a>
								</h5>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item">
							<div class="blog__item__pic">
								<img
									src="<%=request.getContextPath()%>/resources/img/blog/blog-3.jpg"
									alt="">
							</div>
							<div class="blog__item__text">
								<ul>
									<li><i class="fa fa-calendar-o"></i> May 4,2019</li>
									<li><i class="fa fa-comment-o"></i> 5</li>
								</ul>
								<h5>
									<a href="#">Lorem ipsum dolor sit amet, consectetur..</a>
								</h5>
						</div>
					</div>				
			</div>
			</div>
                        </div> --%>
                        <div id="button_parent">
							<button type="button" class="site-btn" onclick="location.href='<%=request.getContextPath()%>/board/write';">글등록</button>
                		</div>
                                                
                        <div class="col-lg-12">
                            <div class="product__pagination blog__pagination">
                                <a href="#">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      <!--   </div> -->
    </section>
    <!-- Blog Section End -->
    