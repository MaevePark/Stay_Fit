<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src='<%=request.getContextPath() %>/resources/js/shop/shopCategory.js'></script>


<div class="col-lg-2 col-md-5">
	<div class="sidebar">

		<div class="sidebar__item">
			<h4>Department</h4>
			<ul>
				<li><a href="<%=request.getContextPath()%>/shop?productCategory=0">홈</a></li>
				<c:forEach items="${categoryList }" var="cList">
					<li><a href="<%=request.getContextPath()%>/shop/main?productCategory=${cList.cid}">${cList.cname }</a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="sidebar__item">
			<h4>Price</h4>
			<div class="price-range-wrap">
				<div
					class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
					data-min="10" data-max="540">
					<div class="ui-slider-range ui-corner-all ui-widget-header"></div>
					<span tabindex="0"
						class="ui-slider-handle ui-corner-all ui-state-default"></span> <span
						tabindex="0"
						class="ui-slider-handle ui-corner-all ui-state-default"></span>
				</div>
				<div class="range-slider">
					<div class="price-input">
						<input type="text" id="minamount"> <input type="text"
							id="maxamount">
					</div>
				</div>
			</div>
		</div>

	</div>
</div>