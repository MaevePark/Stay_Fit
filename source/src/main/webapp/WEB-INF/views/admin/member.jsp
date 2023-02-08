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

    <title>관리자 - 회원</title>

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
              <h3 class="fw-bold py-3 mb-4 row justify-content-center"><span class="text-muted fw-light"></span>회원 목록 </h3>
              
              
              <!-- 검색 조건 -->

              <div class="col-xxl">
			    <div class="card mb-4">
			      <div class="card-body">
			        <form>
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label" for="basic-default-name">회원 ID</label>
			            <div class="col-sm-10">
			              <input type="text" class="form-control" id="basic-default-name" placeholder="회원 ID를 입력하세요">
			            </div>
			          </div>
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label" for="basic-default-name">정렬 기준</label>
			            <div class="col-sm-10">
			              <div class="btn-group">
					        <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">정렬 기준을 선택하세요  &nbsp;</button>
					        <ul class="dropdown-menu">
					          <li><a class="dropdown-item" href="javascript:void(0);">게시글 수 많은순</a></li>
					          <li><a class="dropdown-item" href="javascript:void(0);">댓글 수 많은순</a></li>
					          <li><a class="dropdown-item" href="javascript:void(0);">총 주문금액 높은순</a></li>
					        </ul>
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

              <p id="displayCount" style="margin-left: 20px">총 n건</p>
              
              <!-- Basic Bootstrap Table -->
              <div class="card">
                <div class="table-responsive text-nowrap">
                  	
                  <table class="table">
                    <thead>
                      <tr>
                        <th>프로필사진</th>
                        <th>회원 ID</th>
                        <th>이메일</th>
                        <th>닉네임</th>
                        <th>게시글수</th>
                        <th>댓글수</th>
                        <th>총 주문금액</th>
                        <th>회원가입일</th>
                      </tr>
                    </thead>
                    <tbody id="dataTableBody" class="table-border-bottom-0">
<%--                     
                      <tr>
                        <td>
                          <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
                            <li
                              data-bs-toggle="tooltip"
                              data-popup="tooltip-custom"
                              data-bs-placement="top"
                              class="avatar avatar-xs pull-up"
                            >
                              <img src="<%=request.getContextPath() %>/resources/admin/assets/img/avatars/6.png" alt="Avatar" class="rounded-circle" />
                            </li>
                          </ul>
                        </td>
                        <td>122</td>
                        <td>stayfit@stayfit.com</td>
                        <td>스테이핏</td>
                        <td>5</td>
                        <td>10</td>
                        <td>10,000</td>
                        <td>2023.02.02</td>
                      </tr>
               --%>        
                    </tbody>
                  </table>
                </div>
                
                <!-- 페이지네이션 -->
                <ul id = "pagingul" class="pagination justify-content-center" style="margin: 40px 0 24px 0">
                
<!-- 	          <li class="page-item prev">
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
-->
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

<script>

let totalData; //총 데이터 수
let dataPerPage = 10; //한 페이지에 나타낼 글 수
let pageCount = 5; //페이징에 나타낼 페이지 수
let globalCurrentPage = 1; //현재 페이지
let dataList = []; //표시하려하는 데이터 리스트

$(function() {
	 
	$.ajax({
		method: "GET",
		url: "memberlist",
		dataType: "json",
		success: function (data) {
		   	//totalData(총 데이터 수) 구하기
		   	totalData = data.length;
         	//데이터 대입
		   	for (let i = 0; i < data.length; i++){    				  
		   		dataList.push(data[i]);  				  
			}
			console.log(dataList);
		}
	});
	//글 목록 표시 호출 (테이블 생성)
	displayData(1, dataPerPage);
	
	//페이징 표시 호출
	paging(totalData, dataPerPage, pageCount, 1);
});

//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage) {
	let chartHtml = "";

	//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
	currentPage = Number(currentPage);
	dataPerPage = Number(dataPerPage);
	
	console.log(dataList);
	console.log(dataList[0]);
	
	for (let i = (currentPage - 1) * dataPerPage; i < (currentPage - 1) * dataPerPage + dataPerPage; i++) {
		console.log(dataList[i]);
		chartHtml += 
			"<tr>" +
				"<td>" + 
	                "<ul class='list-unstyled users-list m-0 avatar-group d-flex align-items-center'>" +
		                "<li data-bs-toggle='tooltip' data-popup='tooltip-custom' data-bs-placement='top' class='avatar avatar-xs pull-up'>" +
		                  "<img src='" + dataList[i].profimg + "' alt='Avatar' class='rounded-circle' />" +
		                "</li>" +
	                "</ul>" +
				"</td>" +
				"<td>" + dataList[i].mid + "</td>" +
				"<td>" + dataList[i].memail + "</td>" +
				"<td>" + dataList[i].mname + "</td>" +
				"<td>" + dataList[i].postcnt + "</td>" +
				"<td>" + dataList[i].replycnt + "</td>" +
				"<td>" + dataList[i].payment + "</td>" +
				"<td>" + dataList[i].mcreate + "</td>" +
			"</tr>";
	}
	$("#dataTableBody").html(chartHtml);
	console.log(chartHtml);
}
</script>

</html>
