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
	th {
		background-color: #efefef;
		text-align: center;
		vertical-align: middle;
	}
	
	.yyy > thead > tr > th  {
		vertical-align: middle;
		border: 1px solid #ddd;
	}
	
	.yyy > tbody > tr > td {
		text-align: center;
		vertical-align: middle;
		border: 1px solid #ddd;
	}
	
	.table {
		border: 1px solid #ddd;
	}
	
	.xxx td {
		text-align: left;
	}
</style>

</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%@ include file="../common/user-sidebar.jsp"%>

	<div class="col-sm-9">
		<p style="font-size: 18px;">주문내역</p>
		<table class="table xxx">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tr>
				<th>주문번호</th>
				<td style="color: red;">${test.no}</td>
			</tr>
			<tr>
				<th>주문일시</th>
				<td><fmt:formatDate pattern="yyyy-MM-dd a HH:mm:ss" value="${test.testCreateDate }"/></td>
			</tr>
			<tr>
				<th>결제정보</th>
				<td>${payment.pgProvider }</td>
			</tr>
			<tr>
				<th>주문하시는 분</th>
				<td>${user.name }	/	${user.email }</td>
			</tr>
		</table>
		<br>
		<p style="font-size: 18px;">구매하신 상품정보</p>
		<table class="table yyy">
			<thead>
				<tr>
					<th>No</th>
					<th>상품</th>
					<th>
						<p style="margin: 0px;">판매가</p>
						<p>(수량)</p>
					</th>
					<th>할인내역</th>
					<th>할인적용가</th>
					<th>진행상태</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="price" value="0"/>
				<c:set var="discount" value="0"/>
				<c:forEach var="info" items="${infos }" varStatus="loop">
					<c:set var="price" value="${price + info.testprice }"/>
					<tr>
						<td style="font-weight: bold;">${loop.count }</td>
						<td style="color: #318cff;">${info.testTitle} > ${info.ep }</td>
						<td>
							<p style="margin: 0px;"><fmt:formatNumber value="${info.testprice }"/>원</p>
							<p>(1)</p>
						</td>
						<td><fmt:formatNumber>
						<c:choose>
							<c:when test="${info.discountWay == 'percent'}">
								${info.testprice * (100 - info.discountPrice) * 0.01 }
								<c:set var="discount" value="${discount + (info.testprice * (100 - info.discountPrice) * 0.01) }"/>
								<c:set var="discount2" value="${info.testprice * (100 - info.discountPrice) * 0.01 }"></c:set>
							</c:when>
							<c:otherwise>
								${info.discountPrice }
								<c:set var="discount" value="${discount + info.discountPrice }"/>
								<c:set var="discount2" value="${info.discountPrice }"></c:set>
							</c:otherwise>
						</c:choose>
						</fmt:formatNumber>원</td>
						<td style="color: red;"><fmt:formatNumber>${info.testprice - discount2}</fmt:formatNumber>원</td>
						<td>${info.status }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<br>
		<p style="font-size: 18px;">지불정보</p>
		<table class="table yyy">
			<thead>
				<tr>
					<th>상품주문금액</th>
					<th>쿠폰할인</th>
					<th>적립금사용</th>
					<th>실제지불금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="color: #318cff; font-weight: bold;"><fmt:formatNumber><c:out value="${price }"/></fmt:formatNumber>원</td>
					<td><fmt:formatNumber><c:out value="${discount }"/></fmt:formatNumber>원</td>
					<c:choose>
						<c:when test="${history.role == 'M' }">
							<td><fmt:formatNumber>${history.point }</fmt:formatNumber>원</td>
						</c:when>
						<c:otherwise>
							<td>0원</td>
						</c:otherwise>
					</c:choose>
					<td style="color: #318cff; font-weight: bold;"><fmt:formatNumber><c:out value="${infos[0].totalPrice }"/></fmt:formatNumber>원</td>
				</tr>
			</tbody>
		</table>
	</div>
	</div>
	</div>

	<script type="text/javascript">
   

   </script>
	<%@ include file="../common/footer.jsp"%>