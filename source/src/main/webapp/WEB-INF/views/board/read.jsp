<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--index로 이동함 삭제예정  -->
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/boardread.css" type="text/css">  --%>
<!--  <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>  -->
<!-- 여기까지 삭제  -->

<!-- 게시판 상세페이지 -->
<section class="blog spad">
	<div class="container">
		<div class="row">
			<!-- 게시판 카테고리 첨부-->
			<jsp:include page="/WEB-INF/views/board/boardcategory.jsp"></jsp:include>
			<!-- 게시판 카테고리 첨부 끝 -->
			<div class="col-lg-10 col-md-10">
				<div class="row">
					<!-- 글검색인데 삭제예정  -->
					<div class="hero__search__form">
						<form action="#">
							<div class="hero__search__categories">
								<select name="">
									<option value="1" selected>카테고리 전체</option>
									<option value="2">식단</option>
									<option value="3">팁&노하우</option>
									<option value="4">고민&질문</option>
								</select>
							</div>
							<div class="hero__search__categories">
								<select name="search">
									<option value="1" selected>전체</option>
									<option value="2">작성자</option>
									<option value="3">제목</option>
								</select>
							</div>
							<input type="text" placeholder="검색어를 입력해주세요.">
							<button type="submit" class="site-btn">SEARCH</button>
						</form>
					</div>
					<!-- 글검색인데 삭제예정  여기까지-->
					<!-- 게시글  -->
					<table id="readContent">
						<tr>
							<td>${read.btitle}</td>
							<td>${read.bviewcount}</td>
						</tr>
						<tr>
							<td>${read.mname}</td>
							<td><fmt:formatDate pattern="YY/MM/dd"
									value="${read.bcreate}" /></td>
						</tr>

						<!-- 컨텐츠  -->
						<tr>
							<td colspan="2" style="min-width: 500px">
								<p>${read.bcontent}</p>
							</td>
						</tr>
					</table>
					<!-- 게시글 끝  -->
					<!-- 게시글 이모티콘 -->
					<div class="container" id="emotion">
						<form>
							<div id="emote" class="row">
								<label for="0" class="col text-center"> <input
									type="radio" id="0" name="emotion" value="0">
									<p>감사해요</p>
								</label> <label for="1" class="col text-center"> <input
									type="radio" id="1" name="emotion" value="1">
									<p>응원해요</p>
								</label> <label for="2" class="col text-center"> <input
									type="radio" id="2" name="emotion" value="2">
									<p>궁금해요</p>
								</label> <label for="3" class="col text-center"> <input
									type="radio" id="3" name="emotion" value="3">
									<p>대단해요</p>
								</label> <label for="4" class="col text-center"> <input
									type="radio" id="4" name="emotion" value="4">
									<p>멋있어요</p>
								</label>
							</div>
						</form>
					</div>
					<!-- 게시글 이모티콘 끝-->


					<!-- 수정, 삭제, 목록 버튼 -->
					<div id="button_parent">
						<!-- 수정, 삭제 버튼은 본인이 작성한 글일때만 출력. -->
						<c:if test="${writer == read.mid }">
							<form>
								<button type="button" class="site-btn" id="btn-upd"
									onclick="location.href='update?bid=${read.bid}'">수정</button>
								<button type="button" class="site-btn" id="btn-del"
									onclick="del(${read.bid})">삭제</button>
							</form>
						</c:if>
						<button type="button" class="site-btn"
							onclick="location.href='list?bcid=${read.bcid}'">목록</button>
					</div>
					<!-- 수정, 삭제, 목록 버튼 여기까지  -->


					<!-- 북마크 보류-->
					<!-- <label for="bookmark"> <input type="radio" id="bookmark"
						name="" value="5">
						<p>북마크</p>
					</label> -->
					<!-- 북마크 여기까지  -->

					<!-- 댓글 -->
					<div id="replyArea">
						<!--댓글 리스트  -->
						<table id="readReply">
							<c:choose>
								<c:when test="${empty reply }">
									<tr>
										<td colspan="5" align="center">작성된 댓글이 없습니다</td>
									</tr>
								</c:when>
								<c:when test="${!empty reply}">
									<c:forEach var="repl" items="${reply}">
										<tr>
											<td style="width:400px">  <!-- overflow: hidden때문에 임시부여 수정예정 -->
												<div class="blog__sidebar__recent__item__pic">
													<img id="profimg" src="${repl.profimg }" />
												</div>
												<div class="blog__sidebar__recent__item__text">
													<span>${repl.mname }</span>
													<%-- <div id="old-reply" style="dispay:none;">${repl.rcontent }
													</div> --%>
													<div class ="reply-form">
														<!--기존 댓글 정보  -->
														<div id="old-reply" class="old-reply">
															<c:out value="${repl.rcontent }"/>
														</div>
														<!--댓글 수정 폼  -->
														<div id="comment-form" class="comment-form" style="display: none;" >
															<input type="text" id="comment-input" class="comment-input">
															<div class="container">
															<button id="submit-button" class="modify-rid btn btn-primary btn-sm btn-light" value="${repl.rid }">등록</button>
															<button id="cancel-button" class="btn btn-primary btn-sm btn-light">취소</button>
															</div>
														</div>
														<c:if test="${repl.mid == writer }">
														<div class="container">
															
															<!-- <button id="modify-button" onclick="showForm()" class="btn btn-sm btn-modify">수정</button> -->
															<button id="modi-reply" class="btn btn-sm btn-modify" value="${repl.rid }">수정</button>
															<button id="del-reply"type="button" onclick="rdel(${repl.rid})" class="btn btn-sm btn-del">삭제</button>
															<button id="repl-repl"type="button" class="btn btn-primary btn-sm btn-light">답글</button>
														</div>
												</c:if> 
												<c:if test="${repl.mid != writer }">
													<div class="container">
														<button class="btn btn-primary btn-sm btn-light like-button" value="${repl.rid }">공감</button>
														<button type="button" class="btn btn-primary btn-sm btn-light">신고</button>
														<button type="button" class="btn btn-primary btn-sm btn-light">답글</button>
													</div>
												</c:if>
													</div>
												</div>
											</td>
											<td></td>
											<td><fmt:formatDate pattern="YY/MM/dd HH:MM"
													value="${repl.rcreate}" /></td>
											<%-- <td>
											<c:if test="${repl.mid == writer }">
													<div class="container">
														
														<!-- <button id="modify-button" onclick="showForm()" class="btn btn-sm btn-modify">수정</button> -->
														<button id="modify-button" class="btn btn-sm btn-modify">수정</button>
														<button type="button" onclick="rdel(${repl.rid})" class="btn btn-sm btn-del">삭제</button>
														<button type="button" class="btn btn-primary btn-sm btn-light">답글</button>
													</div>
												</c:if> 
												<c:if test="${repl.mid != writer }">
													<div class="container">
														<button type="button" class="btn btn-primary btn-sm btn-light">공감</button>
														<button type="button" class="btn btn-primary btn-sm btn-light">신고</button>
														<button type="button" class="btn btn-primary btn-sm btn-light">답글</button>
													</div>
												</c:if>
											</td> --%>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
							<td></td>
							<td></td>
							<td></td>
						</table>
						<!-- 댓글 리스트  끝 -->

						<!-- 댓글 작성  -->
						<div class="hero__search__form">
							<form>
								<input type="hidden" id="mid" name="mid" value="${writer }">
								<input type="hidden" id="bid" name="bid" value="${read.bid }">
								<input type="text" name="rcontent" id="rcontent"
									placeholder="댓글을 작성해주세요">
								<button type="submit" id="rep_write" onclick="rep_btn()"
									class="site-btn">댓글 등록</button>
							</form>
						</div>
						<!-- 댓글 작성 끝  -->
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<script>
//게시글 삭제
function del(bid){
	var check = confirm("게시글을 삭제하겠습니까?");
	
	if(check==true){
		$.ajax({
			type : "POST",
			url : "delete",
			data : {"bid" : bid},
			dataType : "Json",
		}).done(function(){
			alert("게시글 삭제 성공");
			location.href = "list?bcid=${read.bcid}"
		}).fail(function(error){
			alert("게시글을 삭제할 수 없습니다. 다시 시도해주세요.");
			console.log(error);
		});
	}else{
		alert("취소하였습니다.");
	}	
}

