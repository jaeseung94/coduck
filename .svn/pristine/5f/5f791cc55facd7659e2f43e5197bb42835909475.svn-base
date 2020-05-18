<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/head.jsp" %>
<%@ include file="../../common/header.jsp" %>
<%@ include file="sub-bar.jsp" %> 

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
      
		<!-- question start -->
		<div class="question container">
	        <div class="lecture-question" id="questionApp">
	            <div class="columns">
	                <div class="col-sm-9">
	                    <div class="lecture-question">
	                    <br>
                        <div class="question search-form">
                            <label class="label search-label" for="search">
                              <span class="visually-hidden">질문 검색</span>
                              <input id="search" v-model="keyword" @keyup.enter="searchQuestion"  class="question search-input" type="text" placeholder="질문을 검색해보세요" value="">
                            </label>
                            <button class="btn btn-search" @click="searchQuestion">검색</button>
                        </div>
                        <br>
                        <div class="posts-container" id="questions">
                            <div class="post-container-box" v-for="question in questions">
                                <div class="post">
                                       <div>
	                                    <figure class="post-left-image is-rounded">
	                                        <img class="is-rounded" :src="question.user.imageFilename" width="49px">
	                                    </figure>
                                           <span class="writer"><strong>{{question.user.id}}</strong></span>
                                           <span class="post updated_date">{{question.createDate}}</span>
                                       </div>
                                    <div class="post-contents">
                                        <div class="contents">
                                             <br>
                                             <span class="article_body"><p>{{question.contents}}</p></span>
                                        </div>
                                        <div class="post-comment" v-if="question.isAnswered === 'Y'">
                                            <div class="comments">
                                            	<i class="fas fa-comments"></i>
                                            	<a class="show-answer" @click="showAnswer(question.no)">댓글</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="answer_container">
                                	<input v-model="question.no" type="hidden"/>
                                    <div class="review-answer-item">
                                    	<figure class="review-image-container">
                                            <img class="review_image" src="" width="40px" />
                                        </figure>
                                        <div class="review-answer-box">
                                            <div class="answer-contents">
                                                <div class="answer_header">
                                                    <strong id="answer_user_id"></strong>
                                                    <span class="answer update_date"></span>
                                                </div>
                                                <div class="review_answer_body"></div>
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
			<%-- 	            
                <!-- Modal -->
                <div class="modal fade question-madal" id="myModal" role="dialog">
                <form action="insertQuestion.hta" method="post">
                	<input type="hidden" name="lectureNo" value="${param.lectureNo }">
                    <div class="modal-dialog">
	                    <div class="modal-content">
	                        <div class="modal-body">
	                        <p style="font-size: 18px; font-weight: 600; color: darkblue;">질문 작성 <i class="fas fa-pencil-alt"></i></p>
	                            <textarea class="modal-text" placeholder="내용을 입력해주세요."></textarea>
	                        </div>
	                        <div class="modal-footer">
	                            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	                            <button type="submit" class="btn btn-info" data-dismiss="modal">등록</button>
	                        </div>
	                    </div>
                    </div>
                </form>
                </div> 
            --%>
	        </div>
	    </div>
		<!-- question end -->

<script>
	var lectureNo = ${param.lectureNo} || 0;
	
	var app = new Vue ({
		el: '#questionApp',
		data: {
			questions: [],
			keyword: '',
		},
		methods: {
			searchQuestion: function() {
				const keyword = this.keyword;
				$.getJSON("/lecture/api/searchQuestion.hta",{no:lectureNo,keyword}, function(result) {
					console.log(app.questions,result);
					app.questions = result;
				})
			},showAnswer: function(questionNo) {
				$.getJSON("/lecture/api/getAnswer.hta", {questionNo}, function(result) {
					var $answer = $("input[value="+questionNo+"]").next();
					
					$answer.find("#answer_user_id").text(result.user.id);
					$answer.find(".review_image").prop("src", result.user.imageFilename);
					$answer.find(".update_date").text(result.createDate);
					$answer.find(".review_answer_body").text(result.contents);
				});
			}
		}
	});

	$(function() {
		app.searchQuestion();
	});

</script>
<%@ include file="../../common/footer.jsp" %>