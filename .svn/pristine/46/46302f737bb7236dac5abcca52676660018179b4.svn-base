<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
table thead tr th, td {
	text-align: center;
}

table tr {
	padding: 8px;
	vertical-align: middle;
}

table thead tr td {
	height: 40px;
}
</style>
</head>
<body>
<%@ include file="../common/tag.jsp" %>
<div class="container">
	<div class="row" style="margin-top: 20px;" >
		<div class="form-group row">
			<div class="col-sm-offset-1 col-sm-3">
				<select class="form-control" id="upCate">
					<option value=""  selected disabled>응시분야를 선택하세요.</option>
				</select>
			</div>
			<div class="col-sm-3">
				<select class="form-control" id="downCate">
					<option value=""  selected disabled>종목을 선택하세요.</option>
				</select>
			</div>
			<div class="col-sm-3">
				<select class="ui search dropdown form-control" id="ep">
					<option value=""  selected disabled>회차를 선택하세요.</option>
				</select>
			</div>
		</div>
	</div>
	
	<br>
	
	<div class="row" id="div-test-list" style="display: none;">
		<form action="/cart/addTestsInCart.hta" method="get" id="form-addCart">
			<div class="col-sm-12">
				<table class="table table-bordered">
					<colgroup>
					    <col style=width:5%;>
					    <col style=width:6%;>
					    <col style=width:30%;>
					    <col style=width:10%;>
					    <col style=width:7%;>
					    <col style=width:12%;>
					    <col style=width:10%;>
					    <col style=width:20%;>
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" id="check-allOrNothing" /></th>
							<th>순번</th>
							<th>분류 및 시험명</th>
							<th>시험회차</th>
							<th>문항수</th>
							<th>가격</th>
							<th>응시여부</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				
				<br>
				<button type="button" class="btn btn-default" id="btn-addCheckedItems-Cart">장바구니 담기</button>
			</div>
		</form>
	</div>
</div> 
<script type="text/javascript">
	
	$(document).ready(function(){
		//개별 장바구니 버튼 눌렀을 때
		$("tbody").on("click", ".btn-warning", function(){
			$.ajax({
				type:"GET",
				url:"/cart/addTestsInCart.hta",
				data:{testNo:$(this).val()},
				success:function(){
					alert("장바구니에 담겼습니다.");
				}
			})
		
		})
		
		//선택된 아이템을 장바구니 담기 눌렀을 때
		$("#form-addCart").on("click", "#btn-addCheckedItems-Cart",	function(){
			if ($("tbody").find("[name=testNo]:checked").length == 0) {
				alert("선택된 상품이 없습니다.");
				return;
			}
			
			var formData = $("#form-addCart").serialize();
			 $.ajax({
				type:"GET",
				url:"/cart/addTestsInCart.hta",
				data:formData,
				success:function(){
					alert("선택된 시험이 장바구니에 담겼습니다.");
				}
			})
		})
		
		$("#check-allOrNothing").change(function(){
			var checkedStatus = $("#check-allOrNothing").is(":checked");
			if(checkedStatus){
				$(":checkbox").attr("checked",true);
			} else {
				//$(":checkbox").prop("checked","false");
				$(":checkbox").attr("checked",false);
			}
		})
		
		$("#ep").change(function(){

			var testNo = $(this).val();
			$.getJSON("/test/getTestData.hta", {testNo:testNo}, function(result){
				$("tbody").empty();
				
				var tests = result.searchTestDetailDtos;
				addRow(tests);
			})
		})
		
		
		$("#downCate").change(function(){
			$.getJSON("/test/getTestData.hta", {downCateNo:$(this).val()}, function(result){
				$("#ep").empty();
				
				var option = "<option value='' selected disabled>회차를 선택하세요.</option>";
				
				var eps = result.eps;
				$.each(eps, function(index, item){
					option += "<option value=" + item.testNo + ">" + item.testEp + "</option>";
				})
				$("#ep").append(option);
				
				$("tbody").empty();
				var tests = result.searchTestDetailDtos;
				addRow(tests);
			} )
		})
	
		$("#upCate").change(function(){
			$.getJSON("/test/getTestData.hta", {upCateNo:$(this).val()}, function(result){
				
				$("#downCate").empty();
				$("#div-test-list table tbody").empty();
				
				var option = "<option value='' selected disabled>종목을 선택하세요.</option>";				
				var downCates = result.downCategories;			
				
				$.each(downCates, function(index, item){
					option += "<option value=" + item.no + ">" + item.name + "</option>";
				})
				$("#downCate").append(option);
				
				$("#div-test-list").css("display", "block");
				
				
				var tests = result.searchTestDetailDtos;
				addRow(tests);

			})
		})

		$.getJSON("/test/getTestData.hta", function(result){
			var upCates = result.upCategories;
			
			var row = "";
			$.each(upCates, function(index, item){
				row += "<option value=" + item.no + ">" + item.name + "</option>";
			})
			$("#upCate").append(row);
			
		})

		var addRow = function(tests){
			var row = "";
			$.each(tests, function(index, item){
				row += "<tr>";
				row += "<td><input type='checkbox' name='testNo' value='" + item.testNo + "'/></td>";
				row += "<td>" + (index+1) + "</td>";
				row += "<td style='text-align: left;'>" + item.mainCateName + " > " + item.subCateName + "</td>";
				row += "<td>" + item.testEp + "</td>";
				row += "<td>" + item.testQtCnt + "</td>";
				row += "<td>" + item.testPrice.toLocaleString() + "원</td>";
				var done = item.testDone;
				if(done == 'T'){
					row += "<td>응시완료</td>";
				} else {
					row += "<td>미응시</td>";
				}
				row += "<td><a href='' class='btn btn-primary btn-sm'>바로구매</a> <button type='button' class='btn btn-warning btn-sm' name='testNo' value='" + item.testNo + "'>장바구니담기</button></td>";
				row += "</tr>";
			})
			$("tbody").append(row);
		}
		
	})
	

</script>
</body>
</html>