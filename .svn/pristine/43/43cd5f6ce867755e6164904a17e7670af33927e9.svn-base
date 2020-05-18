<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/tag.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>관리자 - 강좌 관리 - 동영상 관리</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://unpkg.com/vue@2.5.13/dist/vue.js"></script>
	
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
	#lectsInfoTable .sample-video {cursor: pointer;}
	
	
	button.page-link {
	display: inline-block;
	}
	button.page-link {
	    font-size: 20px;
	    color: #29b3ed;
	    font-weight: 500;
	}
	</style>
</head>
<body id="page-top">
<div id="wrapper">
<%@include file="common/admin-side.jsp" %>
	<div id="content-wrapper" class="d-flex flex-column">
	<%@include file="common/admin-nav.jsp" %>
		<div class="container-fluid">			
			<div class="row" id="admin-lecture">
				<h3 style="margin-left: 60px;">강좌 관리</h3>
				<div class="col-sm-12">
				
		            <form action="lecture.hta" id="search-lect-form" class="form-horizontal style-form" method="get">
		            <input type="hidden" name="pageno" id="page-no" value="${pageNo }">
		                <div class="form-panel"
		                   style="background: #fff; margin: 0px 50px; padding: 33px 17px;">               
		                    <div class="form-group col-sm-10" style="display: inline-flex;">
		                        <label class="control-label col-sm-1">카테고리</label>
		                        <div class="col-sm-4" id="category-sel">
		                            <select class="form-control" id="range-search" name="range" style="width: 150px;">
		                                <option value="0">전체</option>
		                                 <c:forEach var="category" items="${categories }">
		                                	<option value="${category.no}" ${param.range eq category.no ? 'selected' : '' }>${category.name }</option>
		                                </c:forEach>
		                            </select>
		                        </div>                            
		                    </div>              
		                     
		                    <div class="form-group col-sm-10" style="display: inline-flex;">
		                        <label class="col-sm-1 control-label">검색</label>
		                        <div class="col-sm-3">
		                            <input type="text" class="form-control" id="keyword-search" name="keyword"  value="${param.keyword }" placeholder="검색할 키워드를 입력해주세요." 
		                            style="font-size: 15px; width: 400px;">
		                        </div>
		                        <div class="col-sm-5">
		                            <button type="button" class="btn btn-default" id="find-lect-btn"><i class="fas fa-search"></i></button>
		                    	</div>
		                    </div>
		
