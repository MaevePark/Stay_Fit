

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    
//    events : [
//    	{
//    	title: '<img src="<%=request.getContextPath()%>/resources/img/diary/scale.png">' 
//    		+ (breakfast + snack1 + lunch + snack2 + dinner + snack3) + "\n"
//    		+ '<img src="<%=request.getContextPath()%>/resources/img/diary/scale.png">\n'
//    		+ weight + "\n"
//    		+ '<img src="<%=request.getContextPath()%>/resources/img/diary/scale.png">\n'
//    		+ exercise ,
//		start : '2023-03-13',// ddate,
//		end : '2023-03-13'
//    	}
//	  ]
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next',
        center: 'title',
        right: 'today'
      },
      
      titleFormat : function(date) {
    	  return date.date.year +"년 "+(date.date.month +1) +"월";
      },
      selectable: true,
      
      eventClick:function(){
		  var modal = $("#calendar-modal");
		  modal.modal();
	  },
	  
	  dateClick:function(){
		  $("#calendar-modal").modal("show");
	  },
	  
    });
    
    calendar.render();
  });

  $('#diary-form').submit(function(event){
	  event.preventDefault();
	  
	  var weight = $('#weight-input').val();
	  
	  $ajax({
		  type:'POST',
		  url:'/diary-write',
		  data:{ weight: weight },
		  success: function(data){
			  //fullcalendar에 아이콘과 함께 표시
		  },
		  error: function(){
			  console.log('실패');
		  }
	  })
  })
//  $('#btnSrcMeal').click(function(){
//	  var keyword = $('#searchMeal').val();
//	  $.ajax({
//		  url: '/search-meal',
//		  data: {keyword: keyword},
//		  success: function(data){
//			  $('#diarypage').html(data);
//		  }
//	  })
//  })
  $(document).on('click', '.btn-add', function(){
  })
  
  
function searchMeal() {
	let searchInput = document.getElementById('searchMeal');
	if(searchInput.value !== "") {
		$.ajax({
			url: "searchmeal",
			type: "get",
			async: false,
			data: {
				keyword: searchInput.value
			},
			dataType: "json",
			success: function(value) {
					console.log("------------여기는 return된 데이터------------");
					console.log(value.nutList);
					var nutrition = value.nutList;
					
					var tbody = $(".search-table tbody");
					
					tbody.empty()
					
					for(var i=0; i< nutrition.length; i++) {
						var nut = nutrition[i];
						
						var row = $("<tr></tr>") // 새로운 행 생성
						$("<td>" + nut.product + "</td>").appendTo(row); // 셀 추가
						$("<td>" + nut.capunit + "</td>").appendTo(row);
						$("<td>" + nut.kcal + "</td>").appendTo(row);
						$("<td>").html('<button class="btn btn-primary btn-add" data-meal="${meal.id}"><i class="bi bi-plus-square"></i></button>').appendTo(row);
						tbody.append(row); // 행을 테이블에 추가
					}
			}
		});
	}
}
  
  function searchExrc() {
		let searchInput = document.getElementById('searchExrc');
		if(searchInput.value !== "") {
			$.ajax({
				url: "searchexrc",
				type: "get",
				async: false,
				data: {
					keyword: searchInput.value
				},
				dataType: "json",
				success: function(value) {
						console.log("아아아아아아아아 여기는 return된 데이이이이이이터");
						console.log(value.exrcList);
						var exercise = value.exrcList;
						
						for(var i=0; i< exercise.length; i++) {
							var exrc = exercise[i];
							
							var row = $("<tr></tr>") // 새로운 행 생성
							$("<td>" + exrc.exercise + "</td>").appendTo(row); // 셀 추가
							$("<td>" + '5분' + "</td>").appendTo(row);
							$("<td>" + exrc.five_m_kcal + "</td>").appendTo(row);
							$("<td>").html('<button class="btn btn-primary btn-add" data-meal="${exrc.exid}"><i class="bi bi-plus-square"></i></button>').appendTo(row);
							tbody.append(row); // 행을 테이블에 추가
							
							$("<td>" + exrc.exercise + "</td>").appendTo(row); // 셀 추가
							$("<td>" + '10분' + "</td>").appendTo(row);
							$("<td>" + exrc.ten_m_kcal + "</td>").appendTo(row);
							$("<td>").html('<button class="btn btn-primary btn-add" data-meal="${exrc.exid}"><i class="bi bi-plus-square"></i></button>').appendTo(row);
							tbody.append(row); // 행을 테이블에 추가
							
							$("<td>" + exrc.exercise + "</td>").appendTo(row); // 셀 추가
							$("<td>" + '30분' + "</td>").appendTo(row);
							$("<td>" + exrc.thirty_m_kcal + "</td>").appendTo(row);
							$("<td>").html('<button class="btn btn-primary btn-add" data-meal="${exrc.exid}"><i class="bi bi-plus-square"></i></button>').appendTo(row);
							tbody.append(row); // 행을 테이블에 추가
							
							$("<td>" + exrc.exercise + "</td>").appendTo(row); // 셀 추가
							$("<td>" + '1시간' + "</td>").appendTo(row);
							$("<td>" + exrc.one_h_kcal + "</td>").appendTo(row);
							$("<td>").html('<button class="btn btn-primary btn-add" data-meal="${exrc.exid}"><i class="bi bi-plus-square"></i></button>').appendTo(row);
							tbody.append(row); // 행을 테이블에 추가
						}
						
				},
			});
		}
	}
  
  function isNumberKey(event) {

      var charCode = (event.which) ? event.which : event.keyCode;

      if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
          return false;
      // Textbox value    
      var value = event.srcElement.value;    
      // 소수점(.)이 두번 이상 나오지 못하게
      var pattern0 = /^\d*[.]\d*$/; // 현재 value값에 소수점(.) 이 있으면 . 입력불가
      if (pattern0.test(value)) {
          if (charCode == 46) {
              return false;
          }
      }
      var pattern1 = /^\d{3}$/; // 현재 value값이 3자리 숫자이면 . 만 입력가능
      if (pattern1.test(value)) {
          if (charCode != 46) {
              alert("3자리 숫자만 입력가능합니다");
              return false;
          }
      }
      // 소수점 둘째자리까지만 입력가능
      var pattern2 = /^\d*[.]\d{2}$/; // 현재 value값이 소수점 둘째짜리 숫자이면 더이상 입력 불가
      if (pattern2.test(value)) {
          alert("소수점 둘째자리까지만 입력가능합니다.");
          return false;
      }  
      return true;
  }

