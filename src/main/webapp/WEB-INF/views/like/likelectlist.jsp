<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>내 정보</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/tag.jsp" %>
<%@ include file="../common/user-sidebar.jsp" %>	

		<c:if test="${param.error eq 'fail' }">
			<div class="row">
				<div class="col-sm-12">
					<div class="alert alert-danger">
						<strong> 위시리스트 추가 불가 </strong> 이미 추가했거나 구매하신 강의입니다.
					</div>
				</div>
			</div>
		</c:if>
		
		<div class="col-sm-10">
			<div class="row">
				<div class="col-sm-12">
					<h3>좋아요한 강의 리스트</h3>
				</div>
			</div>
			<div class="row">
			<c:choose>
				<c:when test="${empty userLikeLectList }">
					<div class="col-sm-12">
						<div class="text-center">
							<h3>없습니다</h3>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="userLikeLect" items="${userLikeLectList }" varStatus="loop">
						<div class="col-sm-12" style="margin-top: 20px;">
							<div class="col-sm-3" style="margin-top: 20px;">
							    <img src="${userLikeLect.likeLectImg != null ? userLikeLect.likeLectImg : '1212qwqw.GIF' }" style="width: 100%; height: 200px;">
							</div>
							<div class="col-sm-9" style="margin-top: 20">
							    <p style="margin-top: 30px;">${userLikeLect.likeLectTitle }</p>
							    <p>난이도 : ${userLikeLect.likeLectGrade }</p>
							    <p>가격 : ${userLikeLect.likeLectPrice }</p>
							    <p>할인가격 : ${userLikeLect.likeLectDiscountPrice }</p>
							</div>
						    <div class="text-right">
						        <a href="/lecture/detail/description.hta?lectureNo=${userLikeLect.lectNo }" style="margin-top: 20px;" class="btn btn-primary">강의 정보</a>
						    </div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	
</script>
</body>
<%@ include file="../common/footer.jsp" %>
</html>

















































