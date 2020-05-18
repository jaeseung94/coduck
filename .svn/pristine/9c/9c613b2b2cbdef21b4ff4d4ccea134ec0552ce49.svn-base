<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script>
$(function() {
        $("#subNav li").on('click', function () {
            const name = $(this).attr('class');
            
            if (name == 'questions' || name == 'dashboard') return;
            // offset() 지정한 엘리먼트의 꼭다리 값 알려줌 
            const scrollTop = $("#" + name).offset().top - 58;
            // animate({name:value}, 속도ms); jquery에 애니메이션 기능 함수
            $('html, body').animate({
                scrollTop
            }, 800);
        });
    });
</script>
    
       <section class="lecture-header-container">
            <div class="container">
                <div class="col-sm-12 play-container">
                    <div class="col-sm-9">
                        <div class="col-sm-4 lecture-container">
                            <div class="lecture-thumbnail">
                                <img src="/resources/images/lecture/spring.jpg" alt="스프링프레임워크" />
                            </div>
                            <div class="lecture-play">
                                <div class="icon_container has-icon">
                                    <i class="fas fa-play"></i>
                                    <br>
                                </div>
                            </div>
                        </div>
                        <div class="lecture-title">
                            <div>
                                <h1>스프링프레임워크-신입개발자를 위한 스프링강좌</h1>
                                <div class="lecture-mata">
                                    <span>
                                        <div class="rating-star">
                                            <div class="star-solid">
                                                <span class="star">★★★★★</span>
                                                <small>(100개의 수강평)</small>
                                                <br>
                                                <small class="student_cnt">3379명의 수강생</small>
                                            </div>
                                        </div>
                                        <div class="lecture-progress">
                                            <span>진도율 : 27강/27강 (100.00%) | 시간 : 695분/695분</span>
                                            <br>
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-info" role="progressbar"
                                                    aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
                                                    style="width:30%">
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
                            <a href="#" class="btn btn-default sy-btn-learning">학습하기</a>
                        </div>
                        <!-- floating btn start -->
                        <div class="lecture-floating-btn">
                            <div class="lecture-floating-top">
                                <div class="lecture-price-cover">
                                    <div class="lecture-price-section">
                                        <div class="lecture-price">
                                            57,750원 <del class="lecture-del-price">77,000원</del>
                                        </div>
                                        <div class="lecture-price-detail">(25% 할인)</div>
                                    </div>
                                    <div class="lecture-btn-section">
                                        <div class="lecture-btn-cover">
                                            <button class="btn lecture-purchase-btn">구매하기</button>
                                        </div>
                                        <div class="lecture-sub-btn-cover">
                                            <button class="btn sub-btn lecture-like-btn">
                                                <i class="far fa-heart"></i> 500 위시
                                            </button>
                                            <button class="btn sub-btn lecture-cart-btn">
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
                                        <i class="fas fa-signal"></i> 수강 난이도 '활용'
                                    </div>
                                    <div class="lecture-info-row">
                                        <i class="far fa-play-circle"></i> 96회 수업ㆍ총 8시간 15분 수업
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- floating btn start -->
                    </div>
                </div>
            </div>
        </section>
        
       	<section class="leature-description_container">
	
		<!-- LectureDetail Menu start-->
	    <div class="container">
	        <ul class="nav nav-pills" id="subNav">
	            <li class="is-active dashboard"><a href="#">대시보드</a></li>
	            <li class="is-active description"><a href="#">강의소개</a></li>
	            <li class='curriculum'><a href="#">교육과정</a></li>
	            <li class='reviews'><a href="#">수강후기</a></li class=''>
	        <li class='questions'><a href="#">질문답변</a></li class=''>
	        </ul>
	    </div>
	    <!-- LectureDetail Menu end-->