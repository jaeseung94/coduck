<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>관리자 - 1:1 문의</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://unpkg.com/vue@2.5.13/dist/vue.js"></script>
	
	<!-- Custom fonts for this template-->
	<link href="../../../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
	<!-- Custom styles for this template-->
	<link href="../../../resources/css/sb-admin-2.min.css" rel="stylesheet">	
	
	<style type="text/css">
	#qnaTable .customer-username {cursor: pointer;}
	#qnaTable .qna-title {cursor: pointer;}
	</style>
</head>
<body id="page-top">
<div id="wrapper">
<%@include file="common/admin-side.jsp" %>
	<div id="content-wrapper" class="d-flex flex-column">
	<%@include file="common/admin-nav.jsp" %>
		<div class="container-fluid">		
			
			<form action="qna.hta"  id="search-qna-form" class="form-horizontal style-form" method="get">
            <input type="hidden" name="pageno" id="page-no" value="">
			<div class="row" id="admin-qna">
				<h3 style="margin-left: 60px;">문의 관리</h3>
				<div class="col-sm-12">
	                <div class="form-panel" style="background: #fff; margin-left:50px; margin-right:50px; padding-top:10px;">               
	
<!-- script - 참고 -->
	                    <div class="form-group col-sm-10" style="display: inline-flex;">
	                        <label class="control-label col-sm-1" style="margin-right:15px;">기간</label>
	                        <div style="display:inline-block; float:left;">
	                            <button type="button" class="btn btn-default btn-date" >오늘</button>
	                            <button type="button" class="btn btn-default btn-date" >3일 이내</button>
	                            <button type="button" class="btn btn-default btn-date" >7일 이내</button>
	                        </div>
	                        <div class="col-md-5">
	                            <div class="input-group input-large" id="date-search" data-date-format="yyyy-MM-dd">
	                                <input type="date" class="form-control date1" value="" name="startDate" placeholder="시작일" style="text-align:center;">
	                                <input type="date" class="form-control date2"  value="" name="endDate" placeholder="종료일" style="text-align:center;">
	                            </div>
	                        </div>
	                    </div>
	
	                    <div class="form-group col-sm-10" style="display: inline-flex;">
	                        <label class="control-label col-md-1">답변 여부</label>
	                        <div class="col-md-6">
	                            <div class="radio-dk" id="isanswered-search">
	                                <label>
	                                    <input type="radio" id="optionsRadios1" name="isAnswered" value="A" > 전체
	                                </label>
	                                <label>
	                                    <input type="radio" id="optionsRadios2" name="isAnswered" value="Y" > 예
	                                </label>
	                                <label>
	                                    <input type="radio" id="optionsRadios3" name="isAnswered" value="N" > 아니오
	                                </label>
	                            </div>                        
	                        </div>                       
		                    <div class="col-md-6" style="left: 410px;">
		                        <a href="/admin/qna.hta" class="btn btn-warning " style="margin-left: 75px;">초기화</a>
		                    </div>
	                    </div>
	                </div>
		        </div>
			</div>
			
			<div class="row">
				<div class="col-sm-12">
	                <div class="form-panel" style="background: #fff; margin-left:50px; margin-right:50px; padding-bottom: 5px; ">               
	                    <div class="form-group col-sm-10">
	                    	<div class="row">
								<div class="col-sm-2">
		                    		<div>
		                    			<select class="form-control" style="width: 200px;" name="sort" id="sort-search">
		                    				<option value="date" >최신순</option>
		                    				<option value="title" >제목순</option>
		                    			</select>
		                    		</div>
		                    	</div>
		                    	<div class="col-sm-7"></div>			                    	
	                    		<div class="col-sm-2">
									<input type="text" class="form-control" style="width:275px;" name="keyword"  value="" id="keyword-search" placeholder="검색어를 입력하세요.">
								</div>	                    	
	                    		<div class="col-sm-1">
									<button type="button" class="btn btn-default" id="find-user-btn"><i class="fas fa-search"></i></button>
								</div>	                    	
	                    	</div>
	                    </div>
	                 </div>
	              </div>
	         </div>
	         </form>
	         
			<div class="row">
				<div class="col-sm-12">
	                <div class="form-panel" style="background: #fff; margin-left:50px; margin-right:50px; ">               
	           			<div class="form-group col-sm-10">   
		                	<div class="row" style="margin-top: 10px;">
		                   		<div class="col-sm-12">
			                     	<table class="table" id="qnaTable" style="text-align: center;">
		                        		<colgroup>
		                        			<col width="8%">
		                        			<col width="11%">
		                        			<col width="12%">
		                        			<col width="12%">
		                        			<col width="10%">
		                        			<col width="8%">
		                        			<col width="8%">
		                        		</colgroup>
										<thead>
											<tr>
												<th>문의번호</th>
												<th>회원명</th>
												<th>제목</th>
												<th>문의날짜</th>
												<th>답변날짜</th>
												<th>답변상태</th>
												<th>답변하기</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>100001</td>
												<td><a class="customer-username">호날두(ronaldo)</a></td>
												<td><a class="qna-title"><strong>모의고사 문제가 너무 어려워요</strong></a></td>
												<td>2020-02-20</td>
												<td></td>
												<td>Y</td>
												<td></td>
											</tr>
											<tr>
												<td>100002</td>
												<td>kaka(kaka)</td>
												<td>모의고사 문제가 너무 쉬운데요?</td>
												<td>2020-02-21</td>
												<td>2020-02-21</td>
												<td>Y</td>
												<td><button class="btn btn-success"><i class="far fa-comment-dots"></i></button></td>
											</tr>
										</tbody>		
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
				
			<div class="row">
				<div class="col-sm-12">
	                <div class="form-panel" style="background: #fff; margin-left:50px; margin-right:50px; ">               
	           			<div class="form-group col-sm-10">  
							<div class="row">									
								<div class="col-sm-3">
		                    		<div class="qnas_length" id="qnas_length" role="status" aria-live="polite">
		                    		총 건의 조회결과			       
		                    		</div>
		                    	</div>
								<div class="col-sm-9">
		                    		<div class="text-center">
		      							<!-- 페이지네이션 -->
		      							<ul class="pagination">		
		      							
		      									      								
		      							</ul>	
		                    		</div>
			                	</div>
							</div>
		                </div>
		        	</div>		                
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
			<div class="modal-body">
				<table class="table" id="modal-customer-detail1-table">
					<tr>
						<th>회원번호</th>
						<td ></td>
						<th>이름</th>
						<td ></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td ></td>
						<th>이메일</th>
						<td ></td>
					</tr>
					<tr>
						<th>가입일</th>
						<td></td>
						<th>가입여부</th>
						<td ></td>
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

