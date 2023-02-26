<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="col-lg-12">
	<div class="product__pagination blog__pagination">
		<c:if test="${pagingMap.start != 1}">
			<a href="<%=request.getContextPath()%>/mypage/mywish?page=1"> << </a>
		</c:if>
		<c:if test="${pagingMap.currentPage != 1}">
			<a href="<%=request.getContextPath()%>/mypage/mywish?page=${pagingMap.currentPage -1}"> < </a>
		</c:if>
		
		
		<c:forEach begin="${pagingMap.start }" end="${pagingMap.end }" var="num">                                
			<a href="<%=request.getContextPath()%>/mypage/mywish?page=${num}">${num}</a>
		</c:forEach>
		
		
		<c:if test="${pagingMap.currentPage != pagingMap.totalPageCnt}">
			<a href="<%=request.getContextPath()%>/mypage/mywish?page=${pagingMap.currentPage +1}"> > </a>
		</c:if>
		<c:if test="${pagingMap.end != pagingMap.totalPageCnt}">
			<a href="<%=request.getContextPath()%>/mypage/mywish?page=${pagingMap.totalPageCnt }"> >> </a>
		</c:if>
	</div>
</div>