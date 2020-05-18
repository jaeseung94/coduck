<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CODUCK - 1등 온라인 강좌</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   
   <!-- sy.css -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
   <link rel="stylesheet" href="<c:url value='/resources/css/sy-style.css' />">    
   <!-- sy.js -->
   <script src="/resources/js/common.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
  <%@ include file="../common/user-sidebar.jsp" %>
         
			<div class="col-sm-10">
            <div class="row">
               <div class="col-sm-12">
                  <h3>구매한 모의고사</h3>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-12">
                   <table class="table" id="my-order-history-table" >
                       <thead>
                           <tr>
                                <th>순번</th>
								<th>시험명</th>
								<th>시험회차</th>
								<th>응시여부</th>
                           </tr>
                       </thead>
                       <tbody>
                       <c:choose>
                         <c:when test="${empty userOrderTestLists }">
                         	<tr>
                         		<td colspan="4" class="text-center">없습니다.</td>
                         	</tr>
                         </c:when>
                         <c:otherwise>
                         	<c:forEach var="userOrderTestList" items="${userOrderTestLists }" varStatus="loop">
						        <tr>
							        <td>${loop.count }</td>
							        <td>${userOrderTestList.testName }</td>
							        <td>${userOrderTestList.testEp }</td>
							        <td>
							        <c:choose>
							            <c:when test="${userOrderTestList.testDone == 'Y' }">
							            	<button id="btn-detail" class="btn btn-info btn-xs" data-order-no="${userOrderTestList.testNo }">점수조회</button> | <a href="/test/test-result.hta?testNo=${userOrderTestList.testNo }" class="btn btn-info btn-xs">상세조회</a>
							            </c:when>
							            <c:when test="${userOrderTestList.testDone == 'N' }">
					             			<a href="/test/takeaTest.hta?testNo=${userOrderTestList.testNo }" class="btn btn-info btn-xs a-take-test" data-test-no="${userOrderTestList.testNo }">응시하기</a>
							            </c:when>
					             	</c:choose>
					             	</td>
						         </tr>
                         	</c:forEach>
                         </c:otherwise>
                       </c:choose>
                       </tbody>
                   </table>
               </div>
            </div>
         </div>
      </div>
   </div>
   
   <!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
	  <div class="modal-dialog">
	  
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title text-center">시험 결과</h4>
	      </div>
	      <div class="modal-body">
	        <table class="table">
	        	<thead>
	        		<tr>
		        		<th>번호</th>
						<th>과목명</th>
						<th>점수</th>
						<th>과락여부</th>
	        		</tr>
	        	</thead>
	        	<tbody>
	        	</tbody>
	        </table>
	      </div>
	        <p style="text-align: right; margin-right: 20px; margin-bottom: 20px;"><button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></p>
	    </div>
	    
	  </div>
	</div>
	
   <script type="text/javascript">
   
   //응시하기 클릭시
   $("#my-order-history-table").on("click", ".a-take-test", function(){
		event.preventDefault();
		var testNo = $(this).data("test-no");
		window.location.reload();
		window.open("/test/takeaTest.hta?testNo=" + testNo, "시험응시페이지", "width = 900, height = 850, top = 100, left = 200, location = no");
   })
   
 	//자세히보기 클릭했을 때	
	$("tbody").on("click", "#btn-detail", function(){
		var testNo = $(this).data("order-no");
		$.getJSON("/test/clickShowDetailTest.hta", {testNo:testNo}, function(result){
			$("#myModal tbody").empty();
			var row = "";
			$.each(result, function(index, item){
				row += "<tr>"
				row += "<td>" + item.subJLv + "</td>";
				row += "<td>" + item.name + "</td>";
				row += "<td>" + item.score + "</td>";
				if(item.isPassed == "Y"){
	 				row += "<td>통과</td>";
				} else {
	 				row += "<td>과락</td>";
				}
				row += "</tr>";
			})
			$("#myModal tbody").append(row);
			$("#myModal").modal("show");
			
		})
		/*  $.ajax({
			type:"GET",
			url:"/test/clickShowDetailTest.hta",
			data:testNo,
			success:function(){
				$("#myModal").modal("show");
			}
		}) */
		
	}) 
   </script>
<%@ include file="../common/footer.jsp"%>
















































