<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/head.jsp" %>
<%@ include file="common/header.jsp" %>
	<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">    
	
	<c:if test="${param.error eq 'deny' }">
      <div class="alert alert-danger">
         <strong>서비스 거부</strong> 등급이 맞지 않아 서비스 요청이 거절되었습니다.
      </div>
   </c:if>
   <section class="main-headerline" style="background-image: url('https://46ba123xc93a357lc11tqhds-wpengine.netdna-ssl.com/wp-content/uploads/2018/09/ux-book-mockup-header.png')">
   	 <form id="mainSearch" class="navbar-form navbar-left" action="/action_page.php">
        <div class="input-group">
          <input type="text" class="form-control main search-box" placeholder="Search" name="search">
          <div class="input-group-btn">
            <button class="btn btn-default main sy-btn-search" type="submit">
              <i class="glyphicon glyphicon-search"></i>
            </button>
          </div>
        </div>
      </form> 
   </section>
   <!-- main contents start -->
        <main id="main">
            <div class="main-content-wrapper">
                <section class="leature-description_container">
                    <div class="container">
                        <div class="">
                            <div class="teacher main-body">
                                <!-- main banner lecture -->
                                <section class="banner-container">
                                    <div class="main-banner-box">
                                        <!-- banner lecture -->
                                        <div class="banner-card lecture-card">
                                            <a href="/lecture/main.hta">
                                                <span class="main banner-icon">
                                                    <img src="/resources/images/lecture/강좌48.png">
                                                </span>
                                            </a>
                                            <div class="banner-title">
                                                <h3>IT 웹 개발, 어렵지 않아요 <i class="fas fa-location-arrow" style="color: olivedrab;"></i></h3>
                                            </div>
                                            <div class="banner-comment">
                                                <p>
                                                    코딩… 나도 배워야 할 것 같은데,뭘 어떻게 시작해야할 지 망설이는 당신!
                                                    코린이라도 되고 싶다면 아니, 코린이에서 벗어나고 싶다면!
                                                    컴퓨터와 소통하기 위한 수 많은 언어들을 어디서부터 어떻게 배워야할지 코덕에서 알려드릴게요.🙂
                                                </p>
                                            </div>
                                        </div>

                                        <!-- main banner test -->
                                        <div class="banner-card test-card">
                                            <a href="/test/test-list.hta">
                                                <span class="main banner-icon">
                                                    <img src="/resources/images/lecture/강좌11.png">
                                                </span>
                                            </a>
                                            <div class="banner-title">
                                                <h3>탄탄한 기출문제로 자격시험 완벽 대비! <i class="fas fa-pencil-alt" style="color: steelblue;"></i></h3>
                                            </div>
                                            <div class="banner-comment">
                                                <p>
                                                    30년이 넘는 시간동안 무수히 많은 자격시험들이 출제되었는데, 
                                                    무수히 많은 자격시험 문제들을 연구해서 만든 자료를 토대로 코덕에서 기출문제 자료집을 제작하였습니다.
                                                    기출문제 풀이와 함께 해설강좌로 오답체크까지 한번에 진행하세요!
                                                </p>
                                            </div>
                                        </div>
                                        <!-- main banner community -->
                                        <div class="banner-card lecture-card">
                                            <a href="/view/viewnotice.hta">
                                                <span class="main banner-icon">
                                                    <img src="/resources/images/lecture/강좌6.png">
                                                </span>
                                            </a>
                                            <div class="banner-title">
                                                <h3>함께 소통해요 <i class="fas fa-paw" style="color: coral;"></i></h3>
                                            </div>
                                            <div class="banner-comment">
                                                <p>
                                                    코덕 커뮤니티에서 우리의 이야기와 궁금한 점들을 공유해보아요!
                                                    <br>
                                                    궁금한 사항들은 1:1문의를 통해 글을 남겨주세요.🙂
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                <!-- main banner end -->
                                <div id="lecture-section">  
                                    <div class="lesson-container">
                                    	<!-- 인기강좌 섹션 start -->
                                    	<section class="new-lecture-container">
                                            <div class="header">
                                                <div class="courses_header">
                                                    <h2 class="title is-4 is-spaced">인기강좌 TOP 5
                                                        <span class="icon">
                                                             <i class="fas fa-angle-right"></i>
                                                        </span>
                                                    </h2>
                                                </div>
                                            </div>
                                            <div class="columns lesson-list-body">
                                                <!-- 강좌 start -->
                                                <c:forEach var="likeLect" items="${likeLects }">
	                                                <div class="column lesson-tablet">
	                                                    <div class="lecutre lesson-item">
	                                                        <a href="/lecture/detail/description.hta?lectureNo=${likeLect.no }" class="lecture-item-front">
	                                                            <div class="item-image">
	                                                                <figure class="item-image-thumbnail">
	                                                                    <img src="${likeLect.imagePath }" class="">
	                                                                    <div class="lesson-item-event-card">
	                                                                        <span>${likeLect.discountRate }% 할인중</span>
	                                                                    </div>
	                                                                </figure>
	                                                            </div>
	                                                        </a>
                                                            <div class="item-contents">
                                                                <div class="lecture-item-title">${likeLect.title }</div>
                                                                <div class="lecture-item-info">
                                                                	<a href="/lecture/detail/description.hta?lectureNo=${likeLect.no }">
	                                                                    <div class="rating column is-half">
	                                                                        <div class="rating-star">
	                                                                            <div class="star_yellow" data-star-score="${likeLect.reviewStar }"></div>
	                                                                        </div>
	                                                                    </div>  
	                                                                    <div class="price column is-half">
	                                                                        <del>₩<fmt:formatNumber value="${likeLect.price }"></fmt:formatNumber></del>
	                                                                        <span class="discount_price">₩<fmt:formatNumber value="${likeLect.discountPrice }"></fmt:formatNumber></span>
	                                                                    </div>
                                                                	</a>
                                                                    <div class="item-info-bottom">
	                                                                    <div class="wish">
	                                                                    	<a href="/like/addlikelectlist.hta?lectureno=${likeLect.no }">
	                                                                    		<i class="far fa-heart"></i>${likeLect.likeCnt}
	                                                                    	</a>
	                                                                    </div>
	                                                                    <div class="teacher_name">${likeLect.userName }</div>
	                                                                </div>  
                                                                </div>
                                                            </div>
	                                                    </div>
	                                                </div>
                                                </c:forEach>
                                            </div>
                                        </section> 
    	                                <!-- 인기강좌 섹션 end -->
                                        <!-- 신규강좌 섹션-->
                                        <section class="new-lecture-container">    
                                            <div class="main-course-list">
                                                <div class="header">
                                                    <div class="courses_header">
                                                        <h2 class="title is-4 is-spaced">따끈따끈, 신규 강좌
                                                            <span class="icon">
                                                                <i class="fas fa-angle-right"></i>
                                                           </span>
                                                        </h2>
                                                    </div>
                                                </div>
                                                <div class="horizontal">
                                                <c:forEach var="newLect" items="${newLects }">
                                                    <div class="my-lecture new-lecture-box">
                                                        <a href="/lecture/detail/description.hta?lectureNo=${newLect.no }">
                                                            <img src="${newLect.imagePath }" class="new-lecture-thumbnail">
                                                        </a>
                                                        <div class="my-lecture new-lecture-body">
                                                            <div class="new-lecture-details">
                                                                <a href="/lecture/detail/description.hta?lectureNo=${newLect.no }">
                                                                    <div class="new detail-title">
                                                                        <h4>${newLect.title }</h4>
                                                                    </div>
                                                                    <div class="new info-lect">
                                                                        <span> 12강 |  시간 : 150분</span>
                                                                    </div>
                                                                    <div class="new info-price">
                                                                        <strong class="discount">₩<fmt:formatNumber value="${newLect.discountPrice }"></fmt:formatNumber></strong>
                                                                        <del class="rate">₩<fmt:formatNumber value="${newLect.price }"></fmt:formatNumber></del>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <div class="wish-btn-box">
                                                                <div class="btn-cart">
                                                                    <a href="/cart/addlectcart.hta?lectNo=${newLect.no }"><button class="btn sm btn-default"><i class="glyphicon glyphicon-shopping-cart t-gray"></i></button></a>
                                                                </div>
                                                                <div class="btn-wish">
                                                                    <a href="/like/addlikelectlist.hta?lectureno=${newLect.no }"><button class="btn sm btn-default"><i class="glyphicon glyphicon-heart-empty t-gray"></i></button></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
											</div>     
                                        </section>        
                                        <!-- 신규강좌 섹션 종료-->
                                        <!-- 무료강좌 섹션 시작 -->    
                                        <section class="new-lecture-container">
                                            <div class="header">
                                                <div class="courses_header">
                                                    <h2 class="title is-4 is-spaced">CODUCK's Pick
                                                        <span class="icon">
                                                            <i class="fas fa-angle-right"></i>
                                                       </span>
                                                    </h2>
                                                </div>
                                            </div>
                                            <div class="columns lesson-list-body">
                                            <c:forEach var="freeLect" items="${freeLects }">
                                                <div class="column lesson-tablet">
                                                    <div class="lecutre lesson-item">
                                                        <a href="/lecture/detail/description.hta?lectureNo=${freeLect.no }" class="lecture-item-front">
                                                            <div class="item-image">
                                                                <figure class="item-image-thumbnail">
                                                                    <img src="${freeLect.imagePath }">
                                                                    <div class="lesson-item-free-card">
                                                                        <span>무료 수강</span>
                                                                    </div>
                                                                </figure>
                                                            </div>
                                                        </a>
                                                        <div class="item-contents">
                                                            <div class="lecture-item-title">${freeLect.title }</div>
                                                            <div class="lecture-item-info">
                                                            	<a href="/lecture/detail/description.hta?lectureNo=${freeLect.no }"> 
	                                                                <div class="rating column is-half">
	                                                                    <div class="rating-star">
	                                                                         <div class="star_yellow" data-star-score="${freeLect.reviewStar }"></div>
	                                                                    </div>
	                                                                </div>  
	                                                                <div class="price column is-half">
	                                                                    <span class="discount_price">무료</span>
	                                                                </div>
                                                            	</a>
                                                                <div class="item-info-bottom">
                                                                 <div class="wish">
                                                                 	<a href="/like/addlikelectlist.hta?lectureno=${freeLect.no }">
                                                                 		<i class="far fa-heart"></i>${freeLect.likeCnt}
                                                                 	</a>
                                                                 </div>
                                                                 <div class="teacher_name">${freeLect.userName }</div>
                                                             </div>  
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>    
                                            </div>     
                                        </section>    
                                        <!-- 무료강좌 섹션 종료-->
                                        <!-- 모의고사 섹션 -->
                                        <section class="new-test-container">    
                                            <div class="main-course-list">
                                                <div class="header">
                                                    <div class="courses_header">
                                                        <h2 class="title is-4 is-spaced">최신 모의고사 기출
                                                            <span class="icon">
                                                                <i class="fas fa-angle-right"></i>
                                                           </span>
                                                        </h2>
                                                    </div>
                                                </div>
                                                <div class="horizontal">
                                                	<c:forEach var="test" items="${tests }">
	                                                    <div class="new-test new-test-box">
	                                                        <a href="/test/test-list.hta">
	                                                            <img src="/resources/images/lecture/강좌17.jpg" class="new-test-thumbnail">
	                                                        </a>
	                                                        <div class="new-test new-test-body">
	                                                            <div class="new-test-details">
	                                                                <a href="">
	                                                                    <div class="new detail-title">
	                                                                        <h4>${test.name }</h4>
	                                                                    </div>
	                                                                    <div class="new info-test">
	                                                                        <span>${test.ep }</span>
	                                                                    </div>
	                                                                    <div class="new test info-price">
	                                                                        <strong class="price">￦<fmt:formatNumber value="${test.price }"></fmt:formatNumber> </strong>
	                                                                    </div>
	                                                                </a>
	                                                            </div>
	                                                            <div class="wish-btn-box">
	                                                                <div class="btn-cart">
	                                                                    <a href="/cart/addlectcart.hta?testNo=${test.no }"><button class="btn sm btn-default"><i class="glyphicon glyphicon-shopping-cart t-gray"></i></button></a>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
                                                	</c:forEach>
                                                </div>     
                                            </div>    
                                        </section>        
                                        <!-- 신규모의고사 섹션 종료-->
                                        <!-- 모의고사 해설강좌 섹션 start -->
                                    	<section class="new-lecture-container">
                                            <div class="header">
                                                <div class="courses_header">
                                                    <h2 class="title is-4 is-spaced">모의고사 풀이, 한방에 해결!
                                                        <span class="icon">
                                                             <i class="fas fa-angle-right"></i>
                                                        </span>
                                                    </h2>
                                                </div>
                                            </div>
                                            <div class="columns lesson-list-body">
                                            	<c:forEach var="testLect" items="${testLects }">
	                                                <div class="column lesson-tablet">
	                                                    <div class="lecutre lesson-item">
	                                                        <a href="/lecture/detail/description.hta?lectureNo=${testLect.no }" class="lecture-item-front">
	                                                            <div class="item-image">
	                                                                <figure class="item-image-thumbnail">
	                                                                    <img src="${testLect.imagePath }" class="">
	                                                                    <c:choose>
	                                                                    	<c:when test="${testLect.discountRate > 0}">
			                                                                    <div class="lesson-item-event-card">
			                                                                        <span>${testLect.discountRate }% 할인중</span>
			                                                                    </div>
	                                                                    	</c:when>
	                                                                    	<c:when test="${testLect.isFreed eq 'Y' }">
	                                                                    		 <div class="lesson-item-free-card">
			                                                                        <span>Free</span>
			                                                                    </div>
	                                                                    	</c:when>
	                                                                    	<c:otherwise></c:otherwise>
	                                                                    </c:choose>
	                                                                </figure>
	                                                            </div>
	                                                        </a>
                                                            <div class="item-contents">
                                                                <div class="lecture-item-title">${testLect.title }</div>
                                                                <div class="lecture-item-info">
                                                                	<a href="/lecture/detail/description.hta?lectureNo=${testLect.no }">
	                                                                    <div class="rating column is-half">
	                                                                        <div class="rating-star">
	                                                                            <div class="star_yellow" data-star-score="${testLect.reviewStar }"></div>
	                                                                        </div>
	                                                                    </div>  
	                                                                    <div class="price column is-half">
	                                                                        <del>₩<fmt:formatNumber value="${testLect.price }"></fmt:formatNumber></del>
	                                                                        <span class="discount_price">₩<fmt:formatNumber value="${testLect.discountPrice }"></fmt:formatNumber></span>
	                                                                    </div>
                                                                	</a>
                                                                    <div class="item-info-bottom">
	                                                                    <div class="wish">
	                                                                    	<a href="/like/addlikelectlist.hta?lectureno=${testLect.no }">
	                                                                    		<i class="far fa-heart"></i>${testLect.likeCnt}
	                                                                    	</a>
	                                                                    </div>
	                                                                    <div class="teacher_name">${testLect.userName }</div>
	                                                                </div>  
                                                                </div>
                                                            </div>
	                                                    </div>
	                                                </div>
                                                </c:forEach>
                                            </div>
                                        </section> 
    	                               <!-- 모의고사 해설강좌 섹션 end -->
                                    </div>                       
                                </div>
                            </div>                      
                        </div>
                    </div>
                </section>
            </div>
        </main>
<script>
$(function() {
	drawingStar();
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
<%@ include file="common/footer.jsp" %>