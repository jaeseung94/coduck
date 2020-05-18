<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/head.jsp" %>
<%@ include file="../../common/header.jsp" %> 
<%@ include file="sub-bar.jsp" %> 
	    
		<!-- description start -->
	        <div class="container">
	            <div class="lecture-description-container">
	                <div class="col-sm-12">
	                    <div class="col-sm-9">
	                        <div class="contents">
	                        <!-- 강의소개 start-->
	                            <div class="lecture-description" id="description">
	                                <div class="can_do description_sub">
	                                    <h3 class="sub-title has-icon">
	                                        이런걸 배울 수 있어요
	                                        <i class="far fa-smile-wink"></i>
	                                    </h3>
	                                    <ul id="lectureTag" data-tag=" ${lecture.tag }"></ul>
	                                </div>
	                                <div class="body">
	                                    <h3 class="body-title">${lecture.infoTitle }</h3>
	                                    <p class="body-contents">
	                                        ${lecture.info }
	                                    </p>
	                                </div>
	                                <div class="lecture-instructor">
	                                    <h3 class="sub-heading">지식공유자 소개</h3>
	                                    <div class="teacher-profile">
	                                        <div class="teacher-profile-image">
	                                            <figure class="image">
	                                                <img src="${lecture.userImagePath }" width="70px" />
	                                                <span class="teacher-profile-name">${lecture.userName }</span>
	                                            </figure>
	                                        </div>
	                                        <ul>
	                                            <li>${lecture.userIntroduction }</li>
	                                        </ul>
	                                    </div>
	                                </div>
	                            </div>
	                            <!-- 교육과정 start-->
	                            
		                            <div class="lecture-curriculum" id="curriculum">
		                                <h3 class="sub-heading">교육과정</h3>
		                                <div class="curriculum-chapter-list">
		                                    <div class="curriculum-title">
		                                        <span class="curriculum_length">총 강의</span>
		                                        <span class="curriculum_runtime">총 시간</span>
		                                    </div>
		                                    <!-- chapter-cover start-->
		                                    <div class="chapter-cover">
	        		                    <c:forEach var="chapterDto" items="${chapters}" varStatus="status">
		                                        <!-- chapter-header start-->
		                                        <div class="chapter-header">
		                                            <div class="chapter-header-left">
		                                                <span class="section_header_icon plus">
		                                                    <i class="glyphicon glyphicon-plus"></i>
		                                                </span>
		                                                <span class="unit_title">챕터 ${status.index }. ${chapterDto.chapter.chapterName }</span>
		                                            </div>
		                                            <div class="chapter-header-right">
		                                                <span class="unit_length">${fn:length(chapterDto.lessons) } 강의</span>
		                                                <span class="unit_time"><i class="far fa-clock"></i>
		                                                    79 : 23</span>
		                                            </div>
		                                        </div>
			                                        <div class="lesson_cover slide-hidden">
		                                        	<c:forEach var="lesson" items="${chapterDto.lessons }">
			                                            <div class="unit_item">
			                                                <div class="col-sm-10 unit_item_left">
			                                                    <i class="far fa-play-circle"></i>
			                                                    <span class="unit_item-title">${lesson.lessonTitle }</span>
			                                                </div>
			                                                <div class="unit_item_right">
			                                                    <span class="unit_time"><i class="far fa-clock"
			                                                            style="margin-right: 4px;"></i>
			                                                        ${lesson.totalTime }
			                                                    </span>
			                                                </div>
			                                            </div>
			                           				 </c:forEach>
			                                        </div>
		                                        </c:forEach>
		                                    </div>
		                                    <!-- chapter-cover end-->
		                                </div>
		                            </div>
	                            <!-- 교육과정 end -->
	
	                            <!-- 공개일자 -->
	                            <div class="lecture-date">
	                                <h3 class="sub-heading">공개 일자</h3>
	                                <div style="padding-left: 1rem;"><fmt:formatDate value="${lecture.createDate }" pattern="yyyy년 MM월 dd일"/></div>
	                            </div>
	                            <!-- 수강후기 start -->
	                            <div class="lecture-reviews" id="reviews">
	                                <h3>수강 후기</h3>
	                                <div class="review-box">
	                                    <div class="average">
	                                        <span class="average_num">${counts.reviewStar }</span>
	                                        <span class="average_star">
	                                            <div class="rating_star">
	                                                <div class="review-star-solid">
	                                                    <span class="star_yellow starScore" data-text="${counts.reviewStar }" style="font-size: 16px;"></span>
	                                                </div>
	                                            </div>
	                                        </span>
	                                        <h5 class="review_total">${counts.reviewCnt }개의 수강평</h5>
	                                    </div>
	                                    <div class="review-progress_bars">
	                                    	<c:forEach var="review" items="${reviewStarAvgs }">
			                                    <div class="review_counting">
		                                            <label style="width: 40px;">${review.star }점</label>
		                                            <c:choose>
	                                            		<c:when test="${review.avgStar > 0 }">
		                                            		<progress class="progress is-link" max="100" value="${review.avgStar }"></progress>
	                                            		</c:when>
	                                            		<c:otherwise>
		                                            		<progress class="progress is-link" max="100"></progress>
	                                            		</c:otherwise>
		                                            </c:choose>
			                                        </div>
	                                    	</c:forEach>
	                                    </div>
	                                </div>
	                                <div class="review_list">
	                                    <div class="review_container">
	                                    <c:forEach var="review" items="${reviews }">
	                                        <div class="review_item">
	                                            <figure class="review-image-container">
	                                                <img class="review_image" src="${review.user.imageFilename }" width="60px" />
	                                            </figure>
	                                            <div class="review-contents-box">
	                                                <div class="review-contents">
	                                                    <div class="review_header">
	                                                        <div class="rating_star">
	                                                            <div class="star_yellow starScore" date-text="${counts.reviewStar }"></div>
	                                                        </div>
	                                                        <strong id="reivew_user_id">${review.user.id }</strong>
	                                                        <span class="review update_date"><fmt:formatDate value="${review.createDate }" pattern="yy-MM-dd"/></span>
	                                                    </div>
	                                                        <div class="review_body">${review.contents }</div>
	                                                </div>
	                                            </div>
	                                        </div>
		                               </c:forEach>
	                                        <button class="btn btn-show-more-review">수강평 더보기</button>
		                               </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
        <!-- description end -->
    	</section>  
    <script>
    
    // 존재하지 않는 평점 그래프 append
    //var html = '<progress class="progress is-link" max="100" value="0"></progress>';
	//$(".review_counting:not(:has(progress))").append(html);
    
    // 교육과정 slideDown/slideUp
    $(".chapter-header").click(function() {    	

	    $(this).next().slideDown();
		$(this).find(".glyphicon").removeClass("glyphicon-plus").addClass("glyphicon-minus");
		
		if ($(this).hasClass("up")) {
	   		$(this).next().slideUp();
		    
	    	$(this).find(".glyphicon").removeClass("glyphicon-minus").addClass("glyphicon-plus");
		}
		$(this).toggleClass("up");
    });
    
 	// starScore
	var score = $(".starScore").data("text");
	var star = "";
	for(var i=1; i<=score; i++) {
		star += '<i class="fas fa-star"></i>';
	}
	
	$(".starScore").html(star);
	
	var trim = 5 - score;
	
	var emptyStar = "";
	for(var i=1; i<=trim; i++) {
		emptyStar += '<i class="far fa-star"></i>';
	}
	
	$(".starScore").append(emptyStar);
	
	// lectureTag split 
	var str = $("#lectureTag").data("tag").split('#');
	var html = "";
	for (var i in str) {
		html +="<li><i class='glyphicon glyphicon-ok'></i> " +  str[i] + "</li>";
	}
	$("#lectureTag").html(html);
	$("#lectureTag li:first").remove();
    
    // 별점에 소수점 붙이기
    var score = $(".average_num").text();
    
    if(score.length == 1) {
    	$(".average_num").append(".0");
    }
    
     $(function() {
        var pg = location.search.search('pg');
        if(pg >= 0) {
        	var name = location.search.substring(pg + 3);
        	const scrollTop = $("#" + name).offset().top - 70;
             //animate({name:value}, 속도ms); jquery에 애니메이션 기능 함수
            $('html, body').animate({
                scrollTop
            }, 600);
        }
    }); 
    </script>
<%@ include file="../../common/footer.jsp" %>