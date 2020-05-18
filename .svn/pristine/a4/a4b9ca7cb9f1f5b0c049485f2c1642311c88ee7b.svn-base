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
<div class="container">
	<div class="page-header">
		<h1>로그인</h1>
	</div>
	
	<c:if test="${param.error eq 'fail' }">
		<div class="row">
			<div class="col-sm-12">
				<div class="alert alert-danger">
					<strong>로그인 실패 </strong>아이디 혹은 비밀번호가 일치하지 않습니다.
				</div>
			</div>
		</div>
	</c:if>
	
	<c:if test="${param.error eq 'required' }">
		<div class="row">
			<div class="col-sm-12">
				<div class="alert alert-danger">
					<strong>서비스 실패 </strong>해당 서비스는 로그인 후 사용가능합니다.
				</div>
			</div>
		</div>
	</c:if>
	
	<div class="row">
		<div class="col-sm-12">
			<p>사용자 정보를 입력하세요</p>
			<form action="login.hta" class="well" method="post">
				<div class="form-group">
					<label>아이디</label>
					<input type="text" class="form-control" name="id"/>
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" class="form-control" name="pwd"/>
				</div>
				<div class="text-right">
					<button type="submit" class="btn btn-primary">로그인</button>
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp"%>