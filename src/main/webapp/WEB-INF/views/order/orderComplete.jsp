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

</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%@ include file="../common/user-sidebar.jsp"%>

	<div class="col-sm-9">
		<h1>주문완료</h1>
	</div>
	</div>


	<script type="text/javascript">
	var testNo;
	
	//모달 내 쿠폰 적용하기 클릭시
	$("#btn-apply-coupon").click(function(event){
		var couponNo = $("#modal-radio :checked").val();
		if($("#modal-radio :checked").length == 0){
			event.preventDefault();
			alert("쿠폰이 선택되지 않았습니다.");
			return;
		}
		$.get("/coupon/insertUsedCouponInTest.hta", 
				{testNo:testNo, couponNo:couponNo}, function(data){
			$("#modal-my-coupons").modal("hide");
			$("#td-coupon-apply-price-" + testNo).empty();
			var couponAppliedPrice = $("#coupon-total-price").text();
			$("#td-coupon-apply-price-" + testNo).append(couponAppliedPrice.toLocaleString()+'원');
		})
	})
	
	//모달 내 할인금액 쿠폰 클릭시 실행
	function calculateDiscountPrice(disprice,couponNo){
		console.log("aaa");
		var origin_disprice = $("#coupon-disprice").text();
		//console.log("couponNo",couponNo);
		//쿠폰 중복 여부 확인
		$.get(
			"/coupon/isUsedInTest.hta?couponNo=" + couponNo, function(data){
				console.log(data);
				console.log(data.testNo);
				console.log(testNo);
				if(data && testNo != data.testNo){
					var status = confirm("다른 상품에 이미 적용된 쿠폰입니다. 취소 후 이 상품에 적용하시겠습니까?");
					if(!status){
						$("#coupon-" +couponNo).prop("checked", false);
						$("#coupon-disprice").text(origin_disprice);
					} else {
						$("#coupon-disprice").text(disprice);
					}
				} 
				//쿠폰 모달 금액 변동
				$("#coupon-disprice").text(disprice);
				var result = $("#coupon-price").text() - $("#coupon-disprice").text();
				if(result < 0){
					result = 0;
				}
				$("#coupon-total-price").text(result);
			}		
		)
	}
	
	//모달 내 할인퍼센트 쿠폰 클릭시 실행
	function calculateDiscountRate(rate,couponNo){
		console.log("aaa");
		$.get("/coupon/isUsedInTest.hta?couponNo=" + couponNo, function(data){
				console.log("퍼센트",data);
				if(data){
					var status = confirm("적용된 쿠폰입니다. 이 상품에 새로 적용하시겠습니까?");
					if(status == true){
						
					}
				} else {
					//쿠폰 모달 금액 변동
					//$("#coupon-disprice").text(disprice);
					var result = $("#coupon-price").text() - $("#coupon-disprice").text();
					if(result < 0){
						result = 0;
					}
					$("#coupon-total-price").text(result);
					//
				}
			}		
		)
		var price = $("#coupon-price").text();
		var result = 0;
		$("#coupon-disprice").text(price*((100-rate)/100));
		result = $("#coupon-price").text() - $("#coupon-disprice").text();
		if(result < 0){
			result = 0;
		}
		$("#coupon-total-price").text(result);
	}
	
	//상품 리스트에서 쿠폰 적용 이미지 클릭 시
	function applyCoupon(price, event, no){
		//이건 한번
		console.log("쿠폰적용")
		event.preventDefault();
		testNo = no;
		//클릭하지 않은 상태로 체크해제시킴.
		$("#modal-radio :radio").prop("checked", false);
		$("#coupon-price").text(price);
		$("#coupon-disprice").text(0);
		$("#coupon-total-price").text(price);
		$.get("/coupon/getAppliedCouponInTest.hta?testNo=" + testNo, function(data){
			//$("#coupon-"+ data).click();
			$("#coupon-" + data).prop("checked", true);
			//$("#coupon-" + data).trigger("click");
			//여기서부터 내일하자
			/* if($("#modal-radio :radio").is(":checked")){
				//$("#modal-radio :radio:checked").trigger("click");
				
				
			} else {
				$("#coupon-price").text(price);
				$("#coupon-disprice").text(0);
				$("#coupon-total-price").text(price); 
			} */
			//$("#modal-my-coupons").modal("show"); 	
		})
		$("#modal-my-coupons").modal("show"); 	
	}
	
	$("label").click(function(){
		$(".div-pay-info").css("display", "none");
		$(".li-color").css("background-color", "white");
		$(this).closest("li").css("background-color", "#ebf7f5").find(".div-pay-info").css("display", "block");
	})
	
   </script>
	<%@ include file="../common/footer.jsp"%>