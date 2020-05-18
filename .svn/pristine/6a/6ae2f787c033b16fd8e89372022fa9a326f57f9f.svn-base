<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="/resources/js/lecture/details-common.js"></script>   

		<section class="lecture-header-container">
            <div class="container">
                <div class="col-sm-12 play-container">
                    <div class="col-sm-9">
                        <div class="col-sm-4 lecture-container">
                            <div class="lecture-thumbnail">
                                <img src="${lecture.imagePath }" alt="스프링프레임워크" />
                            </div>
                            <div class="lecture-play">
                                <div class="icon_container has-icon">
                                    <a href="${lecture.samplePath }">
                                    	<i class="fas fa-play"></i>
                                    </a>
                                    <br>
                                </div>
                            </div>
                        </div>
                        <div class="lecture-title">
                            <div>
                            	<div class="lecture-title-header">
	                                <h1>${lecture.title }</h1>
                            	</div>
                                <div class="lecture-mata">
                                    <span>
                                        <div class="rating-star">
                                            <div class="star-solid">
                                                <span class="star starScore" id="starScore" data-text="${counts.reviewStar }"></span>
                                                <small>(${counts.reviewCnt }개의 수강평)</small>
                                                <br>
                                                <small class="student_cnt"> ${counts.studentCnt }명의 수강생</small>
                                            </div>
                                        </div>
                                        <div class="lecture-progress">
                                            <span>진도율 : ${lessonDto.viewCount }강/${lessonDto.totalCount }강 (${lessonDto.percent }%) | 시간 : ${lessonDto.totalAccumulate }분/${lessonDto.totalTime }분</span>
                                            <br>
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-info" role="progressbar"
                                                    aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                                                    style="width:${lessonDto.percent}%">
                                                </div>
                                            </div>
                                        </div>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="learning-btn-container">
                            <a href="../player/player.hta?lectureNo=${lecture.no }" class="btn btn-default sy-btn-learning">학습하기</a>
                        </div>
                        <!-- floating btn start -->
                        <div class="lecture-floating-btn">
                            <div class="lecture-floating-top">
                                <div class="lecture-price-cover">
                                    <div class="lecture-price-section">
                                        <div class="lecture-price">
                                            <fmt:formatNumber value="${lecture.discountPrice }"></fmt:formatNumber>원 
                                        	<c:if test="${lecture.discountRate > 0}">
                                            	<del class="lecture-del-price"><fmt:formatNumber value="${lecture.price }"></fmt:formatNumber>원</del>
                                        	</c:if>
                                        </div>
                                        <c:if test="${lecture.discountRate > 0}">
	                                        <div class="lecture-price-detail">(${lecture.discountRate }% 할인)</div>
                                        </c:if>
                                    </div>
                                    <div class="lecture-btn-section">
                                        <div class="lecture-btn-cover">
                                            <a href="/order/insertOrderLect.hta" class="btn lecture-purchase-btn">수강신청</a>
                                        </div>
                                        <div class="lecture-sub-btn-cover">
                                            <button class="btn sub-btn lecture-like-btn">
                                                <i class="far fa-heart"></i> ${counts.likeCnt } 위시
                                            </button>
                                            <button href="/cart/insertCartLect.hta" class="btn sub-btn lecture-cart-btn">
                                                <i class="fas fa-shopping-cart"></i> 수강 바구니
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="lecture-floating-bottom">
                                <div class="lecture-info-cover">
                                    <div class="lecture-info-row">
                                        <i class="fas fa-user-tie"></i> 지식공유자 !강사 이름!
                                    </div>
                                    <div class="lecture-info-row">
                                        <i class="far fa-clock"></i> 평생 무제한 시청
                                    </div>
                                    <div class="lecture-info-row">
                                        <i class="fas fa-stamp"></i> 수료증 발급 강의
                                    </div>
                                    <div class="lecture-info-row">
                                       <i class="fas fa-signal"></i>수강 난이도 '활용'
                                    </div>
                                    <div class="lecture-info-row">
                                       <i class="far fa-play-circle"></i>96회 수업ㆍ총 8시간 15분 수업
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- floating btn start -->
                    </div>
                </div>
            </div>
        </section>
                
		<!-- LectureDetail Menu start-->
       	<section class="leature-description_container">
		    <div class="container">
	        	<ul class="nav nav-pills" id="subNav">
	        	<c:if test="${LU != null }">
		            <li class="is-active dashboard"><a href="dashboard.hta?lectureNo=${lecture.no }">대시보드</a></li>
	        	</c:if>
		            <li class="is-active description"><a href="description.hta?lectureNo=${lecture.no }">강의소개</a></li>
		            <li class='curriculum'><a href="#">교육과정</a></li>
		            <li class='reviews'><a href="#">수강후기</a></li>
		        	<li class='questions'><a href="question.hta?lectureNo=${lecture.no }">질문답변</a></li>
	        	</ul>
	    	</div>
		    <!-- LectureDetail Menu end-->