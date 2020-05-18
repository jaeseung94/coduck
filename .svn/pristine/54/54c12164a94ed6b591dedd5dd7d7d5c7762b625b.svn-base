<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CODUCK - 1등 온라인 강좌</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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

			<div class="col-sm-10" style="margin-top: 30px;">
				<p>내 학습 / 내 질문</p>
				<h4>내 질문</h4>
				<div class="row">
					<div class="col-md-12">
						<%-- <form id="sort-question-form" action="userquestion.hta" class="form-inline" method="get">
							<div class="form-group" style="margin-right: 20px;">
								<label>정렬기준</label>
								<select class="form-control" name="sort" id="selectquestion">
									<option value="1" ${empty param.sort || param.sort eq '1' ? 'selected' :'' }>미답변</option>
									<option value="2" ${param.sort eq '2' ? 'selected' :'' }>답변완료</option>
								</select>
							</div>
						</form> --%>
					</div>
				</div>
				<div class="row" id="1">
					<c:choose>
						<c:when test="${empty userQuestionList }">
							<h3>질문내역 없음</h3>
						</c:when>
						<c:otherwise>
							<c:forEach var="userQuestionList" items="${userQuestionList }" varStatus="loop">
								<div class="col-md-10" style="border: 1px solid lightgreen; margin-top: 10px; margin-bottom: 10px;">
									<h3 style="font-weight: bold; background-color: #F3F781;">레슨명 : ${userQuestionList.questionLessonTitle }</h3>
									<p style="padding-top: 10px; padding-bottom: 10px;">${userQuestionList.questionContents }</p>
									<p>
										<c:choose>
											<c:when test="${userQuestionList.isAnswered == 'Y' }">
											답변여부 : <a href="/lecture/detail/question.hta?lectureNo=${userQuestionList.lectNo }" style="color: red;">답변완료</a>
										</c:when>
											<c:when test="${userQuestionList.isAnswered == 'N' }">
											답변여부 : <a style="color: blue;">답변대기중</a>
										</c:when>
										</c:choose>
									</p>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#selectquestion").change(function() {
			var sortNo = $("#selectquestion").val();
			alert(sortNo);
			$.getJSON("/userquestion/userquestion.hta", {sortNo:sortNo}, function(result) {
				$("#1").empty();
				var row = "";
				$.each(result, function(index, item) {
					if(item.length == 0){
						row += "<h3>조건검색 리스트 없음</h3>"
					}else {
						row += "<h3> 레슨명 " + item.questionLessonTitle +"</h3>"
						row += "<p>" + item.questionContents +"</p>"
						row += "<p>" + item.questionLessonTitle +"</p>"
					}
				})
				$("#1").append(row);
			})
		})
	</script>

	<%@ include file="../common/footer.jsp"%>