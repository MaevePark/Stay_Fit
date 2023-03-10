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

				
	          <!-- 모달창 -->
	          <div class="modal fade" id="updateModal" tabindex="-1" style="display: none;" aria-hidden="true">
	            <div class="modal-dialog modal-dialog-centered" role="document">
	              <div class="modal-content">
	                <div class="modal-header">
	                  <h5 class="modal-title" id="modalCenterTitle">상품 수정</h5>
	                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body">
	                
		              <form id="updateForm" name="updateForm" method="post" enctype="multipart/form-data">
		              
	                      <input type="hidden" name="pid" id="pid" class="form-control" required>
		                  <div class="row">
		                    <div class="col mb-3">
		                      <label for="pname" class="form-label">상품명<span style="font-size: 0.75rem; color: #696cff;"> (필수)</span></label>
		                      <input type="text" name="pname" id="pname" class="form-control" required>
		                    </div>
		                  </div>
		                  <div class="row">
		                    <div class="col mb-3">
		                      <label class="form-label">대표이미지<span style="font-size: 0.75rem; color: #696cff;"> (필수)</span></label>
		                      <div class="d-flex align-items-start align-items-sm-center gap-4">
					          
					          <img src="" id="thumbnail" class="d-block rounded" height="100" width="100">
		                      <input type="hidden" name="pimage"> <!-- '이전 이미지로'클릭 대비해서 기존 이미지 저장해놓기 -->
					          
					            <div class="button-wrapper">
					              <label for="upload" class="btn btn-primary me-2" tabindex="0">
					                <span class="d-none d-sm-block">새로운 이미지 업로드</span>
					                <i class="bx bx-upload d-block d-sm-none"></i>
					                
					                <input type="file" name="upload" id="upload" class="file-input" hidden="" accept="image/png, image/jpeg">
					              
					              </label>
					              <button type="button" class="btn btn-outline-secondary image-reset">
					                <i class="bx bx-reset d-block d-sm-none"></i>
					                <span class="d-none d-sm-block">이전 이미지로</span>
					              </button>
					            </div>
					          </div>
					          
		                    </div> <!-- file타입은 name을 vo의 필드명과 동일하게 작성하면 vo에 들어가려다가 고꾸라짐. 다르게 작성해야함 -->
		                  </div>
		                  <div class="row">
		                    <div class="col mb-3">
		                      <label for="pricenum" class="form-label">판매가<span style="font-size: 0.75rem; color: #696cff;"> (필수)</span></label>
		                      <input type="text" name="pricenum" id="pricenum" class="form-control" required>
		                    </div>
		                  </div>
		                  <div class="row">
		                    <div class="col mb-3">
		                      <label for="pstock" class="form-label">재고수량</label>
		                      <input type="text" name="pstock" id="pstock" class="form-control">
		                    </div>
		                  </div>
		                  <div class="row">
		                    <div class="col mb-3">
		                      <label for="plink" class="form-label">상품 URL<span style="font-size: 0.75rem; color: #696cff;"> (필수)</span></label>
		                      <input type="text" name="plink" id="plink" class="form-control" required>
		                    </div>
		                  </div>
		              </form>
	                </div>
	                <div class="modal-footer">
	                  <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
	                  <button type="button" class="btn btn-primary" onclick="productUpdate(event)">등록</button>
	                </div>
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
		url: "productlist",
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
				"<td style='padding-left:0; padding-right:0;'>" + 
					"<button type='button' class='btn btn-secondary btn-sm link'>상품보기</button>" + 
					"<input type='hidden' name='plink' value='" + dataList[i].plink + "'>" +
				"</td>" +
				"<td style='padding-right:0;'>" + 
					"<button type='button' class='btn btn-secondary btn-sm update' data-bs-toggle='modal' data-bs-target='#updateModal'>상품수정</button>" + 
					"<input type='hidden' name='image' value='" + dataList[i].pimage + "'>" +
					"<input type='hidden' name='pricenum' value='" + dataList[i].pricenum + "'>" +
				"</td>" +
				"<td>" + 
					"<button type='button' class='btn btn-secondary btn-sm delete'>상품삭제</button>" + 
				"</td>" +
			"</tr>";
	}
	$("#dataTableBody").html(chartHtml);
	$("button.link").on("click", linkClickHandler);
	$("button.update").on("click", modalShowHandler);
	$("button.delete").on("click", productDeleteHandler);
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
		url: "productlist",
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

