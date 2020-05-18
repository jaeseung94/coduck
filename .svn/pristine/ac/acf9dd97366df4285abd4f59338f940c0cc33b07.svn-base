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
	<div class="container" style="font-size: 17px; width: 1440px; min-height: 950px; margin-top: 50px;">
		<div class="row">
			<div class="col-sm-2" style="height: 900px;">
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
				<span>설정 / 프로필 설정</span>
				<h4>수강중인 강의</h4>
				<div class="row">
					<%-- <div class="col-md-12">
						<form id="sort-lect-form" action="userlecting.hta" class="form-inline" method="get">
							<div class="form-group" style="margin-right: 5px;">
								<label>정렬기준</label>
								<select class="form-control" name="sort" id="sort-lecture">
									<option value="1" ${empty param.sort || param.sort eq '1' ? 'selected' :'' }>진행도순</option>
									<option value="2" ${param.sort eq '2' ? 'selected' :'' }>제목순</option>
								</select>
							</div>
						</form>
					</div> --%>
						<%-- <c:if test="${empty userLectProcessivity }">
							<c:forEach var="userLect" items="${userLectList }" varStatus="loop">
								<div class="col-md-11" style="margin-top: 20px; margin-left:13px; padding-left: 0px;">
									<img src="${userLect.imagePath != null ? userLect.imagePath : '1212qwqw.GIF' }" style="float: left; width: 300px; height: 200px; margin-right: 20px;">
									<img src="${userLect.imagePath }" style="float: left; width: 300px; height: 200px; margin-right: 20px;">
									<h3>${userLect.lectTitle }</h3>
									<p>진행도</p>
									<progress value="0" max="10" style="width: 400px;"></progress>
									<p>구매일자 : <fmt:formatDate value="${userLect.lectCreateDate }" pattern="yyyy.MM.dd"></fmt:formatDate></p>
									<div class="text-right">
										<a href="/lecture/detail/dashboard.hta?lectureNo=${userLect.lectNo }" type="submit" class="btn btn-primary">이어서 학습하기</a>
									</div>
								</div>
							</c:forEach>
						</c:if> --%>
					<c:choose>
						<c:when test="${empty userLectList }">
							<div class="col-sm-12">
								<div class="text-center">
									<h3>없습니다</h3>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="userLect" items="${userLectList }" varStatus="loop">
							<c:forEach var="userLectProcessivity" items="${userLectProcessivity }">
							<c:if test="${userLect.lectNo == userLectProcessivity.lectNo }">
								<div class="col-md-11" style="margin-top: 20px; margin-left:13px; padding-left: 0px;">
									<img alt="" src="${userLect.imagePath }" style="float: left; width: 300px; height: 200px; margin-right: 20px;">
									<h3>${userLect.lectTitle }</h3>
									<p>진행도</p>
											<progress value="${userLectProcessivity.totalAccumulate }" max="${userLectProcessivity.totalTime }" style="width: 400px;"></progress>									
									<p>구매일자 : <fmt:formatDate value="${userLect.lectCreateDate }" pattern="yyyy.MM.dd"></fmt:formatDate></p>
									<div class="text-right">
										<a href="/lecture/detail/dashboard.hta?lectureNo=${userLect.lectNo }" type="submit" class="btn btn-primary">이어서 학습하기</a>
									</div>
								</div>
							</c:if>
							</c:forEach>
							</c:forEach>
						</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
	</div>
	<script type="text/javascript">
		$("#sort-lecture").change(function() {
			$("#sort-lect-form").submit();
		})
	</script>

<%@ include file="../common/footer.jsp"%>


















































