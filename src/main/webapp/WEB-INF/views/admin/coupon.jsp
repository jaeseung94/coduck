<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>관리자 - 쿠폰 관리</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<!-- Custom fonts for this template-->
	<link href="../../../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
	<!-- Custom styles for this template-->
	<link href="../../../resources/css/sb-admin-2.min.css" rel="stylesheet">	

<style type="text/css">
	.modal-body div {padding-top: 2px;};
</style>
</head>
<body id="page-top">
<div id="wrapper">
<%@include file="common/admin-side.jsp" %>
	<div id="content-wrapper" class="d-flex flex-column">
	<%@include file="common/admin-nav.jsp" %>
		<div class="container-fluid">			
			<div class="row">
				<div class="col-sm-12">
					<form class="form-horizontal" id="coupon-list-form" action="/coupon/deletecheckcoupons.hta" method="get">
						<div class="row">
							<div class="col-sm-6"><h3>쿠폰 관리</h3></div>
							<div class="col-sm-6">
								<input placeholder="검색" style="float: right;">
							</div>
						</div>
						<div class="row" style="margin-bottom: 10px;">
							<div class="col-sm-6">
								<button type="button" class="btn btn-primary couponsend-btn" id="couponSendBtn" ><i class="far fa-paper-plane"></i> 쿠폰 발송</button>
							</div>
							<div class="col-sm-6 text-right">
								<button type="button" class="btn btn-success couponadd-btn " id="couponAddBtn" ><i class="fas fa-plus-circle"></i> 쿠폰 추가</button>
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-12">
								<table class="table" id="coupon-table">
									<thead>
										<tr>
											<th>
												<input type="checkbox" id="checkallcoupon">
											</th>
											<th>쿠폰명</th>
											<th>쿠폰내용</th>
											<th>유효기간</th>
											<th>수량</th>
											<th>관리기능</th>
										</tr>
									</thead>
									<tbody>
									<c:choose>
										<c:when test="${empty coupons } ">
											<tr>
												<td colspan="6" class="text-center">등록된 쿠폰이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="coupon" items="${coupons }">
												<tr>
													<td><input type="checkbox" name="couponno" value="${coupon.no }"></td>
													<td>${coupon.title }</td>
													<td>${coupon.detail }</td>
													<td>
														<span><fmt:formatDate value="${coupon.startDate }" pattern="yyyy-MM-dd"/></span>
														 ~ 
														 <span><fmt:formatDate value="${coupon.endDate }" pattern="yyyy-MM-dd"/></span>
													</td>
													<td>${coupon.limited eq 'N' ? '무제한' : coupon.amount }</td>
													<td>
														<button type="button" data-coupon-no="${coupon.no }"><i class="far fa-edit"></i>수정</button>
														<button type="button" data-coupon-no="${coupon.no }"><i class="far fa-trash-alt"></i>삭제</button>
													</td>									
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>	
									</tbody>				
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<button type="button" class="btn btn-danger" style="float: right;" id="couponDeleteBtn">
									<i class="far fa-trash-alt"></i>삭제
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 쿠폰 추가하기(모달) -->
<div class="modal fade" id="modal-coupon-add" role="dialog">
	<div class="modal-dialog">
		<form id="add-coupon-form" class="well" method="post" action="/coupon/addcoupon.hta">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">쿠폰 추가</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-12">
							<label for="couponName">쿠폰명</label>
							<input type="text" class="form-control" name="title"> 
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<label for="couponDetail">쿠폰내용</label>
							<textarea class="form-control" rows="5" name="detail"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<h6 style="margin-bottom: -5px;">유효기간</h6>
							<div class="row">
								<div class="col-sm-5">
		                        	<input type="date" class="form-control" id="addStartDate" name="startDate" placeholder="시작일">
		                        </div>
		                        <div class="col-sm-2">
		                        	<p style="text-align: center;">~</p>
		                        </div>
		                        <div class="col-sm-5">
		                        	<input type="date" class="form-control"  id="addEndDate" name="endDate" placeholder="종료일" disabled>
		                        </div>        
	                    	</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="radio-box">			
								<!-- radio에 동일한 name을 하여 하나만 고를 수 있다. -->
								<input type="radio" name="discountRadio"  data-field-id="add-discount-radio-rate" checked="checked">할인비율
								<input type="number" name="discountRate" max="99" style="width: 10%;"  id="add-discount-radio-rate"> %	
								<br>			
								<input type="radio"  name="discountRadio" data-field-id="add-discount-radio-price">할인금액
								<input type="number" name="discountPrice" max="200000" style="width: 25%;" disabled="disabled" id="add-discount-radio-price"> 원						
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<h6>쿠폰수량</h6>
							<input type="number" max="9999" name="amount" id="add-coupon-amount">
							<label class="checkbox"><input type="checkbox" name="limited" id="add-check-limited" value="N">무제한</label>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-info" >추가하기</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- 쿠폰 수정하기(모달) -->
