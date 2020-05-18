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
			<form id="reg-form" action="register.hta" class="well" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label>이름</label>
					<input type="text" class="form-control" name="name" id="user-name"/><!-- UserRegisterForm의 필드값의 이름과 같아야 한다. -->
				</div>
				<div class="form-group">
					<label>아이디</label>
					<input type="text" class="form-control" name="id" id="user-id"/>
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
					<input type="password" class="form-control" name="pwd" id="user-pwd"/>
				</div>
				<div class="form-group">
					<label>프로필사진</label>
					<input type="file" class="form-control" name="imgfile"/>
				</div>
				<div class="form-group">
					<label>자기소개</label>
					<textarea class="form-control" rows="" cols="5" name="selfInfo"></textarea>
				</div>
				<div class="form-group">
					<label>계좌번호</label>
					<input type="text" class="form-control" name="banknumber" id="user-bankno"/>
				</div>
				<div class="text-right">
					<input type="submit" class="btn btn-primary" onclick="checkform(event)"  value="회원등록" />
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
		function checkform(e) {
			e.preventDefault(); 	// 일단 제출이 안되게 해놈
			
			// 아이디 체크 : 6글자 이상
			var userId = document.getElementById("user-id").value.trim();
			if(userId.length == 0){
				alert("아이디를 입력하세요");
				return;
			}
			if(userId.length < 3){
				alert("아이디는 3글자 이상 입력하세요");
				return;
			}
			
			// 비밀번호 체크 : 8 ~ 12글자
			var userPwd = document.getElementById("user-pwd").value.trim();
			if(userPwd.length == 0){
				alert("비밀번호를 입력하세요");
				return;
			}
			if(userPwd.length < 3 || userPwd.length > 12){
				alert("비밀번호는 3 ~ 12글자 이내로 입력하세요");
				return;
			}
			
			// 비밀번호 체크 : 8 ~ 12글자
			var userPwd = document.getElementById("user-pwd").value.trim();
			if(userPwd.length == 0){
				alert("비밀번호를 입력하세요");
				return;
			}
			
			// 비밀번호 체크 : 8 ~ 12글자
			var userBankNo = document.getElementById("user-bankno").value.trim();
			if(userBankNo.length == 0){
				alert("계좌번호를 입력하세요");
				return;
			}
			
			document.getElementById("reg-form").submit();
		}
	</script>
</body>
</html>