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
	<%@ include file="../common/user-sidebar.jsp" %>

			<div class="col-sm-10">
				<p>구매내역은 최근에 구매했던 순서로 표시됩니다.</p>
				<span>내 결제 / 구매내역</span>
				<h4>강의 구매내역</h4>
				<div class="row">
					<table class="table">
						<thead>
							<tr>
								<th>순번</th>
								<th>제목</th>
								<th>가격</th>
								<th>구매가격</th>
								<th>구매날짜</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${empty userLectList }">
								<tr>
									<td colspan="5" class="text-center">없습니다</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="userbyLect" items="${userLectList }" varStatus="loop">
									<tr>
										<td>${loop.count }</td>
										<td>${userbyLect.lectTitle }</td>
										<td>${userbyLect.lectPrice }</td>
										<td>${userbyLect.totalPrice }</td>
										<td><fmt:formatDate value="${userbyLect.lectCreateDate }" pattern="yyyy.MM.dd"/></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="col-sm-10">
				<h4>모의고사 구매내역</h4>
				<div class="row">
					<table class="table">
						<thead>
							<tr>
								<th>순번</th>
								<th>제목</th>
								<th>가격</th>
								<th>구매가격</th>
								<th>구매날짜</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>자바 한달 마스터</td>
								<td>500000</td>
								<td>500000</td>
								<td>2016-05-05</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>
</body>
<%@ include file="../common/footer.jsp"%>
</html>

















































