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
				  textColor: event.textColor.replace(/"/g, '')
				  //, emotImg: event.emotImg.replace(/"/g, '')
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
			      eventClick:function(date){
					  var model = $("#calendar-modal");
					  modal.modal();
				  },
				  dateClick:function(){
					  $("#calendar-modal").modal("show");
				  },
				  dayMaxEvents: true,
				  events: events
			});
					  
			console.log(events);
			calendar.render();
			for(var i=0; i<events.length; i++) {
				//var a = document.querySelector('[data-date='+events[i].start+'].fc-day');
				console.log(document.querySelector('[data-date="'+events[i].start+'"].fc-day'));
				//a.innerHTML = events[i].emotImg+events[i].title;
			}
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

function upload() {
	var breakfast = document.querySelector('[for="breakfast"].btn-kcal').innerText;
	var lunch = document.querySelector('[for="lunch"].btn-kcal').innerText;
	var dinner = document.querySelector('[for="dinner"].btn-kcal').innerText;
	var snack1 = document.querySelector('[for="snack1"].btn-kcal').innerText;
	var snack2 = document.querySelector('[for="snack2"].btn-kcal').innerText;
	var snack3 = document.querySelector('[for="snack3"].btn-kcal').innerText;
	
	console.log(typeof parseInt(dinner.substring(0, dinner.indexOf('kcal'))));
	console.log(parseInt(dinner.substring(0, dinner.indexOf('kcal'))));
	
	$.ajax({
		url: "diarywrite",
		type: "post",
		async: false,
		data: {
			mid: document.getElementById("mid").value,
			breakfast: parseInt(breakfast.substring(0, breakfast.indexOf('kcal')))*1,
			lunch: parseInt(lunch.substring(0, lunch.indexOf('kcal')))*1,
			dinner: parseInt(dinner.substring(0, dinner.indexOf('kcal')))*1,
			snack1: parseInt(snack1.substring(0, snack1.indexOf('kcal')))*1,
			snack2: parseInt(snack2.substring(0, snack2.indexOf('kcal')))*1,
			snack3: parseInt(snack3.substring(0, snack3.indexOf('kcal')))*1
		},
		dataType: "json",
		success: function(result) {
			
		},
		error: function(result) {}
		
		
	});
	


}


