<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
  	.zzz {
  		border: 3px #69c solid; padding: 20px; margin-bottom: 20px;
  	}
  	
  	.v {
  		margin-left: 20px
  	}
  	
  	.font-up{
  		font-size: 15px;
  	}
  	
  	th, td { 
  		text-align: center;
  	}
  	
  </style>
</head>
<body>
<%@ include file="../common/tag.jsp" %>

<div class="container">

	<div class="row">
		<h2>응시과목 : ${test.name } <fmt:formatDate value="${test.testDate }"/> 기출문제 </h2>
		<h3>회차 : ${test.ep }</h3>
	</div>
	<br>
	<table class="table">
		<colgroup>
			<col width="10%" >
			<col width="40%">
			<col width="20%">
			<col width="10%">
			<col width="15&">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>과목명</th>
				<th>정답수 / 문항수</th>
				<th>점수</th>
				<th>과락여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="subjResult" items="${subjResults}">
				<tr>
					<td>${subjResult.subJLv }</td>
					<td>${subjResult.name }</td>
					<td>${subjResult.ansCnt } / ${subjResult.subjQtCnt }</td>
					<td>${subjResult.score }</td>
					<c:choose>
						<c:when test="${subjResult.isPassed eq 'Y'}">	
							<td><p>통과</p></td>
						</c:when>
						<c:otherwise>
							<td><p>과락</p></td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<h4>경과 시간 : <span id="span-time"></span></h4>
	<c:if test="${subjResults[0].finalPassed eq 'Y' }">
		<h4>판정 : <span style="color: red;">합격</span></h4>
	</c:if>
	<c:if test="${subjResults[0].finalPassed eq 'N' }">
		<h4>판정 : <span style="color: red;">불합격</span></h4>
	</c:if>
	<br>
	<h4 style="color: red">틀린 문제의 내용은 다음과 같습니다. 다시 한번 풀어보세요.</h4>
	<br>
	
	<!-- 틀린문항 -->
	<c:set var="subjNo" value="1"/>
	<c:forEach var="qt" items="${falseQts }">
		<c:if test="${qt.subjNo != subjNo}">
			<div class="col-sm-offset-4 col-sm-4 zzz text-center"><p style="margin: 0px">${qt.subjName }</p></div>
			<c:set var="subjNo" value="${qt.subjNo }"/>
		</c:if>
		<div class="row">
			<div class="col-sm-12 zzz">
				<p style="font: 16px; font-weight: bold">${qt.qtNum }. ${qt.content }</p>
				<br/>
				<p class="v font-up">1. ${qt.v1 }</p>
				<p class="v font-up" >2. ${qt.v2 }</p>
				<p class="v font-up">3. ${qt.v3 }</p>
				<p class="v font-up">4. ${qt.v4 }</p>
				
				<br>
				
				<p class="v font-up">입력한 답 : ${qt.ckNum }</p>
				<p class="v font-up" style="display: block;">정답 : [  ] <button class="btn btn-default btn-sm ans-show">정답보기</button></p> 
				<p class="v font-up" style="display: none;">정답 : [${qt.ans }] <button class="btn btn-default btn-sm ans-hide">정답감추기</button></p> 
				<p class="v font-up" style="color: red;">정답률 : ${qt.trueRate }%</p>
			</div>
		</div>
	</c:forEach>
	
	<br>
	<br>
	<!-- 맞춘문항 -->
	<h4 style="color: blue">맞춘 문제의 내용은 다음과 같습니다. 맞춘 내용도 다시 보세요!</h4>
	<br>
	<br>
	<c:forEach var="qt" items="${trueQts }">
		<c:if test="${qt.subjNo != subjNo}">
			<div class="col-sm-offset-4 col-sm-4 zzz text-center"><p style="margin: 0px">${qt.subjName }</p></div>
			<c:set var="subjNo" value="${qt.subjNo }"/>
		</c:if>
		<div class="row">
			<div class="col-sm-12 zzz">
				<p style="font: 16px; font-weight: bold">${qt.qtNum }. ${qt.content }</p>
				<br/>
				<p class="v">1. ${qt.v1 }</p>
				<p class="v">2. ${qt.v2 }</p>
				<p class="v">3. ${qt.v3 }</p>
				<p class="v">4. ${qt.v4 }</p>
				
				<br>
				
				<p class="v font-up">입력한 답 : ${qt.ckNum }</p>
				<p class="v font-up" style="display: block;">정답 : [  ] <button class="btn btn-default btn-sm ans-show">정답보기</button></p> 
				<p class="v font-up" style="display: none;">정답 : [${qt.ans }] <button class="btn btn-default btn-sm ans-hide">정답감추기</button></p> 
				<p class="v font-up" style="color: red;">정답률 : ${qt.trueRate }%</p>
			</div>
		</div>
	</c:forEach>
</div>
<script type="text/javascript">

	var cnt = 0;
	changeTimeToString(${subjResults[0].passedTime});
	
	function changeTimeToString(time){
		var hour = parseInt(time/3600);
		var min = parseInt((time%3600)/60);
		var sec = time%60;
		
		$("#span-time").text(hour + "시간 " + min +  "분 " + sec + "초");
	}
	
	$(".ans-hide").click(function(){
		$(this).closest("p").css("display", "none");
		$(this).closest("p").prev().css("display", "block");
	})
	
	$(".ans-show").click(function(){
		$(this).closest("p").css("display", "none");
		$(this).closest("p").next().css("display", "block");
	})
</script>
</body>
</html>