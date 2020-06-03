<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>1:1 문의내역 목록</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style type="text/css">
    	#quest-detail {
    		border: 1px solid #f7f7f7;
    	}
    	
    	#quest-detail th {
			background-color: #f7f7f7;  
    	}	
    	
    	#quest-detail th,td {
			padding-left: 30px;	
    	}
 
    </style>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/user-sidebar.jsp" %>

		<div class="col-sm-10">
			<p style="font-size: 25px;">1:1 문의내역</p>
		</div>
		
		<div class="col-sm-10">
			<div class="row">
				<div class="col-sm-12">
					<p style="font-size: 14px; margin-top: 10px;">> 1:1 문의내역입니다.</p>
					<br>
					<table class="table" id="quest-detail">
						<colgroup>
							<col width="20%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>제목</th>
								<td style="padding-left: 30px;">${map.qna.title }</td>
							</tr>
							<tr>
								<th>작성일</th>
								<td style="padding-left: 30px;"><fmt:formatDate value="${map.qna.createDate }" pattern="yyyy.MM.dd a HH:mm:ss"/></td>
							</tr>
						</tbody>
					</table>
					
					<br>
					<p>${map.qna.content }</p>
					<br>
					<br>
				</div>
				<div class="col-sm-12">
					<br>
					<br>
					<c:forEach var="img" items="${map.images}" >
						<div class="col-sm-2">
							<%-- <img class="img-path" alt="" src="/coduck-images/${img.fileName }" style="width: 100%; height: 200px;"> --%>
							<img class="img-path" alt="" src="/qustion-images/${img.fileName }" style="width: 100%; height: 200px;"> 
						</div>
					</c:forEach>
				</div>
			</div>
			
			<c:if test="${not empty map.ans }">
				<div class="row" style="background-color: #f7f7f7; margin-top: 30px; margin-bottom: 30px;">
					<div class="col-sm-2">
						<p style="margin: 10px">${map.ans.userName }</p>
					</div>
					<div class="col-sm-10">
						<p style="margin: 10px">${map.ans.content }</p>
					</div>
				</div>
			</c:if>
			
			<div class="row">
				<div class="col-sm-12" style="text-align: right;">
					<a href="/userquestion/modify.hta?qnaNo=${map.qna.no }" class="btn btn-success">수정</a>
					<a href="/userquestion/del.hta?qnaNo=${map.qna.no }" id="a-del" class="btn btn-danger">삭제</a>
				</div>
			</div>
		</div>
	</div>	
	</div>
	
	<script type="text/javascript">
		$("#a-del").click(function(e){
			e.preventDefault();
			var x = confirm("정말로 삭제하시겠습니까?");
			if(x){
				location.href = "/userquestion/del.hta?qnaNo="+ ${map.qna.no };
				return;
			}
		})
	
	</script>
<%@ include file="../common/footer.jsp"%>