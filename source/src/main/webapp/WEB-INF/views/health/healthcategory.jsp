<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


				<div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__item">
                            <h4>Categories</h4>
                            <ul>
                                <li><a href="<%=request.getContextPath()%>/mypage/mywish">BMI</a></li>
                                <li><a href="<%=request.getContextPath()%>/mypage/mycart">필요 감량 칼로리</a></li>
                                <li><a href="<%=request.getContextPath()%>/mypage/myproduct">표준/미용 체중</a></li>
                                <li><a href="<%=request.getContextPath()%>/mypage/myboard?type=bookmark">하루 소비 칼로리</a></li>
                                <li><a href="<%=request.getContextPath()%>/mypage/myboard?type=likereply">하루 권장 섭취 칼로리</a></li>
                                <li><a href="<%=request.getContextPath()%>/mypage/myboard?type=myboard">하루 권장 운동량</a></li>
                            </ul>
                        </div>
                    </div>
                </div>