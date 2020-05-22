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
	font-size: 17px;
}

table tr {
	padding: 8px;
	vertical-align: middle;
}

table thead tr td {
	height: 40px;
}
		.pagination a {
		  color: black;
		  float: left;
		  padding: 8px 16px;
		  text-decoration: none;
		}
		
		.pagination a.active {
		  background-color: #4CAF50;
		  color: white;
		  border-radius: 5px;
		}
		
		.pagination a:hover:not(.active) {
		  background-color: #ddd;
		  border-radius: 5px;
		}



</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/tag.jsp" %>
<div class="container" style="min-height: 1100px;">
	<br>
	<div class="row" style="margin-top: 20px;" >
		<form action="" method="get" id="form-search">
		<input id="input-page-no" name="pageNo" type="hidden" value="1"/>
		<div class="form-group row">
			<div class="col-sm-offset-1 col-sm-3">
				<select name="upCateNo" class="form-control" id="upCate" style="height: 45px; font-size: 20px;">
					<option value="0"  >응시분야를 선택하세요.</option>
				</select>
			</div>
			<div class="col-sm-3">
				<select name="downCateNo" class="form-control" id="downCate" style="height: 45px; font-size: 20px;">
					<option value="0" >종목을 선택하세요.</option>
				</select>
			</div>
			<div class="col-sm-3">
				<select name="testNo" class="ui search dropdown form-control" id="ep"  style="height: 45px; font-size: 20px;">
					<option value="0" >회차를 선택하세요.</option>
				</select>
			</div>
		</div>
		</form>
	</div>
	
	<br>
	
	
	<div class="row" id="div-test-list" >
	
		<button type="button" class="btn btn-default" id="btn-addCheckedItems-Cart" style="margin-bottom: 20px;">장바구니 담기</button>
		
		<form action="/cart/addTestsInCart.hta" method="get" id="form-addCart">
			<div class="col-sm-12" style="padding: 0px;">
				<table class="table table-bordered" id="table-test">
					<colgroup>
					    <col style=width:3%;>
					    <col style=width:5%;>
					    <col style=width:*;>
					    <col style=width:10%;>
					    <col style=width:7%;>
					    <col style=width:8%;>
					    <col style=width:9%;>
					    <col style=width:9%;>
					    <col style=width:20%;>
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" id="check-allOrNothing" style="width: 15px; height: 15px;"/></th>
							<th>순번</th>
							<th>분류 및 시험명</th>
							<th>시험회차</th>
							<th>문항수</th>
							<th>가격</th>
							<th>구매여부</th>
							<th>응시여부</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				
				<br>
			</div>
			
			<!-- 페이지네이션 -->
			<div class="col-sm-12 text-center">
				<div class="pagination" id="pagination">		
				
				</div>	
			</div>
		</form>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
	  <div class="modal-dialog">
	  
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title text-center">시험 결과</h4>
	      </div>
	      <div class="modal-body">
	        <table class="table">
	        	<thead>
	        		<tr>
		        		<th>번호</th>
						<th>과목명</th>
						<th>점수</th>
						<th>과락여부</th>
	        		</tr>
	        	</thead>
	        	<tbody>
	        	</tbody>
	        </table>
	      </div>
	        <p style="text-align: right; margin-right: 20px; margin-bottom: 20px;"><button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></p>
	    </div>
	    
	  </div>
	</div>
</div> 


