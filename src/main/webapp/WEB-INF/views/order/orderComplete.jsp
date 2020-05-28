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

<!-- sy.css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/sy-style.css' />">
<!-- sy.js -->
<script src="/resources/js/common.js"></script>
<style type="text/css">
	.center {
		 text-align: center;
	}
	
	#sum-table {
		width:100%;
		border-collapse:collapse; 
		background-color: #f5f5f5; 
		border: 2px solid black;
		vertical-align: middle;
	}
	
	#sum-table th, #sum-table td {
		text-align: center;
		border: 1px solid black;
	}
	
	#sum-table th {
		height: 35px;
	}
	
	#sum-table td {
		height: 60px;
	}
	
	#tr-sum span{
		font-weight: bold;
		font-size: 23px;
	}
	
	.xx th, .xx td {
		border: 1px solid #ddd;
	}
	
	.table th {
		background-color: #f5f5f5;
	}
	
	.yy th, .yy td{
		padding: 15px;
	}
	
	.btn-black-lg {
		  background-color: #555555; 
		  border: none;
		  color: white;
		  padding: 15px 32px;
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 16px;
		  margin: 4px 2px;
		  cursor: pointer;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%@ include file="../common/user-sidebar.jsp"%>

	<div class="col-sm-9">
		<img alt="" src="/imgs/주문완료.PNG" style="width: 100%; height: 90px;">
		<br>
		<br>
		<div style="text-align: center;">
			<h2>"주문이 정상적으로 처리되었습니다."</h2>
			<h4>코덕을 이용해주셔서 감사합니다.</h4>
		</div>
		<br>
		<br>
		<h4 style="font-weight: bold;">주문상품 정보 및 결제내역</h4>
		<table class="table xx" style="border: 1px solid #ddd; border-top: 2px solid black">
			<thead>
				<tr style="background-color: #f5f5f5;">
					<th class="center">상품명/옵션</th>
					<th class="center">수량</th>
					<th class="center">상품금액</th>
					<th class="center">쿠폰할인금액</th>
					<th class="center">적립금사용금액</th>
				</tr>
			</thead>
			<tbody class="center">
					<c:set var="originPrice" value="0"></c:set>
					<c:forEach var="info" items="${ordInfos }" varStatus="loop">
						<c:set var="infoLen" value="${loop.count }"></c:set>
						<c:set var="originPrice" value="${originPrice + info.testprice }"></c:set>
						<tr>
							<c:set var="totalPrice" value="${info.totalPrice }"></c:set>
							<td>${info.testTitle } > ${info.ep }</td>
							<td>1</td>
							<td><fmt:formatNumber value="${info.testprice }"/></td>
							<c:choose>
								<c:when test="${info.discountWay eq 'percent' }">
									<td><fmt:formatNumber value="${info.testprice * info.discountPrice*0.01 }"/></td>
								</c:when>
								<c:otherwise>
									<td><fmt:formatNumber value="${info.discountPrice }"/></td>
								</c:otherwise>
							</c:choose>
							<td class="row-span">
								<c:choose>
									<c:when test="${not empty point}">
										<fmt:formatNumber value="${point.point }"/>
									</c:when>
									<c:otherwise>
										0
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
			</tbody>
		</table>
		<br>
		
		<table id="sum-table" >	
			<colgroup>
				<col width="33%">
				<col width="33%">
				<col width="*">
			</colgroup>
			<thead>
				<tr>
					<th>상품금액 <span>(상품 : <span id="span-cnt">${infoLen}</span>건)</span></th>
					<th>총 할인금액</th>
					<th>최종 결제금액</th>
				</tr>
			</thead>
			<tbody>
				<tr id="tr-sum">
					<td><span id="span-total-price"><fmt:formatNumber><c:out value="${originPrice }"/></fmt:formatNumber></span>원</td>
					<td><span style="margin-right: 30px; font-size: 20px;" class="glyphicon glyphicon-minus-sign"></span><span><fmt:formatNumber><c:out value="${originPrice - totalPrice }"/></fmt:formatNumber></span>원</td>
					<td><img style="margin: 0px 30px 5px 0px; height: 22px;" alt="" src="/imgs/equals.png"/><span style="color: red;" id="span-final-price"><fmt:formatNumber><c:out value="${totalPrice }"/></fmt:formatNumber></span>원</td>
				</tr>
			</tbody>
		</table>
		<br>
		<br>
		<table class="table xx yy" style="border: 1px solid #ddd; border-top: 2px solid black;">
			<tr>
				<th style="vertical-align: middle;">
					<div  style="min-height: 40px;">
						주문번호
					</div>
				</th>
				<td>${ordTest.no }</td>
			</tr>
			<tr>
				<th style="vertical-align: middle;">
					<div  style="min-height: 40px; vertical-align: middle;">
						주문일시
					</div>
				</th>
				<td><fmt:formatDate value="${ordTest.testCreateDate }" pattern="yyyy-MM-dd a hh:mm:ss"/></td>
			</tr>
			<tr>
				<th style="vertical-align: middle;">주문자 정보</th>
				<td>
					<ul style="list-style: none; padding: 0px;">
						<li>주문하시는 분 : ${user.name }</li>
						<li>휴대폰번호 : 010-1234-4565</li>
						<li>이메일 : ${user.email }</li>
					</ul>
				</td>
			</tr>
			<tr>
				<th>
					<div  style="min-height: 40px; vertical-align: middle;">
						결제정보
					</div>
				</th>
				<td>
					<ul style="list-style: none; padding:0px">
						<li>결제방식 : ${payment.pgProvider }</li>
					</ul>
				</td>
			</tr>
		</table>
		
		<p style="text-align: center;">
			<br>
			<button class="btn-black-lg" type="button" id="btn-home" >홈으로</button>
			<button class="btn-black-lg" type="button" id="btn-ord-list" style="background-color: #f44336;">나의 주문현황</button>
		</p>
	</div>
	</div>
	</div>


	<script type="text/javascript">
		var len = ${infoLen};
		var price = ${originPrice};
		
		$(".row-span").not(":eq(0)").remove();
		$(".row-span").eq(0).attr("rowspan", len);
		$(".row-span").eq(0).css("vertical-align", "middle");
		
		$("#btn-home").click(function(){
			location.href = "/home.hta";
		})	
		
		$("#btn-ord-list").click(function(){
			location.href = "/order/userorderlectlist.hta";
		})		
   </script>
	<%@ include file="../common/footer.jsp"%>