//댓글 작성
 function rep_btn(){
	var rcontent = $("#rcontent").val();
	var bid = ${read.bid};
	var mid = ${writer}; 
	
	var reply = {
			"rcontent" : rcontent,
			"bid" : bid,
			"mid" : mid
	};
	
	$.ajax({
		type : "POST",
		url : "replywrite",
		data : JSON.stringify(reply),
		contentType : "application/json",
		dataType : "Json",
	}).done(function(re){
		alert("댓글이 작성되었습니다");
		location.reload();
	}).fail(function(err){
		alert("댓글을 작성할 수 없습니다. 다시 시도해주세요.");
		console.log(error);
	});
	
} 

//수정화면
$(document).on('click','#modi-reply',function(){
	var $reply = $(this).parents('.reply-form');     //reply에 기존댓글 + 수정폼 담기 (현재수정중인 댓글)
	var content = $reply.find('.old-reply').html().trim();	//content에 공백 없애고 내용담기
	var $editForm = $reply.find('.comment-form');	//editForm에 수정폼 담기
	var $commentInput = $editForm.find('.comment-input');	//commentInput에 기존댓글내용 담기
	
	$commentInput.val(content);  //commentInput에 수정된 댓글내용담기
	$reply.addClass('editing');  //현재수정중 구분용 editing추가
	$reply.find('.old-reply, #modi-reply, #del-reply, #repl-repl').hide();  //수정하기버튼과 기존댓글 숨기기 
	$editForm.show(); //수정폼 보이게하기 
	
	 $commentInput.focus();
	
	 console.log(content);
});
//취소버튼 클릭시 기존화면으로 
$(document).on('click', '#cancel-button', function() {
	var $reply = $(this).closest('.reply-form');
	$reply.removeClass('editing');
	$reply.find('.old-reply, #modi-reply, #del-reply, #repl-repl').show();
	$reply.find('.comment-form').hide();
	});
	
