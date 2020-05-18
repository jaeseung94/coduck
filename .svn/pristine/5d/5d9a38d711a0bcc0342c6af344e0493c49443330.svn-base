<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../common/header.jsp" %>

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

		<!-- question start -->
		<div class="question container">
	        <div class="lecture-question" id="question">
	            <div class="columns">
	                <div class="col-sm-9">
	                    <div class="lecture-question">
	                        <div class="add-post">
	                             <button class="sy-btn sy-btn-question" data-toggle="modal" data-target="#myModal">질문 작성</button>
	                        </div>
	                        <div class="question search-form">
	                            <label class="label search-label" for="search">
	                              <span class="visually-hidden">질문 검색</span>
	                              <input id="search" class="question search-input" type="text" placeholder="질문을 검색해보세요" value="">
	                            </label>
	                            <button class="btn btn-search">검색</button>
	                        </div>
	                        <div class="posts-container">
	                            <div class="post-container-box">
	                                <div class="post">
	                                    <figure class="post-left-image is-rounded">
	                                        <img class="is-rounded" src="/resources/images/logo/coduck.ico" width="49px">
	                                    </figure>
	                                    <div class="post-contents">
	                                        <div class="contents">
	                                            <p>
	                                              <strong class="contents-title">연습자료 </strong>
	                                              <small>
	                                                <span class="writer"><strong> sungsil kim</strong></span>
	                                                <span class="post updated_date">3달 전</span>
	                                                <span class="option" fxd-data="{&quot;id&quot;:16035,&quot;type&quot;:&quot;question&quot;}"></span>
	                                              </small><br>
	                                              <span class="article_body"></span></p><p>연습자료는 어디서 받나요? 강의를 잘 들었지만, 연습을 해 볼 수가 없어 다 잊어버린 듯 합니다.</p>
	                                            <p></p>
	                                          </div>
	                                          <div class="post-comment">
	                                            <div class="comments" fxd-data="{&quot;count&quot;:0}">
	                                                <svg aria-hidden="true" data-prefix="fas" width="16" data-icon="comment" class="svg-inline--fa fa-comment fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 32C114.6 32 0 125.1 0 240c0 49.6 21.4 95 57 130.7C44.5 421.1 2.7 466 2.2 466.5c-2.2 2.3-2.8 5.7-1.5 8.7S4.8 480 8 480c66.3 0 116-31.8 140.6-51.4 32.7 12.3 69 19.4 107.4 19.4 141.4 0 256-93.1 256-208S397.4 32 256 32z"></path></svg>
	                                                <span class="number">0</span>
	                                            </div>
	                                          </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <nav class="pagination sy-pagination" role="navagation" aria-label="pagination">
	                                <ul class="pagination">
	                                    <li><a href="#"><i class="fas fa-angle-left"></i></a></li>
	                                    <li class="active"><a href="#">1</a></li>
	                                    <li><a href="#">2</a></li>
	                                    <li><a href="#">3</a></li>
	                                    <li><a href="#"><i class="fas fa-angle-right"></i></a></li>
	                                  </ul>
	                            </nav>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            
                <!-- Modal -->
                <div class="modal fade question-madal" id="myModal" role="dialog">
                    <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <input class="modal-title" placeholder="제목을 입력해주세요.">
                        </div>
                        <div class="modal-body">
                            <textarea class="modal-text">
                               질문 입력
                            </textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                            <button type="submit" class="btn btn-info" data-dismiss="modal">등록</button>
                        </div>
                    </div>
                    </div>
                </div>
	        </div>
	    </div>
		<!-- question end -->
<%@ include file="../../common/footer.jsp" %>