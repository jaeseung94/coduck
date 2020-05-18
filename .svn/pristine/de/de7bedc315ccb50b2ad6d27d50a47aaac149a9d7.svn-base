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
   <div class="container" style="font-size: 17px; width: 1440px;">
			<c:if test="${param.error eq 'fail' }">
				<div class="row">
					<div class="col-sm-12">
						<div class="alert alert-danger">
							<strong>구매 실패 </strong> 입력오류
						</div>
					</div>
				</div>
			</c:if>
      <div class="row">
         <div class="col-sm-2">
			<p>내 학습</p>
			<ul style="list-style: none;">
				<li><a href="/user/userlecting.hta">수강중인 강의</a></li>
				<li><a href="/user/mybytestlist.hta">모의고사</a></li>
				<li><a href="/userquestion/myquestionlist.hta">강의 질문</a></li>
			</ul>
			<p>내 결제</p>
			<ul style="list-style: none;">
				<li><a href="/like/likelectlist.hta">위시리스트</a></li>
				<li><a href="/cart/userCartList.hta">장바구니</a></li>
				<li><a href="/user/mycouponlist.hta">내 쿠폰함</a></li>
				<li><a href="/order/userorderlectlist.hta">구매내역</a></li>
			</ul>
			<p>내 강의</p>
			<ul style="list-style: none;">
				<li id="teacher"><a href="/teacher/main.hta">내 강의</a></li>
			</ul>
			<p>관리자 문의</p>
			<ul style="list-style: none;">
				<li id="teacher"><a href="/user/userqueston.hta">문의하기</a></li>
				<li><a href="/userquestion/userqnatoadmlist.hta">문의 내역 조회</a></li>
			</ul>
		</div>

			
			<c:if test="${param.error eq 'failcartno' }">
				<div class="row">
					<div class="col-sm-12">
						<div class="alert alert-danger">
							<strong>구매 실패 </strong> 입력오류
						</div>
					</div>
				</div>
			</c:if>

			<div class="col-sm-10">
            <div class="row">
               <div class="col-sm-12">
                  <h3>구매할 시험 정보</h3>
                  <p>구매할 시험 정보를 확인하세요</p>
               </div>
            </div>
            <div class="row">
            
               <div class="col-sm-12">
               <form action="/order/ordertests.hta" method="post" class="form-horizontal">
                  <table class="table" id="test-table">
                     <thead id="test-thead">
                        <tr>
                           <th>순번</th>
                           <th>제목</th>
                           <th>가격</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:choose>
                           <c:when test="${empty userChoiceTestList }">
                              <tr>
                                 <td colspan="3" class="text-center">선택한 상품이 없습니다.</td>
                              </tr>
                           </c:when>
                           <c:otherwise>
                              <c:forEach var="userChoiceTestList" items="${userChoiceTestList }" varStatus="loop">
                                 <tr>
      
                                    <td>${loop.count }<input type="hidden" class="form-control" name="testno" value="${userChoiceTestList.no }"/></td>
                                    <td>${userChoiceTestList.name }</td>
                                    <td>${userChoiceTestList.price } 원</td>
                                    <td ></td>
                                 </tr>
                              </c:forEach>
                           </c:otherwise>
                        </c:choose>
                     </tbody>
                     <tfoot>
                        <tr>
                           <td colspan="2">구매가격</td>
                           <td><strong id="test-summary-price">0</strong> 원</td>
                           <td></td>
                        </tr>
                     </tfoot>
                  </table>
                  <!-- <form action="/order/orderlects.hta" method="post" class="form-horizontal"> -->
                     <input type="hidden" id="coupon-no" class="form-control" name="choicecouponno" disabled="disabled" />
                     <div class="form-group">
                        <label class="control-label col-sm-2">계좌번호</label>
                        <div class="col-sm-3">
                           <input type="text" class="form-control" name="bankno" />
                        </div>
                     </div>
                     <%-- <div class="form-group">
                        <label class="control-label col-sm-2">포인트</label>
                        <div class="col-sm-3" id="">
                           <input type="number" class="form-control" name="userpoint" id="user-point" value="${userPoint.point }"/>
                        </div>
                        <button type="button" class="btn btn-success" id="usepoint">포인트 사용하기</button>
                     </div> --%>
                     <div class="form-group">
                        <label class="control-label col-sm-2">결재금액</label>
                        <div class="col-sm-3">
                           <input type="text" readonly="readonly"  name="testtotalprices" id="test_total_price" class="form-control">
                        </div>
                        <label class="control-label col-sm-1 text-left" style="margin-left: -70px;">원</label>
                        <div class="col-sm-2">
                           <button type="button" id="btn-open-coupon-modal" class="btn btn-success">쿠폰 사용하기</button>
                        </div>
                        <div class="col-sm-1 col-sm-offset-1">
                           <button type="submit" class="btn btn-primary" onclick="checkform(event)">구매하기</button>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>


   <div id="modal-my-coupons" class="modal fade" role="dialog">
      <div class="modal-dialog modal-lg">

         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">나의 쿠폰 리스트</h4>
            </div>
            <div class="modal-body">
               <table class="table" id="modal-coupon-detail-table">
                  <thead>
                     <tr>
                        <th>쿠폰번호</th>
                        <th>쿠폰제목</th>
                        <th>쿠폰 가격할인</th>
                        <th>쿠폰 가격할인률</th>
                        <th>사용하기</th>
                     </tr>
                  </thead>
                  <tbody>

                  </tbody>
               </table>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
         </div>
      </div>
   </div>
   <script type="text/javascript">
   var everywherePrice = 0;
   var pointPrice = 0;
   
   $(function() {
      var totalPrice = 0;
      
      $("#test-table tbody td").parents("tr").each(function(index, tr) {
         var price = parseInt($(tr).find('td:eq(2)').text());
         totalPrice += price;
      });
      $("#test-summary-price").text(totalPrice);
      $("#test_total_price").val(totalPrice);
      everywherePrice = totalPrice;
   })
   
 

   
   $("#btn-open-coupon-modal").on('click', function() {
      
      var usedCouponNo = $("#coupon-no").val();
      
      var $tbody = $("#modal-coupon-detail-table tbody").empty();
      $.getJSON("/admin/couponDetails.hta", function(result) {
         $.each(result, function(index, coupon) {

            var row = "<tr>";
            row += "<td id='coupon-no'>" + coupon.no + "</td>";
            row += "<td>" + coupon.title + "</td>";
            row += "<td>" + coupon.discountPrice + "</td>";
            row += "<td>" + coupon.discountRate + "%</td>";
            if (usedCouponNo == coupon.no) {
               row += "<td><button class='btn coupon-info btn-danger btn-xs' >취소</button></td>";
            } else {
               row += "<td><button class='btn coupon-info btn-primary btn-xs'>쿠폰적용</button></td>";
            }
            
            row += "</tr>";

            $tbody.append(row);
            
            
            
            $('.coupon-info').click(function() {
               $(this).text("취소").removeClass("btn-primary").addClass("btn-danger");
               var $tr = $(this).closest("tr");
               var totalPrice = parseInt($("#test-summary-price").text());                  
      
               var couponDiscountPrice = 0;
               var discountPrice = parseInt($tr.find("td:eq(2)").text());
               var discountRate = parseInt($tr.find("td:eq(3)").text());
               var couponNo = parseInt($tr.find("td:eq(0)").text());
               $("#coupon-no").val(couponNo).prop('disabled', false);
               

               if(discountPrice != 0){
                  totalPrice -= discountPrice;
                  $("#test_total_price").val(totalPrice);
               }else{
                  couponDiscountPrice = totalPrice * (1- discountRate/100);
                  $("#test_total_price").val(couponDiscountPrice);
               }
               
               $("#modal-my-coupons").modal("hide");
            })
            
            
         })
         
         $("#modal-my-coupons").modal("show");
         
         $('.btn-danger').click(function() {
            alert("취소버튼 누름");
            if($(this).text() == '취소'){
               $(this).text('쿠폰적용');
               $(this).removeClass("btn-danger").addClass("btn-primary");
               
               $("#test_total_price").val(everywherePrice);
            }
         })

      })
   })
   </script>
<%@ include file="../common/footer.jsp"%>
















































