<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
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
		
		<div class="col-sm-10">
			<span>설정 / 프로필 설정</span>
			<h4>프로필 설정</h4>
			<div class="row">
				<form id="reg-form" action="userupdate.hta" class="well" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label>닉네임</label>
						<input type="text" class="form-control" name="nickname" value="${userProfil.nickname }"/>
					</div>
					<div class="form-group text-center">
						<h4>프로필 사진</h4>
						<%-- <img src="../../resources/images/userImageFilename/${userProfil.imageFilename != null ? userProfil.imageFilename : 'skrwl.GIF' }" style="width: 100px; height: 100px; margin-bottom: 20px;"/> --%>
						<img src="${userProfil.imageFilename }" style="width: 100px; height: 100px; margin-bottom: 20px;"/>
						<input type="file" class="form-control" name="imgfile"/>
					</div>
					<div class="form-group">
						<label>이메일</label>
						<input type="text" class="form-control" name="email" value="${userProfil.email }"/>
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" class="form-control" name="pwd" id="user-pwd" />
					</div>
					<div class="form-group">
						<label>자기소개</label>
						<textarea class="form-control" rows="" cols="5" name="selfInfo">${userProfil.selfInfo }</textarea>
					</div>
					<div class="form-group">
						<label>계좌번호</label>
						<input type="text" class="form-control" name="banknumber" value="${userProfil.bankNumber }"  id="user-bankno"/>
					</div>
					<div class="text-right">
						<input type="submit" class="btn btn-primary" onclick="checkform(event)"  value="프로필수정" />
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function checkform(e) {
	e.preventDefault(); 	// 일단 제출이 안되게 해놈
	
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

<%@ include file="../common/footer.jsp" %>


















































