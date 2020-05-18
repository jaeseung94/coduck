<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common/header.jsp" %>  
	<!-- lecture - main start -->  
    <main id="main">
            <section id="lecture-section" class="section">
                <div class="container">
                    <div class="columns is-tablet col-sm-12">
                        <aside class="column is-2 sidebar_left col-sm-2">
                            <div class="dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" style="font-size: 18px;">IT 프로그래밍 
                                <span class="caret"></span> </button>
                                <ul class="dropdown-menu">
                                	 <li><a href="main.hta">All</a></li>
                                	 <c:forEach var="category" items="${categories }">
	                                    <li><a href="main.hta?cateNo=${category.no }">${category.name }</a></li>
                                     </c:forEach>
                                </ul>
                            </div>
                            <div class="accordion-box">
                                <button class="accordion accordion-title">난이도
                                    <i class="fas fa-angle-down"></i>
                                </button>
                                <div class="panel accordion-contents" id="accordion">
                                    <div class="checkbox_accordion">
                                        <input type="checkbox" name="grade" value="1">
                                        <label class="">입문</label>
                                    </div>
                                    <div class="checkbox_accordion">
                                        <input type="checkbox" name="grade" value="2">
                                        <label class="">초급</label>
                                    </div>
                                    <div class="checkbox_accordion">
                                        <input type="checkbox" name="grade" value="3">
                                        <label class="">중급</label>
                                    </div>
                                    <div class="checkbox_accordion">
                                        <input type="checkbox" name="grade" value="4">
                                        <label class="">활용</label>
                                    </div>
                                </div>
                                <button class="accordion accordion-title">옵션
                                    <i class="fas fa-angle-down"></i>
                                </button>
                                <div class="panel accordion-contents">
                                    <div class="checkbox_accordion">
                                        <input type="checkbox">
                                        <label class="">무료</label>
                                    </div>
                                    <div class="checkbox_accordion">
                                        <input type="checkbox">
                                        <label class="">유료</label>
                                    </div>
                                    <div class="checkbox_accordion">
                                        <input type="checkbox">
                                        <label class="">할인중</label>
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
                                  <input id="search" class="search-input" type="text" placeholder="강의 검색하기" value="">
                                </label>
                                <button class="btn btn-search">검색</button>
                            </div>
                            <div class="lectures-contents">
                                <div class="lectures-box">
                                    <div class="breadcrumb">
                                        <ul> 
                                            <li>
                                                <a href="" class="catagory_link">ALL &nbsp</a>
                                            </li>
                                            
                                            <li>
                                                <a href="" class="catagory_link">&nbsp Html/CSS</a>
                                            </li>
                                        </ul>
                                        <div class="dropdown" id="sort" style="float:right;">
                                            <select class="btn btn-sm" name="sort" style="border:1px solid lightgray;">
                                                <option value="like" selected>추천순</option>
                                                <option value="recent">최신순</option>
                                                <option value="score">평점순</option>
                                                <option value="price">가격순</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>                         
                            <div class="lesson-container">
                                <div class="columns lesson-list-body">
                                <c:forEach var="lecture" items="${lectures }">
                                    <div class="column lesson-tablet">
                                        <div class="lecutre lesson-item">
	                                            <a href="detail/description.hta?lectureNo=${lecture.no }" class="lecture-item-front">
	                                                <div class="item-image">
	                                                    <figure class="item-image-thumbnail">
	                                                        <img src="${lecture.imagePath}" class="">
	                                                        <c:if test="${lecture.isFreed eq 'Y' }">
		                                                        <div class="lesson-item-event-card">
		                                                            <i class=""></i>
		                                                            <span>${lecture.discountRate }% 할인중</span>
		                                                        </div>
	                                                        </c:if>
	                                                        
	                                                    </figure>
	                                                </div>
	                                                <div class="item-contents">
	                                                    <div class="lecture-item-title">
	                                                        ${lecture.title }
	                                                    </div>
	                                                    <div class="lecture-item-info">
	                                                        <div class="rating column is-half">
	                                                            <div class="rating-star">
	                                                                <div class="star_yellow">
	                                                                    ★★★★
	                                                                </div>
	                                                            </div>
	                                                        </div>  
	                                                        <div class="price column is-half">
	                                                        <c:choose>
	                                                        	<c:when test="${lecture.isFreed eq 'Y' }">
		                                                            <del>￦<fmt:formatNumber value="${lecture.price }"></fmt:formatNumber></del>
	                                                        	</c:when>
	                                                        	<c:otherwise>
	                                                        		<br>
	                                                        	</c:otherwise>
	                                                        </c:choose>                                                      	
	                                                            <span class="discount_price">￦<fmt:formatNumber value="${lecture.discountPrice }"></fmt:formatNumber></span>
	                                                        </div>
	                                                        <div class="item-info-bottom">
	                                                            <div class="student_num column is-half"></div>
	                                                            <div class="teacher_name">${lecture.userName }</div>
	                                                        </div>  
	                                                    </div>
	                                                </div>
	                                            </a>
	                                        </div>
	                                    </div>
                                    </c:forEach>
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
            </section>
        </main>
		<!-- lecture-main end -->
<script>
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
</script>		
<%@ include file="../common/footer.jsp" %>