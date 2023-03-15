<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 게시판 상세페이지 -->
<section class="blog spad">
	<div class="container">
		<div class="row">
			<!-- 게시판 카테고리 첨부-->
			<jsp:include page="/WEB-INF/views/board/boardcategory.jsp"></jsp:include>
			<!-- 게시판 카테고리 첨부 끝 -->
			<div class="col-lg-10 col-md-10">
				<%-- <div>
					<button type="button" id="list_btn"
						onclick="location.href='list?bcid=${read.bcid}'">목록</button>
				</div> --%>
				<div class=""
					style="border: 1px solid #ebecef; border-radius: 6px; padding: 29px 29px 0;">
					<!-- 게시글  -->
					<table id="readContent">
						<tr>
							<td><h3>${read.btitle}</h3></td>
							<td>${read.bviewcount}</td>
						</tr>
						<tr>
							<td><img id="profimg" src="${read.profimg }" />${read.mname}</td>
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

					<!-- 북마크 & 댓글 카운트 -->
					<!-- 북마크  -->
					<div class="container mt-3">
						<div class="d-flex">
							<div class="reply-img">
								<img class="balloon-img"
									src="<%=request.getContextPath()%>/resources/img/board-read/balloon.png"
									alt="balloon">
							</div>
							<div class="count p-2">${rCnt}</div>
							<div class="book-img">
								<button class="bookmark" value="${read.bid}">
									<img class="default-img"
										src="<%=request.getContextPath()%>/resources/img/board-read/delbook.png"
										alt="default-book"> <img class="active-img"
										src="<%=request.getContextPath()%>/resources/img/board-read/bookmark.png"
										alt="bookmark">
								</button>
							</div>
							<div class="book-msg img-text">북마크</div>
						</div>
					</div>
					<!-- 북마크 & 댓글 카운트 끝  -->

					<!-- 댓글 -->
					<div id="replyArea">
						<div style="margin-left: 5px;">
							<h5>댓글</h5>
						</div>
						<!--댓글 리스트  -->
						<c:choose>
							<c:when test="${empty reply }">
								<ul id="readReply">
									<li class="no-rep-wrap">
										<div class="no-reply">작성된 댓글이 없습니다</div>
									</li>
								</ul>
							</c:when>
							<c:when test="${!empty reply}">
								<c:forEach var="repl" items="${reply}">
									<div id="readReply" class="child${repl.rcase }">
										<ul>
											<li id="eachreply">
												<div class="reply-image">
													<img id="profimg" src="${repl.profimg }" />
												</div>
												<div class="reply-inbox">
													<div class="reply-info d-flex justify-content-between">
														<div>
															<strong>${repl.mname }</strong> <span><fmt:formatDate
																	pattern="YY/MM/dd HH:MM" value="${repl.rcreate}" /></span>
														</div>
														<!-- 공감, 신고 버튼 -->
														<div class="d-flex flex-row">
															<c:if test="${repl.mid != writer }">
																<button class="like-button" value="${repl.rid }">
																	<img class="unlike-img"
																		src="<%=request.getContextPath()%>/resources/img/board-read/unlike.png"
																		alt="unlike-img"> <img class="like-img"
																		src="<%=request.getContextPath()%>/resources/img/board-read/like.png"
																		alt="like-img">
																</button>
																<button type="button" class="report-button" onclick="openModal('${repl.mname}', '${repl.rid}')" data-toggle="modal" data-target="#myModal">
																	<img class="report-img"
																		src="<%=request.getContextPath()%>/resources/img/board-read/siren.png"
																		alt="siren-img">
																</button>
																<!-- The Modal -->
																<div class="modal fade" id="myModal">
																	<div class="modal-dialog modal-dialog-centered">
																		<div class="modal-content">

																			<!-- Modal Header -->
																			<div class="modal-header">
																				 <h4 id="modal-title" class="modal-title">님을 신고합니다</h4>
																				<button type="button" class="close"
																					data-dismiss="modal">×</button>
																			</div>

																			<!-- Modal body -->
																			<form>
																				<div class="modal-body" id="report" >
																					<input type="hidden" name="rid" value="rid">
																					<input type="radio" id="0" name="report" value="0">
																					<label for="0" class="text-center">광고/상업성
																						댓글</label> <br> <input type="radio" id="1"
																						name="report" value="1"> <label for="1"
																						class="text-center">비방/욕설 댓글</label> <br> <input
																						type="radio" id="2" name="report" value="2">
																					<label for="2" class="text-center">개인정보 유출
																						댓글</label> <br> <input type="radio" id="3"
																						name="report" value="3"> <label for="3"
																						class="text-center">청소년 유해 댓글</label> <br> <input
																						type="radio" id="4" name="report" value="4">
																					<label for="4" class="text-center">명예훼손/저작권
																						침해 댓글</label> <br> <input type="radio" id="5"
																						name="report" value="4"> <label for="5"
																						class="text-center">도배성 댓글</label><br> <input
																						type="radio" id="6" name="emotion" value="4">
																					<label for="6" class="text-center">불명확/추측성
																						댓글</label>
																				</div>
																			</form>

																			<!-- Modal footer -->
																			<div class="modal-footer">
																				<button type="button" class="btn btn-danger"
																					data-dismiss="modal">신고</button>
																				<button type="button" class="btn btn-secondary"
																					data-dismiss="modal">취소</button>
																			</div>

																		</div>
																	</div>
																</div>


															</c:if>
														</div>
														<!-- 공감, 신고 버튼 끝 -->
													</div>
													<div class="reply-form">
														<!-- 기존 댓글 정보  -->
														<div id="old-reply" class="old-reply">
															<c:out value="${repl.rcontent }" />
														</div>
														<!-- 기존 댓글 정보  끝-->

														<!-- 댓글 수정 폼  -->
														<div id="comment-form" class="comment-form"
															style="display: none;">
															<input type="text" id="comment-input"
																class="comment-input">
															<div class="container">
																<button id="submit-button"
																	class="modify-rid btn btn-primary btn-sm btn-light"
																	value="${repl.rid }">등록</button>
																<button id="cancel-button"
																	class="btn btn-primary btn-sm btn-light">취소</button>
															</div>
														</div>
														<!-- 댓글 수정 폼  끝-->

														<!-- 댓글  버튼변화-->
														<div class="container">
															<c:if test="${repl.mid == writer }">
																<button id="modi-reply" class="btn btn-sm btn-modify"
																	value="${repl.rid }">수정</button>
																<button id="del-reply" type="button"
																	onclick="rdel(${repl.rid})" class="btn btn-sm btn-del">삭제</button>
															</c:if>

															<button id="child-reply"
																class="btn btn-primary btn-sm btn-light"
																value="${repl.rid}">답글</button>
														</div>
														<!-- 댓글  버튼변화 끝-->

														<!-- 답댓글 작성  -->
														<div id="child-form-${repl.rid }"
															class="write_reply_form child-form"
															style="margin: 12px 0 29px; display: none;">
															<div class="reply-inbox">
																<strong class="writer-name">${loginuser}</strong> <input
																	type="hidden" id="rseq" value="${repl.rseq }">
																<textarea name="ccontent" id="ccontent" rows="3"
																	placeholder="${repl.mname }에게 답글을  작성해주세요"></textarea>
																<div>
																	<div style="margin-bottom: 10px;">
																		<button type="submit" id="child_reg"
																			value="${repl.rid }">등록</button>
																		<button type="submit" class="child_del"
																			value="${repl.rid}">취소</button>
																	</div>
																</div>
															</div>
														</div>
														<!-- 답댓글 작성  끝-->
													</div>
												</div>
											</li>
										</ul>
									</div>

								</c:forEach>
							</c:when>
						</c:choose>
						<!-- 댓글 리스트  끝 -->

					</div>
					<div
						style="margin-top: 12px; margin-bottom: 17px; border-top: 2px solid #ebecef; height: auto;">
					</div>
					<!-- 댓글작성 시작  -->
					<div class="write_reply_form" style="margin: 12px 0 29px;">
						<div class="reply-inbox">
							<strong class="writer-name">${loginuser}</strong>
							<textarea name="rcontent" id="rcontent" rows="3"
								placeholder="댓글을  작성해주세요"></textarea>
								<div style="margin-bottom: 10px;">
									<button type="submit" id="rep_write" onclick="rep_btn()">등록</button>
								</div>
							<div>
							</div>
						</div>
					</div>

					<!-- 댓글 작성 끝  -->
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


