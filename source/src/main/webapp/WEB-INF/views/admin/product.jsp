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

    <title>관리자 - 상품</title>

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
              <h3 class="fw-bold py-3 mb-4 row justify-content-center"><span class="text-muted fw-light"></span>상품 목록 </h3>
              
              
              <!-- 검색 조건 -->
              
              <div class="col-xxl">
			    <div class="card mb-4">
			      <div class="card-body">
			        <form>
			        
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label" for="searchword">상품명</label>
			            <div class="col-sm-10">
			              <input type="text" class="form-control" id="searchword" placeholder="상품명을 입력하세요">
			            </div>
			          </div>
			          
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label" for="basic-default-name">카테고리</label>
			            <div class="col-sm-10">
			              <div class="btn-group">
					        <button type="button" id="dropdownbtn1" value="0" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">카테고리를 선택하세요  </button>
					        <ul class="dropdown-menu">
					          <li><a data-value="1" class="dropdown-item category">샐러드&amp;도시락&amp;볶음밥</a></li>
					          <li><a data-value="2" class="dropdown-item category">닭가슴살</a></li>
					          <li><a data-value="3" class="dropdown-item category">밥&amp;면</a></li>
					          <li><a data-value="4" class="dropdown-item category">간편요리&amp;반찬</a></li>
					          <li><a data-value="5" class="dropdown-item category">베이커리&amp;떡</a></li>
					          <li><a data-value="6" class="dropdown-item category">분식&amp;만두&amp;치킨</a></li>
					          <li><a data-value="7" class="dropdown-item category">건강식&amp;음료</a></li>
					          <li><a data-value="8" class="dropdown-item category">단백질&amp;시리얼&amp;간식</a></li>
					        </ul>
					      </div>
			            </div>
			          </div>
			          
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label" for="basic-default-name">정렬 기준</label>
			            <div class="col-sm-10">
			              <div class="btn-group">
					        <button type="button" id="dropdownbtn2" value="0" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">정렬 기준을 선택하세요  </button>
					        <ul class="dropdown-menu">
					          <li><a data-value="1" class="dropdown-item sort">판매가 높은 순</a></li>
					          <li><a data-value="2" class="dropdown-item sort">판매가 낮은 순</a></li>
					          <li><a data-value="3" class="dropdown-item sort">판매량 많은 순</a></li>
					          <li><a data-value="4" class="dropdown-item sort">판매량 적은 순</a></li>
					          <li><a data-value="5" class="dropdown-item sort">재고수량 많은 순</a></li>
					          <li><a data-value="6" class="dropdown-item sort">재고수량 적은 순</a></li>
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
                        <th>ID</th>
                        <th>카테고리</th>
                        <th>상품명</th>
                        <th>이미지</th>
                        <th>판매가</th>
                        <th>판매량</th>
                        <th>재고수량</th>
                      </tr>
                    </thead>
                    <tbody id="dataTableBody" class="table-border-bottom-0"></tbody>
                  </table>
                </div>
                
              	<!-- 페이지네이션 -->
              	<ul id = "pagingul" class="pagination justify-content-center" style="margin: 40px 0 24px 0"></ul>
              
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
//------------------------------------------------------------------------------
// <드롭다운메뉴>
$(".dropdown-item.category").click(function() {
	
	$("#dropdownbtn1").val($(this).data("value"));
	$("#dropdownbtn1").text($(this).text() + " ");
}); 
$(".dropdown-item.sort").click(function() {
	
	$("#dropdownbtn2").val($(this).data("value"));
	$("#dropdownbtn2").text($(this).text() + " ");
}); 

//------------------------------------------------------------------------------
// <목록출력>

let searchword; //검색단어
let category; //게시판종류
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
	category = $("#dropdownbtn1").val();
	sort = $("#dropdownbtn2").val();
	
	console.log("searchword : " + searchword);
	console.log("category : " + category);
	console.log("sort : " + sort);
	
	$.ajax({
		url: "adminproductlist",
		method: "GET",
		data: { 'searchword': searchword, 'category': category, 'sort': sort },
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
			console.log("totalData : " + totalData);
			
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
				"<td colspan='9' style='text-align: center;'>검색 결과가 없습니다.</td>" + 
			"</tr>";
	}

	//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
	currentPage = Number(currentPage);
	dataPerPage = Number(dataPerPage);
	
	// ((currentPage - 1) * dataPerPage + dataPerPage)가 40, totalData가 36라면 -> 36이 선택되도록 Math.min()함수 사용 -> 결과 : 30 ~ 35인덱스 출력
	for (let i = (currentPage - 1) * dataPerPage; i < Math.min((currentPage - 1) * dataPerPage + dataPerPage, totalData); i++) {
		chartHtml += 
			"<tr>" +
				"<td>" + dataList[i].pid + "</td>" +
				"<td>" + dataList[i].cname + "</td>" +
				"<td>" + dataList[i].pname + "</td>" +
				"<td>" + 
	                "<ul class='list-unstyled users-list m-0 avatar-group d-flex align-items-center'>" +
		                "<li data-bs-toggle='tooltip' data-popup='tooltip-custom' data-bs-placement='top' class='avatar avatar-xs pull-up'>" +
		                  "<img src='" + dataList[i].pimage + "' class='rounded-circle' />" +
		                "</li>" +
	                "</ul>" +
				"</td>" +
				"<td>" + dataList[i].pricechar + "</td>" +
				"<td>" + dataList[i].psales + "</td>" +
				"<td>" + dataList[i].pstock + "</td>" +
				"<td>" + 
					"<button type='button' class='btn btn-secondary btn-sm link'>상품보기</button>" + 
					"<input type='hidden' name='plink' value='" + dataList[i].plink + "'>" +
				"</td>" +
			"</tr>";
	}
	$("#dataTableBody").html(chartHtml);
	$("button.link").on("click", linkClickHandler);
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
	category = 0;
	sort = 0;
	
	$("#searchword").val(null);
	$("#dropdownbtn1").val(0);
	$("#dropdownbtn1").text("카테고리를 선택하세요  ");
	$("#dropdownbtn2").val(0);
	$("#dropdownbtn2").text("정렬 기준을 선택하세요  ");
	
	console.log("searchword : " + searchword);
	console.log("category : " + category);
	console.log("sort : " + sort);
	
	$.ajax({
		url: "adminproductlist",
		method: "GET",
		data: { 'searchword': searchword, 'category': category, 'sort': sort },
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
// <상품 보기 링크 이동>
function linkClickHandler() {
	
	let plink = $(this).siblings("input[type=hidden]").val();
	window.open(plink); // 새 창에 열기
}

</script>

</html>
