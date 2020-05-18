<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp" %>
<%@ include file="../common/header.jsp" %> 

	<!-- lecture - main start -->  
    <main id="main">
    	<input type="hidden" name="page" value="${param.page }"/>
    	<input type="hidden" name="cateNo" value="${param.cateNo }"/>
            <section id="lecture-section" class="section">
                <div class="container">
                    <div class="columns is-tablet col-sm-12">
                        <aside class="column is-2 sidebar_left col-sm-2">
                            <div class="dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" style="font-size: 18px;">IT 프로그래밍 
                                <span class="caret"></span> </button>
                                <ul class="dropdown-menu" id="categoryList">
                                	 <li><a data-cate-no="0">All</a></li>
                                	 <c:forEach var="category" items="${categories }">
	                                    <li><a data-cate-no="${category.no}">${category.name }</a></li>
                                     </c:forEach>
                                </ul>
                            </div>
                            <div class="accordion-box">
                                <button class="accordion accordion-title">난이도
                                    <i class="fas fa-angle-down"></i>
                                </button>
                                <div class="panel accordion-contents" id="accordion">
                                    <div class="checkbox_accordion">
                                        <input id="lv1" type="checkbox" name="grade" value="1" >
                                        <label for="lv1">입문</label>
                                    </div>
                                    <div class="checkbox_accordion">
                                        <input id="lv2" type="checkbox" name="grade" value="2">
                                        <label for="lv2">초급</label>
                                    </div>
                                    <div class="checkbox_accordion">
                                        <input id="lv3" type="checkbox" name="grade" value="3">
                                        <label for="lv3">중급</label>
                                    </div>
                                    <div class="checkbox_accordion">
                                        <input id="lv4" type="checkbox" name="grade" value="4">
                                        <label for="lv4">활용</label>
                                    </div>
                                </div>
                                <button class="accordion accordion-title">옵션
                                    <i class="fas fa-angle-down"></i>
                                </button>
                                <div class="panel accordion-contents">
                                    <div class="checkbox_accordion">
                                        <input id="optionFree" type="checkbox" name="option" value="Y" />
                                        <label for="optionFree">무료</label>
                                    </div>
                                    <div class="checkbox_accordion">
                                        <input id="optionPaid" type="checkbox" name="option" value="N" />
                                        <label for="optionPaid">유료</label>
                                    </div>
                                    <div class="checkbox_accordion">
                                        <input id="optionDiscount" type="checkbox" name="discount" value="-1"/>
                                        <label for="optionDiscount">할인중</label>
                                    </div>
                                </div>
                            </div>
                        </aside>
                        <div class="column lecutres-body col-sm-9">
                            <div class="lectures-header">
                                <h3 class="header-title">IT 프로그래밍</h3>
                            </div>
                            <div class="search-form">
                                <label class="label search-label" for="search">
                                  <span class="visually-hidden">질문 검색</span>
                                  <input id="search" class="search-input" type="text" placeholder="강의 검색하기" autocomplete="off">
                                </label>
                                <button type="button" class="btn btn-search">검색</button>
                            </div>
                            <div class="lectures-contents">
                                <div class="lectures-box">
                                    <div class="breadcrumb">
                                        <ul> 
                                            <li>
                                                <a href="" class="catagory_link">IT 프로그래밍 &nbsp</a>
                                            </li>
                                            <li>
                                                <a href="" class="catagory_link">&nbsp</a>
                                            </li>
                                        </ul>
                                        <div class="dropdown" id="sort" style="float:right;">
                                            <select class="btn btn-sm" name="sort" style="border:1px solid lightgray;">
                                                <option value="recent" selected>최신순</option>
                                                <option value="like">추천순</option>
                                                <option value="price">가격순</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>                         
                            <div class="lesson-container">
                                <div class="columns lesson-list-body"></div> 
                                <nav class="pagination sy-pagination" id="pagination" role="navagation" aria-label="pagination"></nav>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
		<!-- lecture-main end -->
