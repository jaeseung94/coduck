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
				<c:if test="${empty noticedetail.fileName }">
					<h1 style="margin-top: 50px;">${noticedetail.title }</h1>
					<hr/>
					<h3>${noticedetail.contents }</h3>
					<hr/>
					<p style="margin-top: 90px;">첨부파일 없습니다.</p>				
				</c:if>
				<c:if test="${not empty noticedetail.fileName }">
					<h1 style="margin-top: 50px;">${noticedetail.title }</h1>
					<hr/>
					<h3>${noticedetail.contents }</h3>
					<hr/>
					<a style="margin-top: 90px; font-size: 30px;" href="/admin/download.hta?noticeNo=${noticedetail.noticeNo }">첨부파일<i class="far fa-file fa-3x"></i></a>			
				</c:if>
			</div>
		</div>
	</div>
	
   <script type="text/javascript">
   	
   </script>
	<%@ include file="../common/footer.jsp"%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	