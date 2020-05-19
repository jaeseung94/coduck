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

<!-- sy.css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/sy-style.css' />">
<!-- sy.js -->
<script src="/resources/js/common.js"></script>
<style type="text/css">
#test-table tr th, #test-table tr td {
	text-align: center;
}

#table-final-price td {
	text-align: left;
	color: #737373;
	font-size: 13px;
}

#btn-pay {
	background-color: #f44336;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 21px;
	font-weight: bold;
	margin: 4px 2px;
	cursor: pointer;
	width: 100%;
}

#table-pay-info tr th, #table-pay-info tr td {
	vertical-align: middle;
}

#table-pay-info tr th {
	background-color: #f1f1f1;
}

ul {
	border-bottom: rgb(221, 221, 221);
	list-style: none;
}

.process {
	margin-left: 20px;
	font-weight: bold;
	font-size: 22px
}

.font-bold {
	font-weight: bold;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%@ include file="../common/user-sidebar.jsp"%>

	<div class="col-sm-9">
		<img alt="" src="/imgs/장바구니 2단계.PNG"
			style="width: 100%; height: 90px;">
		<c:if test="${param.error eq 'failcartno' }">
			<div class="row">
				<div class="col-sm-12">
					<div class="alert alert-danger">
						<strong>구매 실패 </strong> 입력오류
					</div>
				</div>
			</div>
		</c:if>

		<div class="row">
			<p class="process" style="margin-top: 30px;">1. 주문 상품 확인 및 할인 적용</p>

			<div class="col-sm-9">
				<form action="/order/ordertests.hta" method="post"
					class="form-horizontal">
					<table class="table table-bordered" id="test-table">
						<thead id="test-thead">
							<tr style="background-color: #f1f1f1;">
								<th>번호</th>
								<th>상품명</th>
								<th>수량</th>
								<th>쿠폰 적용가</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty tests }">
									<tr>
										<td colspan="4" class="text-center">선택한 상품이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="test" items="${tests }" varStatus="loop">
										<tr>
											<td>${loop.count }<input type="hidden"
												class="form-control" name="testno" value="${test.no }" /></td>
											<td>${test.name }>${test.ep }<a
												onclick="applyCoupon(${test.price},event, ${test.no })"
												class="a-coupon" href="" style="margin-left: 20px"><img
													src="/imgs/쿠폰 적용.PNG"></a></td>
											<td>1</td>
											<td data-test-price="${test.price }" data-test-no="${test.no }" class="coupon-apply-price" id="td-coupon-apply-price-${test.no }"><span class="pricelist"><fmt:formatNumber>${test.price }</fmt:formatNumber></span>원</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				
			<div class="col-sm-3" style="padding-left: 0px;">
				<table class="table" style="border: 3px solid #f44336; margin: 0px;"
					id="table-final-price">
					<tbody>
						<tr style="background-color: #f44336;">
							<td style="font-size: 20px; color: white; font-weight: bold;">최종결제금액</td>
						</tr>
						<tr style="height: 45px;">
							<td style="vertical-align: middle;"><span style="float:left;width:49%;">총 주문금액 : </span><span style="float: right; color: black;">원</span> <span style="float:right; font-weight: bold; color: black;"><fmt:formatNumber value="${totalPrice }" /></span></td>
						</tr>
						<tr style="height: 45px">
							<td style="vertical-align: middle;"><span style="float:left;width:49%;">총 할인금액 : </span><span style="float: right; color: black;">원</span> <span style="float:right; font-weight: bold; color: black;" id="totalDiscount"></span></td>
						</tr>
						<tr style="height: 70px;">
						
							<td style="vertical-align: middle;"><span style="float:left;width:49%; font-weight: bold; margin-top: 10px;">최종결제금액 : </span><span style="float: right; color: black; margin-top: 10px;">원</span> <span style="float:right; font-weight: bold; color: red; font-size: 24px;" id="finalPrice"></span></td>
						</tr>
					</tbody>
				</table>
				<button id="btn-pay" style="margin-left: 0px;">
					<img src="/imgs/결제 아이콘.PNG" height="35px;"
						style="margin-right: 5px;" /><span>결제하기</span>
				</button>
			</div>
		</div>

		<div class="row">
			<p class="process">2. 결제 정보 선택</p>
			<div class="col-sm-9">
				<table class="table table-bordered" id="table-pay-info">
					<colgroup>
						<col width="20%">
						<col width="*">
					</colgroup>
					<tr>
						<th>적립금 사용</th>
						<td>
							<p>
								사용가능액 : <span style="font-weight: bold;"><fmt:formatNumber value="${point }"/></span>원
							</p>
							<p>
								<input type="text" value="0" class="text-right" id="input-point" 
									style="padding-right: 5px; color: #f44336; width: 100px;">원
								<span style="margin: 0px 15px 0px 15px;">
								<label><input id="allpoint" type="checkbox">모두사용</label>	
								</span>
								<button id="btn-point-apply" type="button">적용</button>
							</p>
						</td>
					</tr>
					<tr>
						<th>결제 수단</th>
						<td style="padding: 0px; height: 100%;">
							<ul style="margin-left: 0px; padding: 0px; margin-bottom: 0px;">
								<li style="border-bottom: 1px solid #ddd;" class="li-color">
									<div class="radio" style="margin-left: 15px;">
										<label><input type="radio" checked name="payment">무통장
											입금</label>
									</div>
									<div class="row div-pay-info"
										style="border-top: 1px dotted black; width: 100%; margin: 0px; padding-top: 20px; display: none;">
										<div>
											<p style="margin-left: 10px;">
												입금은행 <span style="margin-left: 10px;"> <select>
														<option value="">선택</option>
														<option value="">기업은행</option>
														<option value="">국민은행</option>
														<option value="">농협</option>
														<option value="">우리은행</option>
														<option value="">신한은행</option>
														<option value="">부산은행</option>
														<option value="">KEB하나은행</option>
												</select>
												</span>
											</p>
											<p style="margin-left: 10px;">
												입금자명 <span style="margin-left: 10px;"> <input
													type="text" placeholder="사용자이름" />
												</span>
											</p>
										</div>
									</div>
								</li>
								<li class="li-color">
									<div class="radio" style="margin-left: 15px;">
										<label><input type="radio" name="payment">카카오
											페이</label>
									</div>
									<div class="row div-pay-info"
										style="border-top: 1px dotted black; width: 100%; margin: 0px; padding-top: 20px; display: none;">
										<div>
											<p style="margin-left: 10px;">
												입금은행 <span style="margin-left: 10px;"> <select>
														<option value="">선택</option>
														<option value="">기업은행</option>
														<option value="">국민은행</option>
														<option value="">농협</option>
														<option value="">우리은행</option>
														<option value="">신한은행</option>
														<option value="">부산은행</option>
														<option value="">KEB하나은행</option>
												</select>
												</span>
											</p>
											<p style="margin-left: 10px;">
												입금자명 <span style="margin-left: 10px;"> <input
													type="text" placeholder="사용자이름" />
												</span>
											</p>
										</div>
									</div>
								</li>
							</ul>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</div>


	<div id="modal-my-coupons" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">

			<div class="modal-content" style="padding: 10px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<p style="font-size: 24px;" class="modal-title">내쿠폰함</p>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-2">
							<p class="font-bold">쿠폰 할인</p>
						</div>
						<div class="col-sm-10">
							<c:choose>
								<c:when test="${not empty coupons}">
									<div class="radio" id="modal-radio">
										<c:forEach var="coupon" items="${coupons }">
											<p>
												<label for="coupon-${coupon.no }" style="font-size: 12px;" class="label-coupon" data-coupon-no="${coupon.no }" data-discountPrice=${coupon.discountPrice } data-discount-way=${coupon.discountWay }>
													<input class="radio-coupon" id="coupon-${coupon.no }" name="radio-coupon" value="${coupon.no }" type="radio"/>
													<span class="span-discountPrice" style="font-size: 14px; font-weight: bold;">${coupon.discountPrice }</span>${coupon.discountWay eq 'price' ? '원' : '%' } 할인
													<span style="margin-left: 10px;">${coupon.title }</span>
												</label> 
											</p>
										</c:forEach>
									</div>
								</c:when>
								<c:otherwise>
									<p>보유한 쿠폰이 없습니다.</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="row text-center"
						style="margin-top: 10px; padding: 10px;">
						<div class="col-sm-3">
							<p class="font-bold" style="font-size: 20px; margin-bottom: 0px;">상품가격</p>
							<p>
								<span id="coupon-price" style="font-size: 24px;">0</span>원
							</p>
						</div>
						<div class="col-sm-1" style="margin-top: 12px;">
							<p>
								<span class="glyphicon glyphicon-minus-sign"
									style="font-size: 20px;"></span>
							</p>
						</div>
						<div class="col-sm-3">
							<p class="font-bold" style="font-size: 20px; margin-bottom: 0px;">할인금액</p>
							<p>
								<span id="coupon-disprice" style="font-size: 24px;">0</span>원
							</p>
						</div>
						<div class="col-sm-1" style="margin-top: 12px;">
							<p>
								<img alt="" src="/imgs/equals.png" width="20px;" height="20px;">
							</p>
						</div>
						<div class="col-sm-4">
							<p class="font-bold" style="font-size: 20px; margin-bottom: 0px;">총
								상품금액</p>
							<p>
								<span id="coupon-total-price"
									style="font-size: 24px; color: #f44336;">0</span>원
							</p>
						</div>
					</div>
					<div class="row text-center"
						style="padding: 10px; margin-top: 20px;">
						<button type="button" class="btn btn-primary"
							id="btn-apply-coupon">쿠폰 적용</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
	</div>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript">
	
	var testNo;
	var xxxx = true;
	var checkedStatus = false;
	var sum = 0;
	var prevPointDiscount;
	var prevPointFinal;
	var IMP = window.IMP;
	IMP.init('imp06298246');
	
	IMP.request_pay({
	    pg : 'kakao',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 14000,
	    buyer_email : ${user.email},
	    buyer_name : ${user.name}
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }

	    alert(msg);
	});
	
	$("#btn-point-apply").click(function(){
		if($(this).hasClass("click")){
			$(this).removeClass("click").addClass("nonclick");
			$(this).text("적용");
			$("#totalDiscount").text(prevPointDiscount.toLocaleString());
			$("#finalPrice").text(prevPointFinal.toLocaleString());
		} else{
			$(this).removeClass("nonclick").addClass("click");
			$(this).text("적용 취소");
			var totalDiscount = commaNumberToInt($("#totalDiscount").text()) + commaNumberToInt($("#input-point").val());
			$("#totalDiscount").text(totalDiscount.toLocaleString());
			$("#finalPrice").text((${totalPrice} - totalDiscount).toLocaleString());
		}
	})
	
	$("#allpoint").click(function(e){
		if($(this).is(":checked")){
			var point =	${user.point};
			$("#input-point").val(point.toLocaleString());
		} else{
			$("#input-point").val(0);
		}
	})
	
	function commaNumberToInt(str){
		return parseInt(str.replace(/,/g , ''));
	} 
	
 	function totalDiscount(){
		var result = 0;
		$(".coupon-apply-price").each(function(index, item){
			result += commaNumberToInt($(item).find(".pricelist").text());
		})
		return ${totalPrice}-result;
	} 
	
 	$(".coupon-apply-price").each(function(index, item){
		testNo = $(item).data("test-no");
		$.get("/coupon/getAppliedCouponInTest.hta?testNo=" + testNo, function(data){
			if(data){//쿠폰
				var discountPrice = 0;
				if(data.discountWay == 'percent'){
					discountPrice =  $(item).data("test-price") * (data.discountPrice * 0.01);
				} else{
					discountPrice = data.discountPrice;
				}
				$(item).find(".pricelist").text(($(item).data("test-price") - discountPrice).toLocaleString());
			}
			sum += commaNumberToInt($(item).find(".pricelist").text());
			prevPointDiscount = ${totalPrice} - sum;
			$("#totalDiscount").text(prevPointDiscount.toLocaleString());
			prevPointFinal = ${totalPrice} - prevPointDiscount;
			$("#finalPrice").text(prevPointFinal.toLocaleString());
		})
 	})
	
	//모달 내 쿠폰 적용하기 클릭시
	$("#btn-apply-coupon").click(function(e){
		var couponNo;
		if($("#modal-radio :checked").length == 0){
			alert("쿠폰이 선택되지 않았습니다.");
			return;
		}
		if(checkedStatus){
			$("#modal-my-coupons").modal("hide");
			return;
		}
		couponNo = $("#modal-radio :checked").val();
		$.get("/coupon/insertUsedCouponInTest.hta", {testNo:testNo, couponNo:couponNo}, function(data){
			if(data != -1 && xxxx){
				//상품 가격 구하기
				var price = $("#td-coupon-apply-price-"+data).data("test-price");
				$("#td-coupon-apply-price-" +data).find(".pricelist").text(price.toLocaleString());
			}
			console.log($("#coupon-total-price").text());
			$("#td-coupon-apply-price-" + testNo).find(".pricelist").text($("#coupon-total-price").text().toLocaleString());
			$("#modal-my-coupons").modal("hide");
			console.log(totalDiscount());
			prevPointDiscount = totalDiscount();
			$("#totalDiscount").text(prevPointDiscount.toLocaleString());
			prevPointFinal = ${totalPrice} - prevPointDiscount
			$("#finalPrice").text(prevPointFinal.toLocaleString());
			$("#input-point").val(0);
			$("#allpoint").prop("checked", false);
			$("#btn-point-apply").removeClass("click").removeClass("nonclick").text("적용");
		})
	})
	
	//모달 내 쿠폰 클릭시
	$(".radio-coupon").change(function(e){
		console.log(111);
		e.preventDefault();
		e.stopPropagation();
		var label = $(this).hasClass("label-coupon") ? $(this) : $(this).closest(".label-coupon");
		var discountWay = label.data("discount-way");
		
		var couponNo = label.data("coupon-no");
		$.get("/coupon/isUsedInTest.hta?couponNo=" + couponNo, function(data){
			console.log(2);
			
			if(data && testNo != data.testNo){
				xxxx = confirm("이미 적용된 쿠폰입니다. 취소 후 이 상품에 새로 적용하시겠습니까?");
				if(xxxx){
					label.find("input:radio").prop("checked", true);
				} 
			} else{
				label.find("input:radio").prop("checked", true);
				//checkedStatus = true;
			}
			if(xxxx){
				var price = $("#coupon-price").text();
				var discountPrice = label.find(".span-discountPrice").text();
				if(discountWay == 'percent'){
					discountPrice =  price * (discountPrice * 0.01);
				}
				$("#coupon-disprice").text(discountPrice);
				$("#coupon-total-price").text(price-discountPrice);
			}
		}) 
	})

	//상품 리스트에서 쿠폰 적용 이미지 클릭 시
	function applyCoupon(price, event, no){
 		event.preventDefault();
		testNo = no;
		//클릭하지 않은 상태로 체크해제시킴.
		$("#modal-radio :radio").prop("checked", false);
		$("#coupon-price").text(price);
		$("#coupon-disprice").text(0);
		$("#coupon-total-price").text(price);
		//적용된 쿠폰 불러와서 체크시키기
		$.get("/coupon/getAppliedCouponInTest.hta?testNo=" + testNo, function(data){
			//$("#coupon-" + data).prop("checked", true);
			$("#coupon-" + data.couponNo).click();
		}) 
		$("#modal-my-coupons").modal("show"); 	
	}
	
	/* $("label").click(function(){
		$(".div-pay-info").css("display", "none");
		$(".li-color").css("background-color", "white");
		$(this).closest("li").css("background-color", "#ebf7f5").find(".div-pay-info").css("display", "block");
	}) */
	
   </script>
	<%@ include file="../common/footer.jsp"%>