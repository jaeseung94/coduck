<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../common/tag.jsp" %>
	<div class="container">

		<button type="button" class="btn btn-info btn" data-toggle="modal"
			data-target="#myModal">시험 등록</button>


		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">시험 등록</h4>
					</div>

					<form class="form-horizontal" id="form-register" action="/test/addTestByExcel.hta" method="post" enctype="multipart/form-data">

						<div class="modal-body">
							<div class="form-group">
								<label class="control-label col-sm-2">분류1</label>
								<div class="col-sm-3">
									<select name="testMainCateNo" class="form-control" id="testMainCateNo">
										<option value="" selected disabled>카테고리를 선택하세요.</option>
										<c:forEach var="cate" items="${testMainCates }" varStatus="loop">
											<option value="${cate.no }">${cate.name }</option>
										</c:forEach>
									</select>
								</div>
								<label class="control-label col-sm-2">분류2</label>
								<div class="col-sm-4">
									<select name="testCateNo" class="form-control" id="testCateNo">
										<option value="" selected disabled>시험을 선택하세요.</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2">엑셀파일</label>
								<div class="col-sm-6">
									<input type="file" class="form-control" name="xlsfile" accept=".xls,.xlsx">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2">가격</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" name="price">
								</div>
							</div>

						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary" id="button-submit">등록</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>

			</div>
		</div>

	</div>
	
<script type="text/javascript">
	
	$("#form-register").submit(function(event){
		if($("#testMainCateNo").val() == null){
			alert("분류1을 선택해주세요.");
			event.preventDefault();
			return;
		}
		if($("#testCateNo").val() == null){
			alert("분류2를 선택해주세요.");
			event.preventDefault();
			return;
		}
		if($("[name='xlsfile']").val() == ""){
			alert("파일이 선택해주세요.");
			event.preventDefault();
			return;
		}
		if($("#price").val() == ""){
			alert("가격을 입력해주세요.");
			event.preventDefault();
			return;
		}
			
	})

	$("#testMainCateNo").change(function(){
		var mainCateNo = $(this).val();
		
		$("#testCateNo").empty();
		
/* 		$.getJSON("/test/getCates.hta", {mainCateNo:mainCateNo}, function(result){
			alert("ajax실행됨.");
			var row = "<option value=''>시험을 선택하세요.</option>";
			$.each(result, function(index, item){
				row += "<option value='" + item.no + "'>" + item.name + "</option>";
				
			})
				$("#testCateNo").append(row);
		}) */
		
		$.ajax({
			type:"GET",			// 요청방식
			url: "/admin/getCates.hta",	// 요청URL
			data: {mainCateNo:mainCateNo},		// 서버로 전달되는 요청파라미터
			dataType: "json",		// 예상되는 서버의 응답데이터 타입,
			success: function(result) {
				// 성공적인 응답이 왔을 때 실행할 코드
				var row = "<option value='' selected disabled>시험을 선택하세요.</option>";
				$.each(result, function(index, item){
					row += "<option value='" + item.no + "'>" + item.name + "</option>";
					
				})
				$("#testCateNo").append(row);
			}		
		});
	})
	
</script>
</body>
</html>