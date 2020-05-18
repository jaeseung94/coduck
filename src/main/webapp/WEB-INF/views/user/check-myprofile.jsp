<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>프로필 비밀번호 체크</title>
    
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
	<%@ include file="../common/user-sidebar.jsp"%>
		
	
		<div class="col-sm-10" style="margin-top: 100px;">
		
			<div class="row">
				<div class="col-sm-10 text-center">
					<div class="page-header">
						<h3>사용자 확인</h3>
					</div>
					
					<c:if test="${param.error eq 'fail' }">
						<div class="row">
							<div class="col-sm-12">
								<div class="alert alert-danger">
									<strong>비밀번호 오류 </strong>비밀번호가 일치하지 않습니다.
								</div>
							</div>
						</div>
					</c:if>
					
					<form action="/user/profile-check.hta" class="form-horizontal" method="post">
						<p>비밀번호를 입력하세요.</p>
						<div class="form-group">
							<label class="control-label col-sm-4">아이디</label>
							<p class="col-sm-5 text-left" style="padding-top: 7px; font-weight: bold;">${id }</p>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">비밀번호</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" name="pwd"/>
							</div>
						</div>
						<div class="text-center">
							<input type="submit" class="btn btn-primary" value="확인">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
