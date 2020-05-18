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
<div class="container" style="font-size:17px; width:1440px;">
	<div class="row">
		<div class="col-sm-2" style="border: 1px solid red;">
			<p>대시보드</p>
			<p>내 학습</p>
			<ul>
				<li><a href="/user/userlecting.hta">수강중인 강의</a></li>
				<li><a href="/question/userqueston.hta">내 질문</a></li>
				<li>내 모의고사</li>
			</ul>
			<p>내 결제</p>
			<ul>
				<li>위시리스트</li>
				<li><a href="/cart/userCartList.hta">장바구니</a></li>
				<li>내 쿠폰함</li>
				<li><a href="/user/userbylist.hta">구매내역</a></li>
			</ul>
			<p>설정</p>
			<ul>
				<li>프로필 설정</li>
				<li>알림 설정</li>
			</ul>
			<p>내 강의/모의고사</p>
			<ul>
				<li>내 강의</li>
				<li>내 모의고사</li>
			</ul>
		</div>
		
		<div class="col-sm-10" style="border: 1px solid blue;">
			<span>설정 / 프로필 설정</span>
			<h4>프로필 설정</h4>
			<div class="row">
				<form action="userupdate.hta" class="well" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label>닉네임</label>
						<input type="text" class="form-control" name="nickname" value="${userProfil.nickname }"/>
					</div>
					<div class="form-group text-center">
						<h4>프로필 사진</h4>
						<img src="../../resources/images/userImageFilename/${userProfil.imageFilename }" style="width: 100px; height: 100px; margin-bottom: 20px;"/>
						<input type="file" class="form-control" name="imgfile"/>
					</div>
					<div class="form-group">
						<label>이메일</label>
						<input type="text" class="form-control" name="email" value="${userProfil.email }"/>
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" class="form-control" name="pwd" />
					</div>
					<div class="form-group">
						<label>자기소개</label>
						<textarea class="form-control" rows="" cols="5" name="selfInfo">${userProfil.selfInfo }</textarea>
					</div>
					<div class="form-group">
						<label>계좌번호</label>
						<input type="text" class="form-control" name="banknumber" value="${userProfil.bankNumber }" />
					</div>
					<div class="text-right">
						<button type="submit" class="btn btn-primary btn-info">프로필 수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	
</script>
</body>
<%@ include file="../common/footer.jsp" %>
</html>

















































