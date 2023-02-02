<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/boardread.css" type="text/css">

	<!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
            	<!-- 마이페이지 카테고리 -->
                <jsp:include page="/WEB-INF/views/mypage/mypagecategory.jsp"></jsp:include>
                
                <div class="col-lg-8 col-md-7">
                    <div class="row">
						
						<table id="readContent">
							<!-- 타이틀1  -->
							<tr>
								<td>제목</td>
								<td>작성자</td>
								
							</tr>
							<!-- 타이틀1  -->
							<tr>
								<td>조회수</td>
								<td>수정 혹은 작성일자</td>
							</tr>
						
							<!-- 컨텐츠  -->
							<tr>
								<td colspan="2">
									<div class="col-lg-8 col-md-7 order-md-1 order-1">
					                    <div class="blog__details__text">
					                        <img src="<%=request.getContextPath() %>/resources/img/blog/details/details-pic.jpg" alt="">
					                        <p>Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet
					                            dui. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Mauris blandit
					                            aliquet elit, eget tincidunt nibh pulvinar a. Vivamus magna justo, lacinia eget consectetur
					                            sed, convallis at tellus. Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada.
					                            Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus.
					                            Donec rutrum congue leo eget malesuada. Curabitur non nulla sit amet nisl tempus convallis
					                            quis ac lectus. Donec sollicitudin molestie malesuada. Nulla quis lorem ut libero malesuada
					                            feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.</p>
					                        <h3>The corner window forms a place within a place that is a resting point within the large
					                            space.</h3>
					                        <p>The study area is located at the back with a view of the vast nature. Together with the other
					                            buildings, a congruent story has been managed in which the whole has a reinforcing effect on
					                            the components. The use of materials seeks connection to the main house, the adjacent
					                            stables</p>
					                    </div>
					                    <div class="blog__details__content">
					                        <div class="row">
					                            <div class="col-lg-6">
					                                <div class="blog__details__author">
					                                    <div class="blog__details__author__pic">
					                                        <img src="img/blog/details/details-author.jpg" alt="">
					                                    </div>
					                                    <div class="blog__details__author__text">
					                                        <h6>Michael Scofield</h6>
					                                        <span>Admin</span>
					                                    </div>
					                                </div>
					                            </div>
					                            <div class="col-lg-6">
					                                <div class="blog__details__widget">
					                                    <ul>
					                                        <li><span>Categories:</span> Food</li>
					                                        <li><span>Tags:</span> All, Trending, Cooking, Healthy Food, Life Style</li>
					                                    </ul>
					                                    <div class="blog__details__social">
					                                        <a href="#"><i class="fa fa-facebook"></i></a>
					                                        <a href="#"><i class="fa fa-twitter"></i></a>
					                                        <a href="#"><i class="fa fa-google-plus"></i></a>
					                                        <a href="#"><i class="fa fa-linkedin"></i></a>
					                                        <a href="#"><i class="fa fa-envelope"></i></a>
					                                    </div>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                </div>
								</td>
							</tr>
							
						</table>
						
						<!-- 버튼 -->
						<div>
							<!-- 수정, 삭제 버튼은 본인이 작성한 글일때만 출력. -->
							<button type="button" onclick="">수정</button>
							<button type="button" onclick="">삭제</button>
							<button type="button" onclick="">목록</button>
						</div>
						
                        
                        <div id="replyArea">
                        	<!-- 게시글 이모티콘 -->
                        	<div>
                        		<div id="emote">
                        			<label for="0"><input type="radio" id="0" name="" value="0"><span>도움됐어요</span></label>
                        			<label for="1"><input type="radio" id="1" name="" value="1"><span>응원해요</span></label>
                        			<label for="2"><input type="radio" id="2" name="" value="2"><span>궁금해요</span></label>
                        			<label for="3"><input type="radio" id="3" name="" value="3"><span>부러워요</span></label>
                        			<label for="4"><input type="radio" id="4" name="" value="4"><span>예뻐요</span></label>
                        		</div>
                        	</div>
                        	
                        	<!-- 댓글 -->
                        	<div>
                        	댓글영역
                        	</div>
                        
                        </div>
                        
                        
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->