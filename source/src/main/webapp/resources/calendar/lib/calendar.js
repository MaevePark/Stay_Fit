

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
//      events: 
    });

    calendar.render();
  });
  
  function modalOn(){
	  modal.style.display = "flex"
  }
  
  function modalOff(){
	  modal.style.display = "none"  
  }
  
  const modal = document.getElementById("modal")
  const openModal = document.getElementById("fc-daygrid-day-frame")
  openModal.addEventListener("click", e => {
	  modalOn()
  })
  const closeModal = document.getElementById("btn-cancel")
  openModal.addEventListener("click", e => {
	  modalOff()
  })
  modal.addEventListener("click", e => {
      const evTarget = e.target
      if(evTarget.classList.contains("modal-overlay")) {
    	  modalOff()
      }
  })
  window.addEventListener("keyup", e => {
      if(modal.style.display === "flex" && e.key === "Escape") {
    	  modalOff()
      }
  })