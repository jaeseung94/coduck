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
   <style type="text/css">
    ul.tabs {
            margin: 0;
            padding: 0;
            float: left;
            list-style: none;
            height: 32px; /*--Set height of tabs--*/
            border-bottom: 1px solid #999;
            border-left: 1px solid #999;
            width: 100%;
        }
        ul.tabs li {
            float: left;
            margin: 0;
            padding: 0;
            height: 31px; /*--Subtract 1px from the height of the unordered list--*/
            line-height: 31px; /*--Vertically aligns the text within the tab--*/
            border: 1px solid #999;
            border-left: none;
            margin-bottom: -1px; /*--Pull the list item down 1px--*/
            overflow: hidden;
            position: relative;
            background: #e0e0e0;
        }
        ul.tabs li a {
            text-decoration: none;
            color: #000;
            display: block;
            font-size: 1.2em;
            padding: 0 20px;
            /*--Gives the bevel look with a 1px white border inside the list item--*/
            border: 1px solid #fff; 
            outline: none;
        }
        ul.tabs li a:hover {
            background: #ccc;
        }
        html ul.tabs li.active, html ul.tabs li.active a:hover  {
             /*--Makes sure that the active tab does not listen to the hover properties--*/
            background: #fff;
            /*--Makes the active tab look like it's connected with its content--*/
            border-bottom: 1px solid #fff; 
        }

        /*Tab Conent CSS*/
        .tab_container {
            border-top: none;
            overflow: hidden;
            clear: both;
            float: left; 
            width: 100%;
            background: #fff;
        }
        .tab_content {
            padding: 20px;
            font-size: 1.2em;
        }
   </style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
  <%@ include file="../common/user-sidebar.jsp" %>
         
			<div class="col-sm-9">
            <br>
            <br>
            <div class="row">
               <div class="col-sm-12">
               <div id="wrapper">    
				    <!--탭 메뉴 영역 -->
				    <ul class="tabs">
				        <li><a href="#tab1">응시한 모의고사</a></li>
				        <li><a href="#tab2">미응시 모의고사</a></li>
				    </ul>
				
				    <!--탭 콘텐츠 영역 -->
				    <div class="tab_container">
				        <div id="tab1" class="tab_content">
				            <!--Content-->
							<br/>
						   <table class="table">
		                       <thead>
		                           <tr>
		                                <th>순번</th>
										<th>시험명</th>
										<th>시험회차</th>
										<th></th>
		                           </tr>
		                       </thead>
		                       <tbody>
						            <c:choose>
			                         <c:when test="${empty done }">
			                         	<tr>
			                         		<td colspan="4" class="text-center">없습니다.</td>
			                         	</tr>
			                         </c:when>
			                         <c:otherwise>
			                         	<c:forEach var="d" items="${done }" varStatus="loop">
									        <tr>
										        <td>${loop.count }</td>
										        <td>${d.testName }</td>
										        <td>${d.testEp }</td>
										        <td>
										        <c:choose>
										            <c:when test="${d.testDone == 'Y' }">
										            	<button id="btn-detail" class="btn btn-info btn-xs" data-order-no="${d.testNo }">점수조회</button> | <a href="/test/test-result.hta?testNo=${d.testNo }" class="btn btn-info btn-xs">상세조회</a>
										            </c:when>
										            <c:when test="${d.testDone == 'N' }">
								             			<a href="/test/takeaTest.hta?testNo=${userOrderTestList.testNo }" class="btn btn-info btn-xs a-take-test" data-test-no="${d.testNo }">응시하기</a>
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
				
				        <div id="tab2" class="tab_content">
				           <!--Content-->
				           <br>
			              <table class="table" >
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
		                         <c:when test="${empty notYet }">
		                         	<tr>
		                         		<td colspan="4" class="text-center">없습니다.</td>
		                         	</tr>
		                         </c:when>
		                         <c:otherwise>
		                         	<c:forEach var="e" items="${notYet }" varStatus="loop">
								        <tr>
									        <td>${loop.count }</td>
									        <td>${e.testName }</td>
									        <td>${e.testEp }</td>
									        <td>
									        <c:choose>
									            <c:when test="${e.testDone == 'Y' }">
									            	<button id="btn-detail" class="btn btn-info btn-xs" data-order-no="${e.testNo }">점수조회</button> | <a href="/test/test-result.hta?testNo=${e.testNo }" class="btn btn-info btn-xs">상세조회</a>
									            </c:when>
									            <c:when test="${e.testDone == 'N' }">
							             			<a href="/test/takeaTest.hta?testNo=${e.testNo }" class="btn btn-info btn-xs a-take-test" data-test-no="${e.testNo }">응시하기</a>
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
   
   $(".tab_content").hide(); //Hide all content
   $("ul.tabs li:first").addClass("active").show(); //Activate first tab
   $(".tab_content:first").show(); //Show first tab content

   //On Click Event
   $("ul.tabs li").click(function() {

       $("ul.tabs li").removeClass("active"); //Remove any "active" class
       $(this).addClass("active"); //Add "active" class to selected tab
       $(".tab_content").hide(); //Hide all tab content

       var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
       $(activeTab).fadeIn(); //Fade in the active ID content
       return false;
   });
   
   //응시하기 클릭시
   $(".table").on("click", ".a-take-test", function(){
		event.preventDefault();
		var testNo = $(this).data("test-no");
		window.location.reload();
		window.open("/test/takeaTest.hta?testNo=" + testNo, "시험응시페이지", "width = 1200, height = 850, top = 100, left = 200, location = no");
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
	}) 
   </script>
<%@ include file="../common/footer.jsp"%>

