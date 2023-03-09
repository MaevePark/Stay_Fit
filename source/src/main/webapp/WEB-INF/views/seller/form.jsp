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

<!-- 로그인을 하지 않은 경우나 seller가 아닌 사용자가 url로 접근하는 것 막는 코드 -->  
<% if(request.getSession().getAttribute("mrole") == null || !('S' == (char)request.getSession().getAttribute("mrole"))){ %>
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
					          <li><a data-value="1" class="dropdown-item">샐러드&amp;도시락&amp;볶음밥</a></li>
					          <li><a data-value="2" class="dropdown-item">닭가슴살</a></li>
					          <li><a data-value="3" class="dropdown-item">밥&amp;면</a></li>
					          <li><a data-value="4" class="dropdown-item">간편요리&amp;반찬</a></li>
					          <li><a data-value="5" class="dropdown-item">베이커리&amp;떡</a></li>
					          <li><a data-value="6" class="dropdown-item">분식&amp;만두&amp;치킨</a></li>
					          <li><a data-value="7" class="dropdown-item">건강식&amp;음료</a></li>
					          <li><a data-value="8" class="dropdown-item">단백질&amp;시리얼&amp;간식</a></li>
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
			            <div class="col-sm-10 d-flex align-items-start align-items-sm-center gap-4">
					          
				          <img src="" id="thumbnail" alt="" class="d-block rounded" height="100" width="100" style="border: 1px solid #d9dee3;">
				            <div class="button-wrapper">
				              <label for="uploadFile" class="btn btn-primary me-2" tabindex="0">
				                <span class="d-none d-sm-block">이미지 업로드</span>
				                <i class="bx bx-upload d-block d-sm-none"></i>
				                
				                <input type="file" name="uploadFile" id="uploadFile" class="file-input" onchange="setThumbnail(event);" hidden="" accept="image/png, image/jpeg" required>
				              	<!-- file타입은 name을 vo의 필드명과 동일하게 작성하면 vo에 들어가려다가 고꾸라짐. 다르게 작성해야함 -->
				              </label>
				            </div>
				         </div>

			          </div>
			          
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label">판매가 <span style="font-size: 0.75rem; color: #696cff;"> (필수)</span></label>
			            <div class="col-sm-10">
			              <input type="text" name="pricenum" class="form-control" required>
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
// <대표이미지 썸네일>
let thumbnail = document.getElementById('thumbnail');

$(function(){
	// 기본이미지
	thumbnail.src = "https://res.cloudinary.com/doxmm0ofz/image/upload/v1678087337/upload_wyuiu1.jpg";
	thumbnail.style.padding = "30px";
});
function setThumbnail(event) {
	
	let fileInput = document.querySelector('.file-input');
	
  	if (fileInput.files[0]) {
  		// 사용자가 업로드한 이미지
  		thumbnail.src = window.URL.createObjectURL(fileInput.files[0]);
  		thumbnail.style.padding = "0";
  	}
}	

</script>

</html>