<div class="modal fade" id="modal-coupon-update" role="dialog">
	<div class="modal-dialog">
		<form id="update-coupon-form" class="well" method="post" action="/coupon/updatecoupon.hta">
			<input type="hidden" name="couponno">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">쿠폰 수정</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-12">
							<label for="couponName">쿠폰명</label>
							<input type="text" class="form-control" name="title"> 					
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<label for="couponDetail">쿠폰내용</label>
							<textarea class="form-control" rows="5" name="detail"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<h6 style="margin-bottom: -5px;">유효기간</h6>
							<div class="row">
								<div class="col-sm-5">
		                        	<input type="date" class="form-control" id="updateStartDate" name="startDate" placeholder="시작일">
		                        </div>
		                        <div class="col-sm-2">
		                        	<p style="text-align: center;">~</p>
		                        </div>
		                        <div class="col-sm-5">
		                        	<input type="date" class="form-control"  id="updateEndDate" name="endDate" placeholder="종료일" disabled>
		                        </div>        
	                    	</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="radio-box">			
								<!-- radio에 동일한 name을 하여 하나만 고를 수 있다. -->
								<input type="radio" name="discountRadio1"  data-field-id="update-discount-radio-rate" checked="checked">할인비율
								<input type="number" name="discountRate" max="99" style="width: 10%;"  id="update-discount-radio-rate"> %	
								<br>			
								<input type="radio"  name="discountRadio2" data-field-id="update-discount-radio-price">할인금액
								<input type="number" name="discountPrice" max="200000" style="width: 25%;" disabled="disabled" id="update-discount-radio-price"> 원						
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<h6>쿠폰수량</h6>
							<input type="number" max="9999" name="amount" id="update-coupon-amount">
							<label class="checkbox"><input type="checkbox" name="limited" id="update-check-limited" value="N">무제한</label>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-info" >수정하기</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- 쿠폰(아이콘) 삭제하기(모달) -->
<div class="modal fade" id="modal-coupon-delete" role="dialog">
	<div class="modal-dialog">
		<form id="delete-coupon-form" class="well" method="get" action="/coupon/deletecoupon.hta">
			<input type="hidden" name="couponno">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">쿠폰 삭제</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<p>해당 쿠폰을 삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger" >삭제하기</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- 쿠폰(체크) 삭제하기(모달) -->
<div class="modal fade" id="modal-check-coupon-delete" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">쿠폰 삭제</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<p>해당 쿠폰을 삭제하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="btn-check-coupon-delete">삭제하기</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 쿠폰 발송하기(모달) -->
<div class="modal fade" id="modal-coupon-send" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">쿠폰 보내기</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-6">
						<h4>쿠폰 리스트</h4>
						<p>지급할 쿠폰을 선택하세요.</p>
						<input type="text" class="form-control" placeholder="검색" id="coupon-name-field">
						<ul class="list-group" style="max-height: 150px; overflow: auto; " id="coupon-all-list">
							<c:choose>
								<c:when test="${empty coupons } ">
									<li>등록된 쿠폰이 없습니다.</li>
								</c:when>
								<c:otherwise>
									<c:forEach var="coupon" items="${coupons }">
										<li class="list-group-item" data-coupon-no="${coupon.no }">${coupon.title }(${coupon.detail })</li>
									</c:forEach>
								</c:otherwise>
							</c:choose>	
						</ul>
					</div>
					<div class="col-sm-6">
						<h4>회원 리스트</h4>
						<p>쿠폰 받을 회원을 선택하세요.</p>
						<input type="text" class="form-control" placeholder="검색" id="user-name-field">
						<ul class="list-group" style="max-height: 150px; overflow: auto; " id="user-all-list">
						</ul>
						<span style="vertical-align: -webkit-baseline-middle;"><i class="fas fa-users"></i>전체 회원수 <strong id="total-user-size">0</strong>명</span>
						<button type="button" class="btn btn-primary btn-xs" id="user-all-selected">전체</button>
						<button type="button" class="btn btn-warning btn-xs" id="user-move-down">아래로</button>
					</div>
				</div>
				<hr/>
				<div class="row">
					<div class="col-sm-6">
						<p style="text-align:center; margin: 10px 0;">선택된 쿠폰 상세정보</p>
						<table class="table" id="modal-coupon-detail-table">
							<thead>
								<tr>
									<th class="text-center">발송할 쿠폰을 선택하세요.</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="col-sm-6">
						<p>쿠폰 받을 대상자입니다.</p>
						<ul class="list-group" style="max-height: 150px; overflow: auto; " id="user-select-list">
						</ul>
						<span style="vertical-align: -webkit-baseline-middle;"><i class="fas fa-users"></i>수신 회원수 <strong id="received-user-size">0</strong>명</span>
						<button type="button" class="btn btn-primary btn-xs" id="user-select-selected">전체</button>
						<button type="button" class="btn btn-warning btn-xs" id="user-move-up">위로</button>
					</div>
				</div>
			</div>
			
			<form id="send-coupon-form" class="well" method="post" action="/coupon/insertCouponByAdmin.hta">
				<div class="modal-footer">
					<button type="submit" class="btn btn-info" id="send-coupon-btn">발송하기</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" id="send-coupon-cancel">닫기</button>
				</div>
				<div id="selected-user-box">
				
				</div>
				<div id="selected-coupon-box">
					
				</div>
			</form>
		</div>						
	</div>
