<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="<%=request.getContextPath() %>/resources/admin/assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>관리자 - 게시물관리</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="<%=request.getContextPath() %>/resources/admin/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="<%=request.getContextPath() %>/resources/admin/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="<%=request.getContextPath() %>/resources/admin/assets/js/config.js"></script>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">

      
		<!-- Aside Begin -->
	    <jsp:include page="/WEB-INF/views/admin/aside.jsp"/>
	    <!-- Aside End -->


        <!-- Layout container -->
        <div class="layout-page">

          <!-- Content wrapper -->
          <div class="content-wrapper">
          
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h3 class="fw-bold py-3 mb-4 row justify-content-center"><span class="text-muted fw-light"></span>게시물 목록 </h3>
              
              
              <!-- 검색 조건 -->
              <!-- 상품명 -->
              <!-- 카테고리 -->
              <div class="col-xxl">
			    <div class="card mb-4">
			      <div class="card-body">
			        <form>
			        
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label" for="basic-default-name">제목</label>
			            <div class="col-sm-10">
			              <input type="text" class="form-control" id="basic-default-name" placeholder="제목을 입력하세요">
			            </div>
			          </div>
			          
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label" for="basic-default-name">게시판</label>
			            <div class="col-sm-10">
			              <div class="btn-group">
					        <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">게시판을 선택하세요  &nbsp;</button>
					        <ul class="dropdown-menu">
					          <li><a class="dropdown-item" href="javascript:void(0);">Action</a></li>
					          <li><a class="dropdown-item" href="javascript:void(0);">Another action</a></li>
					          <li><a class="dropdown-item" href="javascript:void(0);">Something else here</a></li>
					          <li>
					            <hr class="dropdown-divider">
					          </li>
					          <li><a class="dropdown-item" href="javascript:void(0);">Separated link</a></li>
					        </ul>
					      </div>
			            </div>
			          </div>
			          
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label" for="basic-default-name">게시물 상태</label>
			            <div class="col-sm-10" style="padding: 8px 13px">
							<div class="form-check form-check-inline">
				              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
				              <label class="form-check-label" for="inlineRadio1">활성화된 게시물</label>
				            </div>
				            <div class="form-check form-check-inline">
				              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
				              <label class="form-check-label" for="inlineRadio2">비활성화된 게시물</label>
				            </div>
			            </div>
			          </div>
			          
			          <div class="row justify-content-center">
			            <div class="pagination justify-content-center" style="padding: 0">
				          <button type="button" class="btn btn-primary" style="margin-right: 10px">검색</button>
				          <button type="button" class="btn btn-secondary">초기화</button>
				        </div>
			          </div>
			        </form>
			      </div>
			    </div>
			  </div>

              <p style="margin-left: 20px">총 n건</p>
              
              <!-- Basic Bootstrap Table -->
              <div class="card">
                <div class="table-responsive text-nowrap">
                  	
                  <table class="table">
                    <thead>
                      <tr>
                        <th>게시물 ID</th>
                        <th>게시판</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                        <th>상태</th>
                        <th>삭제</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                      <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>122</td>
                        <td>고민&질문</td>
                        <td><strong>PT 질문 있습니다</strong></td>
                        <td>stayfit@stayfit.com</td>
                        <td>25</td>
                        <td>2023.02.02</td>
                        <td>활성화</td>
                        <td>
                          <button type="button" class="btn btn-secondary btn-sm">삭제</button>
                        </td>
                      </tr>
                      <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i>122</td>
                        <td>고민&질문</td>
                        <td><strong>PT 질문 있습니다</strong></td>
                        <td>stayfit@stayfit.com</td>
                        <td>25</td>
                        <td>2023.02.02</td>
                        <td>비활성화</td>
                        <td>
                          <button type="button" class="btn btn-secondary btn-sm">삭제</button>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                
                <!-- 페이지네이션 -->
                <ul class="pagination justify-content-center" style="margin: 40px 0 24px 0">
	              <li class="page-item prev">
	                <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-left"></i></a>
	              </li>
	              <li class="page-item">
	                <a class="page-link" href="javascript:void(0);">1</a>
	              </li>
	              <li class="page-item">
	                <a class="page-link" href="javascript:void(0);">2</a>
	              </li>
	              <li class="page-item active">
	                <a class="page-link" href="javascript:void(0);">3</a>
	              </li>
	              <li class="page-item">
	                <a class="page-link" href="javascript:void(0);">4</a>
	              </li>
	              <li class="page-item">
	                <a class="page-link" href="javascript:void(0);">5</a>
	              </li>
	              <li class="page-item next">
	                <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-right"></i></a>
	              </li>
	            </ul>
              </div>
              <!--/ Basic Bootstrap Table -->


            </div>
            <!-- / Content -->


            <!-- Footer Begin -->
	    	<jsp:include page="/WEB-INF/views/admin/footer.jsp"/>
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
    <script src="<%=request.getContextPath() %>/resources/admin/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/assets/vendor/libs/popper/popper.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/assets/vendor/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath() %>/resources/admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="<%=request.getContextPath() %>/resources/admin/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="<%=request.getContextPath() %>/resources/admin/assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>
