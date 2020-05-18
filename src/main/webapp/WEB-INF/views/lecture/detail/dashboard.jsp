<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../common/head.jsp" %>
<%@ include file="../../common/header.jsp" %>
<%@ include file="sub-bar.jsp" %> 
    
	    <!-- dashboard start -->
	    <div class="dashboard container">
	        <div class="lecture-dashboard" id="dashboard">
	            <div class="colums"> 
	                <div class="column is-half">
	                    <div class="lecture-board box recent-question">
	                        <span class="board-box-title">최근 질문</span>
	                        <div class="lecture-question item-container">
	                        <c:forEach var="question" items="${questions }">
	                            <a href="question.hta?lectureNo=${lecture.no }" class="list-item">
	                                <fiqure class="user-profile-image">
	                                    <img src="${question.user.imageFilename }" width="40px" class="is-rounded" alt="작성자 프로필">
	                                </fiqure>
	                                
	                                <div class="item-title">
	                                <c:choose>
	                                	<c:when test="${fn:length(question.contents) > 24}">
	                                		<c:out value="${fn:substring(question.contents, 0, 23)}" /> ...
	                                	</c:when>
	                                	<c:otherwise>
	                                		<c:out value="${question.contents }"></c:out>
	                                	</c:otherwise>
	                                </c:choose>
	                                </div>
	                                
	                                <div class="item-date"><fmt:formatDate value="${question.createDate }" pattern="yyyy-MM-dd"/></div>
	                            </a>
	                        </c:forEach>
	                        </div>
	                    </div>
	                </div>
	                <div class="column is-half pull-right">
	                    <div class="lecture-board box recent-lesson">
	                        <span class="board-box-title">최근 본 강의</span>
	                        <div class="lecture-lesson item-container">
	                            <!-- 최근 본 강의 목록 start -->
	                            <c:forEach var="recent" items="${recentList }">
		                            <div class="recent-view lesson_cover">
		                                <div class="unit_item">
		                                    <div class="col-sm-8 unit_item_left">
		                                        <i class="far fa-play-circle"></i>
		                                        <span class="unit_item-title">${recent.lessonTitle }</span>
		                                    </div>
		                                    <div class="unit_item_right">
		                                        <span class="unit_time">
		                                        	<i class="far fa-clock" style="margin-right: 4px;"></i>
		                                        	 ${recent.newTotalTime }
		                                        </span>
		                                    </div>
		                                </div>
		                            </div>
	                            </c:forEach>
	                            <!-- 최근 본 강의 목록 end -->
	                        </div>
	                    </div>
	                    <div class="col-sm-12 lecture-board box my-status">
	                        <span class="board-box-title">내 학습현황</span>
	                        <div class="lecture-lesson item-container">
	                            <div class="item-status">
	                                <div class="col-sm-4">
	                                    <div class="status_value complete_unit_cnt">
	                                        <span>${lessonDto.viewCount }/${lessonDto.totalCount }</span>
	                                    </div>
	                                    <div class="status_label">완료 수업</div>
	                                </div>
	                                <div class="col-sm-4 stayed_time">
	                                    <div class="status_value">
	                                        <span>${lessonDto.hourByTotalAccumulate }<small>h</small> ${lessonDto.minutesTotalAccumulate }<small>m</small></span>
	                                    </div>
	                                    <div class="status_label">총 학습 시간</div>
	                                </div>
	                                <c:if test="${lessonDto.viewCount eq lessonDto.totalCount}">
		                                <div class="col-sm-4 certificate">
		                                    <div class="certificate-container">
		                                        <img src="/resources/images/lecture/certificate.PNG" width="85px" />
		                                        <p>수료증</p>
		                                    </div>
		                                </div>
	                                </c:if>
	                            </div>
	                        </div>
	                    </div>
	                </div>
		        </div>
		    </div>   
	    </div>
	    <!-- dashboard end -->
	</section>
<%@ include file="../../common/footer.jsp" %>