</div>
<!-- Bootstrap core JavaScript-->
<script src="../../../resources/vendor/jquery/jquery.min.js"></script>
<script src="../../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="../../../resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="../../../resources/js/sb-admin-2.min.js"></script>
<!-- Page level plugins -->
<script src="../../../resources/vendor/chart.js/Chart.min.js"></script>
<!-- Page level custom scripts -->

<script type="text/javascript">
	
	$("#addStartDate").change(function() {
		var today = new Date();
		var yesterday = new Date(today.getTime() + (1000*60*60*24* - 1));
		var startDate = new Date($(this).val());
		
		if (startDate.getTime() < yesterday.getTime()) {
			alert("유효기간 시작일은 오늘을 포함하여 이후 날짜로 선택하세요.");
			$(this).val('');
			return;
		}
		
		if ($("#addEndDate").val()) {
			var endDate = new Date($("#addEndDate").val());
			
			if (startDate.getTime() > endDate.getTime()) {
				alert("유효기간 시작일은 유효기간 종료일보다 이전 날짜로 선택하세요.");
				$(this).val('');
				return;
			}
		}
		
		$("#addEndDate").prop('disabled', false);
		
	});
	
	$("#updateStartDate").change(function() {
		var today = new Date();
		var yesterday = new Date(today.getTime() + (1000*60*60*24* - 1));
		var startDate = new Date($(this).val());
		
		if (startDate.getTime() < yesterday.getTime()) {
			alert("유효기간 시작일은 오늘을 포함하여 이후 날짜로 선택하세요.");
			$(this).val('');
			return;
		}
		
		if ($("#updateEndDate").val()) {
			var endDate = new Date($("#updateEndDate").val());
			
			if (startDate.getTime() > endDate.getTime()) {
				alert("유효기간 시작일은 유효기간 종료일보다 이전 날짜로 선택하세요.");
				$(this).val('');
				return;
			}
		}
		
		$("#updateEndDate").prop('disabled', false);
		
	});

	$("#updateEndDate").change(function() {
		var startDate = new Date($("#updateStartDate").val());
		var endDate = new Date($(this).val());
		
		if (endDate.getTime() < startDate.getTime()) {
			alert("유효기간 종료일은 유효기간 시작 날짜 이후 날짜로 선택하세요.");
			$(this).val('');
			return;
		}
		
	});
	
	// 쿠폰 리스트 (필터하기)
	$("#coupon-name-field").keyup(function() {
		var keyword = $("#coupon-name-field").val();
		if (keyword == "") {
			$("#coupon-all-list li").show();
		} else {
			$("#coupon-all-list li:contains("+keyword+")").show();
			$("#coupon-all-list li:not(:contains("+keyword+"))").hide();
		}
	});
	
	// 회원 리스트 (필터하기)
	$("#user-name-field").keyup(function() {
		var keyword = $("#user-name-field").val();
		if (keyword == "") {
			$("#user-all-list li").show();
		} else {
			$("#user-all-list li:contains("+keyword+")").show();
			$("#user-all-list li:not(:contains("+keyword+"))").hide();
		}
	});
	
	
	// 쿠폰 발송(값을 입력하지 않았을 경우)
	$("#send-coupon-form").submit(function() {
		if ($("#selected-coupon-box input[name='couponno']").length == 0) {
			alert("지급할 쿠폰을 선택하세요.");
			return false;
		}
		
		if ($("#selected-user-box input[name='userno']").length == 0) {
			alert("쿠폰 받을 대상자를 선택하세요.");
			return false;
		}
		
		
		return true;
	})
	
	// 쿠폰 추가(값을 입력하지 않았을 경우)
	$("#add-coupon-form").submit(function() {
		if ($("#add-coupon-form :input[name=title]").val().trim() == "") {		
			alert("쿠폰명을 입력해주세요.");
			$("#add-coupon-form :input[name=title]").focus();
			return false;
		}
		
		if ($("#add-coupon-form :input[name=startDate]").val().trim() == "" || $("#add-coupon-form :input[name=endDate]").val().trim() == "") {		
			alert("유효기간을 입력해주세요.");
			$("#add-coupon-form :input[name=startDate]").focus();
			return false;
		}
		
		if ($("#add-coupon-form :input[name=discountRate]").val() == "" && $("#add-coupon-form :input[name=discountPrice]").val() == "") {		
			alert("할인비율 또는 할인금액을 입력해주세요.");
			$("#add-coupon-form :input[name=discountRate]").focus();
			return false;
		}
		
		if ($("#add-coupon-form :input[name=amount]").val() == "" && $("#add-coupon-form :input[name=limited]").is(":checked") == false) {		
			alert("쿠폰수량(무제한)을 입력해주세요.");
			$("#add-coupon-form :input[name=amount]").focus();
			return false;
		}	
		
		return true;
	});
	
	$('#couponAddBtn').click(function(){
		$("#modal-coupon-add").modal('show');
	});
	
	
	// 수정하기
	$('#coupon-table button:has(.fa-edit)').click(function(){
		var couponNo = $(this).data("coupon-no");
		$("#modal-coupon-update input[name=couponno]").val(couponNo);
		
		$.getJSON("/coupon/couponDetail.hta", {couponno:couponNo}, function(result) {
			$("#modal-coupon-update input[name=title]").val(result.title);
			$("#modal-coupon-update textarea[name=detail]").val(result.detail);
			
			var startDate = result.startDate;
			var endDate = result.endDate;
			
			if (startDate < endDate) {
				$("#modal-coupon-update input[name=startDate]").val(result.fmtStartDate);
			}
			
			if (startDate < endDate) {
				$("#modal-coupon-update input[name=endDate]").val(result.fmtEndDate);
				$("#modal-coupon-update input[name=endDate]").prop("disabled", false);
			}			
			
			var discountPrice = result.discountPrice;
			var discountRate = result.discountRate;
			
			if (discountPrice != 0) {
				$("#modal-coupon-update input[name=discountRadio2]").prop("checked", true);
				$("#modal-coupon-update input[name=discountRadio1]").prop("checked", false);
				$("#modal-coupon-update #update-discount-radio-price").val(discountPrice);
				$("#modal-coupon-update #update-discount-radio-rate").val('');
				$("#modal-coupon-update #update-discount-radio-rate").prop("disabled", true);
				$("#modal-coupon-update #update-discount-radio-price").prop("disabled", false);
			}
			
			if (discountRate != 0) {
				$("#modal-coupon-update input[name=discountRadio1]").prop("checked", true);
				$("#modal-coupon-update input[name=discountRadio2]").prop("checked", false);
				$("#modal-coupon-update #update-discount-radio-rate").val(discountRate);
				$("#modal-coupon-update #update-discount-radio-price").val('');
				$("#modal-coupon-update #update-discount-radio-price").prop("disabled", true);
				$("#modal-coupon-update #update-discount-radio-rate").prop("disabled", false);
			}
			
			var amount = result.amount;
			var limited = result.limited;
			
			if (limited == 'Y') {
				$("#modal-coupon-update input[name=amount]").prop("disabled", false);
				$("#modal-coupon-update input[name=limited]").prop("checked", false);
				$("#modal-coupon-update input[name=amount]").val(amount);
			}
			
			if (limited == 'N') {
				$("#modal-coupon-update input[name=amount]").prop("disabled", true);
				$("#modal-coupon-update input[name=limited]").prop("checked", true);
				$("#modal-coupon-update input[name=amount]").val('');
			}
			
		});
		
		/* var title = $tr.find("td:eq(1)").text();
		var detail = $tr.find("td:eq(2)").text();
		var startDate = $tr.find("td:eq(3) span:first").text();
		var endDate = $tr.find("td:eq(3) span:last").text();
		var amount = $tr.find("td:eq(4)").text();
		
		
		console.log(name, desc, startDate, endDate, amount) */
		
		$("#modal-coupon-update").modal('show');
		
	});
	
	// 삭제하기(아이콘)
	$('#coupon-table button:has(.fa-trash-alt)').click(function(){
		
		var couponNo = $(this).data("coupon-no");
		$("#delete-coupon-form [name=couponno]").val(couponNo);
		$("#modal-coupon-delete").modal('show');
	});
	
	// 삭제하기(체크)
	$("#couponDeleteBtn").click(function() {
		
		var couponNos = $("#coupon-table input[name=couponno]:checked");
	
		if (couponNos.length == 0) {
			alert("삭제할 쿠폰을 체크해주세요.");
			return;
		}
		
		$("#modal-check-coupon-delete").modal('show');
	});
	
	// 체크된 쿠폰 삭제하기
	$("#btn-check-coupon-delete").click(function() {
		$("#coupon-list-form").submit();
	});
	
	$("#user-all-list").on('click', '.list-group-item', function() {
		$(this).toggleClass('active');
	})
	
	$("#user-all-selected").click(function() {
		$("#user-all-list li").toggleClass('active');
	});
	
	$("#user-all-selected").click(function() {
		if ($("#user-all-list .list-group-item").hasClass("active")) {
			$("#user-all-list .list-group-item").removeClass("active");
			$("#user-all-list .list-group-item").addClass("active");	
		} else {
			$("#user-all-list .list-group-item").removeClass("active");
		}
	});
	
	$("#user-select-list").on('click', '.list-group-item', function() {
		$(this).toggleClass('active');
	})
	
	$("#user-select-selected").click(function() {
		$("#user-select-list li").toggleClass('active');
	});
	
	$("#user-select-selected").click(function() {
		if ($("#user-select-list .list-group-item").hasClass("active")) {
			$("#user-select-list .list-group-item").removeClass("active");
			$("#user-select-list .list-group-item").addClass("active");	
		} else {
			$("#user-select-list .list-group-item").removeClass("active");
		}
	});
	
	// 아래로 버튼
	$("#user-move-down").click(function() {
		var couponQuota = parseInt($("#modal-coupon-detail-table tr:last td").text());		// 총 쿠폰수량
		var couponLimit = $("#modal-coupon-detail-table tr:last td").text();
		var currentUserLength = $("#selected-user-box > input").length;						// 현재 쿠폰 받을 대상자
		var selectedUserLength = $("#user-all-list .active").length;						// 추가할 쿠폰 받을 대상자
		
		if (currentUserLength + selectedUserLength <= couponQuota || couponLimit == '무제한') {
			$("#user-all-list .active").each(function(index, el) {
				var userno = $(el).data("user-no");
				$("#selected-user-box").append("<input type='hidden' name='userno' value='"+userno+"'>");
			});
			
			$("#user-all-list .active").appendTo("#user-select-list");
			
		} else {
			alert("쿠폰 받을 대상자 숫자가 현재 쿠폰 숫자를 초과합니다.");
		}
		
		$("#received-user-size").text($("#user-select-list li").length);
	});  

	// 위로 버튼
	$("#user-move-up").click(function() {
		$("#user-select-list .active").each(function(index, el) {
			$("#selected-user-box input[name='userno']").remove();
		});
		
		$("#user-select-list .active").appendTo("#user-all-list");
		$("#user-select-list .active").remove();

		$("#received-user-size").text($("#user-select-list li").length);
	});  
	
	// 닫기 (쿠폰 보내기 모달창)
	$("#send-coupon-cancel").click(function() {
		$("#selected-user-box").empty();	
	});
	
	// 쿠폰 발송  
	$("#couponSendBtn").click(function() {
		
		$("#modal-coupon-send").modal('show');
		$("#user-select-list").empty();
		
		//(전체회원 조회하기)
		var $list = $("#user-all-list").empty();
		$.ajax({
			url: "/admin/couponuserlist.hta",
			type: "get",
			data: {},
			success: function(data) {
				$.each(data, function(index, user) {
					var li = '<li class="list-group-item" data-user-no="'+user.no+'">';
					li += user.name+"("+user.id+")";
					li += "</li>";
					
					$list.append(li);
				})
				
				$("#total-user-size").text(data.length);
			}
		})
	})
	
	// 쿠폰 리스트안에 쿠폰 클릭
	$("#coupon-all-list").on('click', '.list-group-item', function() {
		$(this).addClass('active').siblings().removeClass("active");
		$("#user-select-list li").appendTo("#user-all-list");
		$("#received-user-size").text(0);
		
		// 쿠폰 발송안에 감싸진 폼 (input type="hidden")에 값을 부여하기
		var couponno = $("#coupon-all-list .active").data("coupon-no");
		if (!couponno) {
			return;
		}
		$("#selected-coupon-box input[name='couponno']").remove();
		$("#selected-coupon-box").append("<input type='hidden' name='couponno' value='"+couponno+"'>");
		
		var $table = $("#modal-coupon-detail-table").empty();
		
		$.ajax({
			url: "/coupon/couponDetail.hta",
			type: "get",
			data: {couponno:couponno},
			success: function(result) {		 
				var table = "<tr>";
				table += "<th>쿠폰명</th>";
				table += "<td>"+result.title+"</td>";
				table += "</tr>";
				table += "<tr>";
				table += "<th>쿠폰내용</th>";
				table += "<td>"+result.detail+"</td>";
				table += "</tr>";
				table += "<tr>";
				table += "<th>유효기간</th>";
				table += "<td>"+result.fmtStartDate+' ~ '+result.fmtEndDate+"</td>";		
				table += "</tr>";
				table += "<tr>";
				table += "<th>수량</th>";
				if (result.limited == 'Y') {
					table += "<td>"+result.amount+"</td>";
				} else  if (result.limited == 'N') {
					table += "<td>무제한</td>";
				}
				table += "</tr>";			
				
				$table.append(table);
			}
		});
	})
		
	$("#modal-coupon-add :input[name=discountRadio]").change(function() {	
		$(":input[name=discountRate], :input[name=discountPrice]").prop('disabled', true);
		$(":input[name=discountRate]").val('')
		$(":input[name=discountPrice]").val('')

		$("#" + $(this).data('field-id')).prop('disabled', false);	
	})
	
	$("#modal-coupon-update :radio").change(function() {	
		$(":input[name=discountRate], :input[name=discountPrice]").prop('disabled', true);
		$(":input[name=discountRate]").val('')
		$(":input[name=discountPrice]").val('')
		$("#modal-coupon-update :radio").prop('checked', false);

		$(this).prop('checked', true);
		$("#" + $(this).data('field-id')).prop('disabled', false);	
	})
	
	$("#modal-coupon-add input[name=limited]").click(function() {
		if ($("#add-check-limited").prop('checked')) {
			$("#add-coupon-amount").prop('disabled', true);
			$("#add-coupon-amount").val('');
		} else {
			$("#add-coupon-amount").prop('disabled', false);
		}
	})
	
	$("#modal-coupon-update input[name=limited]").click(function() {
		if ($("#update-check-limited").prop('checked')) {
			$("#update-coupon-amount").prop('disabled', true);
			$("#update-coupon-amount").val('');
		} else {
			$("#update-coupon-amount").prop('disabled', false);
		}
	})
	
	$("#modal-coupon-add").change(function() {
		if ($("#modal-coupon-add input[name=limited]").is(":checked")) {
			$("#modal-coupon-add input[name=limited]").val('N');
		} else {
			$("#modal-coupon-add input[name=limited]").val('Y');
		}
	});
	
	$("#modal-coupon-update").change(function() {
		if ($("#modal-coupon-update input[name=limited]").is(":checked")) {
			$("#modal-coupon-update input[name=limited]").val('N');
		} else {
			$("#modal-coupon-update input[name=limited]").val('Y');
		}
	});
	
	$('#coupon-all-list').on('click', 'li', function() {
		$('#coupon-all-list li.active').removeClass('active');
		$(this).addClass("active");	
	});
	
	$('#checkallcoupon').click(function() {
		if ($('#checkallcoupon').prop("checked")) {
			$("input[name=couponno]").prop("checked", true);
		} else {
			$("input[name=couponno]").prop("checked", false);
		} 
	});
	
	
</script>
</body>
</html>