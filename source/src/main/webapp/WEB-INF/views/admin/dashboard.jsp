<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default"
	data-assets-path="<%=request.getContextPath()%>/resources/admin/assets/"
	data-template="vertical-menu-template-free">
<head>
<meta name="_csrf" th:content="${_csrf.token}" />
<meta name="_csrf_header" th:content="${_csrf.headerName}" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>관리자 - 대시보드</title>

<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/admin/assets/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/admin/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/admin/assets/vendor/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/admin/assets/vendor/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/admin/assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/apex-charts/apex-charts.css" />

<!-- Page CSS -->

<!-- Helpers -->
<script
	src="<%=request.getContextPath()%>/resources/admin/assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script
	src="<%=request.getContextPath()%>/resources/admin/assets/js/config.js"></script>
</head>

<body>

<!-- 로그인을 하지 않은 경우나 admin이 아닌 사용자가 url로 접근하는 것 막는 코드 -->  
<% if(request.getSession().getAttribute("mrole") == null || !('A' == (char)request.getSession().getAttribute("mrole"))){ %>
<script>
window.onload = function() {
    location.href = "<%=request.getContextPath()%>/member/login";
}
</script>
<%}%>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">


			<!-- Aside Begin -->
			<jsp:include page="/WEB-INF/views/admin/aside.jsp" />
			<!-- Aside End -->

			<!-- Content -->
			<!-- Layout container -->
			<div class="layout-page">

				<!-- Content wrapper -->
				<div class="content-wrapper">

					<!-- Content -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<div class="row">

							<!-- 총 수익 현황 (Total Revenue Chart) -->
							<div class="col-12 col-lg-12 order-1 order-md-3 order-lg-2 mb-4">
								<div class="card">
									<div class="row row-bordered g-0">
										<div class="col-md-12">
											<h5 class="card-header m-0 me-2 pb-3">총 수익 현황</h5>

											<div id="totalRevenueChart" class="px-2"></div>

										</div>
									</div>
								</div>
							</div>
							<!--/ 총 수익 (Total Revenue Chart) -->

							<!-- 카테고리별 판매 비율(Order Statics Chart) -->
							<div class="col-6 col-md-6 col-lg-6 col-xl-6 order-2 mb-4">
								<div class="card h-100">
									<div
										class="card-header d-flex align-items-center justify-content-between pb-0">
										<div class="card-title mb-0">
											<h5 class="m-0 me-2">카테고리별 판매 비율 현황</h5>
										</div>
									</div>
									<div
										class="card-body d-flex justify-content-evenly align-items-center mb-3"
										style="padding: 24px">

										<div id="orderStatisticsChart"></div>

									</div>
								</div>
							</div>
							<!--/ 카테고리별 판매 비율(Order Statics Chart) -->

							<!-- 판매량 (Sales Volume Chart) -->
							<div class="col-6 col-md-6 col-lg-6 order-3 mb-4">
								<div class="card h-100">
									<div class="card-header">
										<div class="card-title mb-0">
											<h5 class="m-0 me-2">판매량 현황</h5>
										</div>
									</div>
									<div class="card-body px-0">
										<div class="tab-content p-0">
											<div class="tab-pane fade show active"
												id="navs-tabs-line-card-income" role="tabpanel">

												<div id="incomeChart"></div>

											</div>
										</div>
									</div>
								</div>
							</div>
							<!--/ 판매량 (Sales Volume Chart) -->

						</div>

					</div>
					<!-- / Content -->



					<!-- Footer Begin -->
					<jsp:include page="/WEB-INF/views/admin/footer.jsp" />
					<!-- Footer End -->



					<div class="content-backdrop fade"></div>
				</div>
				<!-- Content wrapper -->
			</div>
			<!-- / Layout page -->
		</div>

		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->


	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<script
		src="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/jquery/jquery.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/popper/popper.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin/assets/vendor/js/bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<script
		src="<%=request.getContextPath()%>/resources/admin/assets/vendor/js/menu.js"></script>
	<!-- endbuild -->

	<!-- Vendors JS -->
	<script
		src="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/apex-charts/apexcharts.js"></script>

	<!-- Main JS -->
	<script
		src="<%=request.getContextPath()%>/resources/admin/assets/js/main.js"></script>

	<!-- Page JS -->
	<script
		src="<%=request.getContextPath()%>/resources/admin/assets/js/dashboards-analytics.js"></script>

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
