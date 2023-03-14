

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
//		end : '2023-03-13' //ddate
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
		  url:'/diarywrite',
		  data:{ weight: weight },
		  success: function(data){
			  //fullcalendar에 아이콘과 함께 표시
		  },
		  error: function(){
			  console.log('실패');
		  }
	  });
  });
  
  $('#btnSrcMeal').click(function() {
	  var keyword = $('#searchMeal').val();
	  if(keyword.value !==""){
		  $.ajax({
			    url: "searchmeal",
			    type: "get",
			    data: { keyword: keyword },
			    dataType: "json",
			    success: function(value) {
			      console.log("------------여기는 return된 데이터------------");
			      console.log(value.nutList);
			      var nutrition = value.nutList;
			      var tbody = $(".search-meal-table tbody");
			      tbody.empty()
			      for (var i = 0; i < nutrition.length; i++) {
			        var nut = nutrition[i];
			        var row = $("<tr></tr>")
			        $("<td>" + nut.product + "</td>").appendTo(row);
			        $("<td>" + nut.sersize + nut.capunit + "</td>").appendTo(row);
			        $("<td>" + nut.kcal + " kcal</td>").appendTo(row);
			        $("<td>").html('<button class="btn btn-light btn-add-meal" data-meal="' + nut.id + '"><img src="<%=request.getContextPath() %>/resources/img/diary/add.png"></button>').appendTo(row);
			        tbody.append(row);
			      }
			    }
			  });  
	  }
	});
  $('#btnSrcExrc').click(function(){
	  var keyword = $('#searchExrc').val();
	  if(keyword.value !==""){
		  $.ajax({
			  url: "searchexrc",
			  type:"get",
			  data: {keyword:keyword},
			  dataType:"json",
			  success: function(value){
				  console.log("------------여기는 return된 데이터------------");
				  console.log(value.exrcList);
				  var exercise = value.exrcList;
					var tbody = $(".search-exrc-table tbody");
					
					for(var i=0; i< exercise.length; i++) {
						var exrc = exercise[i];
						
						var row = $("<tr></tr>") // 새로운 행 생성
						$("<td>" + exrc.exercise + "</td>").appendTo(row); // 셀 추가
						$("<td>" + '5분' + "</td>").appendTo(row);
						$("<td>" + exrc.five_m_kcal + "</td>").appendTo(row);
						$("<td>").html('<button class="btn btn-primary btn-add-exrc" data-time="5"><img src="<%=request.getContextPath() %>/resources/img/diary/add.png"></button>').appendTo(row);
						tbody.append(row); // 행을 테이블에 추가
						
						$("<td>" + exrc.exercise + "</td>").appendTo(row); // 셀 추가
						$("<td>" + '10분' + "</td>").appendTo(row);
						$("<td>" + exrc.ten_m_kcal + "</td>").appendTo(row);
						$("<td>").html('<button class="btn btn-primary btn-add-exrc" data-time="10"><img src="<%=request.getContextPath() %>/resources/img/diary/add.png"></button>').appendTo(row);
						tbody.append(row); // 행을 테이블에 추가
						
						$("<td>" + exrc.exercise + "</td>").appendTo(row); // 셀 추가
						$("<td>" + '30분' + "</td>").appendTo(row);
						$("<td>" + exrc.thirty_m_kcal + "</td>").appendTo(row);
						$("<td>").html('<button class="btn btn-primary btn-add-exrc" data-time="30"><img src="<%=request.getContextPath() %>/resources/img/diary/add.png"></button>').appendTo(row);
						tbody.append(row); // 행을 테이블에 추가
						
						$("<td>" + exrc.exercise + "</td>").appendTo(row); // 셀 추가
						$("<td>" + '1시간' + "</td>").appendTo(row);
						$("<td>" + exrc.one_h_kcal + "</td>").appendTo(row);
						$("<td>").html('<button class="btn btn-primary btn-add-exrc" data-time="60"><img src="<%=request.getContextPath() %>/resources/img/diary/add.png"></button>').appendTo(row);
						tbody.append(row); // 행을 테이블에 추가
					}
			  }
		  });  
	  }
  });

  $('.btn-add-meal').click(function(){
		var mealName = $(this).closest('tr').find('td:eq(1)').text();
		var mealCapunit = $(this).closest('tr').find('td:eq(2)').text();
		var mealCalories = $(this).closest('tr').find('td:eq(3)').text();
		
		var mealData = {
			name : mealName,
			capunit : mealCapunit,
			calroies : mealCalories
		};
		
		$.ajax({
			type: "POST",
			url: "/nutwrite",
			data: {
				mealName : mealName,
				mealCapunit : mealCapunit,
				mealCalories : mealCalories
			},
			success:function(response){
				var $newRow = $("<tr>").attr('id', 'meal-row-' + rowCount);
				$newRow.append($("<td>").text(mealName));
				$newRow.append($("<td>").text(mealCapunit));
				$newRow.append($("<td>").text(mealCalories));
				$newRow.append($("<td>").html('<button class="btn btn-light minus-box btn-remove-menu"><i class="bi bi-dash-square"></i></button>'));
				rowCount++;
				$("#mealTable tbody").append($newRow)
			}
		});
	  });
  $('.btn-remove-menu').click(function(){
	  var rowId = $(this).closest('tr').attr('id');
	  $.ajax({
		    url: '/deletemeal',
		    type: 'POST',
		    data: { mealId: rowId },
		    success: function(response) {
		      // 삭제 요청이 성공한 경우, 테이블에서 해당 행 삭제
		      $('#' + rowId).remove();
		    }
	  });
  });
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
						var tbody = $(".search-exrc-table tbody");
						
						for(var i=0; i< exercise.length; i++) {
							var exrc = exercise[i];
							
							var row = $("<tr></tr>") // 새로운 행 생성
							$("<td>" + exrc.exercise + "</td>").appendTo(row); // 셀 추가
							$("<td>" + '5분' + "</td>").appendTo(row);
							$("<td>" + exrc.five_m_kcal + "</td>").appendTo(row);
							$("<td>").html('<button class="btn btn-primary btn-add-exrc" data-time="5"><i class="bi bi-plus-square"></i></button>').appendTo(row);
							tbody.append(row); // 행을 테이블에 추가
							
							$("<td>" + exrc.exercise + "</td>").appendTo(row); // 셀 추가
							$("<td>" + '10분' + "</td>").appendTo(row);
							$("<td>" + exrc.ten_m_kcal + "</td>").appendTo(row);
							$("<td>").html('<button class="btn btn-primary btn-add-exrc" data-time="10"><i class="bi bi-plus-square"></i></button>').appendTo(row);
							tbody.append(row); // 행을 테이블에 추가
							
							$("<td>" + exrc.exercise + "</td>").appendTo(row); // 셀 추가
							$("<td>" + '30분' + "</td>").appendTo(row);
							$("<td>" + exrc.thirty_m_kcal + "</td>").appendTo(row);
							$("<td>").html('<button class="btn btn-primary btn-add-exrc" data-time="30"><i class="bi bi-plus-square"></i></button>').appendTo(row);
							tbody.append(row); // 행을 테이블에 추가
							
							$("<td>" + exrc.exercise + "</td>").appendTo(row); // 셀 추가
							$("<td>" + '1시간' + "</td>").appendTo(row);
							$("<td>" + exrc.one_h_kcal + "</td>").appendTo(row);
							$("<td>").html('<button class="btn btn-primary btn-add-exrc" data-time="60"><i class="bi bi-plus-square"></i></button>').appendTo(row);
							tbody.append(row); // 행을 테이블에 추가
						}
						
				},
			});
		}
	}
  
  $('.btn-add-exrc').click(function(){
	var exerciseName = $(this).closest('tr').find('td:eq(1)').text();
	var exerciseTime = $(this).data('time');
	var exerciseCalories = $(this).closest('tr').find('td:eq(3)').text();
	
	var exerciseData = {
		name : exerciseName,
		calories : exerciseCalories,
		time : exerciseTime
	};
	
	$.ajax({
		type: "POST",
		url: "/diarywrite",
		data: {
			exerciseName : exerciseName,
			exerciseCalories : exerciseCalories
		},
		success:function(response){
			var $newRow = $("<tr>").attr('id', 'exrc-row-' + rowCount);
			$newRow.append($("<td>").text(exerciseName));
			$newRow.append($("<td>").text(exerciseTime));
			$newRow.append($("<td>").text(exerciseCalories));
			$newRow.append($("<td>").html('<button class="btn btn-light minus-box btn-remove-exrc"><i class="bi bi-dash-square"></i></button>'));
			rowCount++;
			$("#exerciseTable tbody").append($newRow)
		}
	});
  });
  $('.btn-remove-exrc').click(function(){
	  var rowId = $(this).closest('tr').attr('id');
	  $.ajax({
		    url: '/delete-exrc',
		    type: 'POST',
		    data: { exrcId: rowId },
		    success: function(response) {
		      // 삭제 요청이 성공한 경우, 테이블에서 해당 행 삭제
		      $('#' + rowId).remove();
		    }
	  });
  });
  
  //몸무게 입력란 유효성 체크
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

