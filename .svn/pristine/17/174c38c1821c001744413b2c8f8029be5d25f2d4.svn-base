<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>관리자 메인페이지</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  <script src="https://unpkg.com/vue@2.5.13/dist/vue.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	
	<!-- Custom fonts for this template-->
	<link href="../../../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
	<!-- Custom styles for this template-->
	<link href="../../../resources/css/sb-admin-2.min.css" rel="stylesheet">	
</head>
<body id="page-top">
<div id="wrapper">
<%@include file="common/admin-side.jsp" %>
	<div id="content-wrapper" class="d-flex flex-column">
		<%@include file="common/admin-nav.jsp" %>
		<div class="container-fluid">	
			<div class="row">
				<div class="col-sm-6">
					<h4 style="margin-top:10px;">최근 1주일이내 강좌/모의고사 매출액</h4>
					<div onload="chart()">
	                   <canvas id="bar-chart"></canvas>
	                </div>
				</div>
				<div class="col-sm-6" >
					<h4 style="margin-top:10px;">최근 1주일이내 강좌/모의고사 매출비율</h4>
					<div onload="chart()">
	                   <canvas id="pie-chart"></canvas>
	                </div>
				</div>
			</div>		
		</div>
	</div>
</div>
<!-- Bootstrap core JavaScript-->
<script src="../../../resources/vendor/jquery/jquery.min.js"></script>
<script src="../../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="../../../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="../../../resources/js/sb-admin-2.min.js"></script>
<!-- Page level plugins -->
<script src="../../../resources/vendor/chart.js/Chart.min.js"></script>
<!-- Page level custom scripts -->
<script type="text/javascript">
window.onload = function chart() {
	createBarChart();
	createPieChart()
}

var barChart;
function createBarChart() {
var ctx1 = document.getElementById("bar-chart").getContext('2d');
   
	barChart = new Chart(ctx1, {
		type: 'bar',
        data: {
			labels: ['1일이내', '3일이내', '1주일이내'],
            datasets: [{
            	label: '강좌', 
                data: ['${adminLectIncomeByDay}', '${adminLectIncomeByThree}', '${adminLectIncomeByWeek}'],
                backgroundColor: [
            	    'rgba(255, 99, 132, 0.2)',
            	    'rgba(255, 99, 132, 0.2)',
            	    'rgba(255, 99, 132, 0.2)',
            	    'rgba(255, 99, 132, 0.2)',
            	    'rgba(255, 99, 132, 0.2)',
            	    'rgba(255, 99, 132, 0.2)',
					'rgba(255, 99, 132, 0.2)'
				],
                borderColor: [
                    'rgba(255, 159, 64, 1)',
                    'rgba(255, 159, 64, 1)',
                     'rgba(255, 159, 64, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
			},{label: '모의고사', 
				data: ['${adminTestIncomeByDay}', '${adminTestIncomeByThree}', '${adminTestIncomeByWeek}'],
                backgroundColor: [
            	    'rgba(75, 192, 192, 0.2)',
            	    'rgba(75, 192, 192, 0.2)',
            	    'rgba(75, 192, 192, 0.2)',
            	    'rgba(75, 192, 192, 0.2)',
            	    'rgba(75, 192, 192, 0.2)',
            	    'rgba(75, 192, 192, 0.2)',
            	    'rgba(75, 192, 192, 0.2)'
				],
                borderColor: [
                    'rgba(54, 162, 235, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(54, 162, 235, 1)'
                ],
                borderWidth: 1}]
		},
        options: {
			maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
			scales: {
		    	yAxes: [{
		        	ticks: {
		            	beginAtZero:true
			        }
				}]
			}
		}
	});
}

var pieChart;
function createPieChart() {
var ctx2 = document.getElementById("pie-chart").getContext('2d');
   
	barChart = new Chart(ctx2, {
		type: 'pie',
        data: {
			labels: ['강좌', '모의고사'],
            datasets: [{
                data: ['${adminIncomeRate.LECT_RATE}', '${adminIncomeRate.TEST_RATE}'],
                backgroundColor: [
            	    'rgba(255, 99, 132)',
            	    'rgba(75, 192, 192)',
            	  
				],
			}]
		},
        options: {
			
		}
	});
}

</script>
</body>
</html>