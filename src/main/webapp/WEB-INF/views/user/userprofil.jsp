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
<%@ include file="../common/user-sidebar.jsp" %>
		
		<div class="col-sm-10">
			<div class="row">
				<form id="reg-form" action="userupdate.hta" class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group text-center">
						<h4>프로필 사진</h4>
						<a href="" id="a-profile"><img id="img-profile" src="/user-profiles/${userProfil.imageFilename }" style="width: 100px; height: 100px;"/></a>
						<input type="file" class="form-control" name="imgfile" style="display: none;"/>
					</div>
					<div class="form-group" style="margin-top: 40px;">
						<label class="control-label col-sm-2">닉네임</label>
						<div class="col-sm-10">
							<input type="text" class="form-control col-sm-10" name="nickname" value="${userProfil.nickname }"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">이메일</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="email" value="${userProfil.email }"/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">비밀번호</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" name="pwd" id="user-pwd" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">자기소개</label>
						<div class="col-sm-10">
							<textarea class="form-control" rows="5" cols="5" name="selfInfo">${userProfil.selfInfo }</textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">계좌번호</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="banknumber" value="${userProfil.bankNumber }"  id="user-bankno"/>
						</div>
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
	
	//이미지 클릭시 사진 업로드 기능 구현
	$("#a-profile").click(function(event){
		event.preventDefault();
		$("input[name='imgfile']").click();
	})
	
	$("input[name='imgfile']").change(function(){
		var file = this.files[0];
	    reader = new FileReader();
	   
	    reader.onload = function (event) {
	        var img = new Image();
	        img.src = event.target.result;
	        console.log(event.target);
	        img.width = 500;
	        img.height = 500;
	        
	        $("#a-profile").empty(img);
	        $("#a-profile").append(img);
	    };
	    reader.readAsDataURL(file);
	})

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


















































