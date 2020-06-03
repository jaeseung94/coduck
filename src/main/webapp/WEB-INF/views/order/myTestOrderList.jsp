<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CODUCK - 1등 온라인 강좌</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 달력 위젯 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- sy.css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/sy-style.css' />">
<!-- sy.js -->
<script src="/resources/js/common.js"></script>
<style type="text/css">
	.pagination a {
		  color: black;
		  float: left;
		  padding: 8px 16px;
		  text-decoration: none;
		}
		
		.pagination a.active {
		  background-color: #4CAF50;
		  color: white;
		  border-radius: 5px;
		}
		
		.pagination a:hover:not(.active) {
		  background-color: #ddd;
		  border-radius: 5px;
		}

.box-radio-input input[type="radio"] {
	display: none;
}

.box-radio-input input[type="radio"]+span {
	display: inline-block;
	background: none;
	border: 1px solid #dfdfdf;
	padding: 0px 10px;
	text-align: center;
	height: 35px;
	line-height: 33px;
	font-weight: 500;
	cursor: pointer;
}

.box-radio-input input[type="radio"]:checked+span {
	border: 1px solid #23a3a7;
	background: #23a3a7;
	color: #fff;
}

#table-myOrder td, #table-myOrder th {
	border: 1px solid #ddd;
	vertical-align: middle;
	text-align: center;
}