<script>
	$(function() {
		// init
		drawingStar();
		getSearchValues();
		
		// sidebar accordion
		var acc = document.getElementsByClassName("accordion");
		var i;
		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}
		
		var page = 1;
		
		// 사이드바 클릭
		$(".accordion-box input[type=checkbox]").on("click",function() {
			getSearchValues();
		});
		
		// 검색버튼 클릭
		$(".btn-search").click(function(e) {
			getSearchValues();
		});
		
		// input엘리먼트 엔터 입력
		$("#search").on("keyup",function(e) {
			console.log(e.keyCode);
			if(e.keyCode == 13) 
				getSearchValues();
		});
		
		// 정렬 변경 시 조건 검색 실행
		$("select[name=sort]").on("change", function() {
			getSearchValues();
		});
		
		/* $("#pagination").on("click","li a", function() {
			var page = $(this).text();
			$("input[name=page]").val(page);
			
			getSearchValues();
		}); */
		
		// 카테고리 클릭 시 조건 검색 실행
		$("#categoryList").on("click","li",function(){
			var cateNo = $(this).children().data("cate-no");
			$("input[name=cateNo]").val(cateNo);

			getSearchValues();
		});
	
		// 강좌리스트 페이지네이션 실행
		$("#pagination").on("click", '.pagination li a', function() {
			var page = $(this).data("page");

			$("input[name=page]").val(page);
			
			getSearchValues();
		});
		
		// 조건별 강좌 검색
		function getSearchValues() {

			var cateNo = $("input[name=cateNo]").val();
			var keyword = $(".search-input").val();
			var sort = $("select[name=sort]").val();
			var $grades = $("input[name=grade]:checked");
			var $options = $("input[name=option]:checked");
			var discount = $("input[name=discount]:checked").val();
			var page = $("input[name=page]").val() || 1;
			
			var grades = [];
			$grades.each(function(i,grade) {
				grades.push(parseInt(grade.value));
			});
			
			var options = [];
			$options.each(function(i,option) {
				options.push(option.value);
			});

			var data = {
						"cateNo":cateNo,
						"keyword":keyword,
						"sort":sort,
						"grades":grades,
						"options":options,
						"discount":discount,
						"page":page
						};
			
			$.ajax({
				url: "/lecture/api/searchLecture.hta",
				type: 'post',
			    contentType: "application/json",
                data: JSON.stringify(data),
				success: function(resultMap) {
					
					var result = resultMap.lectures;
					var beginPage = resultMap.beginPage;
					var endPage = resultMap.endPage;
					var totalPage = resultMap.totalPage;
					var html = '';
					 
					if(result.length) {					
						result.forEach(function(item, i) {
							
							var lecture = item.lecture;
							var count = item.lectureDto
	                                                        
							html += '<div class="column lesson-tablet">';
							html += '<div class="lecutre lesson-item">';
							html += '<a href="detail/description.hta?lectureNo=' + lecture.no + '" class="lecture-item-front">';
							html += '<div class="item-image">';
							html += '<figure class="item-image-thumbnail">';
							html += '<img src="' + lecture.imagePath +'">';
							if (lecture.discountRate > 0) {
								html += '<div class="lesson-item-event-card">';
								html += '<span>' + lecture.discountRate + '% 할인중</span>';
								html += '</div>';
							}
							if (lecture.discountRate > 0 && lecture.isFreed == "Y") {
								html += '<div class="lesson-item-free-card">';
								html += '<span>Free</span>';
								html += '</div>';
							}
							html += '</figure>';
							html += '</div>';
							html += '<div class="item-contents">';
							html += '<div class="lecture-item-title">' + lecture.lectTitle + '</div>';
							html += '<div class="lecture-item-info">';
							html += '<div class="rating column is-half">';
							html += '<div class="rating-star">';
							
							html += '<div class="star_yellow" data-star-score="'+ count.reviewStar +'"></div>';
							html += '</div>';
							html += '</div>';
							html += '<div class="price column is-half">';
							if (lecture.discountRate > 0) {
								html += '<del>￦' + lecture.price.toLocaleString() + '</del><br>';
							} else {
								html += '<br>';
							}							
							html += '<span class="discount_price">￦' + lecture.discountPrice.toLocaleString() +'</span>';
							html += '</div>'
							html += '</a>';
							html += '<div class="item-info-bottom">';
							html += '<div class="wish">';
							html += '<a href="/like/addlikelectlist.hta?lectureno=' + lecture.no + '"><i class="far fa-heart"></i>' + count.likeCnt + '</a>';
							html += '</div>';
							html += '<div class="teacher_name">' + count.userName + '</div>';
							html +=	'</div>';  
							html +=	'</div>'; 
							html +=	'</div>';  
							html +=	'</div>';  
							html +=	'</div>';
							
							$(document).scrollTop(0);
						});
							
						var pageText = "";
						
						pageText += '<ul class="pagination">';
						if (beginPage > 3) {
							pageText += '<li><a data-page="' + (beginPage - 1) + '"><i class="fas fa-angle-left"></i></a></li>';
						}
						
						for (var i = beginPage; i <= endPage; i++) {
							pageText += '<li><a data-page="' + i + '" style="'+ (page == i ? 'background:#66DDC6 ; color:white': '') + '">' + i + '</a></li>';
						}
						pageText += '<li><a data-page="' + (endPage + 1) + '" style="' + (totalPage == endPage ? 'display:none' : 'display:block') + '"><i class="fas fa-angle-right"></i></a></li>';
						pageText += '</ul>';   
						
					} else {
						html += '<div class="lecutre lesson-no-item col-sm-12">';
						html += '<img src="/resources/images/logo/siba.png" />'
						html += '<h1>검색 결과가 없어요!</h1>';
						html += '</div>';
						
						$("#pagination").empty();
					}
					
					$("#pagination").html(pageText);
					$(".columns.lesson-list-body").empty();
					$(".columns.lesson-list-body").append(html);
					drawingStar();
				},
				error: function(e){console.log(e)}
			});
		}
	});
	
	function drawingStar() {
		$(".star_yellow").each(function(index, el) {
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