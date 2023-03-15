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
			let events = JSON.parse(result).map(event => ({
				  title: event.title.replace(/"/g, ''),
				  start: event.start.replace(/"/g, ''),
				  backgroundColor: event.backgroundColor.replace(/"/g, ''),
				  borderColor: event.borderColor.replace(/"/g, ''),
				  textColor: event.textColor.replace(/"/g, ''),
				  emotImg: event.emotImg.replace(/"/g, '')
				  }));
			
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
			      eventClick:function(date){
					  var model = $("#calendar-modal");
					  modal.modal();
				  },
				  dateClick:function(){
					  $("#calendar-modal").modal("show");
				  },
				  dayMaxEvents: true,
				  events: events,
				  eventRender: function(event, element) {
					  if(emotImg) {
						  console.log("으엥?"+event);
						  eventElement.find("div.fc-event-title").inner(title);		
					  }
					  		  
					},
			});
					  
			console.log(events);
			calendar.render();
		},
		error: function(result) {
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




