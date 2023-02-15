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

    <title>판매자 - 상품관리</title>

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
	    <jsp:include page="/WEB-INF/views/seller/aside.jsp"/>
	    <!-- Aside End -->


        <!-- Layout container -->
        <div class="layout-page">

          <!-- Content wrapper -->
          <div class="content-wrapper">
          
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h3 class="fw-bold py-3 mb-4 row justify-content-center"><span class="text-muted fw-light"></span>상품 등록 </h3>
              
			  <div class="col-xxl">
			    <div class="card mb-4">
			      <div class="card-body">
			      
			      	<!-- 폼 시작 -->
			        <form action="<%=request.getContextPath() %>/seller/productinsert" method="post" enctype="multipart/form-data">
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label">카테고리 <span style="font-size: 0.75rem; color: #696cff;"> (필수)</span></label>
			            <div class="col-sm-10">
			              <div class="btn-group">
					        <button type="button" id="dropdownbtn" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">카테고리를 선택하세요  </button>
					        <ul class="dropdown-menu">
					          <li><a data-value="1" class="dropdown-item">샐러드·도시락·볶음밥</a></li>
					          <li><a data-value="2" class="dropdown-item">닭가슴살</a></li>
					          <li><a data-value="3" class="dropdown-item">건강간식·음료</a></li>
					        </ul>
					      </div>
			            </div>
			          </div>
			          <input type="hidden" name="cid" id="cid" required value="1">
			          
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label">상품명 <span style="font-size: 0.75rem; color: #696cff;"> (필수)</span></label>
			            <div class="col-sm-10">
			              <input type="text" name="pname" class="form-control" placeholder="예) 미주라 통밀도너츠" required>
			            </div>
			          </div>
			          
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label">대표이미지 <span style="font-size: 0.75rem; color: #696cff;"> (필수)</span></label>
			            <div class="col-sm-10">
			              <input type="file" class="form-control" name="uploadFile" id="formFile" required>
			            </div><!-- name을 vo의 필드명과 동일하게 작성하면 vo에 넣을 수 없음 -->
			          </div>
			          
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label">판매가 <span style="font-size: 0.75rem; color: #696cff;"> (필수)</span></label>
			            <div class="col-sm-10">
			              <input type="text" name="pprice" class="form-control" required>
			            </div>
			          </div>
			          
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label">재고수량</label>
			            <div class="col-sm-10">
			              <input type="text" name="pstock" class="form-control">
			            </div>
			          </div>
			          
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label">상품 URL <span style="font-size: 0.75rem; color: #696cff;"> (필수)</span></label>
			            <div class="col-sm-10">
			              <input type="text" name="plink" class="form-control" required>
			            </div>
			          </div>
			          
			          <div class="row justify-content-center">
			            <div class="pagination justify-content-center" style="padding: 0">
				          <button type="submit" id="submit" class="btn btn-primary">등록</button>
				        </div>
			          </div>
			        </form>
			        
			      </div>
			    </div>
			  </div>

            </div>
            <!-- / Content -->


            <!-- Footer Begin -->
	    	<jsp:include page="/WEB-INF/views/seller/footer.jsp"/>
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
    <script src="<%=request.getContextPath() %>/resources/admin/assets/js/form-basic-inputs.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
  
<script>
//------------------------------------------------------------------------------
// <드롭다운메뉴>
$(".dropdown-item").click(function() {
	
	$("#dropdownbtn").val($(this).data("value"));
	$("#dropdownbtn").text($(this).text() + " ");
	
	// input type hidden에 카테고리 선택값 넣어줌
	$("#cid").val($(this).data("value"));
	console.log($("#cid").val());
}); 

//------------------------------------------------------------------------------
</script>

</html>
