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
						<form action="#">
							<div class="">
								<select name="">
									<option value="1" selected>카테고리 선택</option>
									<option value="2">식단</option>
									<option value="3">팁&노하우</option>
									<option value="4">고민&질문</option>
								</select>
							</div>
						</form>
					</div>

					<div class="form-group ">
						<input type="text" name="title" class="form-control"
							placeholder="enter title" required="required">
					</div>
					<div class="form-group">
						<textarea id="summernote" class="form-control" rows="15" cols="65"
							name="content"></textarea>
					</div>
					<div class="button_parent">
					<button type="submit" class="site-btn">등록</button>
					<button type="submit" class="site-btn">미리보기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#summernote').summernote({
			lang: 'ko-KR',
			height: 400
		});

</script>
</section>
<!-- Blog Section End -->