

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
  
  $('#btnSrcMeal').on('click keypress', function(event) {
	  if(event.type ==='click' || event.keyCode === 13){
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
				        $('<td style="vertical-align: middle;">' + nut.sersize + nut.capunit + "</td>").appendTo(row);
				        $('<td style="vertical-align: middle;">' + nut.kcal + " kcal</td>").appendTo(row);
				        $('<td style="padding-top: 0px; vertical-align: middle;">').html('<button class="btn-add-meal" data-meal="' + nut.id + '"><img src="/stayfit/resources/img/diary/add.png"></button>').appendTo(row);
				        tbody.append(row);
				      }
				 }
			});  
		  }  
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
					tbody.empty()
					
					for(var i=0; i< exercise.length; i++) {
						var exrc = exercise[i];
						
						var row_5 = $("<tr></tr>") // 새로운 행 생성
						var row_10 = $("<tr></tr>")
						var row_30 = $("<tr></tr>")
						var row_60 = $("<tr></tr>") 
						$("<td>" + exrc.exercise + "</td>").appendTo(row_5); // 셀 추가
						$('<td style="vertical-align: middle;">' + '5분' + "</td>").appendTo(row_5);
						$('<td style="vertical-align: middle;">' + exrc.five_m_kcal + " kcal </td>").appendTo(row_5);
						$("<td style='padding-top: 0px; vertical-align: middle;'>").html('<button class="btn-add-exrc" data-exrc="'+exrc.exid+'"><img src="/stayfit/resources/img/diary/add.png"></button>').appendTo(row_5);
						
						$("<td>" + exrc.exercise + "</td>").appendTo(row_10); // 셀 추가
						$('<td style="vertical-align: middle;">' + '10분' + "</td>").appendTo(row_10);
						$('<td style="vertical-align: middle;">' + exrc.ten_m_kcal + " kcal </td>").appendTo(row_10);
						$("<td style='padding-top: 0px; vertical-align: middle;'>").html('<button class="btn-add-exrc" data-exrc="'+exrc.exid+'"><img src="/stayfit/resources/img/diary/add.png"></button>').appendTo(row_10);
						
						$("<td>" + exrc.exercise + "</td>").appendTo(row_30); // 셀 추가
						$('<td style="vertical-align: middle;">' + '30분' + "</td>").appendTo(row_30);
						$('<td style="vertical-align: middle;">' + exrc.thirty_m_kcal + " kcal </td>").appendTo(row_30);
						$("<td style='padding-top: 0px; vertical-align: middle;'>").html('<button class="btn-add-exrc" data-exrc="'+exrc.exid+'"><img src="/stayfit/resources/img/diary/add.png"></button>').appendTo(row_30);
						
						$("<td>" + exrc.exercise + "</td>").appendTo(row_60); // 셀 추가
						$('<td style="vertical-align: middle;">' + '1시간' + "</td>").appendTo(row_60);
						$('<td style="vertical-align: middle;">' + exrc.one_h_kcal + " kcal </td>").appendTo(row_60);
						$("<td style='padding-top: 0px; vertical-align: middle;'>").html('<button class="btn-add-exrc" data-exrc="'+exrc.exid+'"><img src="/stayfit/resources/img/diary/add.png"></button>').appendTo(row_60);
						tbody.append(row_5); // 행을 테이블에 추가
						tbody.append(row_10);
						tbody.append(row_30);
						tbody.append(row_60);
					}
			  }
		  });  
	  }
  });

  $(document).on('click', '.btn-add-meal', function(){
	  	var meal = $(this).closest('tr').find('td:eq(0)').text();
		var sersize = $(this).closest('tr').find('td:eq(1)').text();
		var kcal = $(this).closest('tr').find('td:eq(2)').text();
		
		var row = $('<tr></tr>')
		$('<td>' + meal + '</td>').appendTo(row);
		$("<td style='vertical-align: middle;'>" + sersize + '</td>').appendTo(row);
		$("<td style='vertical-align: middle;'>" + kcal + '</td>').appendTo(row);
		$("<td style='padding-top: 0px; vertical-align: middle;'>").html('<button class="minus-box btn-remove-menu"><img src="/stayfit/resources/img/diary/remove.png"></button>').appendTo(row);
		$("#mealTable tbody").append(row)
	  });
  
  $(document).on('click', '.btn-remove-menu', function(){
	  $(this).closest('tr').remove();
	});
  
  $(document).on('click', '.btn-add-exrc', function(){
	var exid = $(this).data('exrc');
	var exercise = $(this).closest('tr').find('td:first').text();
	var duration = $(this).closest('tr').find('td:eq(1)').text();
	var kcal = $(this).closest('tr').find('td:eq(2)').text();
	
	var row = $('<tr></tr>')
	$('<td>' + exercise + '</td>').appendTo(row);
	$("<td style='vertical-align: middle;'>" + duration + '</td>').appendTo(row);
	$("<td style='vertical-align: middle;'>" + kcal + '</td>').appendTo(row);
	$("<td style='padding-top: 0px; vertical-align: middle;'>").html('<button class="minus-box btn-remove-exrc"><img src="/stayfit/resources/img/diary/remove.png"></button>').appendTo(row);
	$('#exerciseTable tbody').append(row);
  });
//		$.ajax({
//		type: "POST",
//		url: "/diarywrite",
//		data: {
//			exerciseName : exerciseName,
//			exerciseCalories : exerciseCalories
//		},
//		success:function(response){
//			var $newRow = $("<tr>").attr('id', 'exrc-row-' + rowCount);
//			$newRow.append($("<td>").text(exerciseName));
//			$newRow.append($("<td>").text(exerciseTime));
//			$newRow.append($("<td>").text(exerciseCalories));
//			$newRow.append($("<td>").html('<button class="minus-box btn-remove-exrc"><img src="/stayfit/resources/img/diary/remove.png"></button>'));
//			rowCount++;
//			$("#exerciseTable tbody").append($newRow)
//		}
//	});
  $(document).on('click', '.btn-remove-exrc', function(){
	  $(this).closest('tr').remove();
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

