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
      <div class="row">
         <div class="col-sm-2">
				<p>내 학습</p>
				<ul style="list-style:none;">
					<li><a href="/user/userlecting.hta">수강중인 강의</a></li>
					<li><a href="/user/mybytestlist.hta">모의고사</a></li>
					<li><a href="/userquestion/myquestionlist.hta">강의 질문</a></li>
				</ul>
				<p>내 결제</p>
				<ul style="list-style:none;">
					<li><a href="/like/likelectlist.hta">위시리스트</a></li>
					<li><a href="/cart/userCartList.hta">장바구니</a></li>
					<li><a href="/user/mycouponlist.hta">내 쿠폰함</a></li>
					<li><a href="/order/userorderlectlist.hta">구매내역</a></li>
				</ul>
				<p>내 강의</p>
				<ul style="list-style:none;">
					<li id="teacher"><a href="/teacher/main.hta">내 강의</a></li>
				</ul>
				<p>관리자 문의</p>
				<ul style="list-style:none;">
					<li id="teacher"><a href="/user/userqueston.hta">문의하기</a></li>
				</ul>
			</div>
         
			<div class="col-sm-10">
            <div class="row">
               <div class="col-sm-12">
                  <h3>구매한 강의</h3>
                  <p>구매한 강의 리스트</p>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-12">
                   <table class="table" id="my-order-history-table">
                       <thead>
                           <tr>
                               <th>쿠폰번호</th>
		                       <th>쿠폰제목</th>
		                       <th>쿠폰 가격할인</th>
		                       <th>쿠폰 가격할인률</th>
                           </tr>
                       </thead>
                       <tbody>
                       <c:choose>
                         <c:when test="${empty couponDetails }">
                         	<tr>
                         		<td colspan="6" class="text-center">없어 돌아가</td>
                         	</tr>
                         </c:when>
                         <c:otherwise>
                         	<c:forEach var="couponDetail" items="${couponDetails }" varStatus="loop">
		                         <tr>
					                 <td>${couponDetail.no }</td>
					                 <td>${couponDetail.title }</td>
					                 <td>${couponDetail.discountPrice } 원</td>
					                 <td>${couponDetail.discountRate } %</td>
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
<%@ include file="../common/footer.jsp"%>
















































