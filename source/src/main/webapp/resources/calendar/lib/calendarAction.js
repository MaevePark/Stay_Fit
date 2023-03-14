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
				  start: event.start.replace(/"/g, '')
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
			      eventClick:function(){
					  var model = $("#calendar-modal");
					  modal.modal();
				  },
				  dateClick:function(){
					  $("#calendar-modal").modal("show");
				  },
				  dayMaxEvents: true,
				  events: events,
//				  eventRender: function(info) {
//					    // 이벤트의 title 속성에서 HTML 태그를 가진 경우
//					    if (info.event.title.match(/<.*>/)) {
//					      // 배경색상 또는 텍스트 색상을 변경합니다.
//					      info.el.style.backgroundColor = 'red';
//					      info.el.style.color = 'white';
//					    }
//					  }
			});
					  
			console.log(events);
			calendar.render();
			// listUpData(result);
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