.table th {
	background-color: #efefef;
	text-align: center;
	vertical-align: middle;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%@ include file="../common/user-sidebar.jsp"%>

	<div class="col-sm-9">
		<h3>구매한 모의고사</h3>
		<br>
		<br>
		<div class="row">
			<div class="col-sm-12">
				<form id="form-myOrder" action="">
					<table class="table">
						<tr>
							<th>기간별 조회</th>
							<td><label class="box-radio-input"> <input
									type="radio" name="period" value="7" checked="checked">
									<span>1주일</span>
							</label> <label class="box-radio-input"> <input type="radio"
									name="period" value="30"> <span>1개월</span>
							</label> <label class="box-radio-input"> <input type="radio"
									name="period" value="90"> <span>3개월</span>
							</label> <label class="box-radio-input"> <input type="radio"
									name="period" value="180"> <span>6개월</span>
							</label></td>
						</tr>
						<tr>
							<th>일자별 조회</th>
							<td id="td-date">
								<input type="text" id="Datepicker-prev" name="period-prev"> 
								<input type="text" id="Datepicker-next" name="period-next">
								<button id="btn-inquiry" type="button" class="btn btn-sm"
									style="background-color: gray; color: white; margin-bottom: 5px;">조회</button>
							</td>
						</tr>
					</table>
				</form>
			</div>

			<div class="col-sm-12">
				<table class="table" id="table-myOrder">
					<thead>
						<tr>
							<th>
								<p style="margin: 0px;">주문일자</p>
								<p style="font-weight: lighter;">(주문번호)</p>
							</th>
							<th>상품</th>
							<th>결제금액</th>
							<th>진행상태</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
			
			<div class="col-sm-12 text-center">
				<div class="pagination" id="pagination">		
				
				</div>	
			</div>
		</div>
	</div>
	</div>
	</div>

	<script type="text/javascript">
   
   var prevNo = 0;
   var cnt = 1;
   var index;
   var statuss =  false;
   
   setCalender(7);
   inquiry(1)
   
   	//페이지네이션
	function setPagination(pagination){
		$("#pagination").empty();
		
		var pageRow ="";
		if(pagination.pageNo > 1){
			pageRow += "<a href='' data-page-no='" + (pagination.pageNo - 1) + "'>이전</a>";
		}
		
		for(var i=pagination.beginPage; i<=pagination.endPage; i++){
			if(pagination.pageNo == i){
				pageRow += "<a href='' data-page-no='" + i + 
				"' class='active'>" + i + "</a>";
			} else {
				pageRow += "<a href='' data-page-no='" + i + 
				"'>" + i + "</a>";
			}
		}
		
		if(pagination.pageNo < pagination.totalPagesCount){
			pageRow += "<a href='' data-page-no='" + (pagination.pageNo + 1) + "'>다음</a>";
		}
		
		$("#pagination").append(pageRow);
	}
	
	//페이지네이션 클릭했을 때
	$("#pagination").on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page-no");
		$("#input-page-no").val(pageNo);
		inquiry(pageNo);
	})
   
   function setCalender(data){
	   var time = new Date();
	   time = time.getTime();
	   time -= (60*60*24*data*1000);
	   time = new Date(time);
  		var year = time.getFullYear()
  		var month =time.getMonth() + 1;
  		var day = time.getDate();
  		if(month < 10){
  			month = "0"+month;
  		}
  		if(day < 10){
  			day = "0"+day;
  		}
  		$("#Datepicker-prev").val(""+year+month+day);
  		
  		time = new Date();
  		year = time.getFullYear()
  		month =time.getMonth() + 1;
  		day = time.getDate();
  		if(month < 10){
  			month = "0"+month;
  		}
  		if(day < 10){
  			day = "0"+day;
  		}
  		$("#Datepicker-next").val(""+year+month+day);
   }
   
	//개월 수 조회
   $("input[name='period']").change(function(){
	   var time;
	   var val = $(this).val();
	   
	   switch(val){
	   	case '7':	
	   		time = 7;
	   		break;
	   	case '30':
	   		time = 30;
	   		break;
	   	case '90':
	   		time = 90;
	   		break;
	   	case '180':
	   		time = 180;
	   		break;
	   }
	   setCalender(time);
	   inquiry(1);
   }) 
   
   function setRowSpan(){
	   for(var i=0; i<$(".row-span").length;i++){
		   if(statuss == true){
			   cnt = 1;
		   }
		   if(prevNo == $(".row-span").eq(i).text()){
			   if(cnt == 1){
				   index = i-1;
			   }
			   $(".row-span").eq(i).remove();
			   cnt++;
			   $(".row-span").eq(index).attr("rowspan", cnt)
			   statuss = true;
		   }else{
			   statuss = false;
		   }
		   prevNo = $(".row-span").eq(i).text();
	   }
   }
    
    //조회함수
	function inquiry(pageNo){
	   var prev = $("#Datepicker-prev").val();
	   var next = $("#Datepicker-next").val();
	   $.ajax({
		   url:"/order/myTestOrderListByPeriod.hta",
		   data:{prev:prev, next:next, pageNo:pageNo},
		   method:"get"
	   }).done(function(data){
		   $("#table-myOrder tbody").empty();
		   $("#pagination").empty();
		   var row ="";
		   var p;
		   if(data.dto==null || data.dto==""){
			   row += "<tr><td colspan='6' class='text-center'>주문내역이 존재하지 않습니다.</td></tr>";
			   $("#table-myOrder tbody").append(row);
			   return;
		   }
		   for(var i=0; i<data.dto.length; i++){
			   row+="<tr>";
			   row+="<td class='row-span'>"
			   //console.log(data[i].testCreateDate)
			   row+="<a href='/order/orderTestDetail.hta?orderNo="+ data.dto[i].orderNo + "'><p style='margin: 0px; color: #666; font-weight: bold;'>";
			   var date = new Date(data.dto[i].testCreateDate);
			   row+= date.toLocaleDateString() + "</p>";
			   row+="<p>(" + data.dto[i].orderNo + ")</p></a>";
			   row+="</td>";
			   row+="<td style='color: #666; height: 67px;'>" + data.dto[i].testTitle + " > " + data.dto[i].ep + "</td>";
			   if(data.dto[i].discountWay == 'percent'){
				   p = data.dto[i].testprice * (100 - data.dto[i].discountPrice) * 0.01;
			   } else {
				   p = data.dto[i].testprice - data.dto[i].discountPrice;
			   }
			   row+="<td style='color: red;'>" + p.toLocaleString() + "원</td>";
			   row+="<td>" + data.dto[i].status + "</td>";
			   row+="</tr>";
		   }
		   $("#table-myOrder tbody").append(row);
		   setRowSpan();
		   setPagination(data.pagination);
	   })
	}
	
    //기간별 조회
   $("#btn-inquiry").click(function(e){
	   inquiry(1);
   })
   
   //달력 api
   $("#Datepicker-prev").datepicker({
	   showOn: "both", 
       buttonImage: "/imgs/달력.PNG", 
       buttonImageOnly: true,
	   changeMonth: true, 
       changeYear: true,
       nextText: '다음 달',
       prevText: '이전 달',
       showButtonPanel: true, 
       currentText: '오늘 날짜', 
       closeText: '닫기', 
       dateFormat: "yymmdd",
       changeMonth: true, 
       dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
       dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
       monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
       monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
   });
   
   $("#Datepicker-next").datepicker({
	   showOn: "both", 
       buttonImage: "/imgs/달력.PNG", 
       buttonImageOnly: true,
	   changeMonth: true, 
       changeYear: true,
       nextText: '다음 달',
       prevText: '이전 달',
       showButtonPanel: true, 
       currentText: '오늘 날짜', 
       closeText: '닫기', 
       dateFormat: "yymmdd",
       changeMonth: true, 
       dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
       dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
       monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
       monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       maxDate:0
   });
   
   $("#td-date img").css("margin-bottom", "5px");
   $("#td-date img").css("height", "25px");

   </script>
	<%@ include file="../common/footer.jsp"%>