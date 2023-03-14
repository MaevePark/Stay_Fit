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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->
  	<style>
	#sortOption {
	    display: inline-block;
	    font-weight: 400;
	    line-height: 1.53;
	    vertical-align: middle;
	    cursor: pointer;
	    -webkit-user-select: none;
	    -moz-user-select: none;
	    color: #8592a3;
    	border-color: #8592a3;
    	background: transparent;
    	padding: 0.4375rem 0.875rem 0.4375rem 0.875rem;
    	font-size: 0.9375rem;
	    border-radius: 0.375rem;
	    transition: all 0.2s ease-in-out;
	    appearance : none ;
  		-webkit-appearance : none ;
	}
	#sortOption::-ms-expand {
	  	display : none ;
	}
	#sortOption option[disabled] {
		display: none;
	}
    </style>

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
			            <label class="col-sm-2 col-form-label" for="searchword">닉네임</label>
			            <div class="col-sm-10">
			              <input type="text" class="form-control" id="searchword" placeholder="닉네임을 입력하세요">
			            </div>
			          </div>
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label" for="basic-default-name">정렬 기준</label>
			            <div class="col-sm-10">
			              <div class="btn-group">
			              
					        <button type="button" id="dropdownbtn" value="0" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">정렬 기준을 선택하세요  </button>
					        <ul class="dropdown-menu">
					          <li><a data-value="1" class="dropdown-item">게시글 수 많은순</a></li>
					          <li><a data-value="2" class="dropdown-item">댓글 수 많은순</a></li>
					          <li><a data-value="3" class="dropdown-item">총 주문금액 높은순</a></li>
					        </ul>
					        
					      </div>
			            </div>
			          </div>
			          <div class="row justify-content-center">
			            <div class="pagination justify-content-center" style="padding: 0">
				          <button type="button" id="searchbtn" class="btn btn-primary" style="margin-right: 10px">검색</button>
				          <button type="button" id="resetbtn" class="btn btn-secondary">초기화</button>
				        </div>
			          </div>
			        </form>
			      </div>
			    </div>
			  </div>

              <p id="displayCount" style="margin-left: 20px"></p>
              
              <!-- Basic Bootstrap Table -->
              <div class="card">
                <div class="table-responsive text-nowrap">
                  	
                  <table class="table">
                    <thead>
                      <tr>
                        <th></th>
                        <th>회원 ID</th>
                        <th>이메일</th>
                        <th>닉네임</th>
                        <th>게시글수</th>
                        <th>댓글수</th>
                        <th>총 주문금액</th>
                        <th>회원가입일</th>
                      </tr>
                    </thead>
                    <tbody id="dataTableBody" class="table-border-bottom-0"></tbody>
                  </table>
                </div>
                
                <!-- 페이지네이션 -->
                <ul id = "pagingul" class="pagination justify-content-center" style="margin: 40px 0 24px 0"></ul>
              
              </div>
              <!--/ Basic Bootstrap Table -->
              
			  <!-- 모달창 -->
	          <div class="modal fade" id="statisticsModal" tabindex="-1" style="display: none;" aria-hidden="true">
	            <div class="modal-dialog modal-dialog-centered" style="max-width: 50rem" role="document">
	              <div class="modal-content">
	                <div class="modal-header">
	                  <h5 class="modal-title" id="modalCenterTitle">활동 통계</h5>
	                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body">
	                
			            <!-- Expense Overview -->
		                <div class="order-1 mb-4">
		                  <div class="card h-100">
		                    <div class="card-header">
		                      <ul class="nav nav-pills" role="tablist">
		                        <input type="hidden" id="selectChart" value="1">
		                        <li class="nav-item">
		                          <button type="button" class="nav-link active" data-value="1" role="tab">총 주문금액</button>
		                        </li>
		                        <li class="nav-item">
		                          <button type="button" class="nav-link" data-value="2" role="tab">게시글 수</button>
		                        </li>
		                        <li class="nav-item">
		                          <button type="button" class="nav-link" data-value="3" role="tab">댓글 수</button>
		                        </li>
		                      </ul>
		                    </div>
		                    <div class="card-body px-0">
		                      <div class="tab-content p-0">
		                        <div class="tab-pane fade show active" id="navs-tabs-line-card-income" role="tabpanel">
		                          <div id="modalChart"></div>
		                        </div>
		                      </div>
		                    </div>
		                  </div>
		                </div>
		                <!--/ Expense Overview -->
		              
	                </div>
	              </div>
	            </div>
	          </div>
	          
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
    <script src="<%=request.getContextPath()%>/resources/admin/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="<%=request.getContextPath() %>/resources/admin/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="<%=request.getContextPath()%>/resources/admin/assets/js/dashboards-analytics3.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>

