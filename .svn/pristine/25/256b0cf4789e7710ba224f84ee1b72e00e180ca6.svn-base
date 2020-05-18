<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>관리자 - 강좌 관리 - 동영상 관리</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<!-- Custom fonts for this template-->
	<link href="../../../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
	<!-- Custom styles for this template-->
	<link href="../../../resources/css/sb-admin-2.min.css" rel="stylesheet">	
</head>
<body id="page-top">
<div id="wrapper">
<%@include file="common/admin-side.jsp" %>
	<div id="content-wrapper" class="d-flex flex-column">
	<%@include file="common/admin-nav.jsp" %>
		<div class="container-fluid">			
			<div class="row">
				<div class="col-sm-12">
            <form action="#" class="form-horizontal style-form" method="get">
                <div class="form-panel">               
                    <div class="form-group">
                        <label class="control-label col-sm-1">카테고리</label>
                        <div class="col-sm-3">
                            <select class="form-control">
                                <option>전체</option>
                                <option>CSS</option>
                                <option>HTML</option>
                            </select>
                        </div>                            
                    </div>               

                    <div class="form-group">
                        <label class="col-sm-1 control-label">검색</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="search-board" placeholder="검색할 키워드를 입력해주세요." style="font-size: 13px;">
                        </div>
                    </div>

<!-- script - 참고 -->
                    <div class="form-group">
                        <label class="control-label col-sm-1" style="margin-right:15px;">기간</label>
                        <div style="display:inline-block; float:left;">
                            <button type="button" class="btn btn-default btn-sm dk-btn-cal">오늘</button>
                            <button type="button" class="btn btn-default btn-sm dk-btn-cal">3일 이내</button>
                            <button type="button" class="btn btn-default btn-sm dk-btn-cal">7일 이내</button>
                        </div>
                        <div class="col-md-5">
                            <div class="input-group input-large" data-date="2014/01/01" data-date-format="yyyy/mm/dd">
                                <span class="input-group-addon"><i class="far fa-calendar-alt"></i></span>
                                <input type="text" class="form-control date1" name="from" placeholder="시작일" style="text-align:center;">
                                <span class="input-group-addon"><i class="far fa-calendar-alt"></i></span>
                                <input type="text" class="form-control date2" name="to" placeholder="종료일" style="text-align:center;">
                            </div>
                        </div>
                        <div>
                            <button type="button" class="btn btn-info btn-sm" id="button-dk">조회</button>
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 0px;border-bottom:none;">
                        <label class="control-label col-md-1">승인 여부</label>
                        <div class="col-md-6">
                            <div class="radio-dk">
                                <label>
                                    <input type="radio" id="optionsRadios1" name="status" value="statusall" checked="checked"> 전체
                                </label>
                                <label>
                                    <input type="radio" id="optionsRadios2" name="status" value="yes"> 예
                                </label>
                                <label>
                                    <input type="radio" id="optionsRadios3" name="status" value="no"> 아니오
                                </label>
                            </div>
                        </div>                       
                    </div>
                </div>
                <div class="col-sm-9">
                </div>
                <div>
                    <button type="button" class="btn btn-warning btn-sm">초기화</button>
                </div>
            </form>
        </div>
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
</body>
</html>