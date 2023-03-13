/**
 * Dashboard Analytics
 */

'use strict';

$(function() {
  let cardColor, headingColor, axisColor, shadeColor, borderColor;

  cardColor = config.colors.white;
  headingColor = config.colors.headingColor;
  axisColor = config.colors.axisColor;
  borderColor = config.colors.borderColor;

  // --------------------------------------------------------------------
  // <첫번째 차트> - Total Revenue Report Chart - Bar Chart
  
  const totalRevenueChartEl = document.querySelector('#totalRevenueChart');
  // 차트 옵션 생성
  const totalRevenueChartOptions = {
      series: [
	  {
          data: []
        }
	  ],
      chart: {
        height: 300,
        stacked: true,
        type: 'bar',
        toolbar: { show: false }
      },
      plotOptions: {
        bar: {
          horizontal: false,
          columnWidth: '33%',
          borderRadius: 12,
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
          left: 20,
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
  
  // 차트 생성
  const totalRevenueChart = new ApexCharts(totalRevenueChartEl, totalRevenueChartOptions);
  totalRevenueChart.render();
  
//	var token = $("meta[name='_csrf']").attr("content");
//	var header = $("meta[name='_csrf_header']").attr("content");
//	var token = 'fetch';
//	var header = "X-CSRF-TOKEN";

  var year = $("#dropdownbtn1").val();
  
  $.ajax({
	  url: "chart1",
	  data: { 'year': year },
      type: "post",
      dataType:"json",
      success:function(data){
    	  console.log(data);
    	  
    	  let chartData = [];
          
    	  // chartData에 12개 미만이 채워진다면 12개까지의 나머지 배열은 null로 채워주기
    	  for (let i = 0; i < 12; i++){    				  
			   if (data[i]) {
				   chartData.push(data[i].revenue);
			   } else {
			       chartData.push(null);
			   }				  
    	  }
  	  
          totalRevenueChart.updateSeries([
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
//--------------------------------------
//<드롭다운 연도 선택시>
$(".dropdown-item.chart1").click(function() {
	
	$("#dropdownbtn1").val($(this).data("value"));
	$("#dropdownbtn1").text($(this).text() + " ");
	
	var year = $("#dropdownbtn1").val();
	  
	  $.ajax({
		  url: "chart1",
		  data: { 'year': year },
	      type: "post",
	      dataType:"json",
	      success:function(data){
	    	  console.log(data);
	    	  
	    	  let chartData = [];
	          
	    	  // chartData에 12개 미만이 채워진다면 12개까지의 나머지 배열은 null로 채워주기
	    	  for (let i = 0; i < 12; i++){				  
				   if (data[i]) {
					   chartData.push(data[i].revenue);
				   } else {
				       chartData.push(null);
				   }				  
	    	  }
	    	  
	          totalRevenueChart.updateSeries([
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

  // --------------------------------------------------------------------
  // <두번째 차트> - Order Statistics Chart
  
  const chartOrderStatistics = document.querySelector('#orderStatisticsChart')
  // 차트 옵션 생성
  const orderChartConfig = {
      chart: {
        height: 260,
        width: 260,
        type: 'donut'
      },
      labels: ['샐러드&도시락&볶음밥', '닭가슴살', '밥&면','간편요리&반찬','베이커리&떡','분식&만두&치킨','건강식&음료','단백질&시리얼&간식'],
      series: [],
      colors: ['hsl(0, 80%, 70%)', 'hsl(30, 80%, 70%)', 'hsl(60, 80%, 70%)', 'hsl(120, 80%, 70%)', 'hsl(240, 80%, 70%)', 'hsl(275, 80%, 70%)', 'hsl(300, 80%, 70%)', 'hsl(330, 80%, 70%)'],
      stroke: {
        width: 5
      },
      dataLabels: {
        enabled: true,
        formatter: function (val, opt) {
          return parseInt(val) + '%';
        }
      },
      legend: {
        show: false
      },
      grid: {
        padding: {
          top: 0,
          bottom: 0,
          right: 15
        }
      },
      plotOptions: {
        pie: {
          donut: {
            size: '60%',
            labels: {
              show: true,
              value: {
                fontSize: '1.5rem',
                fontFamily: 'Public Sans',
                color: headingColor,
                offsetY: -15,
                formatter: function (val) {
                  return parseInt(val) + '건';
                }
              },
              name: {
                offsetY: 20,
                fontFamily: 'Public Sans'
              },
              total: {
                show: true,
                fontSize: '0.8125rem',
                color: axisColor
              }
            }
          }
        }
      }
    };

  // 차트 생성
  const statisticsChart = new ApexCharts(chartOrderStatistics, orderChartConfig);
  statisticsChart.render();

  $.ajax({
	  url: "chart2",
      type: "post",
      dataType:"json",
      success:function(data){
    	  console.log(data);
    	  
    	  let chartData = [];
          
          for (let i = 0; i < data.length; i++){    				  
        	  chartData.push(data[i].sales);    				  
		  }
  	  
          statisticsChart.updateSeries(chartData);
      },
	  error : function(request, status, errordata){
		  alert("error code:" + request.status + "\n"
				+ "message:" + request.responseText + "\n"
				+ "error" + errordata + "\n");
	  }
  });
  
  // --------------------------------------------------------------------
  // <세번째 차트> - Income Chart - Area chart
  
  const incomeChartEl = document.querySelector('#incomeChart')
  // 차트 옵션 생성
  const incomeChartConfig = {
      series: [
        {
          data: []
        }
      ],
      chart: {
        height: 215,
        parentHeightOffset: 0,
        parentWidthOffset: 0,
        toolbar: {
          show: false
        },
        type: 'area'
      },
      dataLabels: {
        enabled: false
      },
      stroke: {
        width: 2,
        curve: 'smooth'
      },
      legend: {
        show: false
      },
      markers: {
        size: 6,
        colors: 'transparent',
        strokeColors: 'transparent',
        strokeWidth: 4,
        discrete: [
          {
            fillColor: config.colors.white,
            seriesIndex: 0,
            dataPointIndex: 7,
            strokeColor: config.colors.primary,
            strokeWidth: 2,
            size: 6,
            radius: 8
          }
        ],
        hover: {
          size: 7
        }
      },
      colors: [config.colors.primary],
      fill: {
        type: 'gradient',
        gradient: {
          shade: shadeColor,
          shadeIntensity: 0.6,
          opacityFrom: 0.5,
          opacityTo: 0.25,
          stops: [0, 95, 100]
        }
      },
      grid: {
        borderColor: borderColor,
        strokeDashArray: 3,
        padding: {
          top: -20,
          bottom: -8,
          left: 8,
          right: 8
        }
      },
      xaxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        axisBorder: {
          show: false
        },
        axisTicks: {
          show: false
        },
        labels: {
          show: true,
          style: {
            fontSize: '13px',
            colors: axisColor
          }
        }
      },
      yaxis: {
        labels: {
          show: false
        }
      }
    };
  
  // 차트 생성
  const incomeChart = new ApexCharts(incomeChartEl, incomeChartConfig);
  incomeChart.render();

  var year2 = $("#dropdownbtn2").val();
  
  $.ajax({
	  url: "chart3",
	  data: { 'year2': year2 },
      type: "post",
      dataType:"json",
      success:function(data){
    	  console.log(data);
    	  
          let chartData = [];
          
          // chartData에 12개 미만이 채워진다면 12개까지의 나머지 배열은 null로 채워주기
    	  for (let i = 0; i < 12; i++){				  
			   if (data[i]) {
				   chartData.push(data[i].cnt);
			   } else {
			       chartData.push(null);
			   }				  
    	  }
  	  
          incomeChart.updateSeries([
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
//--------------------------------------
//<드롭다운 연도 선택시>
$(".dropdown-item.chart3").click(function() {
	
  $("#dropdownbtn2").val($(this).data("value"));
  $("#dropdownbtn2").text($(this).text() + " ");  
  
  var year2 = $("#dropdownbtn2").val();
  console.log("#######" + year2);
  $.ajax({
	  url: "chart3",
	  data: { 'year2': year2 },
      type: "post",
      dataType:"json",
      success:function(data){
    	  console.log(data);
    	  
          let chartData = [];
          
          // chartData에 12개 미만이 채워진다면 12개까지의 나머지 배열은 null로 채워주기
    	  for (let i = 0; i < 12; i++){				  
			   if (data[i]) {
				   chartData.push(data[i].cnt);
			   } else {
			       chartData.push(null);
			   }				  
    	  }
  	  
          incomeChart.updateSeries([
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
});