<script>
//------------------------------------------------------------------------------
// <드롭다운메뉴>
$(".dropdown-item").click(function() {
	
	var dropdownValue = $(this).attr("data-value");
	var dropdownText = $(this).text();
	
	$("#dropdownbtn").val(dropdownValue);
	$("#dropdownbtn").text(dropdownText + " ");
}); 

//------------------------------------------------------------------------------
// <회원목록출력>

let searchword; //검색단어
let sort; //정렬기준
let totalData; //총 데이터 수
let dataPerPage = 10; //한 페이지에 나타낼 글 수
let pageCount = 5; //페이징에 나타낼 페이지 수
let globalCurrentPage = 1; //현재 페이지
let dataList = []; //표시하려하는 데이터 리스트

$(function() {
	
	getData();
	
	$("#searchbtn").click(getData); // 데이터 호출 함수
	$("#resetbtn").click(resetData); // 검색조건,목록 초기화 함수
});

// 1. 데이터 호출 함수
function getData() {
	
	searchword = $("#searchword").val();
	sort = $("#dropdownbtn").val();
	
	console.log("searchword : " + searchword);
	console.log("sort : " + sort);
	
	$.ajax({
		url: "memberlist",
		method: "GET",
		data: { 'searchword': searchword, 'sort': sort },
//		data : "searchword=" + searchword + "&sort=" + sort,
		dataType: "json",
		success: function (data) {
		   	//totalData(총 데이터 수) 구하기
		   	totalData = data.length;
         	//데이터 대입
         	dataList = []; // 전역변수기때문에 매번 초기화해줘야함. 안그러면 기존 데이터가 있는 상태에서 push됨
		   	for (let i = 0; i < data.length; i++){    				  
		   		dataList.push(data[i]);  				  
			}
			console.log(dataList);
			
			// 글 목록 출력 함수 호출 (테이블 생성)
			displayData(1, dataPerPage);
			// 페이징  함수  호출
			paging(totalData, dataPerPage, pageCount, 1);
		}
	});
	// 이 위치에서 위 displayData, paging 함수들을 호출하면 ajax에서 데이터를 가져오기 전에 호출되어 undefined오류날 수 있음. 
	// -> async: false (동기 방식) 추가하든지, 위처럼 success 안에 위치시키든지 해야함 
}

// 2. 글 목록 출력 함수
//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage) {
	let chartHtml = "";
	
	//totalData가 0건인 경우
	if(totalData == 0){
		chartHtml +=
			"<tr>" +
				"<td colspan='8' style='text-align: center;'>검색 결과가 없습니다.</td>" + 
			"</tr>";
	}

	//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
	currentPage = Number(currentPage);
	dataPerPage = Number(dataPerPage);
	
	// ((currentPage - 1) * dataPerPage + dataPerPage)가 40, totalData가 36라면 -> 36이 선택되도록 Math.min()함수 사용 -> 결과 : 30 ~ 35인덱스 출력
	for (let i = (currentPage - 1) * dataPerPage; i < Math.min((currentPage - 1) * dataPerPage + dataPerPage, totalData); i++) {
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
				"<td style='padding-left:0; padding-right:0;'>" + 
					"<button type='button' class='btn btn-secondary btn-sm statistics' data-bs-toggle='modal' data-bs-target='#statisticsModal'>활동 통계</button>" + 
					"<input type='hidden' name='mid' value='" + dataList[i].mid + "'>" +
				"</td>" +
			"</tr>";
	}
	$("#dataTableBody").html(chartHtml);
	$("button.statistics").on("click", modalShowHandler);
}

