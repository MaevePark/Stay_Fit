<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Blog Section Begin -->
<section class="blog spad">
	<div class="container">
		<div class="row">
			<!-- 건강관리 페이지 카테고리 -->
			<jsp:include page="/WEB-INF/views/health/healthcategory.jsp"></jsp:include>

			<div class="col-lg-8 col-md-7">
				<div class="row">

					<h4 class="fw-bold py-3 mb-4">
						<span class="text-muted fw-light">건강관리 /</span> 칼로리 처방 받기
					</h4>
					<!-- 칼로리 처방 입력 시작  -->
					<form id="frmCalories" class="form-floating" action="<%=request.getContextPath() %>/health/calorielist" method="post">
						<table class="table-health">
							<colgroup>
								<col style="width: 150px">
								<col style="width: 650px">
							</colgroup>
							<tbody>
								<tr>
									<th>성별</th>
									<td><input type="radio" class="radio" id="female" name="gender"
										value="F" ><label class="pre" for="female">
											여자 </label> <input type="radio" class="radio" id="male" name="gender"
										value="M" checked="checked"><label class="pre" for="male"> 남자</label></td>
								</tr>
								<tr>
									<th>키</th>
									<td><input type="text" class="ipt2" style="width: 95px"
									value="175"
										id="stature" name="stature" maxlength="3"
										onkeydown="this.value=this.value.replace(/[^0-9]/g,'')"
										onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
										onblur="this.value=this.value.replace(/[^0-9]/g,'')"><span
										class="checkout__input"> cm</span></td>
								</tr>
								<tr>
									<th>체중</th>
									<td><input type="text" class="ipt2" style="width: 95px"
									value="80"
										id="weight" name="weight" maxlength="3"
										onkeydown="this.value=this.value.replace(/[^0-9]/g,'')"
										onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
										onblur="this.value=this.value.replace(/[^0-9]/g,'')"><span
										class="dash"> kg</span></td>
								</tr>
								<tr>
									<th>목표 체중</th>
									<td><input type="text" class="ipt2" style="width: 95px"
									value="75"
										id="goal_weight" name="goal_weight" maxlength="3"
										onkeydown="this.value=this.value.replace(/[^0-9]/g,'')"
										onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
										onblur="this.value=this.value.replace(/[^0-9]/g,'')"><span
										class="dash"> kg</span></td>
								</tr>
								<tr>
									<th>연령</th>
									<td>
										<div class="date-wrap clfix">
											<!-- 생년월일 - 년도 시작 -->
											<input type="text" class="ipt2" style="width: 95px"
												id="byear" name="byear"
												value="2000"
												onkeydown="this.value=this.value.replace(/[^0-9]/g,'')"
												onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
												onblur="this.value=this.value.replace(/[^0-9]/g,'')"
												maxlength="4"><span class="dash"> 년 </span>
											<!-- 생년월일 - 년도 끝 -->	
											
											<!-- 생년월일 - 월 시작 -->
											<div class="hero__search__categories">
												<select class="select4" id="bmonth" name="bmonth">
													<option value="1" selected>1</option>
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
											<!-- 생년월일 - 월 끝 -->
											
											<!-- 생년월일 - 일 시작 -->
											<div class="hero__search__categories">
												<select class="select4" id="bday" name="bday">
													<option value="1"  selected>1</option>
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
										<!-- 생년월일 - 일 끝 -->
									</td>
								</tr>
								<tr>
									<th>체중 감량 기간</th>
									<td><input type="text" class="ipt2" style="width: 95px"
										id="goal_term" name="goal_term"
										value="2"
										onkeydown="this.value=this.value.replace(/[^0-9]/g,'')"
										onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"
										onblur="this.value=this.value.replace(/[^0-9]/g,'')">
										<input type="radio" class="radio" id="month"
										name="goal_term_type" value="M" checked=""><label
										class="pre" for="month"> 개월 </label> <input type="radio"
										class="radio" id="day" name="goal_term_type" value="D"><label
										class="pre" for="day"> 일</label></td>
								</tr>
								<tr>
									<!-- value 에 소수점 나누기 -->
									<th>평소 활동량</th>
									<td>
										<ul class="mt10-list">
											<li><input type="radio" class="radio" id="work01"
												name="active_mass" value="1.02" checked="checked"> <label
												for="work01">활동안함 <span class="p-gray">(운동을
														전혀 안 해요.)</span></label></li>
											<li><input type="radio" class="radio" id="work02"
												name="active_mass" value="1.375"> <label for="work02">가벼운
													활동 <span class="p-gray">(평소 가벼운 운동이나 스포츠를 즐겨요)</span>
											</label></li>
											<li><input type="radio" class="radio" id="work03"
												name="active_mass" value="1.555"> <label for="work03">보통
													활동 <span class="p-gray">(평소 적당한 운동이나 스포츠를 즐겨요.)</span>
											</label></li>
											<li><input type="radio" class="radio" id="work04"
												name="active_mass" value="1.725"> <label for="work04">많은
													활동 <span class="p-gray">(평소 강렬한 운동이나 스포츠를 즐겨요.)</span>
											</label></li>
											<li><input type="radio" class="radio" id="work05"
												name="active_mass" value="0.9"> <label for="work05">격심한
													활동 <span class="p-gray">(평소 매우 심한 운동을 하거나 육체를 쓰는
														직업이예요.)</span>
											</label></li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- 칼로리 처방 받기 버튼 시작 -->
						<div class="col-lg-12 text-center">
						<input type="hidden" name="age"> <!-- 나이 -->
						<input type="hidden" name="bmr"> <!-- 기초대사량 -->
						<input type="hidden" name="amr"> <!-- 활동대사량 -->
						<input type="hidden" name="digestionEnergy"> <!-- digestionEnergy -->
						<button type="button" class="site-btn" onclick="calCalorie();">칼로리 처방 받기</button>			
						</div>
						<!-- 칼로리 처방 받기 버튼 끝 -->
					</form>		
					<!-- 칼로리 처방 입력 끝 -->
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Blog Section End -->

