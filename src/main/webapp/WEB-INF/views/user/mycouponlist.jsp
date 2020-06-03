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
         
			<div class="col-sm-9">
            <div class="row">
               <div class="col-sm-12">
                  <h3>보유한 쿠폰</h3>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-12">
                   <table class="table" id="my-order-history-table">
                       <thead>
                           <tr>
                               <th>쿠폰번호</th>
		                       <th>쿠폰제목</th>
		                       <th>쿠폰 가격 할인</th>
                           </tr>
                       </thead>
                       <tbody>
                       <c:choose>
                         <c:when test="${empty couponDetails }">
                         	<tr>
                         		<td colspan="6" class="text-center">보유하신 쿠폰이 없습니다.</td>
                         	</tr>
                         </c:when>
                         <c:otherwise>
                         	<c:forEach var="couponDetail" items="${couponDetails }" varStatus="loop">
		                         <tr>
					                 <td>${couponDetail.no }</td>
					                 <td>${couponDetail.title }</td>
					                 <c:choose>
					                 	<c:when test="${couponDetail.discountWay == 'percent' }">
					                 		<td>${couponDetail.discountPrice }%</td>
					                 	</c:when>
					                 	<c:otherwise>
							                 <td><fmt:formatNumber value="${couponDetail.discountPrice }" /> 원</td>
					                 	</c:otherwise>
					                 </c:choose>
					                 
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
















































