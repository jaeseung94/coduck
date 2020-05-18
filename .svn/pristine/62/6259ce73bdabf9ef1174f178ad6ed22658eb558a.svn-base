<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>회원가입폼</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="page-header">
		<h1>회원가입</h1>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<p>사용자 정보를 입력하세요</p>
			<form action="register.hta" class="well" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label>이름</label>
					<input type="text" class="form-control" name="name"/><!-- UserRegisterForm의 필드값의 이름과 같아야 한다. -->
				</div>
				<div class="form-group">
					<label>아이디</label>
					<input type="text" class="form-control" name="id"/>
				</div>
				<div class="form-group">
					<label>닉네임</label>
					<input type="text" class="form-control" name="nickname"/>
				</div>
				<div class="form-group">
					<label>이메일</label>
					<input type="text" class="form-control" name="email"/>
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" class="form-control" name="pwd"/>
				</div>
				<div class="form-group">
					<label>프로필사진</label>
					<input type="file" class="form-control" name="imgfile"/>
				</div>
				<div class="form-group">
					<label>자기소개</label>
					<textarea class="form-control" rows="" cols="5" name="selfInfo"></textarea>
				</div>
				<div class="text-right">
					<button type="submit" class="btn btn-primary">회원등록</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>