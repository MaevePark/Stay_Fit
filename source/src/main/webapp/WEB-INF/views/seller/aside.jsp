<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
      
        <!-- Menu -->
        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="<%=request.getContextPath()%>/seller/dashboard" class="app-brand-link">
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
              <span class="menu-header-text">SELLER</span>
            </li>
            
            <!-- 대시보드 -->
<c:choose>
	<c:when test="${currentMenu == 1}">
            <li class="menu-item active">
              <a href="<%=request.getContextPath()%>/seller/dashboard" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div>대시보드</div>
              </a>
            </li>
	</c:when>
	<c:otherwise>
            <li class="menu-item">
              <a href="<%=request.getContextPath()%>/seller/dashboard" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div>대시보드</div>
              </a>
            </li>
	</c:otherwise>
</c:choose> 
          
			<!-- 상품 -->
<c:choose>
	<c:when test="${currentMenu == 2 || currentMenu == 3}">			
            <li class="menu-item active open">
    </c:when>
	<c:otherwise>
			<li class="menu-item">
	</c:otherwise>
</c:choose>    
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-cube-alt"></i>
                <div>상품</div>
              </a>
              <ul class="menu-sub">
              
            <!-- 상품 관리 -->
<c:choose>
	<c:when test="${currentMenu == 2}">
            <li class="menu-item active">
              <a href="<%=request.getContextPath()%>/seller/product" class="menu-link">
                <div>상품 관리</div>
              </a>
            </li>
	</c:when>
	<c:otherwise>
            <li class="menu-item">
              <a href="<%=request.getContextPath()%>/seller/product" class="menu-link">
                <div>상품 관리</div>
              </a>
            </li>
	</c:otherwise>
</c:choose>                  
            <!-- 상품 등록 -->
<c:choose>
	<c:when test="${currentMenu == 3}">
            <li class="menu-item active">
                  <a href="<%=request.getContextPath()%>/seller/form" class="menu-link">
                    <div>상품 등록</div>
                  </a>
            </li>
	</c:when>
	<c:otherwise>
            <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/seller/form" class="menu-link">
                    <div>상품 등록</div>
                  </a>
            </li>
	</c:otherwise>
</c:choose>    
              
              </ul>

          </ul>
        </aside>
        <!-- / Menu -->
