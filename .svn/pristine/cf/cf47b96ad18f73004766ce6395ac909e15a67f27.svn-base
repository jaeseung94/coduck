<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>내 정보</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%@ include file="../common/tag.jsp"%>
	<div class="container" style="font-size:17px; width:1440px;">
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

			<div class="col-sm-10">
				<p>장바구니는 최근에 추가했던 순서로 표시됩니다.</p>
				<span>내 결제 / 장바구니</span>
				<h4>강의 장바구니</h4>
				<div class="row">
					<table class="table" id="lecture-table">
						<thead id="lecture-thead">
							<tr>
								<th>전체선택<input type="checkbox" id="lectuer-all-checkbox" name="lect-all-price"/></th>
								<th>순번</th>
								<th>제목</th>
								<th>가격</th>
								<th>구매하기</th>
								<th>삭제하기</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${empty userCartLectLists }">
								<tr>
									<td colspan="5" class="text-center">고객님 추가좀 하세요</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="userCartLect" items="${userCartLectLists }" varStatus="loop">
									<tr>
										<td><input type="checkbox"  name="lectprice" value="${userCaertLect.cartLectNo }"/></td>
										<td>${loop.count }</td>
										<td>${userCartLect.lectTitle }</td>
										<td id="lectprice-${userCaertLect.cartLectNo }">${userCartLect.lectPrice }</td>
										<td><a href="" class="btn btn-primary btn-xs">구매하기</a></td>
										<td><a href="" class="btn btn-primary btn-xs">삭제하기</a></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
					<div class="text-right">
						<p>총 가격 : <span id="lecture-summary-price">0</span>원</p>
						<a href="" class="btn btn-primary">구매하기</a>
					</div>
				</div>
			</div>
			
			<div class="col-sm-10">
					<h4>모의고사 장바구니</h4>
					<div class="row">
						<table class="table" id="test-table">
							<thead>
								<tr>
									<th>전체선택<input type="checkbox" id="test-all-checkbox" name="test-all-price"/></th>
									<th>순번</th>
									<th>제목</th>
									<th>가격</th>
									<th>구매하기</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
								<c:when test="${empty userCartTestLists }">
									<tr>
										<td colspan="5" class="text-center">고객님 추가좀 하세요</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="userCartTest" items="${userCartTestLists }" varStatus="loop">
										<tr>
											<td><input type="checkbox"  name="testprice" value="${userCartTest.testLectNo }"/></td>
											<td>${loop.count }</td>
											<td>${userCartTest.testTitle }</td>
											<td>${userCartTest.testPrice }</td>
											<td><a href="" class="btn btn-primary btn-xs">구매하기</a></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="text-right">
							<p>총 가격 : <span id="test-summary-price">0</span>원</p>
							<a href="" class="btn btn-primary">구매하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	<script type="text/javascript">
		$("#lecture-table tbody :checkbox[name=lectprice]").change(function() {
			
			var totalPrice = 0;
			$("#lecture-table tbody :checkbox[name=lectprice]:checked").parents("tr").each(function(index, tr) {
				var price = parseInt($(tr).find('td:eq(3)').text());
				totalPrice += price;
			});			
			$("#lecture-summary-price").text(totalPrice);
		});
		
		
		$("#lecture-table thead :checkbox[name=lect-all-price]").change(function() {
			var totalPrice = 0;
			if($(this).is(":checked")){
				$("#lecture-table tbody :checkbox[name=lectprice]").prop("checked", true);
				$("#lecture-table tbody :checkbox[name=lectprice]:checked").parents("tr").each(function(index, tr) {
					var price = parseInt($(tr).find('td:eq(3)').text());
					totalPrice += price;
				});			
				$("#lecture-summary-price").text(totalPrice);
			}else{
				$("#lecture-table tbody :checkbox[name=lectprice]").prop("checked", false);
				$("#lecture-summary-price").text(totalPrice);
			}
			
		})
		
		
	
	$("#test-table tbody :checkbox[name=testprice]").change(function() {
		
		var totalPrice = 0;
		$("#lecture-table tbody :checkbox[name=testprice]:checked").parents("tr").each(function(index, tr) {
			var price = parseInt($(tr).find('td:eq(3)').text());
			totalPrice += price;
		});			
		$("#test-summary-price").text(totalPrice);
	});
	
	
	$("#test-table thead :checkbox[name=test-all-price]").change(function() {
		var totalPrice = 0;
		if($(this).is(":checked")){
			$("#lecture-table tbody :checkbox[name=testprice]").prop("checked", true);
			$("#lecture-table tbody :checkbox[name=testprice]:checked").parents("tr").each(function(index, tr) {
				var price = parseInt($(tr).find('td:eq(3)').text());
				totalPrice += price;
			});			
			$("#test-summary-price").text(totalPrice);
		}else{
			$("#test-table tbody :checkbox[name=testprice]").prop("checked", false);
			$("#test-summary-price").text(totalPrice);
		}
		
	})
	</script>
</body>
<%@ include file="../common/footer.jsp"%>
</html>

















































