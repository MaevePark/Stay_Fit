/**
 * Dashboard Analytics
 */

'use strict';

  let cardColor, headingColor, axisColor, shadeColor, borderColor;

  cardColor = config.colors.white;
  headingColor = config.colors.headingColor;
  axisColor = config.colors.axisColor;
  borderColor = config.colors.borderColor;
  
  // 차트 설정
  let modalChartEl = document.querySelector('#modalChart')
  const modalChartConfig = {
	  series: [
	  {
	      data: []
	    }
	  ],
	  chart: {
	    height: 215,
	    stacked: true,
	    type: 'bar',
	    toolbar: { show: false }
	  },
	  plotOptions: {
	    bar: {
	      horizontal: false,
	      columnWidth: '33%',
	      borderRadius: 5,
	      startingShape: 'rounded',
	      endingShape: 'rounded'
	    }
	  },
	  colors: [config.colors.primary, config.colors.info],
	  dataLabels: {
	    enabled: false
	  },
	  stroke: {
	    curve: 'smooth',
	    width: 6,
	    lineCap: 'round',
	    colors: [cardColor]
	  },
	  legend: {
        show: true,
        horizontalAlign: 'left',
        position: 'top',
        markers: {
          height: 8,
          width: 8,
          radius: 12,
          offsetX: -3
        },
        labels: {
          colors: axisColor
        },
        itemMargin: {
          horizontal: 10
        }
	  },
	  grid: {
	    borderColor: borderColor,
	    padding: {
	    	top: 0,
	        bottom: -8,
	        left: 4,
	        right: 20
	    }
	  },
	  xaxis: {
	    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
	    labels: {
	      style: {
	        fontSize: '13px',
	        colors: axisColor
	      }
	    },
	    axisTicks: {
	      show: false
	    },
	    axisBorder: {
	      show: false
	    }
	  },
	  yaxis: {
	    labels: {
	      style: {
	        fontSize: '13px',
	        colors: axisColor
	      }
	    }
	  },
	  states: {
	    hover: {
	      filter: {
	        type: 'none'
	      }
	    },
	    active: {
	      filter: {
	        type: 'none'
	      }
	    }
	  }
	};
  
  
//--------------------------------------------------------------------
function modalShowHandler() {
	
  // 차트 생성
  var modalChart = new ApexCharts(modalChartEl, modalChartConfig);
  modalChart.render();
	
  // mid 가져오기
  let mid = $(this).siblings("input[name=mid]").val();
  console.log("mid : " + mid);
  let selectedChart = $("#selectChart").val();
  console.log("selectedChart : " + selectedChart);
  
  $.ajax({
	  url: "modalchart",
	  data: { 'mid' : mid , 'chart' : selectedChart },
      type: "post",
      dataType:"json",
      success:function(data){
    	  console.log(data);
    	  
    	  let chartData = [];
          
    	  // 1월부터 12월까지의 데이터가 있는지 검사 -> 있다면 데이터를 push하고, 없다면 null을 push
    	  for (let i = 1; i <= 12; i++) {
    		  let found = false;
    		  for (let j = 0; j < data.length; j++) {
    		    if (data[j].mm === String(i).padStart(2, '0')) { // i가 1부터 9까지일 경우 앞에 0을 붙여서 "01", "02", ..., "09"와 같은 형태로 만듦
    		      chartData.push(data[j].revenue);
    		      found = true;
    		      break;
    		    }
    		  }
    		  if (!found) {
    		    chartData.push(null);
    		  }
    	  }
  	  
    	  modalChart.updateSeries([
        	  {
        		  data: chartData
        	  }
          ]);
      },
	  error : function(request, status, errordata){
		  alert("error code:" + request.status + "\n"
				+ "message:" + request.responseText + "\n"
				+ "error" + errordata + "\n");
	  }
  });

//---------------------------------------------------------
// <차트 선택시>
  $(".nav-link").click(function() {
	  
	  $('.nav-link').removeClass('active');
	  $(this).addClass('active');
	  $('#selectChart').val($(this).data('value'));
	  
	  selectedChart = $("#selectChart").val();
	  console.log("selectedChart : " + selectedChart);
	  
	  $.ajax({
		  url: "modalchart",
		  data: { 'mid' : mid , 'chart' : selectedChart },
	      type: "post",
	      dataType:"json",
	      success:function(data){
	    	  console.log(data);
	    	  
	    	  let chartData = [];
	          
	    	  // 1월부터 12월까지의 데이터가 있는지 검사 -> 있다면 데이터를 push하고, 없다면 null을 push
	    	  for (let i = 1; i <= 12; i++) {
	    		  let found = false;
	    		  for (let j = 0; j < data.length; j++) {
	    		    if (data[j].mm === String(i).padStart(2, '0')) { // i가 1부터 9까지일 경우 앞에 0을 붙여서 "01", "02", ..., "09"와 같은 형태로 만듦
	    		      chartData.push(data[j].revenue);
	    		      found = true;
	    		      break;
	    		    }
	    		  }
	    		  if (!found) {
	    		    chartData.push(null);
	    		  }
	    	  }
	  	  
	    	  modalChart.updateSeries([
	        	  {
	        		  data: chartData
	        	  }
	          ]);
	      },
		  error : function(request, status, errordata){
			  alert("error code:" + request.status + "\n"
					+ "message:" + request.responseText + "\n"
					+ "error" + errordata + "\n");
		  }
	  });
  });
  
}
