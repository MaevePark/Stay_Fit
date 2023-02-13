<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="col-lg-2 col-md-5">
	<div class="sidebar">

		<button type="button" onclick="location.href='<%=request.getContextPath()%>/shop/go'">크롤링 실행!</button>
		<div class="sidebar__item">
			<h4>Department</h4>
			<ul>
				<li><a href="<%=request.getContextPath()%>/shop/main?searchProduct=1">Fresh Meat</a></li>
				<li><a href="<%=request.getContextPath()%>/shop/main?searchProduct=2">Vegetables</a></li>
				<li><a href="<%=request.getContextPath()%>/shop/main?searchProduct=3">Fruit & Nut Gifts</a></li>
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