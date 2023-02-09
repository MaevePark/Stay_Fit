<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
      
        <!-- Menu -->
        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="<%=request.getContextPath()%>/admin/dashboard" class="app-brand-link">
              <span class="app-brand-logo demo">
              	<img src="https://res.cloudinary.com/doxmm0ofz/image/upload/v1675951769/STAY_FIT_logo_ewct4e.png" style="width: 120px; height: 45px;">
              </span>
            </a>

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
          
            <li class="menu-header small text-uppercase">
              <span class="menu-header-text">Administrator</span>
            </li>
            
            <!-- 대시보드 -->
<c:choose>
	<c:when test="${currentMenu == 1}">
            <li class="menu-item active">
              <a href="<%=request.getContextPath()%>/admin/dashboard" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div>대시보드</div>
              </a>
            </li>
	</c:when>
	<c:otherwise>
            <li class="menu-item">
              <a href="<%=request.getContextPath()%>/admin/dashboard" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div>대시보드</div>
              </a>
            </li>
	</c:otherwise>
</c:choose>         
    
            <!-- 회원 -->
<c:choose>
	<c:when test="${currentMenu == 2}">
            <li class="menu-item active">
              <a href="<%=request.getContextPath()%>/admin/member" class="menu-link">
                <i class="menu-icon tf-icons bx bx-user"></i>
                <div>회원</div>
              </a>
            </li>
	</c:when>
	<c:otherwise>
            <li class="menu-item">
              <a href="<%=request.getContextPath()%>/admin/member" class="menu-link">
                <i class="menu-icon tf-icons bx bx-user"></i>
                <div>회원</div>
              </a>
            </li>
	</c:otherwise>
</c:choose>             
            
            <!-- 상품 -->
<c:choose>
	<c:when test="${currentMenu == 3}">
            <li class="menu-item active">
              <a href="<%=request.getContextPath()%>/admin/product" class="menu-link">
                <i class="menu-icon tf-icons bx bx-cube-alt"></i>
                <div>상품</div>
              </a>
            </li>
	</c:when>
	<c:otherwise>
            <li class="menu-item">
              <a href="<%=request.getContextPath()%>/admin/product" class="menu-link">
                <i class="menu-icon tf-icons bx bx-cube-alt"></i>
                <div>상품</div>
              </a>
            </li>
	</c:otherwise>
</c:choose>  
          
			<!-- 게시판 -->
<c:choose>
	<c:when test="${currentMenu == 4 || currentMenu == 5}">			
            <li class="menu-item active open">
    </c:when>
	<c:otherwise>
			<li class="menu-item">
	</c:otherwise>
</c:choose>    
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div>게시판</div>
              </a>
              <ul class="menu-sub">
              
            <!-- 게시물 관리 -->
<c:choose>
	<c:when test="${currentMenu == 4}">
            <li class="menu-item active">
              <a href="<%=request.getContextPath()%>/admin/board" class="menu-link">
                <div>게시물 관리</div>
              </a>
            </li>
	</c:when>
	<c:otherwise>
            <li class="menu-item">
              <a href="<%=request.getContextPath()%>/admin/board" class="menu-link">
                <div>게시물 관리</div>
              </a>
            </li>
	</c:otherwise>
</c:choose>                  
            <!-- 신고 댓글 관리 -->
<c:choose>
	<c:when test="${currentMenu == 5}">
            <li class="menu-item active">
                  <a href="<%=request.getContextPath()%>/admin/report" class="menu-link">
                    <div>신고 댓글 관리</div>
                  </a>
            </li>
	</c:when>
	<c:otherwise>
            <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/admin/report" class="menu-link">
                    <div>신고 댓글 관리</div>
                  </a>
            </li>
	</c:otherwise>
</c:choose>    
              
              </ul>

          </ul>
        </aside>
        <!-- / Menu -->