//부모 댓글 작성
 function rep_btn(){
	var mid = ${writer}; 
	
	var bid = ${read.bid};
	var rcontent = $("#rcontent").val();
	if (!rcontent) {
		   alert('내용을 입력해주세요.');
		   return;
		 }
	
	
	var reply = {
			"rcontent" : rcontent,
			"bid" : bid,
			"mid" : mid
	};
	console.log(reply);
	
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


//답글 화면
// 답글 버튼 클릭 시

 $(document).ready(function(){
	  $(".reply-form").on("click", "#child-reply", function(){
		  var rid = $(this).val();
	    // 열려있는 모든 child-form을 닫습니다.
	    $(".child-form").hide();
		  console.log(rid);
		  $("#child-form-"+rid).show();
	  });

	  $(".reply-form").on("click", ".child_del", function(){
		  var rid = $(this).val();
	    $("#child-form-"+rid).hide();
	  });
	}); 
	
//답글 작성 
 $(document).on('click', '#child_reg', function() {
	var bid = ${read.bid};
	var mid = ${writer}; 
	var rid= $(this).val();
	var $reply = $(this).parents('#child-form-'+ rid);
	var rseq = $reply.find('#rseq').val();
	var rcontent = $reply.find('#ccontent').val();
	
	console.log(bid,mid,rcontent,rseq);
	
	if (rcontent == '') {
	    alert('내용을 입력해주세요.');
	    return;
	}
	
	var child = {
			"rcontent" : rcontent,
			"bid" : bid,
			"mid" : mid,
			"rseq" : rseq,
	};
	
	$.ajax({
		type: "POST",  
		url: "childwrite",
		dataType : "Json",
		contentType : 'application/json',
		data : JSON.stringify(child),
		success: function(response) {
			alert('댓글이 등록되었습니다.');
		  	console.log(response);
		 	location.reload();     
		},
		error: function(xhr, status, error) {
		  	console.error(error);
		  	alert('댓글 등록에 실패하였습니다. 다시 시도해주세요.');
		}
		});
	});



//수정화면
$(document).on('click','#modi-reply',function(){
	var $reply = $(this).parents('.reply-form');     //reply에 기존댓글 + 수정폼 담기 (현재수정중인 댓글)
	var content = $reply.find('.old-reply').html().trim();	//content에 공백 없애고 내용담기
	var $editForm = $reply.find('.comment-form');	//editForm에 수정폼 담기
	var $commentInput = $editForm.find('.comment-input');	//commentInput에 기존댓글내용 담기
	
	$commentInput.val(content);  //commentInput에 수정된 댓글내용담기
	$reply.addClass('editing');  //현재수정중 구분용 editing추가
	$reply.find('.old-reply, #modi-reply, #del-reply, #child-reply').hide();  //수정하기버튼과 기존댓글 숨기기 
	$editForm.show(); //수정폼 보이게하기 
	
	 $commentInput.focus();
	
	 console.log(content);
});
//취소버튼 클릭시 기존화면으로 
$(document).on('click', '#cancel-button', function() {
	var $reply = $(this).closest('.reply-form');
	$reply.removeClass('editing');
	$reply.find('.old-reply, #modi-reply, #del-reply, #child-reply').show();
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
$(document).ready(function(){
	$(document).on('click','.like-button',function(){
		var rid = $(this).val(); //변수 rid에 클릭한 버튼의 value 담기(댓글 번호)
		var btn = $(this); //활성화 여부(active) 추가를 위한 변수
		var isLiked = localStorage.getItem('like-' + rid); //버튼의 활성화 여부 체크
		
		console.log(rid, isLiked);
		
		$.ajax({
			type : 'POST',
			url : 'like',
			data : {rid : rid},
			success : function(data){
				if(data.result == 'success'){
					if(data.action == 'like'){
						btn.addClass('active');
						localStorage.setItem('like-' + rid, 'true'); //페이지 이동해도 활성화 상태 변화 없도록 저장
					}else if(data.action == 'unlike'){
						btn.removeClass('active');
						localStorage.removeItem('like-' + rid); //버튼상태 삭제
					}
				}
			},
			error: function(xhr,status, error){
				console.log('ajax!!:', error)
			}
		});
	});
	
	//페이지 리로드시 버튼 상태 복원
	$('.like-button').each(function(){
		var rid = $(this).val();
		var isLiked = localStorage.getItem('like-' + rid);
		
		if(isLiked == 'true'){
			$(this).addClass('active');
		}
	});
});

//댓글 신고
//모달창 데이터 전달
	function openModal(mname, rid) {
	    var modalTitle = document.getElementById("modal-title");
	    modalTitle.innerHTML = mname + "님을 신고합니다";
 
	    var data = { "rid": rid };
	    $('#myModal #report input[name="rid"]').val(data.rid);

	    $('#myModal').modal('show');
	}

//모달창 신고 클릭 
$(document).ready(function() {
    $('#myModal .modal-footer .btn-danger').click(function() {
        var selectedValue = $('input[name="report"]:checked').val();

     
        var data = {
            "mid": <%= session.getAttribute("mid") %>,
            "rid": $('input[name="rid"]').val(),
            "repid": selectedValue
        };

        console.log(data);
        $.ajax({
            type: "POST",
            url: "replyreport",
            data: data,
            success: function(result) {
                alert("신고 접수 되었습니다.");
            },
            error: function(xhr, status, error) {
                alert("신고에 실패하였습니다.");
            }
        });
    });
});

//북마크
$(document).ready(function(){
	$(document).on('click','.bookmark',function(){
		var bid = $(this).val(); 
		var btn = $(this); 
		var isBookmarked = localStorage.getItem('bookmark-' + bid); 
		
		console.log(bid, isBookmarked);
		
		$.ajax({
			type : 'POST',
			url : 'book',
			data : {bid : bid},
			success : function(data){
				if(data.result == 'success'){
					if(data.action == 'book'){
						btn.addClass('active');
						localStorage.setItem('bookmark-' + bid, 'true'); 
					}else if(data.action == 'delbook'){
						btn.removeClass('active');
						localStorage.removeItem('bookmark-' + bid); 
					}
				}
			},
			error: function(xhr,status, error){
				console.log('ajax!!:', error)
			}
		});
	});
	
	//페이지 리로드시 버튼 상태 복원
	$('.bookmark').each(function(){
		var bid = $(this).val();
		var isBookmarked = localStorage.getItem('bookmark-' + bid);
		
		if(isBookmarked == 'true'){
			$(this).addClass('active');
		}
	});
});
//textarea자동 높이 조절
function adjustHeight() {

	var textEle = $('textarea');

	textEle[0].style.height = 'auto';

	var textEleHeight = textEle.prop('scrollHeight');

	textEle.css('height', textEleHeight);

	};
</script>