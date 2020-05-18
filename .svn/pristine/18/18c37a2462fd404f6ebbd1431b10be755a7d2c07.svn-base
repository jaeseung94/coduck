<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="sub-bar.jsp"%>
					<input type="hidden" name="page" value="${param.page }"/>
					<div class="container">
                        <div class="teacher-container">
                            <div class="teacher main-body" id="teacherApp">
                                <div class="body-contents create-lecture">
                                    <div class="contenets-menu main-banner">
                                        <div class="banner-icon">
                                            <img src="/resources/images/lecture/create_lecture.png">
                                        </div>
                                        <div class="banner-title">
                                             <h3>흥미로운 강좌 만들기 <i class="fab fa-pagelines" style="color: #4c974c;"></i></h3>
                                        </div>
                                        <div class="banner-comment">
                                            <p>
                                                수년간 가르친 경험이 있는 경력 강사이든 처음 가르쳐 보는 초보 강사이든 
                                                남녀노소 관계없이 누구나 흥미로운 강좌를 만들 수 있습니다. 
                                            </p>
                                            <p>
                                            자신의 수준에 상관없이 다음 단계로 도약할 수 있도록 리소스와 모범 사례를 모아 두었습니다.
                                            </p>    
                                        </div>
                                        <div class="banner-bottom-button">
                                            <button class="btn btn-lg">시작하기</button>
                                        </div>
                                    </div>
                                </div>
                                 <div class="search-form">
                                    <label class="label search-label" for="search">
                                      <span class="visually-hidden">질문 검색</span>
                                      <input id="search" class="search-input" type="text" placeholder="강의 검색하기" autocomplete="off">
                                    </label>
                                    <button type="button" class="btn btn-search">검색</button>
                                </div>
                                <div class="body-contents recent-lecture">
                                    <div class="contenets-menu my-lecture"></div>   
                                </div>
                                <nav class="pagination sy-pagination" id="pagination" role="navagation" aria-label="pagination"></nav>
                            </div>                      
                        </div>
                    </div>
                </section>
            </div>
        </main>
<script>	
	$(function () {
		drawingStar();
		searchMyLecture();

		// 강좌 컨텐츠 마우스 이벤트
		$(".my-lecture.teaching-body").mouseenter(function () {
		    $(this).css({opacity:"0.2", cursor:"pointer"});
		});
		
		$(".my-lecture.teaching-body").mouseleave(function () {
	    	$(this).css('opacity','1');
		}); 
		
		// 버튼 클릭시 검색기능 실행
		$(".btn-search").click(function() {
			searchMyLecture();
		});
		
		// input 엘리먼트 엔터 입력
		$("#search").on("keyup", function(e) {
			
			if(e.keyCode == 13) 
				searchMyLecture();
		});
		
		// 강좌리스트 페이지네이션 실행
		$("#pagination").on("click", '.pagination li a', function() {
			var page = $(this).data("page");
			
			$("input[name=page]").val(page);
			searchMyLecture();
		});
		
		// 키워드로 나의 강좌 검색
		function searchMyLecture() {
			
			var keyword = $("#search").val();
			var page = $("input[name=page]").val() || 1;
			
			$.ajax({
				url: "/teacher/searchMyLecture.hta",
				type: 'GET',
				contentType: 'application/json',
				data: {
					"keyword" : keyword,
					"page" : page
				},
				success: function(resultMap) {
					
					var result = resultMap.lectures;
					var beginPage = resultMap.beginPage;
					var endPage = resultMap.endPage;
					var totalPage = resultMap.totalPage;
					var html = '';
					
					if(!result) {
						return;
					}
					
					if(result.length) {
					console.log(result);
						result.forEach(function(item, i) {
							
							var lesson = item.lessonDto;
							
							html += '<div class="my-lecture teaching-box">';
							html += '<a href="/lecture/detail/description.hta?lectureNo='+ item.no + '">';
							html += '<img src="' + item.imagePath + '" class="my-lecture-thumbnail">';
							html += '</a>';
							html += '<div class="my-lecture teaching-body">';
							html += '<div class="teaching-details">';
							html += '<a href="">';
							html += '<div class="detail-title">';
							html += '<h3>'+ item.title +'</h3>';
							html += '</div>';
							html += '<div class="info-lect">';
							html += '<span>' + lesson.totalCount + '강 |  시간 : ' + lesson.totalTime + '분</span>';
							html += '</div>';
							html += '</a>';
							html += '</div>';
							if (item.isDisplay == "N") {
								html += '<div class="label">';
								html += '<label class="badge waiting">승인 대기</label>';
								html += '</div>';
							} else if (item.isDisplay == "D") {
								html += '<div class="label">';
								html += '<label class="badge badge-danger">승인 거절</label>';	
								html += '</div>';
							} else if (item.isDisplay == "Y") {
								html += '<div class="info-box">';
								html += '<div class="info-price">';
								html += '<strong class="discount">￦' + item.discountPrice.toLocaleString() + '</strong>';
								html += '<span class="rate">(' + item.discountRate + '%)</span></div>';
								html += '<div class="info-student">';
								html += '<span>' + item.studentCnt + '명 수강중</span></div>';
								html += '<div class="info-star" data-star-score="' + item.reviewStar + '"></div>';
								html += '<div class="info-wish">';
								html += '<i class="far fa-heart"></i>'+ item.likeCnt + '</div>';
								html += '</div>';
							}
						
							html += '</div>';
							html += '</div>';
						});
						var pageText = '';

						pageText += '<ul class="pagination">';
						if (beginPage > 3) {
							pageText += '<li><a data-page="'+ (beginPage - 1)+ '"><i class="fas fa-angle-left"></i></a></li>';
						}

						for (var i = beginPage; i <= endPage; i++) {
							pageText += '<li><a data-page="'+ i + '" style="'+ (page == i ? 'background:#66DDC6 ; color:white': '') + '">' + i + '</a></li>';
						}
						pageText += '<li><a data-page="'+ (endPage + 1) + '" style="' + (totalPage == endPage ? 'display:none' : 'display:block') + '"><i class="fas fa-angle-right"></i></a></li>';
						pageText += '</ul>';

					} else {
						html += '<div class="lecutre lesson-no-item col-sm-12">';
						html += '<h2>조회된 검색결과가 없어요! </h2>';
						html += '</div><br>';

						$("#pagination").empty();
					}
					
					$("#pagination").html(pageText);
					$(".contenets-menu.my-lecture").empty();
					$(".contenets-menu.my-lecture").append(html);
					 drawingStar();
				},
				error: function(e){ console.log(e)}
			});
		}
	});
		function drawingStar() {
			$(".info-star").each(function(index, el) {
				var score = $(el).data("star-score");

				var star = "";
				for(var i=1; i<=score; i++) {
					star += '<i class="fas fa-star"></i>';
				}
				$(el).append(star);
				
				var emptyStar = "";
				for(var i=1; i<=5-score; i++) {
					emptyStar += '<i class="far fa-star"></i>';
				}
				
				$(el).append(emptyStar);
			});
		}
</script>        
<%@ include file="../common/footer.jsp" %>