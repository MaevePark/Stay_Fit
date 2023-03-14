window.onload = function() {
	var memberId = $('#mid').val();
	$.ajax({
		url: "callDiary",
		type: "post",
		async: false,
		data: {
			mid: memberId
		},
		dataType: "json",
		success: function(result) {
			
			
			let calendarEl = document.getElementById('calendar');
			let calendar = new FullCalendar.Calendar(calendarEl, {
				initialDate: new Date(),
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
					  var model = $("#calendar-modal");
					  modal.modal();
				  },
				  dateClick:function(){
					  $("#calendar-modal").modal("show");
				  },
				  dayMaxEvents: true,
				  events:JSON.parse(result).map(event => ({ title: event.title.replace(/"/g, ''), start: event.start.replace(/"/g, '') }))
			});
					  
			console.log(result);
			calendar.render();
			//listUpData(result);
		},
		error: function(result) {
			console.log("응애");
			let calendarEl = document.getElementById('calendar');
			let calendar = new FullCalendar.Calendar(calendarEl, {
				initialDate: new Date(),
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
					  var model = $("#calendar-modal");
					  modal.modal();
				  },
				  
				  dateClick:function(){
					  $("#calendar-modal").modal("show");
				  },
				dayMaxEvents: true,
			});
			calendar.render();
		}
	});

}




