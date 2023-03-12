<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="./index.html"><img src="<%=request.getContextPath() %>/resources/img/STAY_FIT_footer_logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Who joined :</li>
                            <li>정병주 | 박민지</li>
                            <li>최경선 | 임승규</li>
                            <li>전혜지</li>
                            <li>Git : https://github.com/ChocoJ1721031/Stay_Fit</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>Useful Links</h6>
                        <ul>
                            <li><a href="<%=request.getContextPath()%>/">HomePage</a></li>
                            <li><a href="<%=request.getContextPath()%>/shop/">Shop</a></li>
                            <li><a href="<%=request.getContextPath()%>/board/list?bcid=0">Board</a></li>
                            <li><a href="<%=request.getContextPath()%>/health/caloriewrite">HealthCare</a></li>
                            <li><a href="<%=request.getContextPath()%>/diary">Diary</a></li>
                            <li><a href="<%=request.getContextPath()%>/mypage">MyPage</a></li>
                        </ul>
                        <ul>
                            <li><a href="<%=request.getContextPath()%>/admin/dashboard">AdminPage</a></li>
                            <li><a href="<%=request.getContextPath()%>/member/login">LoginPage</a></li>
                            <li><a href="<%=request.getContextPath()%>/member/join">JoinPage</a></li>
                            <li><a href="<%=request.getContextPath()%>/member/pwfind">SearchPassword</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>Tech Support</h6>
                        <p>KH Academy Gangnam Branch</p>
                        <img alt="kh_logo" src="resources/img/khlogo.jpg">
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->
    