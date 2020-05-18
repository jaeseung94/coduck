<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		                   style="background: #fff; margin: 0px 50px; padding: 33px 17px;">               
		
<!-- script - 참고 -->
		                    <div class="form-group col-sm-10" style="display: inline-flex;">
		                        <label class="control-label col-sm-1" style="margin-right:15px;">기간</label>
		                        <div style="display:inline-block; float:left;">
		                            <button type="button" class="btn btn-default btn-sm btn-date">오늘</button>
		                            <button type="button" class="btn btn-default btn-sm btn-date">3일 이내</button>
		                            <button type="button" class="btn btn-default btn-sm btn-date">7일 이내</button>
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
			                    <div class="col-md-6">
			                        <button type="button" class="btn btn-warning btn-sm" style="float: right; margin-right: 100px;">초기화</button>
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
		                   style="background: #fff; margin: 0px 50px; padding: 33px 17px;">               
		                    <div class="form-group col-sm-10">
			                    <div class="row">			                    	
			                    	<div class="col-sm-6">
										<input type="text" placeholder="검색어를 입력하세요.">
									</div>
			                    	<div class="col-sm-6">
			                    		<div>
			                    			<select style="float: right;">
			                    				<option value="10">10개</option>
			                    				<option value="25">25개</option>
			                    				<option value="50">50개</option>
			                    				<option value="50">100개</option>
			                    			</select>
			                    		</div>
			                    	</div>
			                    </div>
			                    
		                    	<div class="row">
		                    		<div class="col-sm-12">
			                        	<table class="table" id="customersInfoTable" style="text-align: center;">
			                        		<colgroup>
			                        			<col width="8%">
			                        			<col width="7%">
			                        			<col width="12">
			                        			<col width="12%">
			                        			<col width="12%">
			                        			<col width="10%">
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
													<th>연락처</th>
													<th>이메일</th>
													<th>생년월일</th>
													<th>가입일</th>
													<th>가입여부</th>
													<th>탈퇴처리</th>
													<th>쿠폰처리</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>100001</td>
													<td><a class="customer-username" id="username" data-toggle="modal" data-target="#myModal">호날두</a></td>												
													<td>ronaldo</td>
													<td>010-7777-7777</td>
													<td>ronaldo@naver.com</td>
													<td>1987-02-06</td>
													<td>2020-02-06</td>
													<td>가입</td>
													<td><button class="btn btn-danger"><i class="far fa-minus-square"></i></button></td>
													<td>
														<div class="btn-group">
														    <button type="button" class="btn btn-primary">쿠폰</button>
														    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
														    	<span class="caret"></span>
														    </button>
														    <ul class="dropdown-menu coupon-btn" role="menu">
															    <li><a class="coupon-add" id="couponadd" data-toggle="modal" data-target="#myModal">지급</a></li>
															    <li><a class="coupon-add" id="coupondel" data-toggle="modal" data-target="#myModal">삭제</a></li>														 
														    </ul>
												    	</div>
													</td>
												</tr>
											</tbody>									
											<tbody>
												<tr>
													<td>100002</td>
													<td>강소라</td>
													<td>kangsora</td>
													<td>010-6666-7777</td>
													<td>kangsora@naver.com</td>
													<td>1990-02-06</td>
													<td>2020-02-04</td>
													<td>탈퇴</td>
													<td><button class="btn btn-danger"><i class="far fa-minus-square"></i></button></td>
												</tr>
											</tbody>									
										</table>
									</div>
								</div>
								
								<div class="row">									
									<div class="col-sm-3">
			                    		<div class="customers_length" id="customer_length" role="status" aria-live="polite">
			                    		총 37건의 조회결과			       
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
						<th>연락처</th>
						<td>010-1234-5678</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>lee@gmail.com</td>
						<th>생년월일</th>
						<td>1979-01-01</td>
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
							<th>사용여부</th>
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

<div id="modal-coupon-add" class="modal fade" role="dialog">
	<div class="modal-dialog modal-lg">
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
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
	$('#customersInfoTable #username').click(function() {
		$("#modal-customer-items").modal('show');
	});
	
	$('.coupon-btn #couponadd').click(function() {
		$('#modal-coupon-add').modal('show');
	});
	
	$('.coupon-btn #coupondel').click(function() {
		$('#modal-coupon-del').modal('show');
	});
</script>

</body>
</html>