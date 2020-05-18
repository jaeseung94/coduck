<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CODUCK - 1등 온라인 강좌</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style type="text/css">
		.table tr th {
			background-color: #f5f5f5; 
		}
		
		.table tr th,td {
			text-align: center;
			vertical-align: middle;
		}
		
		#sum-table {
			width:100%;
			border-collapse:collapse; 
			background-color: #f5f5f5; 
			border: 2px solid black;
			vertical-align: middle;
		}
		
		#sum-table th, #sum-table td {
			text-align: center;
			border: 1px solid black;
		}
		
		#sum-table th {
			height: 35px;
		}
		
		#sum-table td {
			height: 60px;
		}
		
		#tr-sum span{
			font-weight: bold;
			font-size: 23px;
		}
		
		.btn-black-lg {
			  background-color: #555555; 
			  border: none;
			  color: white;
			  padding: 15px 32px;
			  text-align: center;
			  text-decoration: none;
			  display: inline-block;
			  font-size: 16px;
			  margin: 4px 2px;
			  cursor: pointer;
		}
</style>
<!-- sy.css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/sy-style.css' />">
<!-- sy.js -->
<script src="/resources/js/common.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%@ include file="../common/user-sidebar.jsp"%>

	<div class="col-sm-9">
		<br>
		<br>
		<img alt="" src="/imgs/장바구니 1단계.PNG" style="width: 100%; height: 90px;">
		<p style="font-size: 12px; color:#999999; margin: 15px 0px 0px 10px; ">* 장기간 상품 보관 시 상품 조기품절 또는 할인행사 등의 경우로 품절 또는 판매가 변동이 발생할 수 있습니다.</p>
		<br>
		<p>장바구니에 <span style="color: red;">${cnt }개</span>의 상품이 들어 있습니다.</p>
		<form action="ordertestform.hta" method="post" id="form-cart">
			<table class="table table-bordered" id="test-table">
				<colgroup>
					<col width="5%">
					<col width="5%">
					<col width="*">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead id="test-thead">
					<tr>
						<th><input type="checkbox" id="ck-all-test"
							name="test-all-price" /></th>
						<th>번호</th>
						<th>모의고사명</th>
						<th>상품금액</th>
						<th>할인금액</th>
						<th>합계</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty userCartTestLists }">
							<tr>
								<td colspan="6" class="text-center">장바구니에 담긴 상품이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="userCartTest" items="${userCartTestLists }"
								varStatus="loop">
								<tr>
									<td><input type="checkbox" name="testnos"
										value="${userCartTest.no }" /></td>
									<td>${loop.count }</td>
									<td>${userCartTest.name } > ${userCartTest.ep }</td>
									<td><span class="price"><fmt:formatNumber value="${userCartTest.price }"/></span>원</td>
									<td><fmt:formatNumber value="0"/>원</td>
									<td><fmt:formatNumber value="${userCartTest.price }"/>원</td>
									<td><a
										href="/cart/delTestInCart.hta?testno=${userCartTest.no }"
										class="btn btn-danger btn-xs">삭제</a></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="form-group">
				<input type="hidden" id="test-total" name="order-test-total-price" />
				<div class="row">
					<div class="col-sm-8">
						<a href="" class="btn btn-default btn-xs" id="a-del-ck">선택상품 삭제</a>
						<a href="" class="btn btn-default btn-xs">좋아요 보관</a>
					</div>
					<div class="col-sm-4 text-right">
						<button type="button" class="btn-black-lg" >쇼핑 계속하기</button>
					</div>
				</div>
			</div>
		</form>
		<br>
		
		<table id="sum-table" >	
			<colgroup>
				<col width="33%">
				<col width="33%">
				<col width="*">
			</colgroup>
			<thead>
				<tr>
					<th>상품금액 <span>(상품 : <span id="span-cnt">${cnt }</span>건)</span></th>
					<th>총 할인금액</th>
					<th>최종 결제금액</th>
				</tr>
			</thead>
			<tbody>
				<tr id="tr-sum">
					<td><span id="span-total-price">0</span>원</td>
					<td><span style="margin-right: 30px; font-size: 20px;" class="glyphicon glyphicon-minus-sign"></span><span>0</span>원</td>
					<td><img style="margin: 0px 30px 5px 0px; height: 22px;" alt="" src="/imgs/equals.png"/><span style="color: red;" id="span-final-price">0</span>원</td>
				</tr>
			</tbody>
		</table>
		
		<p style="text-align: center;">
			<br>
			<a href="/cart/orderAllTests.hta" class="btn-black-lg" id="btn-buy-all" >전체상품 주문</a>
			<a href="" class="btn-black-lg" id="btn-buy-ck" style="background-color: #f44336;">선택상품 주문</a>
		</p>
	</div>

	</div>
	</div>
	<script type="text/javascript">
		
		var length = ${cnt};
		checkAll();
   		totalPrice();
   		
   		//선택 상품 구매
   		$("#btn-buy-ck").click(function(event){
   			event.preventDefault();
   			$("#form-cart").attr("action", "/cart/orderCkTests.hta");
   			$("#form-cart").submit();
   			
   		})
   		//선택 상품 삭제
   		$("#a-del-ck").click(function(event){
   			event.preventDefault();
   			$("#form-cart").attr("action", "/cart/delCkTestsInCart.hta");
   			$("#form-cart").submit();
   		})
   		
   		//모의고사 전체 체크 클릭시
   		$("#ck-all-test").change(function(){
   			var status =  $(this).is(":checked");
   			$("#test-table :checkbox").prop("checked", status);
   		})
   		
   		//체크된 총 상품 금액 및 최종 결제금액
   		function totalPrice(){
   			var sum = 0;
   			$("#test-table tbody :checked").closest("tr").find("span").each(function(){
	   			var price = parseInt($(this).text().replace(/,/g , ''));
   				sum+=price;
   			})
   			console.log(sum);
   			$("#span-total-price").text(sum.toLocaleString());
   			$("#span-final-price").text(sum.toLocaleString());
   		}
   		
   		//모든 상품 체크하기
   		function checkAll(){
   			$(":checkbox").prop("checked", "true");
   		}
   		
   		//체크박스 상태가 변경될 때마다
   		$(":checkbox").change(function(){
   			var ckLen = $("tbody :checked").length;
   			if(ckLen == length){
   				$("#ck-all-test").prop("checked", true);
   			} else {
   				$("#ck-all-test").prop("checked", false);
   			}
   			$("#span-cnt").text(ckLen);
   			totalPrice();
   		})
   		
  /*  
      $("#lecture-table tbody :checkbox[name=lectnos]").change(function() {
         
         var totalPrice = 0;
         $("#lecture-table tbody :checkbox[name=lectnos]:checked").parents("tr").each(function(index, tr) {
            var price = parseInt($(tr).find('td:eq(4)').text());
            totalPrice += price;
            $("#lect-total").val(totalPrice);
         });
         $("#lect-total").val(totalPrice);
         $("#lecture-summary-price").text(totalPrice);
      });
      
      
      $("#lecture-table thead :checkbox[name=lect-all-price]").change(function() {
         var totalPrice = 0;
         if($(this).is(":checked")){
            $("#lecture-table tbody :checkbox[name=lectnos]").prop("checked", true);
            $("#lecture-table tbody :checkbox[name=lectnos]:checked").parents("tr").each(function(index, tr) {
               var price = parseInt($(tr).find('td:eq(4)').text());
               totalPrice += price;
            });
            $("#lect-total").val(totalPrice);
            $("#lecture-summary-price").text(totalPrice);
         }else{
            $("#lecture-table tbody :checkbox[name=lectnos]").prop("checked", false);
            $("#lecture-summary-price").text(totalPrice);
         }
         
      })
      
   
   $("#test-table tbody :checkbox[name=testnos]").change(function() {
      
      var totalPrice = 0;
      $("#test-table tbody :checkbox[name=testnos]:checked").parents("tr").each(function(index, tr) {
         var price = parseInt($(tr).find('td:eq(3)').text());
         totalPrice += price;
      });
      $("#test-total").val(totalPrice);
      $("#test-summary-price").text(totalPrice);
   });
   
   
   $("#test-table thead :checkbox[name=test-all-price]").change(function() {
      var totalPrice = 0;
      if($(this).is(":checked")){
         $("#test-table tbody :checkbox[name=testnos]").prop("checked", true);
         $("#test-table tbody :checkbox[name=testnos]:checked").parents("tr").each(function(index, tr) {
            var price = parseInt($(tr).find('td:eq(3)').text());
            totalPrice += price;
         });         
         $("#test-summary-price").text(totalPrice);
      }else{
         $("#test-table tbody :checkbox[name=testnos]").prop("checked", false);
         $("#test-summary-price").text(totalPrice);
      }
      
   }) */
   
   </script>


	<%@ include file="../common/footer.jsp"%>