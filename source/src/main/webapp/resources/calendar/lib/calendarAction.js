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
			});
			console.log(result);
			calendar.render();
			listUpData(result);
			
			
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


function listUpData(el) {
	var eachDate = $('.fc-daygrid-day-events');
	var dateGrand = $('.fc-day');
	console.log(eachDate);
	console.log(dateGrand);
	var diary = el;
	for(var i=0; i<el.length; i++) {
		console.log(diary[i]);
		var ddate = diary[i].ddate;
		
		var dateStr = ddate;
		var monthArr = ["", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
		var splitDate = dateStr.split(" ");

		var year = splitDate[2];
		var month = monthArr[splitDate[0].replace("월", "")];
		var day = splitDate[1].replace(",", "");
		var result;
		
		if(day < 10) {
			result = year + "-" + month + "-0" + day;
		} else {
			result = year + "-" + month + "-" + day;
		}
		console.log(result);
		var dataFrame = document.querySelector("[data-date='"+result+"'].fc-day");
		console.log(dataFrame);
//		dataFrame.innerHTML = '<div>'+
//									'<span>'+'</span>'+
//								'</div>'+
//								'<div>'+
//									'<span>'+diary[i].exercise+'</span>'+
//								'</div>'+
//								'<div>'+
//									'<span>'+diary[i].weight+'</span>'+
//								'</div>';
	}
	
	
	
	
}




