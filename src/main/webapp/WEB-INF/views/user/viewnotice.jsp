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
			<div class="col-sm-12">
				<table class="table" id="notice-detail-table">
					<thead>
						<tr>
							<th>순번</th>
							<th>제목</th>
							<th>첨부파일</th>
							<th>조회수</th>
							<th>상세조회</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
						<c:when test="${empty viewnotice }">
							<tr>
								<td colspan="4" class="text-center">없습니다</td>
							</tr>
						</c:when>
							<c:otherwise>
								<c:forEach var="viewnotice" items="${viewnotice }" varStatus="loop">
									<tr id="1">
										<td>${loop.count }</td>
										<td>${viewnotice.title }</td>
										<td>${viewnotice.fileName }</td>
										<td>${viewnotice.counts }</td>
										<td><a class="btn btn-info btn-xs" id="btn-open-notice" href="/view/noticedetail.hta?noticeNo=${viewnotice.noticeNo }">상세보기</a></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
   <script type="text/javascript">
   	$("#btn-open-notice").click(function() {
		
	})
   </script>
	<%@ include file="../common/footer.jsp"%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	