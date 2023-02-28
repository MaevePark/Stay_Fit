

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
		  alert("date clicked");
		  $("#calendar-modal").modal("show");
	  }
    });

    calendar.render();
  });
  
  