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
			            <label class="col-sm-2 col-form-label" for="searchword">제목</label>
			            <div class="col-sm-10">
			              <input type="text" class="form-control" id="searchword" placeholder="제목을 입력하세요">
			            </div>
			          </div>
			          
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label" for="basic-default-name">게시판</label>
			            <div class="col-sm-10">
			              <div class="btn-group">
			              
					        <button type="button" id="dropdownbtn" value="0" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">게시판을 선택하세요  </button>
					        <ul class="dropdown-menu">
					          <li><a data-value="1" class="dropdown-item">공지사항</a></li>
					          <li><a data-value="2" class="dropdown-item">식단</a></li>
					          <li><a data-value="3" class="dropdown-item">팁&amp;노하우</a></li>
					          <li><a data-value="4" class="dropdown-item">고민&amp;질문</a></li>
					        </ul>
					        
					      </div>
			            </div>
			          </div>
			          
			          <div class="row mb-3">
			            <label class="col-sm-2 col-form-label" for="basic-default-name">게시물 상태</label>
			            <div class="col-sm-10" style="padding: 8px 13px">
							<div class="form-check form-check-inline">
				              <input class="form-check-input" type="radio" name="radioOptions" id="inlineRadio" value="0" checked>
				              <label class="form-check-label" for="inlineRadio">전체</label>
				            </div>
							<div class="form-check form-check-inline">
				              <input class="form-check-input" type="radio" name="radioOptions" id="inlineRadio1" value="1">
				              <label class="form-check-label" for="inlineRadio1">정상 게시물</label>
				            </div>
				            <div class="form-check form-check-inline">
				              <input class="form-check-input" type="radio" name="radioOptions" id="inlineRadio2" value="2">
				              <label class="form-check-label" for="inlineRadio2">삭제된 게시물</label>
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
                        <th>게시물 ID</th>
                        <th>게시판</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                        <th>상태</th>
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
$(".dropdown-item").click(function() {
	
	var dropdownValue = $(this).attr("data-value");
	var dropdownText = $(this).text();
	
	$("#dropdownbtn").val(dropdownValue);
	$("#dropdownbtn").text(dropdownText + " ");
}); 
//------------------------------------------------------------------------------
// <라디오버튼>
$("input[name=radioOptions]").click(function() {
	
	$("input[name=radioOptions]").prop('checked', false); //name이 radioOptions인 라디오 버튼 일괄 해제
	$(this).prop('checked', true); //선택한 radio만 체크
	// attr(X) prop(O) 
	// ★★★ disabled, selected, checked와 같은 속성값을 확인 또는 변경하는 경우는 .prop()를 사용!! ★★★
});

//------------------------------------------------------------------------------
// <게시물목록출력>

let searchword; //검색단어
let category; //게시판종류
let state; //활성화/비활성화
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
	category = $("#dropdownbtn").val();
	state = $("input[name=radioOptions]:checked").val();
	
	console.log("searchword : " + searchword);
	console.log("category : " + category);
	console.log("state : " + state);
	
	$.ajax({
		url: "boardlist",
		method: "GET",
		data: { 'searchword': searchword, 'category': category, 'state': state },
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
				"<td>" + dataList[i].bid + "</td>" +
				"<td>" + dataList[i].bcname + "</td>" +
				"<td>" + dataList[i].btitle + "</td>" +
				"<td>" + dataList[i].mid + "</td>" +
				"<td>" + dataList[i].bviewcount + "</td>" +
				"<td>" + dataList[i].bcreate + "</td>" +
				"<td>" + dataList[i].bstate + "</td>" +
				"<td>" + 
					"<button type='button' class='btn btn-secondary btn-sm link'>글보기</button>" + 
					"<input type='hidden' name='bid' value='" + dataList[i].bid + "'>" +
				"</td>" +
				"<td>" + 
					"<button type='button' class='btn btn-secondary btn-sm delete'>글삭제</button>" + 
					"<input type='hidden' name='bid' value='" + dataList[i].bid + "'>" +
				"</td>" +
			"</tr>";
	}
	$("#dataTableBody").html(chartHtml);
	$("button.link").on("click", linkClickHandler);
	$("button.delete").on("click", boardDeleteHandler); // <삭제 방법 1>
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
	state = 0;
	
	$("#searchword").val(null);
	$("#dropdownbtn").val(0);
	$("#dropdownbtn").text("게시판을 선택하세요  ");
	$("input[name=radioOptions]").prop('checked', false); //name이 radioOptions인 라디오 버튼 일괄 해제
	$("#inlineRadio").prop('checked', true); //첫번째 radio만 체크
	// attr(X) prop(O) 
	// ★★★ disabled, selected, checked와 같은 속성값을 확인 또는 변경하는 경우는 .prop()를 사용!! ★★★
	
	console.log("searchword : " + searchword);
	console.log("category : " + category);
	console.log("state : " + state);
	
	$.ajax({
		url: "boardlist",
		method: "GET",
		data: { 'searchword': searchword, 'category': category, 'state': state },
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

// <글보기 링크 이동>
function linkClickHandler() {
	
	var bid = $(this).siblings("input[type=hidden]").val();
	window.open('${pageContext.request.contextPath}/board/read.do?bid=' + bid); // 새 창에 열기
}

// <게시물 삭제>

// <삭제 방법 1> : html태그를 다 로딩한 후의 위치에 $("button.delete").on("click", deleteHandler); 작성
// -> 그 위치에 이 함수를 넣지 않고 그냥 <script>밑에 $("button.delete").on("click", function(){ 처럼 작성하면
// <script>태그는 위에서부터 쭉 실행되니까.. 윈도우가 완벽히 로드되기도 전에 click이벤트가 먼저 발생해서 해당  태그를 인식할 수 없음.
// 따라서 html태그들이 다 생성된 후의 위치에 click이벤트를 걸어줘야함!
function boardDeleteHandler() {
	
	var bid = $(this).siblings("input[type=hidden]").val();
	console.log(bid);
	    
    $.ajax({
   		url : "boarddelete",
   		type : "post",
   		data: { 'bid' : bid },
   		success: function(data){
   			if(data == 1) {
				alert("게시물 삭제 성공");
			} else {
				alert("게시물 삭제 실패");
			}
   			getData();
		 }
   	});  
}
// <삭제 방법 2> : 태그에 직접 onclick='boardDelete(this)' 속성 부여
function boardDelete(thisEle){
	
	var bid = $(thisEle).siblings("input[type=hidden]").val();
	console.log(bid);
	    
    $.ajax({
   		url : "boarddelete",
   		type : "post",
   		data: { 'bid' : bid },
   		success: function(data){
   			if(data == 1) {
				alert("게시물 삭제 성공");
			} else {
				alert("게시물 삭제 실패");
			}
   			getData();
		 }
   	});  
}
</script>

</html>
