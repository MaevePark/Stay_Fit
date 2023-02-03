<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
            	<!-- 마이페이지 카테고리 -->
                <jsp:include page="/WEB-INF/views/board/boardcategory.jsp"></jsp:include>
                
                <div class="col-lg-8 col-md-7">
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
							<div class="card" style="border: none">
								
								<div class="table-responsive text-nowrap">
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
											<tr>
												<td>CATEGORY</td>
												<td>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>
												<td>USER</td>
												<td>VIEWCOUNT</td>
												<td>YYYY.MM.DD</td>
											</tr>
											<tr>
												<td>CATEGORY</td>
												<td>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>
												<td>USER</td>
												<td>VIEWCOUNT</td>
												<td>YYYY.MM.DD</td>
											</tr>
											<tr>
												<td>CATEGORY</td>
												<td>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</td>
												<td>USER</td>
												<td>VIEWCOUNT</td>
												<td>YYYY.MM.DD</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!--/ Basic Bootstrap Table -->
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
    