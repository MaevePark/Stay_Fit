<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/boardlist.css" type="text/css">
    
				<div class="col-lg-2 col-md-5" >  <!--style직접 확정 후 삭제  -->
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__item">
                            <h4>Categories</h4>
                            <ul>
                            	<li><a href="<%=request.getContextPath()%>/board/list?bcid=0">공지사항</a></li>
                                <li><a href="<%=request.getContextPath()%>/board/list?bcid=1">식단</a></li>
                                <li><a href="<%=request.getContextPath()%>/board/list?bcid=2">팁&노하우</a></li>
                                <li><a href="<%=request.getContextPath()%>/board/list?bcid=3">고민&질문</a></li>
                            </ul>
                        </div>
                    </div>
                </div>