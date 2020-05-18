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
	<%@ include file="../common/user-sidebar.jsp"%>

			<div class="col-sm-10">
				<span>내 학습 / 내 질문</span>
				<h4>내 질문</h4>
				<div class="row">
					<div class="col-md-12">
						<form action="" class="form-inline" method="post" enctype="multipart/form-data">
							<div class="form-group" style="margin-right: 20px;">
								<label>정렬기준</label>
								<select class="form-control" name="">
									<option>미답변</option>
									<option>답변완료</option>
								</select>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary">검색</button>
							</div>
						</form>
					</div>
					<div class="row">
						<div class="col-md-12" style="border: 1px solid red; margin-top: 20px; margin-left:13px; padding-left: 0px;">
							<h3>강의 질문 타이틀</h3>
							<p>쳅터 이름 : 쳅터 이름 | 질문날짜 : 2016-00-00</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>
</body>
<%@ include file="../common/footer.jsp"%>
</html>

















