<script>
//<--------------------------------------------------------------------
// 1. 기초대사량 계산식 시작
function calCalorie() {	
	
	// 기초대사량 해리스-베네딕트 방정식 기준
	// 여성의 BMR = 655 + (9.6 × 체중(kg)) + (1.8 × 신장(cm)) - (4.7 × 만 나이)
	// 남성의 BMR = 66 + (13.7 × 체중(kg)) + (5 × 신장(cm)) - (6.8 × 만 나이)
	
	var gender = $('input[name=gender]:checked').val(); // 성별
	
	var weight= $("#weight").val(); // 체중
	console.log("체중:" + weight);
	
    var height= $("#stature").val(); // 키(신장)
    console.log("키:" + height);
    
    // 만 나이 계산 공식 시작
    // 만나이 = (현재 연도 - 출생 연도) - 1 + ((현재 월, 일) >= (출생 월, 일))
    
    var byear = $("#byear").val(); // 출생 년도
	console.log("출생 년도:" + byear); 
	
    var bmonth = $("#bmonth").val(); // 출생 월
    console.log("출생 월:" + bmonth); 
    
    var bday = $("#bday").val(); // 출생 일
    console.log("출생 일:" + bday); 
    
    var today = new Date(); // 현재 날짜
    console.log("현재 날짜:" + today); 
    
    var birthday = new Date(byear + "-" + bmonth + "-" + bday); // 생년 월일
    console.log("생년 월일:" + birthday); 
    
    var age = today.getFullYear() - birthday.getFullYear(); // 만 나이 계산
    console.log("나이 계산:" + age); 
    
 	// 생일이 아직 오지 않은 경우 나이에서 1을 빼줌
    if (today.getMonth() < birthday.getMonth() || 
    	(today.getMonth() == birthday.getMonth() && today.getDate() < birthday.getDate())) {
    	  age--;
    	} 
 	
    $("[name=age]").val(age); // age 에 담기    

	// 만 나이 계산 공식 끝
    
	// 성별에 따른 기초대사량 계산 시작
	var result;
    
	if (gender == 'F') { // 여성인 경우
		result = 655 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
	} else if (gender == 'M') { // 남성인 경우
		result = 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
	      
	}
	var bmr = result.toFixed(0); // 정수로 표시
    console.log("bmi 계산 값: " + bmr);
	
    $("[name=bmr]").val(bmr); // bmr 에 담기
	// 성별에 따른 기초대사량 계산 끝

// 1. 기초대사량 계산식  끝
//-------------------------------------------------------------------->

//<--------------------------------------------------------------------
// 2. 활동 대사량 계산식 시작

	// 활동 계수 공식
	// (1) 활동안함 :  기초대사량 x 1.2
	// (2) 가벼운 활동 (평소 가벼운 운동이나 스포츠를 즐겨요) :  기초대사량 x 1.375
	// (3) 보통 활동 (평소 적당한 운동이나 스포츠를 즐겨요.) :  기초대사량 x 1.55
	// (4) 많은 활동 (평소 강렬한 운동이나 스포츠를 즐겨요.) :  기초대사량 x 1.725
	// (5) 격심한 활동 (평소 매우 심한 운동을 하거나 육체를 쓰는 직업이예요.) :  기초대사량 x 1.9
	
	// 활동 계수
	var activityLevel = 1.2; // 활동안함
	var activityLevel = 1.375; // 가벼운 활동
	var activityLevel = 1.55; // 보통 활동
	var activityLevel = 1.725; // 많은 활동
	var activityLevel = 1.9; // 격심한 활동
	
	// 활동 대사량 계산
	var amr = bmr * activityLevel;
	console.log("활동 대사량: " + amr.toFixed(2) + " kcal/day");
// 2. 활동 대사량 계산식 끝
//-------------------------------------------------------------------->

//<--------------------------------------------------------------------
// 3. 소화를 위한 에너지 계산식 시작
	// 입력값
	var mealCalories = amr; // 식사 열량 (kcal)
	var digestionEfficiency = 0.1; // 소화 효율
	
	// 소화를 위한 에너지 계산
	var digestionEnergy = (bmr+mealCalories) * digestionEfficiency;
	console.log("소화를 위한 에너지: " + digestionEnergy.toFixed(2) + " kcal");
	$("[name=age]").val(age);
	$("[name=bmr]").val(bmr);
	$("[name=amr]").val(amr);
	$("[name=digestionEnergy]").val(digestionEnergy);

// 3. 소화를 위한 에너지 계산식 끝
//-------------------------------------------------------------------->	

//<--------------------------------------------------------------------
// 4. 하루 동안 섭취해야 할 음식 칼로리 계산식 시작

// TODO

	$("#frmCalories").submit();
	


// 4. 하루 동안 섭취해야 할 음식 칼로리  계산식 끝
//-------------------------------------------------------------------->	

//<--------------------------------------------------------------------
// 5. 하루 동안 운동으로 소모해야 할 운동 칼로리  계산식 시작

// TODO

// 5. 하루 동안 운동으로 소모해야 할 운동 칼로리  계산식 끝
//-------------------------------------------------------------------->	

//<--------------------------------------------------------------------
// 6. 칼로리 처방 페이지 입력값 없을 시 alert 창 띄우기  시작 
/* function calorie_view(){
	if ($("#stature").val().replace(/(^\s*)|(\s*$)/g, "") == ''){
		alert("키를 입력해주세요.");
		$("#stature").val("");
		$("#stature").focus();
		return;
	}

	if ($("#weight").val().replace(/(^\s*)|(\s*$)/g, "") == ''){
		alert("체중를 입력해주세요.");
		$("#weight").val("");
		$("#weight").focus();
		return;
	}

	if ($("#goal_weight").val().replace(/(^\s*)|(\s*$)/g, "") == ''){
		alert("목표체중을 입력해주세요.");
		$("#goal_weight").val("");
		$("#goal_weight").focus();
		return;
	}

	if ($("#byear").val().replace(/(^\s*)|(\s*$)/g, "") == ''){
		alert("다이어트시작 년도를 입력해주세요.");
		$("#byear").val("");
		$("#byear").focus();
		return;
	}

	if ($("#bmonth").val().replace(/(^\s*)|(\s*$)/g, "") == ''){
		alert("다이어트시작 월을 입력해주세요.");
		$("#bmonth").val("");
		$("#bmonth").focus();
		return;
	}

	if ($("#bday").val().replace(/(^\s*)|(\s*$)/g, "") == ''){
		alert("다이어트시작 일을 입력해주세요.");
		$("#bday").val("");
		$("#bday").focus();
		return;
	}

	if ($("#goal_term").val().replace(/(^\s*)|(\s*$)/g, "") == ''){
		alert("체중감량기간을 입력해주세요.");
		$("#goal_term").val("");
		$("#goal_term").focus();
		return;
	}

 	var frm = document.frm;
 	frm.action = "/health/calorielist.jsp"
 	frm.submit();
 */
}  // calCalorie() 끝

//6. 칼로리 처방 페이지 입력값 없을 시 alert 창 띄우기  끝 
//-------------------------------------------------------------------->
</script>
