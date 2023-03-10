

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,listMonth'
      },
      
      titleFormat : function(date) {
    	  return date.date.year +"년 "+(date.date.month +1) +"월";
      },
      selectable: true,
      
      eventClick:function(){
		  var model = $("#calendar-modal");
		  modal.modal();
	  },
	  
	  dateClick:function(){
		  $("#calendar-modal").modal("show");
	  }
    });

    calendar.render();
  });

  $('#diary-form').submit(function(event){
	  event.preventDefault();
	  
	  var weight = $('#weight-input').val();
	  
	  $ajax({
		  type:'POST',
		  url:'/diary-write',
		  data:{ weight: weight},
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
  
  
function search() {
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
					console.log("아아아아아아아아 여기는 return된 데이이이이이이터");
					console.log(value.nutList);
					var nutrition = value.nutList;
					
					for(var i=0; i< nutrition.length; i++) {
						var list = nutrition[i];
						
						
					}
					
			},
			error: function(request, status, error) {
				alert("code" + request.status + "\n" + "message : " + request.responseText + "\nerror" + error);
			}
		});
	}
}
  
  
  
  
  
  
  