<!-- script - 참고 -->
		                    <div class="form-group col-sm-10" style="display: inline-flex;">
		                        <label class="control-label col-sm-1" style="margin-right:15px;">기간</label>
		                        <div style="display:inline-block; float:left;">
		                            <button type="button" class="btn btn-default btn-date">오늘</button>
		                            <button type="button" class="btn btn-default btn-date">3일 이내</button>
		                            <button type="button" class="btn btn-default btn-date">7일 이내</button>
		                        </div>
		                        <div class="col-md-5">
		                            <div class="input-group input-large" id="date-search" data-date-format="yyyy-MM-dd">
		                                <input type="date" class="form-control date1" name="startDate" value="${param.startDate }" placeholder="시작일" style="text-align:center;">
		                                <input type="date" class="form-control date2" name="endDate" value="${param.endDate }" placeholder="종료일" style="text-align:center;">
		                            </div>
		                        </div>
		                    </div>
		
		                    <div class="form-group col-sm-10" style="display: inline-flex;">
		                        <label class="control-label col-md-1">승인 여부</label>
		                        <div class="col-md-6">
		                            <div class="radio-dk" id="isDisplay-search">
		                                <label>
		                                    <input type="radio" id="optionsRadios1" name="isDisplay" value="A" ${empty param.isDisplay || param.isDisplay eq 'A' ? 'checked' :'' }> 전체
		                                </label>
		                                <label>
		                                    <input type="radio" id="optionsRadios2" name="isDisplay" value="Y" ${param.isDisplay eq 'Y' ? 'checked' :'' }> 승인
		                                </label>
		                                <label>
		                                    <input type="radio" id="optionsRadios3" name="isDisplay" value="D" ${param.isDisplay eq 'D' ? 'checked' :'' }> 거절
		                                </label>
		                                <label>
		                                    <input type="radio" id="optionsRadios4" name="isDisplay" value="N" ${param.isDisplay eq 'N' ? 'checked' :'' }> 대기중
		                                </label>
		                            </div>
		                            
		                        </div>                       
		                    </div>
		                    
		                    <div class="row">
			                    <div class="col-sm-2">
		                    		<div>
		                    			<select class="form-control" style="width: 200px;" name="sort" id="sort-search">
		                    				<option value="date" ${param.sort eq 'date' ? 'selected' : '' }>최신순</option>
		                    				<option value="name" ${param.sort eq 'name' ? 'selected' : '' }>강좌명순</option>
		                    				<option value="cate" ${param.sort eq 'cate' ? 'selected' : '' }>카테고리순</option>
		                    			</select>
		                    		</div>
		                    	</div>
		                    	
			                    <div class="col-sm-10 text-right">
			                        <a href="/admin/lecture.hta" class="btn btn-warning"  style="margin-right:370px;">초기화</a>
			                    </div>
			                    
		                    </div>
		                </div>
		            </form>
		        </div>
			</div>
			
			<div class="row">
				<div class="col-sm-12">
	                <div class="form-panel" style="background: #fff; margin-left:50px; margin-right:50px; ">               
	           			<div class="form-group col-sm-10">   
		                	<div class="row" style="margin-top: 10px;">
		                   		<div class="col-sm-12">
			                     	<table class="table" id="lectsInfoTable" style="text-align: center;">
		                        		<colgroup>
		                        			<col width="15%">
		                        			<col width="6%">
		                        			<col width="5%">
		                        			<col width="5%">
		                        			<col width="6%">
		                        			<col width="6%">
		                        			<col width="4%">
		                        			<col width="4%">
		                        			<col width="6%">
		                        			<col width="5%">
		                        		</colgroup>
										<thead>
											<tr>
												<th>강좌명</th>
							                    <th>카테고리명</th>
							                    <th>등급</th>
							                    <th>회원명</th>
							                    <th>가격</th>
							                    <th>신청일</th>
							                    <th>승인여부</th>
							                    <th>샘플영상</th>
							                    <th></th>
							                    <th></th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty lectList } ">
													<tr>
														<td colspan="9" class="text-center">등록된 강좌가 없습니다.</td> 
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach var="lect" items="${lectList }">
														<tr>
									                    	<td><strong>${lect.title }</strong></td>
									                    	<td>${lect.cateName }</td>
									                    	<td>
									                    		<c:choose>
											                    	<c:when test="${lect.grade == 1}">입문</c:when>
											                    	<c:when test="${lect.grade == 2}">초급</c:when>
											                    	<c:when test="${lect.grade == 3}">중급</c:when>
											                    	<c:when test="${lect.grade == 4}">활용</c:when>
									                    		</c:choose>
									                    	</td>
									                    	<td>${lect.userName }(${lect.userId })</td>
									                    	<td>${lect.price }<strong>(${lect.discountPrice })</strong></td>
									                    	<td><span><fmt:formatDate value="${lect.createDate }" pattern="yyyy-MM-dd"/></span></td>
									                    	<td>
									                    		<c:choose>
											                    	<c:when test="${lect.isDisplay == 'Y'}"><h5><span class="badge badge-success">승인</span></h5></c:when>
											                    	<c:when test="${lect.isDisplay == 'D'}"><h5><span class="badge badge-danger">거절</span></h5></c:when>
											                    	<c:when test="${lect.isDisplay == 'N'}"><h5><span class="badge badge-warning">대기중</span></h5></c:when>
									                    		</c:choose>
									                    	</td>
									                    	<td><a class="sample-video" data-lect-no="${lect.no }" data-video-link="${lect.samplePath }"><i class="fas fa-tv"></i></a></td>
									                    	<td>
									                    		<c:choose>
										                    		<c:when test="${lect.isDisplay == 'N' }">
											                    		<button class="btn btn-success" data-lect-no="${lect.no }" >승인</button>
											                    		<button class="btn btn-danger" data-lect-no="${lect.no }" >거절</button>
										                    		</c:when>
									                    		</c:choose>
									                    	</td>
									                    	<td><button class="btn btn-info" data-lect-no="${lect.no }">상세정보</button></td>
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
		                    		<div class="customers_length" id="customer_length" role="status" aria-live="polite">
		                    		총 ${pagination.totalRows }건의 조회결과			       
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

<!-- 강좌 상세정보 (모달) -->
<div id="modal-lecture-items" class="modal fade" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" id="modal-lecture-detail-content">
			<input type="hidden" name="lectNo">
			<div class="modal-header">
				<h4 class="modal-title">강좌 상세정보</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<table class="table" id="modal-lecture-detail-table">
					<colgroup>
						<col width="*%">
						<col width="*%">
						<col width="12%">
						<col width="*%">
					</colgroup>
					<thead>
						<tr>
							<th>챕터명</th>
							<th>레슨명</th>
							<th>재생시간</th>
							<th>재생하기</th>
						</tr>
					</thead>	
					<tbody class="lecture-detail-tbody">
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 강좌를 승인 하는 모달화면 -->
<div class="modal fade" id="modal-lect-confirm" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" id="modal-lect-confirm-content">
			<input type="hidden" name="lectNo">
			<div class="modal-header">
				<h4 class="modal-title">강좌 승인</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<p>해당 강좌를 승인하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="confirm-lect-btn">승인하기</button>
				<button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 강좌를 거절 하는 모달화면 -->
<div class="modal fade" id="modal-lect-deny" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" id="modal-lect-deny-content">
		<input type="hidden" name="lectNo">
			<div class="modal-header">
				<h4 class="modal-title">강좌 거절</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<p>해당 강좌를 거절하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="deny-lect-btn">거절하기</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 샘플영상 모달화면 -->
