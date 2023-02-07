<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


				<div class="col-lg-4 col-md-5" style="max-width:20%"> <!--style직접 확정 후 삭제  -->
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__item">
                            <h4>Categories</h4>
                            <ul>
                            	<!-- TODO 이동페이지 수정 -->
                                <li><a href="<%=request.getContextPath()%>/health/caloriewrite">칼로리 처방 받기</a></li>
                                <li><a href="<%=request.getContextPath()%>/health/bmiwrite">BMI 지수 조회</a></li>
                                <li><a href="<%=request.getContextPath()%>/health/centerlist">보건소 조회</a></li>
                            </ul>
                        </div>
                    </div>
                </div>