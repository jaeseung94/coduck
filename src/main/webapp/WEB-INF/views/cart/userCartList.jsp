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
            <h4>강의 및 모의고사 장바구니</h4>
            <form action="orderlectform.hta" method="post">
               <table class="table" id="lecture-table">
                  <thead id="lecture-thead">
                     <tr>
                        <th><input type="checkbox" id="lectuer-all-checkbox" name="lect-all-price"/></th>
                        <th>순번</th>
                        <th>제목</th>
                        <th>가격</th>
                        <th>할인가격</th>
                        <th>삭제하기</th>
                     </tr>
                  </thead>
                  <tbody>
                  <c:choose>
                     <c:when test="${empty userCartLectLists }">
                        <tr>
                           <td colspan="5" class="text-center">없습니다</td>
                        </tr>
                     </c:when>
                     <c:otherwise>
                        <c:forEach var="userCartLect" items="${userCartLectLists }" varStatus="loop">
                           <tr>
                              <td><input type="checkbox"  name="lectnos" value="${userCartLect.lectNo }"/></td>
                              <td>${loop.count }</td>
                              <td>${userCartLect.lectTitle }</td>
                              <td>${userCartLect.lectPrice }</td>
                              <td>${userCartLect.discountPrice }</td>
							  <td><a href="/cart/cartlectdel.hta?lectno=${userCartLect.lectNo }" class="btn btn-primary btn-xs" id="del-lect-cart" data-lect-no="${userCartLect.lectNo }">삭제하기</a></td> 
                               <%-- <td><button type="button" class="btn btn-primary btn-xs" id="del-lect-cart" data-lect-no="${userCartLect.lectNo }">삭제하기</button></td> --%>
                           </tr>
                        </c:forEach>
                     </c:otherwise>
                  </c:choose>
                  </tbody>
               </table>
               <div class="form-group">
                  <input type="hidden" id="lect-total" name="order-lect-total-price"/>
                  <p>총 가격 : <span id="lecture-summary-price">0</span>원</p>
                  <button type="button" class="btn btn-primary" id="btn-lect-buy">강의 구매하기</button>
               </div>
               </form>
         </div>
         
         <div class="col-sm-10">
            <h4>모의고사 장바구니</h4>
            <form action="ordertestform.hta" method="post">
               <table class="table" id="test-table">
                  <thead id="test-thead">
                     <tr>
                        <th><input type="checkbox" id="test-all-checkbox" name="test-all-price"/></th>
                        <th>순번</th>
                        <th>제목</th>
                        <th>가격</th>
                        <th>삭제하기</th>
                     </tr>
                  </thead>
                  <tbody>
                  <c:choose>
                     <c:when test="${empty userCartTestLists }">
                        <tr>
                           <td colspan="5" class="text-center">장바구니에 담긴 강의가 없습니다</td>
                        </tr>
                     </c:when>
                     <c:otherwise>
                        <c:forEach var="userCartTest" items="${userCartTestLists }" varStatus="loop">
                           <tr>
                              <td><input type="checkbox"  name="testnos" value="${userCartTest.no }"/></td>
                              <td>${loop.count }</td>
                              <td>${userCartTest.name }  >  ${userCartTest.ep }</td>
                              <td>${userCartTest.price }</td>
                              <td><a href="/cart/carttestdel.hta?testno=${userCartTest.no }" class="btn btn-primary btn-xs">삭제하기</a></td>
                           </tr>
                        </c:forEach>
                     </c:otherwise>
                  </c:choose>
                  </tbody>
               </table>
               <div class="form-group">
                  <input type="hidden" id="test-total" name="order-test-total-price"/>
                  <p>총 가격 : <span id="test-summary-price">0</span>원</p>
                  <button type="button" class="btn btn-primary" id="btn-test-buy">모의고사 구매하기</button>
               </div>
               </form>
         </div>
         
         </div>
      </div>
   <script type="text/javascript">
   		
   		//구매하기 버튼 클릭시
   		$("#btn-lect-buy").click(function(){
   			var i = $("#lecture-summary-price").text();
   			if($("input:checkbox[name=lectnos]").is(":checked") == false){
   				alert("다시 체크해주세요");
   			}else{
   				$('#btn-lect-buy').attr("type", "submit");
   			}	
   		})
   		
   		//구매하기 버튼 클릭시
   		$("#btn-test-buy").click(function(){
   			var i = $("#test-summary-price").text();
   			if($("input:checkbox[name=testnos]").is(":checked") == false){
   				alert("다시 체크해주세요");
   			}else{
   				$('#btn-test-buy').attr("type", "submit");
   			}	
   		})
   
      $("#lecture-table tbody :checkbox[name=lectnos]").change(function() {
         
         var totalPrice = 0;
         $("#lecture-table tbody :checkbox[name=lectnos]:checked").parents("tr").each(function(index, tr) {
            var price = parseInt($(tr).find('td:eq(4)').text());
            totalPrice += price;
            $("#lect-total").val(totalPrice);
         });
         $("#lect-total").val(totalPrice);
         $("#lecture-summary-price").text(totalPrice);
      });
      
      
      $("#lecture-table thead :checkbox[name=lect-all-price]").change(function() {
         var totalPrice = 0;
         if($(this).is(":checked")){
            $("#lecture-table tbody :checkbox[name=lectnos]").prop("checked", true);
            $("#lecture-table tbody :checkbox[name=lectnos]:checked").parents("tr").each(function(index, tr) {
               var price = parseInt($(tr).find('td:eq(4)').text());
               totalPrice += price;
            });
            $("#lect-total").val(totalPrice);
            $("#lecture-summary-price").text(totalPrice);
         }else{
            $("#lecture-table tbody :checkbox[name=lectnos]").prop("checked", false);
            $("#lecture-summary-price").text(totalPrice);
         }
         
      })
      
   
   $("#test-table tbody :checkbox[name=testnos]").change(function() {
      
      var totalPrice = 0;
      $("#test-table tbody :checkbox[name=testnos]:checked").parents("tr").each(function(index, tr) {
         var price = parseInt($(tr).find('td:eq(3)').text());
         totalPrice += price;
      });
      $("#test-total").val(totalPrice);
      $("#test-summary-price").text(totalPrice);
   });
   
   
   $("#test-table thead :checkbox[name=test-all-price]").change(function() {
      var totalPrice = 0;
      if($(this).is(":checked")){
         $("#test-table tbody :checkbox[name=testnos]").prop("checked", true);
         $("#test-table tbody :checkbox[name=testnos]:checked").parents("tr").each(function(index, tr) {
            var price = parseInt($(tr).find('td:eq(3)').text());
            totalPrice += price;
         });         
         $("#test-summary-price").text(totalPrice);
      }else{
         $("#test-table tbody :checkbox[name=testnos]").prop("checked", false);
         $("#test-summary-price").text(totalPrice);
      }
      
   })
   
   /*  $("#del-lect-cart").click(function() {
	   var no = $(this).data("lect-no");
		$.get("/cart/cartlectdel.hta", {lectno:no}, function(result) {
			alert("데이터삭제");
			reload();
		})
   })  */
   
   </script>


<%@ include file="../common/footer.jsp"%>
















































