<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/boardread.css"
	type="text/css">
	<!-- jquery/bootstrap -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
					<form action="<%=request.getContextPath()%>/board/write" method="post">
					<div class="">
								<select name="bcid" id="bcid">
									<option value="" selected>카테고리 선택</option>
									<option value="1">식단</option>
									<option value="2">팁&노하우</option>
									<option value="3">고민&질문</option>
								</select>
							</div>
					<div class="form-group ">
						 <input id="btitle" name="btitle" class="form-control" placeholder="제목을 입력하세요" required="required">
					</div>
					 <div class="form-group">
					 <input id="mid" name="mid" placeholder="아이디를 입력하세요"/> <!-- 삭제예정  -->
						<textarea id="summernote" name="bcontent"></textarea>
					</div> 
					
					<div class="button_parent">
					<button type="submit" class="site-btn btn-submit" >등록</button>
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

</script>
<!-- Blog Section End -->