<!-- 문의글에 답변하는 모달창 -->
<div id="modal-qna-answer" class="modal fade" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
	   			<input type="hidden" name="qnaNo">
				<h4 class="modal-title">답변하기</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<table class="table table-hover">
					<tr>
						<th style="width: 15%">작성자</th>
						<td style="width: 30%">호날두(ronaldo)</td>
						<th style="width: 15%">문의날짜</th>
						<td style="width: 30%">2020-02-20</td>
					</tr>
					<tr>
						<th style="width: 15%">문의제목</th>
						<td colspan="3">모의고사 어렵다고요!!!</td>
					</tr>
					<tr>
						<th style="width: 15%">문의내용</th>
						<td colspan="3">호우호우호우호우호우호우호우호우호우호우호우호우홍후옿우호우홍훙호우홍후오후오</td>
					</tr>
				</table>
				<form>
					<input type="hidden">
					<div class="form-group">
						<label>답변글</label>
						<textarea rows="5" class="form-control"></textarea>
					</div>
					<div class="form-group">
						<label>첨부파일</label>
						<input type="file" class="form-control"/>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" id="qna-answer-btn">답변하기</button>
				<button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 문의글 제목을 클릭하였을때 (모달화면) -->
<div id="modal-qna" class="modal fade" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
	   			<input type="hidden" name="qnaNo">
				<h4 class="modal-title">문의글</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<div class="media" style="margin: 25px;">
				<div class="media-left">
					<img src="../../../resources/images/logo/coduck.ico" class="media-object" style="width:60px">
				</div>
				<div class="media-body">
					<h4 class="media-heading">호날두(ronaldo) <small><i>문의날짜 2020-02-20</i></small></h4>
					<p>문제가 어려워요.</p>
					<pre>문제가 너무 어렵습니다. 난이도 조절 가능하신지요?</pre>					
				</div>
			</div>
			
			<div class="media" style="margin: 25px;">
				<div class="media-body">
					<h4 class="media-heading">관리자 <small><i>답변날짜 2020-02-20</i></small></h4>
					<p>시끄럽다</p>
					<pre>그냥 풀어라</pre>
				</div>
				<div class="media-right">
					<img src="../../../resources/images/admin/daeilkinng.jpg"  class="media-object" style="width:60px">
				</div>
			</div>
	
			<div class="modal-footer">
				<button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
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
<script src="../../../resources/vendor/chart.js/Chart.min.js"></script>
<!-- Page level custom scripts -->
<script type="text/javascript">
	// 이름을 선택하였을때 회원상세정보를 조회한다. (모달창)
	$("#qnaTable .customer-username").click(function() {
		$("#modal-customer-items").modal('show');
	});
	
	// 문의글 제목을 클릭하였을때 (모달창)
	$("#qnaTable .qna-title").click(function() {
		$("#modal-qna").modal('show');
	});
	
	// 문의글 답변하기
	$("#qnaTable .fa-comment-dots").click(function() {
		$("#modal-qna-answer").modal('show');
	});

	// 검색하기
	$("#keyword-search").click(function() {
		$("#search-qna-form").submit();
	});
</script>
</body>
</html>