<script type="text/javascript">
	
	var searchFormData = $("#form-search").serialize();
	console.log(searchFormData);
	
	//페이지네이션
	function setPagination(pagination){
		$("#pagination").empty();
		
		var pageRow ="";
		if(pagination.pageNo > 1){
			pageRow += "<a href='' data-page-no='" + (pagination.pageNo - 1) + "'>이전</a>";
		}
		
		for(var i=pagination.beginPage; i<=pagination.endPage; i++){
			if(pagination.pageNo == i){
				pageRow += "<a href='' data-page-no='" + i + 
				"' class='active'>" + i + "</a>";
			} else {
				pageRow += "<a href='' data-page-no='" + i + 
				"'>" + i + "</a>";
			}
		}
		
		if(pagination.pageNo < pagination.totalPagesCount){
			pageRow += "<a href='' data-page-no='" + (pagination.pageNo + 1) + "'>다음</a>";
		}
		
		$("#pagination").append(pageRow);
	}
	
	//페이지네이션 클릭했을 때
	$("#pagination").on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page-no");
		$("#input-page-no").val(pageNo);
		
		console.log("page-no", $("#input-page-no").val());
			
		var formData = $("#form-search").serialize();
		
		$.getJSON("/test/getTestData.hta", formData, function(result){
			var tests = result.searchTestDetailDtos;
			
			$("tbody").empty();
			$("#pagination").empty();
			
			addRow(tests);
			setPagination(result.pagination);
		})
	})
	
	//페이지 로딩되자마자 실행
	$.getJSON("/test/getTestData.hta", searchFormData, function(result){
		var tests = result.searchTestDetailDtos;
		var upCates = result.upCategories;
		
		$("tbody").empty();
		$("#pagination").empty();
		
		var row = "";
		$.each(upCates, function(index, item){
			row += "<option value=" + item.no + ">" + item.name + "</option>";
		})
		$("#upCate").append(row);
		
		addRow(tests);
		
		setPagination(result.pagination);
	})
	
	/* $.getJSON("/test/getTestData.hta", function(result){
		var upCates = result.upCategories;
		
		var row = "";
		$.each(upCates, function(index, item){
			row += "<option value=" + item.no + ">" + item.name + "</option>";
		})
		$("#upCate").append(row);
		
	}) */

	
	//개별 장바구니 버튼 눌렀을 때
	$("tbody").on("click", ".btn-warning", function(){
		$.ajax({
			type:"GET",
			url:"/cart/addOneTestInCart.hta",
			data:{testNo:$(this).val()},
			success:function(result){
				if(result == "success"){
					var xx = confirm("장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?");
					if(xx){
						location.replace("/cart/myTestCartList.hta");
					}
				} else{
					alert("장바구니에 이미 담겨있는 시험입니다. 다시 선택해주세요.");
				}
			}
		})
	
	})
	
	//여러개 선택된 아이템을 장바구니 담을 때
	$("#div-test-list").on("click", "#btn-addCheckedItems-Cart",	function(){
		if ($("tbody").find("[name=testNo]:checked").length == 0) {
			alert("선택된 상품이 없습니다.");
			return;
		}
		
		var formData = $("#form-addCart").serialize();
		 $.ajax({
			type:"GET",
			url:"/cart/addTestsInCart.hta",
			data:formData,
			success:function(result){
				if (result.status == "success") {
					alert("선택된 시험이 장바구니에 담겼습니다.");
					
				} else {
					var str = "";
					var arr = result.items;
					console.log(arr);
					for(var i=0; i<arr.length; i++){
						str += arr[i] + ", ";
					}
					//문자열은 불변
					var str2 = str.slice(0,-2);//자른 새 문자열 반환(원본 문자열은 보존)
					alert("장바구니에 담긴 시험이 존재합니다. 다시 선택해주세요.\n"
							+ str2);					
				}
			},
			error:function(){
				alert("장바구니에 담는 도중 오류가 발생했습니다.");
			}
		})
	})
	
	$("#check-allOrNothing").change(function(){
		var checkedStatus = $("#check-allOrNothing").is(":checked");
		console.log(checkedStatus);
		$("tbody :checkbox").prop("checked", checkedStatus);
	})
	
	$("#ep").change(function(){
		$("#input-page-no").val(1);
		var formData = $("#form-search").serialize();
		var testNo = $(this).val();
		$.getJSON("/test/getTestData.hta", formData, function(result){
			$("#check-allOrNothing").prop("checked", false);
			$("tbody").empty();
			$("#pagination").empty();
			
			var tests = result.searchTestDetailDtos;
			addRow(tests);
			setPagination(result.pagination);
		})
	})
	
	
	$("#downCate").change(function(){
		 $("#ep").val(0); 
		$("#input-page-no").val(1);
		var formData = $("#form-search").serialize();
		$.getJSON("/test/getTestData.hta", formData, function(result){
			
			$("#check-allOrNothing").prop("checked", false);
			$("#ep").empty();
			
			var option = "<option value='0'>회차를 선택하세요.</option>";
			
			var eps = result.eps;
			$.each(eps, function(index, item){
				option += "<option value=" + item.testNo + ">" + item.testEp + "</option>";
			})
			$("#ep").append(option);
			
			$("tbody").empty();
			$("#pagination").empty();
			var tests = result.searchTestDetailDtos;
			addRow(tests);
			setPagination(result.pagination);
		} )
	})

	$("#upCate").change(function(){
	 	$("#downCate").val(0);
		$("#ep").val(0); 
		$("#input-page-no").val(1);
		var formData = $("#form-search").serialize();
		
		$.getJSON("/test/getTestData.hta", formData, function(result){
			$("#check-allOrNothing").prop("checked", false);
			$("#downCate").empty();
			$("#ep").empty();
			$("#div-test-list table tbody").empty();
			$("#pagination").empty();
			
			var option = "<option value='0'>종목을 선택하세요.</option>";				
			var option2 = "<option value='0'>회차를 선택하세요.</option>";				
			var downCates = result.downCategories;			
			
			$.each(downCates, function(index, item){
				option += "<option value=" + item.no + ">" + item.name + "</option>";
			})
			$("#downCate").append(option);
			$("#ep").append(option2);
			
			$("#div-test-list").css("display", "block");
			
			var tests = result.searchTestDetailDtos;
			addRow(tests);
			setPagination(result.pagination);

		})
	})


	//응시하기 클릭시
	$("#table-test").on("click",".a-take-test", function(event){
		event.preventDefault();
		var testNo = $(this).data("test-no");
		window.location.reload();
		window.open("/test/takeaTest.hta?testNo=" + testNo, "시험응시페이지", "width = 900, height = 850, top = 100, left = 200, location = no");
	})
	
	//ajax 테이블 행 추가
	var addRow = function(tests){
		var row = "";
		$.each(tests, function(index, item){
			var orderYN = item.orderYN;
			var done = item.testDone;
			row += "<tr>";
			if(orderYN == 'Y'){
				row += "<td><input style='height: 15px; width: 15px;' type='checkbox' name='testNo' disabled value='" + item.testNo + "'/></td>";
			} else {
				row += "<td><input style='height: 15px; width: 15px;' type='checkbox' name='testNo' value='" + item.testNo + "'/></td>";
			}
			row += "<td>" + (item.rn) + "</td>";
			row += "<td style='text-align: left;'>" + item.mainCateName + " > " + item.testName + "</td>";
			row += "<td>" + item.testEp + "</td>";
			row += "<td>" + item.testQtCnt + "</td>";
			row += "<td>" + item.testPrice.toLocaleString() + "원</td>";
			if(orderYN == "Y"){
				if(done == "Y"){
					row += "<td>구매완료</td>";
					row += "<td>응시완료</td>";
					row += "<td><button type='button' class='btn btn-default' id='btn-detail'> 자세히보기</button></td>";
				} else {
					row += "<td>구매완료</td>";
					row += "<td>미응시</td>";
					row += "<td><a data-test-no='" + item.testNo + "' href='' class='btn btn-default a-take-test'>응시하기</a></td>";
				}
			} else {
				row += "<td>미구매</td>";
				row += "<td>미응시</td>";
				row += "<td><a href='/buynow/ordernowtestform.hta?testno=" + item.testNo + "' class='btn btn-primary'>바로구매</a> <button type='button' class='btn btn-warning' name='testNo' value='" + item.testNo + "'>장바구니담기</button></td>";
			}
			
			/* if(done == 'Y'){
				row += "<td>응시완료</td>";
				row += "<td><button type='button' class='btn btn-default' id='btn-detail'>자세히보기</button></td>";
			} else {
				row += "<td>미응시</td>";
				row += "<td><a href='/order/orderTests.hta?testno= " + item.testNo + "&testtotalprices= " + item.testPrice + "' class='btn btn-primary'>바로구매</a> <button type='button' class='btn btn-warning' name='testNo' value='" + item.testNo + "'>장바구니담기</button></td>";
			} */
			row += "</tr>";
		})
		$("tbody").append(row);
	}
	
	//자세히보기 클릭했을 때	
 	$("tbody").on("click", "#btn-detail", function(){
 		var testNo = $(this).closest("tr").find("input").val();
 		$.getJSON("/test/clickShowDetailTest.hta", {testNo:testNo}, function(result){
 			$("#myModal tbody").empty();
 			var row = "";
 			$.each(result, function(index, item){
 				row += "<tr>"
 				row += "<td>" + item.subJLv + "</td>";
 				row += "<td>" + item.name + "</td>";
 				row += "<td>" + item.score + "</td>";
 				if(item.isPassed == "Y"){
	 				row += "<td>통과</td>";
 				} else {
	 				row += "<td>과락</td>";
 				}
 				row += "</tr>";
 			})
 			$("#myModal tbody").append(row);
 			$("#myModal").modal("show");
 			
 		})
 		/*  $.ajax({
 			type:"GET",
 			url:"/test/clickShowDetailTest.hta",
 			data:testNo,
 			success:function(){
 				$("#myModal").modal("show");
 			}
 		}) */
		
	}) 
	

</script>
<%@ include file="../common/footer.jsp" %>