<div class="modal fade" id="modal-sample" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" id="modal-sample-content">
		<input type="hidden" name="lectNo">
			<div class="modal-header">
				<h4 class="modal-title">샘플영상</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" id="video-body">
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
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
	// 샘플영상
	$("#lectsInfoTable .sample-video").click(function() {
		
		var lectNo = $(this).data("lect-no");
		var lectSamplePath = $(this).data("video-link");
	
		var videoTag = "<video autoplay><source src='"+lectSamplePath+"' type='video/mp4'/></video>";
		$("#video-body").html(videoTag);
		
		$("#modal-sample").modal('show');
		
	})
	
	// 강좌 상세정보
	$('#lectsInfoTable button.btn-info').click(function() {
		var lectNo = $(this).data("lect-no");
		$("#modal-lecture-detail-content [name=lectNo]").val(lectNo);
		
		$("#modal-lecture-items").modal('show');
		
		var $list = $(".lecture-detail-tbody").empty();
	
		$.ajax({
			url: "/admin/lectdetail.hta",
			type: "get",
			data: {lectNo:lectNo},
			success: function(result) {
				result.forEach(function(item, i) {
					var tbody = "<tr>"
					tbody += "<td>"+item.chapterName+"</td>";
					tbody += "<td><strong>"+item.lessonTitle+"</strong></td>";
					tbody += "<td>"+item.totalTime+" 분</td>";
					
					if (item.lessonVideoPath != null) {
						tbody += "<td><a href=''><i class='fas fa-play'></i></a></td>";
					} else {
						tbody += "<td>준비중</td>";
					}
					
					tbody += "</tr>"
					
					$list.append(tbody);
					
				})
			}
		})
	});
	
/* 	var categoryApp = new Vue({
		el:"#category-sel",
		beforeCreate:function() {
			$.getJSON("/admin/lecturecategory.hta", function(result) {
				categoryApp.categories = result;
			})
		},
		data:{
			categories:[],
		}
	}); */
	
	$("#find-lect-btn").click(function() {
		$("#search-lect-form").submit();
	});
	
	// 페이징 처리하기
	function fn_pagination(no) {
		
		var url = "";
		url += "?pageno=" + no;
		url += "&startDate=" + $("#date-search [name=startDate]").val()
		url += "&endDate=" + $("#date-search [name=endDate]").val()
		url += "&isDisplay=" + $("#isDisplay-search :checked").val()
		url += "&sort=" + $("#sort-search :selected").val();
		url += "&range=" + $("#range-search :selected").val();
		url += "&keyword=" + $("#keyword-search").val();
		
		location.href = url;
	}
	
	
	function fn_next(no) {
		
		var url = "";
		url += "?pageno=" + no;
		url += "&startDate=" + $("#date-search [name=startDate]").val()
		url += "&endDate=" + $("#date-search [name=endDate]").val()
		url += "&isDisplay=" + $("#isDisplay-search :checked").val()
		url += "&sort=" + $("#sort-search :selected").val();
		url += "&range=" + $("#range-search :selected").val();
		url += "&keyword=" + $("#keyword-search").val();
		
		location.href = url;
	};
	
	function fn_prev(no) {
		
		var url = "";
		url += "?pageno=" + no;
		url += "&startDate=" + $("#date-search [name=startDate]").val()
		url += "&endDate=" + $("#date-search [name=endDate]").val()
		url += "&isDisplay=" + $("#isDisplay-search :checked").val()
		url += "&sort=" + $("#sort-search :selected").val();
		url += "&range=" + $("#range-search :selected").val();
		url += "&keyword=" + $("#keyword-search").val();
		
		location.href = url;
	};
	
	// 강좌 승인하는 모달
	$("#lectsInfoTable button.btn-success").click(function() {		
		var lectNo = $(this).data("lect-no");
		$("#modal-lect-confirm-content  [name=lectNo]").val(lectNo);
		
		$("#modal-lect-confirm").modal('show');
	})
	
	// 강좌 거절하는 모달 
	$("#lectsInfoTable button.btn-danger").click(function() {
		var lectNo = $(this).data("lect-no");
		$("#modal-lect-deny-content [name=lectNo]").val(lectNo);
		
		$("#modal-lect-deny").modal('show');
	})
	
	// 강좌 승인
	$("#confirm-lect-btn").click(function() {
		var lectNo = $("#modal-lect-confirm-content input[name=lectNo]").val();
		
		$.ajax({
			url: "/admin/confirmlect.hta",
			type: "post",
			data : {lectNo:lectNo},
			success : function(result) {
				alert("승인하였습니다.");
				$('#modal-lect-confirm').modal('hide');
				
				location.href = "http://localhost/admin/lecture.hta";
			}
		})
	})
	
	// 강좌 거절
	$("#deny-lect-btn").click(function() {
		var lectNo = $("#modal-lect-deny-content input[name=lectNo]").val();
		
		$.ajax({
			url: "/admin/denylect.hta",
			type: "post",
			data : {lectNo:lectNo},
			success : function() {
				alert("거절하였습니다.");
				$('#modal-lect-deny').modal('hide');
				
				location.href = "http://localhost/admin/lecture.hta";
			}
		})
	})
</script>

</body>
</html>