//등록버튼
//수정데이터 넘기기 	
$(document).on('click', '#submit-button', function() {
	var $reply = $(this).closest('.reply-form');
	var $editInput = $reply.find('.comment-input');
	var content = $editInput.val().trim();
	var rid = $reply.find('.modify-rid').val();
	
	var vo ={rid : rid , rcontent : content};
	
	if (!content) {
	   alert('내용을 입력해주세요.');
	   return;
	 }
	$.ajax({
		type: 'POST',  
		url: 'replyupdate',
		dataType : 'json',
		contentType : 'application/json',
		data : JSON.stringify(vo),
		success: function(response) {
		  console.log(response);
		  location.reload();     
		},
		error: function(xhr, status, error) {
		  console.error(error);
		}
		});
	});

//댓글 삭제
function rdel(rid){
	var check = confirm("댓글을 삭제하겠습니까?");
	
	if(check==true){
		$.ajax({
			type : "POST",
			url : "replydelete",
			data : {"rid" : rid},
			dataType : "Json",
		}).done(function(){
			alert("댓글을 삭제하였습니다.");
			location.reload();
		}).fail(function(error){
			alert("댓글을 삭제할 수 없습니다. 다시 시도해주세요.");
			console.log(error);
		});
	}else{
		alert("취소하였습니다.");
	}	
}

//댓글 공감
$(document).ready(function() {
    // 버튼 클릭 이벤트 처리
    $(document).on('click', '.like-button', function() {
        var rid = $(this).val(); // 댓글 번호
        var btn = $(this); // 버튼
		
        console.log(rid);
        
        // Ajax 요청
        $.ajax({
            type: 'POST',
            url: 'like',
            data : {rid:rid},
            success: function(data) {
            	console.log('Ajax response:', data)
                if (data.result == 'success') {
                    if (data.action == 'like') {
                        btn.addClass('active');
                    } else if (data.action == 'unlike') {
                        btn.removeClass('active');
                    }
                }
            },
            error: function(xhr, status, error){
            	console.log('Ajax error:', error)
            }
        });
    });
});
</script>