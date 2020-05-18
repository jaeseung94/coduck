<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/head.jsp" %>
<%@ include file="../../common/header.jsp" %> 

<!-- sy.css -->
<link href="<c:url value="/resources/css/lecture-form.css" />" rel="stylesheet">   

	    <div class="container" style="margin-top: 30px;">
			<div class="main-title">
				<h1 class="main-text">강좌 만들기</h1>
				<br>
				<br>
				<p class="sub-title">Step 1. 제목과 카테고리를 선택해주세요.</p>
			</div>
			<hr>
			<form action="/lecture/addLecture.hta" method="post" id="lectureForm" enctype="multipart/form-data">
				<div class="sub-form category main">
					<h2>강의하시려는 분야의 메인 카테고리를 선택해주세요.</h2>
					<p class="sub-title">선택한 카테고리가 적절하지 않더라도 나중에 변경할 수 있습니다.</p>
					<br>
					<select class="main-cate-select" name="mainCate" style="margin-bottom:20px; padding-left: 130px;">
						<option>메인 카테고리 선택</option>
						<option value="java">IT 웹프로그래밍</option>
						<option value="spring">모의고사 해설 강좌</option>
					</select>
				</div>
				<div class="sub-form category sub hidden">
					<h2>강의하시려는 분야의 서브 카테고리를 선택해주세요.</h2>
					<p class="sub-title">선택한 카테고리가 적절하지 않더라도 나중에 변경할 수 있습니다.</p>
					<br>
					<select class="cate-select" name="cateNo" id="subCate">
						<option></option>
						<c:forEach var="category" items="${categories }">
						 	<option value="${category.no}">${category.name }</option>
                        </c:forEach>
					</select>
				</div>	
				
				
				<div class="sub-form">
					<h2>강좌 제목은 결정하셨나요?</h2>
					<p class="sub-title" >
						지금 좋은 제목이 생각나지 않아도 괜찮습니다. 나중에 변경할 수 있습니다.
					</p>
					<br> 
					<input class="title-inputbox" type="text" name="lectTitle" placeholder="   예 : 기초부터 배우는 JAVA" autocomplete="off"/>
				</div>
				<div class="sub-form">
					<h2>강좌의 난이도를 선택해주세요.</h2>
					<p class="sub-title">
						선택한 난이도가 적절하지 않더라도 나중에 변경할 수 있습니다.
					</p>
					<br> 
					<select class="level-select-box" name="grade">
						<option value="1">입문</option>
						<option value="2">초급</option>
						<option value="3">중급</option>
						<option value="4">활용</option>
					</select>
				</div>
				<div class="sub-form">
					<h2>강좌 소개를 작성해주세요.</h2>
					<p class="sub-title"></p>
					<br> 
					<textarea class="summary-box" name="lectInfo" rows="6" cols="70" placeholder="예: Java는 웹 서비스, 모바일 앱, 시스템 구축 등의 여러가지 산업 분야에서 활용하고 있는 프로그래밍 언어입니다. 실전 자바 강좌를 통해, Java 언어를 활용하기 위한 기본 지식 부터 차근차근 익혀보세요. 다른 언어를 경험해 보지 않은 초보자의 기준으로 제작된 강의이기 때문에 처음 프로그래밍에 입문한 분들도 어렵지 않게 들으실 수 있어요."></textarea>
				</div>
				
				<div class="lect-price-form">
					<h2 style="margin-bottom: 20px">강좌 가격을 설정해주세요.</h2>
					<div class="price-info">
                      <input type="number" name="price" placeholder="가격을 입력해주세요." autocomplete="off">
					</div>
					<div class="price-info">
                      <input type="number" name="discountRate" placeholder="할인율을 입력해주세요(%)" value="0" autocomplete="off"/>
                    </div>
					 <div class="price-info discount">
                      <input type="number" name="discountPrice" value="0"/>
                    </div>
				</div>
			<div style="padding-top: 100px;"></div>
			
			<div class="sub-form file-form">
				<h2>강좌 썸네일 이미지를 등록해주세요.</h2>
				<input type="file" name="thumbnailImage" accept="image/*">
			</div>
			<div class="sub-form" style="margin-bottom: 150px;">
				<h2>강좌를 소개하는 샘플영상을 등록해주세요.</h2>
				<input type="file" name="sampleVideo" accept="video/*">
			</div>
			<hr>
			<button class="btn-move-backward">이전</button>
			<button type="submit" class="btn-submit-lecture">등록</button>
			</form>
			<div style="padding-bottom: 100px;"></div>
		</div>
<script>
		$("#lectureForm").submit(function(e) {
			if(e.keyCode == 13)
				e.preventDefault();
		});
		
	// 검증 처리
	$(".btn-submit-lecture").click(function() {
		
		var $mainCate = $("select[name=mainCate]");
		var $subCate = $("select[name=cateNo]");
		var $lectInfo = $("textarea[name=lectInfo]");
		var $grade = $("select[name=grade]");
		var $price = $("input[name=price]");
		var $thumbnailImage = $("input[name=thumbnailImage]");
		var $videoFile = $("input[name=sampleVideo]");
		
		
		if($mainCate.val() == '') {
			alert("상위 카테고리를 선택해주세요.");
			$mainCate.focus();
			return false;
		}
		
		if($subCate.val() == '') {
			alert("하위 카테고리를 선택해주세요.");
			$subCate.focus();
			return false;
		}
		
		if($lectInfo.val() == '') {
			alert("강좌 소개를 입력해주세요.");
			$lectInfo.focus();
			return false;
		}

		if($grade.val() == '') {
			alert("난이도를 선택해주세요.");
			$grade.focus();
			return false;
		}
		
		if($price.val() == '') {
			alert("강좌 가격을 입력해주세요.");
			$price.focus();
			return false;
		}
		if($thumbnailImage.val() == '') {
			alert("동영상 파일을 선택해주세요.");
			$thumbnailImage.focus();
			return false;
		}
		
		if($videoFile.val() == '') {
			alert("동영상 파일을 선택해주세요.");
			$videoFile.focus();
			return false;
		}
	});
	
	// 상위 카테고리와 일치하는 하위 카테고리 조회
	$("select[name=mainCate]").on("change", function(e) {
		$(".sub-form.category.sub").removeClass("hidden");
	});
	
	// 강좌 할인가격 자동 적용
	$("input[name='discountRate'], input[name='price']").on("keyup", function(e) {
		var price = $("input[name='price']").val();
		var rate = $("input[name=discountRate]").val();
		
		if(rate > 100){
			$("input[name=discountRate]").val(100);
			rate = 100;
		}
		var discountPrice = price - (rate/100*price);
		
	
		$("input[name='discountPrice']").val(Math.round(discountPrice));
	});	

</script>		
<%@ include file="../../common/footer.jsp" %>	