<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>관리자 - 공지사항</title>
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
			
			<div class="row" id="admin-notice">
				<h3 style="margin-left: 60px;">공지 관리</h3>
			</div>
			
			<form action="notice.hta" id="search-notice-form" method="get"> 
			<div class="row">
				<div class="col-sm-12">
	                <div class="form-panel" style="background: #fff; margin-left:50px; margin-right:50px; padding-bottom: 5px; ">  
	                <input type="hidden" name="pageNo" id="page-no" value="${pageNo }">             
	                    <div class="form-group col-sm-10">
	                    	<div class="row">
								<div class="col-sm-2">
		                    		<div>
		                    			<select class="form-control" style="width: 200px;" name="sort" id="sort-search">
		                    				<option value="date"  ${param.sort eq 'date' ? 'selected' : '' }>최신순</option>
		                    				<option value="title"  ${param.sort eq 'title' ? 'selected' : '' }>제목순</option>
		                    			</select>
		                    		</div>
		                    	</div>
		                    	<div class="col-sm-7"></div>			                    	
	                    		<div class="col-sm-2">
									<input type="text" class="form-control" style="width:275px;" name="keyword"  value="${param.keyword }" id="keyword-search" placeholder="검색어를 입력하세요.">
								</div>	                    	
	                    		<div class="col-sm-1">
									<button type="button" class="btn btn-default" id="find-notice-btn"><i class="fas fa-search"></i></button>
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
			                     	<table class="table" id="notice-table" style="text-align: center;">
		                        		<colgroup>
		                        			<col width="10%">
		                        			<col width="50%">
		                        			<col width="6%">
		                        			<col width="2%">
		                        			<col width="2%">
		                        		</colgroup>
										<thead>
											<tr>
												<th>작성일자</th>
												<th>제목</th>
												<th>첨부파일</th>
												<th></th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty noticeList }">
													<tr>
														<td colspan="5" class="text-center">등록된 공지가 없습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach var="notice" items="${noticeList }">
														<tr>
															<td><span><fmt:formatDate value="${notice.createDate }" pattern="yyyy-MM-dd"/></span></td>
															<td class="notice-title" data-notice-no="${notice.no }">${notice.title }</td>
															<td>
																<c:choose>
																	<c:when test="${!empty notice.fileName }"><a href="/admin/download.hta?noticeNo=${notice.no }"><i class="far fa-file"></i></a></c:when>
																</c:choose>
															</td>
															<td><button type="button" data-notice-no="${notice.no }"><i class="far fa-edit"></i></button></td>
															<td><button type="button" data-notice-no="${notice.no }"><i class="far fa-trash-alt"></i></button></td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
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
		                    		<button type="button" id="notice-write-btn">작성</button>			       
		                    		</div>
		                    	</div>
								<div class="col-sm-9">
		                    		<div class="text-center">
		      							<!-- 페이지네이션 -->
		      							<ul class="pagination">		
				      						<c:if test="${pagination.pageNo > 1 }">
		      									<li class="page-item">
		      									<button type="button" class="page-link" onclick="fn_prev('${pagination.pageNo -1}')" data-page-no="${no }">이전</button>
		      									</li>
		      								</c:if>
		      								
	      									<c:forEach var="no" begin="${pagination.beginPage }" end="${pagination.endPage }">
	      										<li>
	      										<button type="button" class="page-link" onclick="fn_pagination('${no}')" data-page-no="${no }">${no }</button>
	      										</li>
	      									</c:forEach>
		      								
		      								<c:if test="${pagination.pageNo < pagination.totalPagesCount }">
		      									<li>
	      										<button type="button" class="page-link" onclick="fn_next('${pagination.pageNo +1}')" data-page-no="${no }">다음</button>
	      										</li>
		      								</c:if>				      								
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

<!-- 공지게시물 제목을 클릭하였을때 (모달화면) -->
<div id="modal-notice" class="modal fade" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" id="modal-notice-detail-content">
			<div class="modal-header">
	   			<input type="hidden" name="noticeNo">
				<h4 class="modal-title">공지글</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<table class="table" id="modal-notice-detail-table">
					<colgroup>
						<col width="5%">
						<col width="*%">
					</colgroup>	
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 공지 삭제하기(모달) -->
<div class="modal fade" id="modal-notice-delete" role="dialog">
	<div class="modal-dialog">
		<form id="delete-notice-form" class="well" method="get" action="deletenotice.hta">
			<input type="hidden" name="noticeNo">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">공지 삭제</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<p>해당 공지를 삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger" >삭제하기</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</form>
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
	// 공지 제목을 클릭하였을때 (모달창)
	$("#notice-table .notice-title").click(function() {
		var noticeNo = $(this).data("notice-no");
		$("#modal-notice-detail-content [name=noticeNo]").val(noticeNo);
		
		$("#modal-notice").modal('show');
		
		var $detail = $("#modal-notice-detail-table").empty();
		
		$.ajax({
			url: "/admin/noticedetail.hta",
			type: "get",
			data: {noticeNo:noticeNo},
			success: function(item) {
				var detail = "<tr>";
				detail += "<td><strong>제목</strong></td>";
				detail += "<td>"+item.title+"</td>";
				detail += "</tr>";	
				
				detail += "<tr>";
				detail += "<td><strong>내용</strong></td>";
				detail += "<td>"+item.contents+"</td>";
				detail += "</tr>"
				detail += "<tr>";
				detail += "<td><strong>첨부파일</strong></td>";
				
				
				if (item.fileName != null) {
					detail += "<td><a href='/admin/download.hta?noticeNo=" + item.no + "'>" + item.fileName + "</a></td>";
				} else {
					detail += "<td>첨부파일이 없습니다.</td>";
				}
				detail += "</tr>"	
				
				$detail.append(detail);
				
			}
		})
	});
	
	// 검색하기
	$("#keyword-search").click(function() {
		$("#search-qna-form").submit();
	});
	
	$("#notice-write-btn").click(function() {
		location.href="noticeform.hta"
	})
	
	// 페이징 처리하기
	function fn_pagination(no) {
		
		var url = "";
		url += "?pageno=" + no;
		url += "&sort=" + $("#sort-search :selected").val();
		url += "&keyword=" + $("#keyword-search").val();
		
		location.href = url;
	}
	
	
	function fn_next(no) {
		
		var url = "";
		url += "?pageno=" + no;
		url += "&sort=" + $("#sort-search :selected").val();
		url += "&keyword=" + $("#keyword-search").val();
		
		location.href = url;
	};
	
	function fn_prev(no) {
		
		var url = "";
		url += "?pageno=" + no;
		url += "&sort=" + $("#sort-search :selected").val();
		url += "&keyword=" + $("#keyword-search").val();
		
		location.href = url;
	};
	
	$("#find-notice-btn").click(function() {
		$("#search-notice-form").submit();
	});
	
	// 공지삭제하기
	$('#notice-table button:has(.fa-trash-alt)').click(function(){
		
		var noticeNo = $(this).data("notice-no");
		$("#delete-notice-form [name=noticeNo]").val(noticeNo);
		$("#modal-notice-delete").modal('show');
	});
	
	// 공지수정하기
	$('#notice-table button:has(.fa-edit)').click(function(){
		
		var url = "";
		url += "/admin/noticeupdatedetail.hta?noticeNo=" + $(this).data("notice-no");
		location.href = url;
	});
	
</script>
</body>
</html>