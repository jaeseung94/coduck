<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>관리자 - 회원 관리</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<!-- Custom fonts for this template-->
	<link href="../../../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
	<!-- Custom styles for this template-->
	<link href="../../../resources/css/sb-admin-2.min.css" rel="stylesheet">	
	<!-- Custom styles for this page -->
    <link href="../../../resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
	<style type="text/css">
	.btn-date {border: 1px solid #cbc4c4;}
	#admin-lecture .form-group {height: 50px;}
	#customersInfoTable .customer-username {cursor: pointer;}
	.coupon-btn {min-width: 60px;}
	.coupon-btn li {font-size: 20px; text-align: center;}
	</style>
</head>
<body id="page-top">
<div id="wrapper">
<%@include file="common/admin-side.jsp" %>
	<div id="content-wrapper" class="d-flex flex-column">
	<%@include file="common/admin-nav.jsp" %>
		<div class="container-fluid">			
			<div class="row" id="admin-lecture">
				<h3 style="margin-left: 60px;">회원 관리</h3>
				<div class="col-sm-12">
		            <form action="#" class="form-horizontal style-form" method="get">
		                <div class="form-panel"
		                   style="background: #fff; margin-left:50px; margin-right:50px; padding-top:10px;">               
		
<!-- script - 참고 -->
		                    <div class="form-group col-sm-10" style="display: inline-flex;">
		                        <label class="control-label col-sm-1" style="margin-right:15px;">기간</label>
		                        <div style="display:inline-block; float:left;">
		                            <button type="button" class="btn btn-default  btn-date">오늘</button>
		                            <button type="button" class="btn btn-default  btn-date">3일 이내</button>
		                            <button type="button" class="btn btn-default  btn-date">7일 이내</button>
		                        </div>
		                        <div class="col-md-5">
		                            <div class="input-group input-large" data-date="2020-01-01" data-date-format="yyyy-MM-dd">
		                                <input type="date" class="form-control date1" name="from" placeholder="시작일" style="text-align:center;">
		                                <input type="date" class="form-control date2" name="to" placeholder="종료일" style="text-align:center;">
		                            </div>
		                        </div>
		                    </div>
		
		                    <div class="form-group col-sm-10" style="display: inline-flex;">
		                        <label class="control-label col-md-1">가입 여부</label>
		                        <div class="col-md-6">
		                            <div class="radio-dk">
		                                <label>
		                                    <input type="radio" id="optionsRadios1" name="status" value="statusall" checked="checked"> 전체
		                                </label>
		                                <label>
		                                    <input type="radio" id="optionsRadios2" name="status" value="yes"> 가입
		                                </label>
		                                <label>
		                                    <input type="radio" id="optionsRadios3" name="status" value="no"> 탈퇴
		                                </label>
		                            </div>                        
		                        </div>                       
			                    <div class="col-md-6" style="left: 410px;">
			                        <button type="button" class="btn btn-warning ">초기화</button>
			                    </div>
		                    </div>
		                </div>
		            </form>
		        </div>
			</div>
			
			<div class="row">
				<div class="col-sm-12">
		            <form action="#" class="form-horizontal style-form" method="get">
		                <div class="form-panel"
		                   style="background: #fff; margin-left:50px; margin-right:50px; ">               
		                    <div class="form-group col-sm-10">
		                    	<div class="row">
									<div class="col-sm-2">
			                    		<div>
			                    			<select class="form-control" style="width: 200px;">
			                    				<option value="">가입일순</option>
			                    				<option value="">아이디순</option>
			                    				<option value="">이름순</option>
			                    				<option value="">회원번호순</option>
			                    			</select>
			                    		</div>
			                    	</div>			                    	
			                    	<div class="col-sm-7">
			             
			                    	</div>
		                    		<div class="col-sm-2">
										<input type="text" class="form-control" style="width:200px;" placeholder="검색어를 입력하세요.">
									</div>	                    	
		                    		<div class="col-sm-1">
										<button type="button" class="btn btn-default  btn-date">검색</button>
									</div>	                    	
		                    	</div>
			                    <div class="row">			                    	
			                    </div>
			                    
		                    	<div class="row" style="margin-top: 10px;">
		                    		<div class="col-sm-12">
			                        	<table class="table" id="customersInfoTable" style="text-align: center;">
			                        		<colgroup>
			                        			<col width="8%">
			                        			<col width="11%">
			                        			<col width="12%">
			                        			<col width="12%">
			                        			<col width="10%">
			                        			<col width="8%">
			                        			<col width="8%">
			                        			<col width="10%">
			                        		</colgroup>
											<thead>
												<tr>
													<th>회원번호</th>
													<th>이름</th>
													<th>아이디</th>
													<th>이메일</th>
													<th>가입일</th>
													<th>가입여부</th>
													<th>탈퇴처리</th>
													<th>쿠폰처리</th>
												</tr>
											</thead>
											<tbody>
											<c:choose>
												<c:when test="${empty users }">
													<tr>
														<td colspan="8" class="text-center">가입된 회원이 없습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach var="user" items="${users }">
														<tr>
															<td>${user.no }</td>
															<td><a class="customer-username" data-user-no="${user.no }" data-toggle="modal" data-targe="#myModal">
																${user.name }
																</a>
															</td>
															<td>${user.id }</td>
															<td>${user.email }</td>
															<td><span><fmt:formatDate value="${user.createDate }" pattern="yyyy-MM-dd"/></span></td>
															<td>${user.enabled }</td>
															<td><button type="button" class="btn btn-danger" data-user-no="${user.no }"><i class="far fa-minus-square"></i></button></td>
															<td>
																<div class="btn-group">
																    <button type="button" class="btn btn-primary">쿠폰</button>
																    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
																    	<span class="caret"></span>
																    </button>
																    <ul class="dropdown-menu coupon-btn" role="menu">
																	    <li><a class="user-coupon-add" data-user-no="${user.no }"data-toggle="modal" data-target="#myModal">지급</a></li>
																	    <li><a class="user-coupon-del" data-user-no="${user.no }" data-toggle="modal" data-target="#myModal">삭제</a></li>														 
																    </ul>
													    		</div>
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
									<div class="col-sm-3">
			                    		<div class="customers_length" id="customer_length" role="status" aria-live="polite">
			                    		총 ${size }건의 조회결과			       
			                    		</div>
			                    	</div>
									<div class="col-sm-9">
			                    		<div>
		       								<!-- 페이지네이션 -->
			                    		</div>
			                    	</div>
								</div>

		                    </div>
		
		           
		                 
			           		<div class="row">
			           			<div class="col-sm-12" style="text-align: right; right: 275px;">
			           				<button class="btn btn-success">엑셀</button>
			           			</div>
			           		</div>
		                </div>		                
		            </form>
		        </div>
			</div>
		</div>
	</div>
</div>

<!-- 이름을 클릭하였을때 나타나는 회원상세정보(모달) -->
<div id="modal-customer-items" class="modal fade" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">회원 상세정보</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-bady">
				<table class="table" id="modal-customer-detail1-table">
					<tr>
						<th>회원번호</th>
						<td>10010</td>
						<th>이름</th>
						<td>이응수</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>lee</td>
						<th>이메일</th>
						<td>lee@gmail.com</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td>2020-01-01</td>
						<th>가입여부</th>
						<td>Y</td>
					</tr>
				</table>
				<table class="table" id="modal-customer-detail2-table">
					<thead>
						<tr>
							<th>수강 강좌명</th>
							<th>신청일자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>자바의 신</td>
							<td>2020-02-02</td>
						</tr>
					</tbody>
				</table>
				<table class="table" id="modal-customer-detail3-table">
					<thead>
						<tr>
							<th>쿠폰명</th>
							<th>할인가격</th>
							<th>지급일</th>
							<th>만료일</th>
							<th>가입여부</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1주년 쿠폰</td>
							<td>5000원</td>
							<td>2020-02-02</td>
							<td>2021-01-02</td>
							<td>N</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 회원을 탈퇴 처리시키는 모달화면 -->
<div class="modal fade" id="modal-user-delete" role="dialog">
	<div class="modal-dialog">
		<form id="delete-user-form" class="well" method="get" action="deletecustomer.hta">
			<input type="hidden" name="userno">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">회원 탈퇴</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<p>해당 회원을 탈퇴시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger" >탈퇴시키기</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- 회원에게 쿠폰을 지급하는 모달화면 -->
<div id="modal-coupon-add" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">쿠폰 지급</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<select>
	   				<option value="">-------------------------</option>
	   				<option value="coupon1">새해쿠폰 할인:5000원</option>
	   				<option value="coupon1">새해쿠폰 할인:5000원</option>
	   			</select>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>	
</div>
<div id="modal-coupon-del" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">쿠폰 회수</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<select>
	   				<option value="">-------------------------</option>
	   				<option value="coupon1">새해쿠폰 할인:5000원</option>
	   				<option value="coupon1">새해쿠폰 할인:5000원</option>
	   			</select>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
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
<script src="../../../resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="../../../resources/vendor/chart.js/Chart.min.js"></script>
<!-- Page level custom scripts -->
<script src="../../../resources/js/demo/datatables-demo.js"></script>

<script type="text/javascript">
	$('#customersInfoTable .customer-username').click(function() {
		$("#modal-customer-items").modal('show');
	});
	
	$('.coupon-btn .user-coupon-add').click(function() {
		$('#modal-coupon-add').modal('show');
	});
	
	$('.coupon-btn .user-coupon-del').click(function() {
		$('#modal-coupon-del').modal('show');
	});
	
	// 회원 탈퇴처리하는 모달
	$('#customersInfoTable button:has(.fa-minus-square)').click(function(){
		
		var userNo = $(this).data("user-no");
		$("#delete-user-form [name=userno]").val(userNo);
		$("#modal-user-delete").modal('show');
	});
</script>
</body>
</html>