// 3. 페이징  함수 
function paging(totalData, dataPerPage, pageCount, currentPage) {
	console.log("currentPage : " + currentPage);
	
	// 총 페이지 수
	totalPage = Math.ceil(totalData / dataPerPage);
	
	if (totalPage < pageCount) {
	  	pageCount = totalPage;
	}
	
	// 페이지 그룹
	let pageGroup = Math.ceil(currentPage / pageCount);
	let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
	
	if (last > totalPage) {
	  	last = totalPage;
	}
	
	let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
	let next = last + 1;
	let prev = first - 1;
	
	let pageHtml = "";
	
	if (prev > 0) {
	  	pageHtml += 
	  		"<li class='page-item prev'>" +
        		"<a class='page-link' href='#' id='prev'><i class='tf-icon bx bx-chevrons-left'></i></a>" +
        	"</li>";
	}
	
	//페이징 번호 표시 
	for (var i = first; i <= last; i++) {
	  	if (currentPage == i) {
	    	pageHtml +=
	            "<li class='page-item active'>" +
	            	"<a class='page-link' href='#' id='" + i + "'>" + i + "</a>" +
	          	"</li>";
	  	} else {
	    	pageHtml += 
              	"<li class='page-item'>" +
	            	"<a class='page-link' href='#' id='" + i + "'>" + i + "</a>" +
	          	"</li>";
	  	}
	}
	
	if (last < totalPage) {
	  	pageHtml += 
	  		"<li class='page-item next'>" +
	    		"<a class='page-link' href='#' id='next'><i class='tf-icon bx bx-chevrons-right'></i></a>" +
	    	"</li>";
	}
	
	$("#pagingul").html(pageHtml);
	let displayCount = "";
	displayCount = "총 " + totalData + "건";
	$("#displayCount").text(displayCount);
	
	
	//페이징 번호 클릭 이벤트 
	$("#pagingul li a").click(function() {
	  	let $id = $(this).attr("id");
	  	selectedPage = $(this).text();
	
	  	if ($id == "next") selectedPage = next;
	  	if ($id == "prev") selectedPage = prev;
	  
	  	//전역변수에 선택한 페이지 번호를 담기
	  	globalCurrentPage = selectedPage;
	  	//페이징 표시 재호출
	  	paging(totalData, dataPerPage, pageCount, selectedPage);
	  	//글 목록 표시 재호출
	  	displayData(selectedPage, dataPerPage);
	});
}

// 검색조건,목록 초기화 함수
function resetData() {
	
	searchword = null;
	sort = 0;
	
	$("#searchword").val(null);
	$("#dropdownbtn").val(0);
	$("#dropdownbtn").text("정렬 기준을 선택하세요  ");
	
	$.ajax({
		url: "memberlist",
		method: "GET",
		data: { 'searchword': searchword, 'sort': sort },
		dataType: "json",
		success: function (data) {
		   	//totalData(총 데이터 수) 구하기
		   	totalData = data.length;
	      	//데이터 대입
	      	dataList = []; // 전역변수기때문에 매번 초기화해줘야함. 안그러면 기존 데이터가 있는 상태에서 push됨
		   	for (let i = 0; i < data.length; i++){    				  
		   		dataList.push(data[i]);  				  
			}
			console.log(dataList);
			
			// 글 목록 출력 함수 호출 (테이블 생성)
			displayData(1, dataPerPage);
			// 페이징  함수  호출
			paging(totalData, dataPerPage, pageCount, 1);
		}
	});
}

// 참고사이트 -> https://mchch.tistory.com/140
//------------------------------------------------------------------------------

</script>

</html>
