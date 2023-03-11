<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<div class="product__discount">
	<div class="section-title product__discount__title">
		<h2>Sale Off</h2>
	</div>
	<div class="row">
		<div class="product__discount__slider owl-carousel">
			<c:forEach items="${saleList }" var="saleList">
				<div class="col-lg-4">
					<div class="product__discount__item">
						<div class="product__discount__item__pic set-bg" data-setbg="${saleList.pimage }">
							<div class="product__discount__percent">-${saleList.psale }%</div>
							<ul class="product__item__pic__hover">
								<li><a data-pid="${saleList.pid }" onclick="sendWish(this)"><i class="fa fa-heart"></i></a></li>
								<li><a data-pid="${saleList.pid }" onclick="sendCart(this)"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="product__discount__item__text">
							<span>${saleList.cname }</span>
							<h5>
								<a href="${saleList.plink }" target="_blank">${saleList.pname }</a>
							</h5>
							<c:set var="sale" value="${(100 - saleList.psale) }"></c:set>
							<fmt:formatNumber var="finalPrice" value="${Math.floor((saleList.pprice * sale)/100/10)*10}" pattern="###,###,##0" />
							<fmt:formatNumber var="price" value="${saleList.pprice}" pattern="###,###,##0" />
							<div class="product__item__price">
								${finalPrice }원 <span>${price }원</span>
							</div>
						</div>
					</div>
				</div>
			
			</c:forEach>
			
			
			
		</div>
	</div>
</div>
    
    
    
    