//------------------------------------------------------------------------------
// <상품 수정>

// 1. 모달창에 기존 정보 가져오기
function modalShowHandler() {
	
	// 상품ID, 상품명, 판매가, 재고수량, 상품URL
	let pid = $(this).parent().siblings().eq(0).text();
	let pname = $(this).parent().siblings().eq(2).text();
	let pimage = $(this).siblings("input[name=image]").val();
	console.log(pimage);
	let pricenum = $(this).siblings("input[name=pricenum]").val();
	let pstock = $(this).parent().siblings().eq(6).text();
	let plink = $(this).parent().siblings().eq(7).children("input[type=hidden]").val();

	$("#pid").val(pid);
	$("#pname").val(pname);
	$("#thumbnail").prop("src", pimage);
	$("input[name=pimage]").val(pimage); 
	// '이전 사진으로'클릭 대비해서 모달창 form 내부에 기존 이미지 저장해놓기 -> input name이 pimage니까 vo의 pimage필드에 그대로 들어갈거임
	$("#pricenum").val(pricenum);
	$("#pstock").val(pstock);
	$("#plink").val(plink);
	
	
// 2. 이미지 첨부, 썸네일 부분 (새로운 사진 업로드, 이전 사진으로)
	
	let thumbnail = document.getElementById('thumbnail');
  	const fileInput = document.querySelector('.file-input');
  	const resetFileInput = document.querySelector('.image-reset');

  	// 이전 사진 변수에 저장
   	const originalImage = thumbnail.src;
	console.log("originalImage : " + originalImage);
   	
   	fileInput.onchange = function() { // 새로운 사진 업로드
      	if (fileInput.files[0]) {
      		thumbnail.src = window.URL.createObjectURL(fileInput.files[0]);
      	}
   	};
   	resetFileInput.onclick = function() { // 이전 사진으로
   		thumbnail.src = originalImage;
   		fileInput.value = ''; // <input type="file"> 값 지워주기
   	};
}


// 3. 수정된 정보 업데이트
function productUpdate(e) {
	e.preventDefault(); // form 안에 submit 역할을 하는 버튼을 누르면 창이 새로고침하여 실행되는데, 새로 실행하지 않게 하고싶을 경우 (submit은 작동됨)
	
	var form = document.getElementById('updateForm');
	form.method = 'post';
	form.enctype = 'multipart/form-data';
	var fileData = new FormData(form);
	
    $.ajax({
  		url : "productupdate",
  		type : "post",
  		enctype: 'multipart/form-data',
  	    cache: false,
  		data: fileData, // url로 전달'할' 데이터
  		async: false,
  	    contentType : false,
  	    processData : false, 
  	    dataType: 'json',
  		success: function(data){ // url로부터 전달'받은' 데이터
			if(data > 0) {
				alert("상품 수정에 성공하였습니다.");
			} else {
				alert("상품 수정에 실패하였습니다.");
			}
			$('#updateForm')[0].reset(); // 폼내용 삭제
			$('#updateModal').modal('hide'); // 폼 닫기
			
			getData(); // 데이터 새로 가져오기
		}
	});  
}

//------------------------------------------------------------------------------
//<상품 삭제>

function productDeleteHandler() {
	
	// 일단 정말 삭제할건지 다시 체크
	if (confirm("정말 삭제하시겠습니까?") == true) { // 확인 클릭시
		let pid = $(this).parent().siblings().eq(0).text();
		console.log(pid);
	    
	    $.ajax({
	  		url : "productdelete",
	  		type : "post",
	  		data: { 'pid' : pid },
	  		success: function(data){
		  		if(data == 1) {
					alert("상품 삭제 성공");
				} else {
					alert("상품 삭제 실패");
				}
	  			getData();
		    }
	    });  
	} else { // 취소 클릭시
	    return false;
	}
}
</script>

</html>