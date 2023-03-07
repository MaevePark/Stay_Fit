<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/boardread.css"
	type="text/css">
	<!-- jquery/bootstrap -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!--  summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> 

<!-- Blog Section Begin -->
<section class="blog spad">
	<div class="container">
		<div class="row">
			<!-- 게시판 카테고리 -->
			<jsp:include page="/WEB-INF/views/board/boardcategory.jsp"></jsp:include>
			<div class="col-lg-8 col-md-7">
				<div class="row">

					<div class="" style="width:"30%"; margin-bottom: 15px;">
						
					</div>
					<form id="updateboard" name="updateboard" action="">
					<div class="">
								<select name="bcid" id="bcid"  >
									<option value="" selected>${board.bcname }</option>
									<c:if test="${board.bcid == 1 }">
										<option value="2">팁&노하우</option>
										<option value="3">고민&질문</option>
									</c:if>
									<c:if test="${board.bcid == 2 }">
										<option value="1">식단</option>
										<option value="3">고민&질문</option>
									</c:if>
									<c:if test="${board.bcid == 3 }">
										<option value="1">식단</option>
										<option value="2">팁&노하우</option>
									</c:if>
								</select>
							</div>
					<div class="form-group ">
						<input type="hidden" id="bid" name="bid" value="${board.bid }"/>
						 <input id="btitle" name="btitle" class="form-control" placeholder="제목을 입력하세요" value="${board.btitle }" required="required"/>
					 	 <input id="mid" name="mid" placeholder="아이디를 입력하세요" value=${board.mid }/> <!-- 삭제예정  -->
					</div>
					 <div class="form-group">
						<textarea id="summernote" name="bcontent">${board.bcontent }</textarea>
					</div> 
					
					<div class="button_parent">
					<button type="submit" class="site-btn btn-submit" onclick="save()">수정</button>
					<button type="button" class="site-btn btn-list" onclick="location.href='list">목록으로</button>
					<button type="button" class="site-btn btn-preview">미리보기</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	
		  $('#summernote').summernote({
			lang: 'ko-KR',
			height: 400,
			focus : true	
		});
		  
		  var save = function() {
			  var markup = $('#updateboard').summernote('code');
			  $('#bcontent').summernote('destroy');
			  $('#board.btitle').summernote('destroy');
			};

		  function update(bid){
				var check = confirm("게시글을 수정하시겠습니까?");
				if(check==true){
					$.ajax({
						type : "POST",
						url : "update",
						data: {"bid" : bid, "bcid" : bcid, "bcontent" : bcontent , "btitle" : btitle},
						contentType: "application/json; charset=UTF-8",
						dataType : "Json"
					}).done(function(){
						alert("게시글 수정 성공");
						location.href = "list?bid=${board.bid}"
					}).fail(function(error){
						alert("게시글을 수정할 수 없습니다. 다시 시도해주세요.");
						console.log(error);
					});
				}else{
					alert("취소하였습니다.");
				}	
			}		
</script>
<!-- Blog Section End -->