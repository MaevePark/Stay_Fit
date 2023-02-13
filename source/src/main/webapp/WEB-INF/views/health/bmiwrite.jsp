<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bmiwrite.css"
	type="text/css">


<!-- Blog Section Begin -->
<section class="blog spad">
	<div class="container">
		<div class="row">
			<!-- 건강관리 페이지 카테고리 -->
			<jsp:include page="/WEB-INF/views/health/healthcategory.jsp"></jsp:include>

			<div class="col-lg-8 col-md-7">
				<div class="row">

					<h4 class="fw-bold py-3 mb-4">
						<span class="text-muted fw-light">건강관리 /</span> BMI 지수 확인
					</h4>
					<!-- BMI 지수 입력 시작  -->
					<form class="form-floating" action="<%=request.getContextPath()%>/health/bmilist">
						<table class="table table-bordered">
							<colgroup>
								<col style="width: 150px">
								<col style="width: 650px">
							</colgroup>
							<tbody>
								<tr>
									<th>성별</th>
									<td><input type="radio" class="radio" id="sex" name="sex"
										value="F" checked=""><label class="pre" for="female">
											여자 </label> <input type="radio" class="radio" id="sex" name="sex"
										value="M"><label class="pre" for="male"> 남자</label></td>
								</tr>
								<tr>
									<th>연령</th>
									<td>
										<div class="date-wrap clfix">
											<input type="text" class="ipt2" style="width: 95px"
												id="byear" name="byear"
												onkeydown="this.value=this.value.replace(/[^0-9]/g,'')"
												onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
												onblur="this.value=this.value.replace(/[^0-9]/g,'')"
												maxlength="4"><span class="dash"> 년 </span>

											<div class="hero__search__categories">
												<select class="select4" id="bmonth" name="bmonth">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
												</select>
											</div>
											<span class="dash"> 월</span>

											<div class="hero__search__categories">
												<select class="select4" id="bmonth" name="bmonth">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
													<option value="23">23</option>
													<option value="24">24</option>
													<option value="25">25</option>
													<option value="26">26</option>
													<option value="27">27</option>
													<option value="28">28</option>
													<option value="29">29</option>
													<option value="30">30</option>
													<option value="31">31</option>
												</select>
											</div>
										</div> <span class="dash"> 일</span>
										</div>
									</td>
								</tr>
								<tr>
									<th>키</th>
									<td><input type="text" class="ipt2" style="width: 95px"
										id="stature" name="stature" maxlength="3"
										onkeydown="this.value=this.value.replace(/[^0-9]/g,'')"
										onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
										onblur="this.value=this.value.replace(/[^0-9]/g,'')"><span
										class="checkout__input"> cm</span></td>
								</tr>
								<tr>
									<th>몸무게</th>
									<td><input type="text" class="ipt2" style="width: 95px"
										id="weight" name="weight" maxlength="3"
										onkeydown="this.value=this.value.replace(/[^0-9]/g,'')"
										onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
										onblur="this.value=this.value.replace(/[^0-9]/g,'')"><span
										class="dash"> kg</span></td>
								</tr>
							</tbody>
						</table>
						<!-- 확인 버튼 시작 -->
						<div class="col-lg-12 text-center">
							<a href="javascript:;" class="site-btn" onclick="bmi_view();">확인</a>	
						</div>
						<!-- 확인 버튼 끝 -->
					</form>
					<!-- BMI 지수 입력 끝 -->
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Blog Section End -->
<script>
//<--------------------------------------------------------------------
//1. bmi 페이지 입력값 없을 시 alert 창 띄우기  시작 
function bmi_view() {
	if ($("#byear").val().replace(/(^\s*)|(\s*$)/g, "") == '') {
		alert("태어난 년도를 입력해주세요.");
		$("#byear").val("");
		$("#byear").focus();
		return;
	}

	if ($("#bmonth").val().replace(/(^\s*)|(\s*$)/g, "") == '') {
		alert("태어난 월을 입력해주세요.");
		$("#bmonth").val("");
		$("#bmonth").focus();
		return;
	}

	if ($("#bday").val().replace(/(^\s*)|(\s*$)/g, "") == '') {
		alert("태어난 일을 입력해주세요.");
		$("#bday").val("");
		$("#bday").focus();
		return;
	}

	if ($("#stature").val().replace(/(^\s*)|(\s*$)/g, "") == '') {
		alert("키를 입력해주세요.");
		$("#stature").val("");
		$("#stature").focus();
		return;
	}

	if ($("#weight").val().replace(/(^\s*)|(\s*$)/g, "") == '') {
		alert("몸무게를 입력해주세요.");
		$("#weight").val("");
		$("#weight").focus();
		return;
	}

	var frm = document.frm;
	frm.action = ""
	frm.submit();
}
//1. bmi 페이지 입력값 없을 시 alert 창 띄우기  끝
//-------------------------------------------------------------------->
</script>