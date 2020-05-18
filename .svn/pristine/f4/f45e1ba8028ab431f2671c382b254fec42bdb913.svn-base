<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="../../common/tag.jsp" %>
<%@ include file="../../common/head.jsp" %>

<!-- sy.css -->
<link href="<c:url value="/resources/css/sy-player.css" />" rel="stylesheet">   

    <div id="root">
        <main id="main">
            <section class="lecture-container">
                <a class="toggle-left is-hidden-tablet"></a>
                    <aside class="lecture-nav lecture-nav-left" id="coursebarApp">
                        <div class="lecture-nav-left-header">
                            <h5 data-lecture-no="${lectureCourse.lecture.no }">${lectureCourse.lecture.lectTitle }</h5>
                            <p>
                                <span>기간:무제한</span>
                            </p>
                            <div class="lecture-progress">
                                <label>진도율 : <span id="viewCount">${lessonDto.viewCount }</span>강/${lessonDto.totalCount }강 (<span id="percent">${lessonDto.percent }</span>%) | 시간 : <span id="totalAccumulate">${lessonDto.totalAccumulate }</span>분/${lessonDto.totalTime }분</label>
                                <div class="progress">
                                    <div id="progressBar" class="progress-bar progress-bar-info" role="progressbar"aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${lessonDto.percent}%">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="curriculum">
                        <c:forEach var="chapters" items="${lectureCourse.chapters }" varStatus="cstatus">
                        	<ul>
                            	<li class="list unit unit-chapter">
                                    <span class="list-item unit-title">${chapters.chapter.chapterName }</span>
                                    <ul class="list unit unit-lesson">
                                    <c:forEach var="lesson" items="${chapters.lessons }" varStatus="status">
                                       <li class="list-item unit-lesson ${cstatus.index == 0 && status.index == 0 ? 'active' : ''}" data-order="${lesson.order}" data-lesson-no="${lesson.no }">
                                           <span class="list-item lesson-title">${lesson.lessonTitle }</span>                                  
                                           <c:forEach var="history" items="${historys }">
	                                           <c:if test="${lesson.no == history.lessonNo && history.isWatched eq 'Y' }">
		                                           <span class="unit-checked-icon">
		                                               <i class="fas fa-check-circle"></i>
		                                           </span>    
	                                           </c:if>
                                           </c:forEach>
                                       </li>
                                    </c:forEach>
                                   </ul>
                               </li>
                            </ul>
                        </c:forEach>
                        </div>
                    </aside>
                    <div class="contents-container center">
                        <header class="contents-header-nav">
                            <div class="toggle-left">
                                <a class="btn btn-sm toggle-btn-nav-left is-outlined">
                                    <i class="fas fa-list-ol"></i>
                                </a>
                            </div>
                            <div class="unit-title">
                                <h3 id="lessonTitle">${firstLesson.lessonTitle }</h3>
                            </div>
                            <div class="right-buttons">
                                <a href="/lecture/detail/dashboard.hta?lectureNo=${lectureCourse.lecture.no }" class="btn go-out-lecture is-outlined">
                                    <span>
                                        <i class="glyphicon glyphicon-new-window"></i> 나가기
                                    </span>
                                </a>
                                <button class="btn toggle-right is-outlined">
                                    <span>
                                        <i class="far fa-question-circle"></i> 질문하기
                                    </span>
                                </button>
                            </div>
                        </header>
                        <div class="contents-unit-body">
                            <div class="player-container">
                               <video src="${firstLesson.videoPath }" autoplay="autoplay" type="video/mp4" class="lesson-video" id="player" controls></video>
                            </div>
                        </div>
                        <footer class="contents-footer-nav navbar">
                            <div class="footer-nav-item">
                                <button class="btn btn-default is-outlined btn-move before">
                                    <span class="btn-before-lesson">
                                        <i class="fas fa-step-backward"></i>
                                         이전강의
                                    </span>
                                </button>
                                <button class="btn btn-default is-outlined">
                                    <span class="btn-next-lesson">
                                        <i class="fas fa-check"></i>
                                    </span>
                                </button>
                                 <button class="btn btn-default is-outlined btn-move after">
                                    <span class="btn-next-lesson">
                                        <i class="fas fa-step-forward"></i>
                                         다음강의
                                    </span>
                                </button>
                            </div>
                        </footer>
                    </div>
                    <div class="lecture-nav lecture-nav-right closed" id="quesionApp">
                        <div class="right-header">
                            <a class="toggle-btn-closed">
                                <i class="fas fa-times"></i>
                            </a>
                            <h4>질문 게시판</h4>
                            <div class="question-editor">
                                <div class="search search-bar search-question">
                                    <input type="text" class="form-control search-box" name="search">
                                    <i class="glyphicon glyphicon-search"></i>
                                </div>
                                <div class="btn-question">
                                    <button class="btn btn-sm btn-default btn-ask">질문하기</button>
                                </div>
                                <div class="question-editor-form">
                                	<form id="questionForm"> 	
		                                <textarea placeholder="내용을 입력해주세요."></textarea>
		                                <div class="ask-form-buttons">
			                                <button type="button" class="btn btn-xs btn-default btn-close">닫기</button>
			                                <button type="button" class="btn btn-xs btn-info btn-submit">등록</button>
		                                </div>
		                            </form>
                                </div>
                            </div>
                        </div>
                        <div class="unit-question-list">
                            <ul id="question-box"></ul>
                        </div>
                    </div>
            </section>
        </main>
    </div>
</body>
<script>
	$(function() {
		
		// 레슨명 클릭 시 active 효과
	    $(".list.unit.unit-lesson li").click(function() {
	        if ($(this).hasClass(".active")) 
	        	return;
	        $(".unit-lesson").removeClass("active");
	        $(this).addClass("active");
	        searchLessonQuestion();
	    });
		
		// 이전강좌, 다음강좌로 이동
		$(".btn-move").on('click', function() {
			
			var isBefore = $(this).hasClass("before");
			var beforeOrder = $(".unit-lesson.active").data("order");
			var order = isBefore ? beforeOrder - 1 : beforeOrder + 1;
			
			if(order && order <=$(".list-item.unit-lesson").length) {
				$(".list-item.unit-lesson").each(function(i,item){
					var orderNo = $(this).data("order");
					if(order == orderNo) {
						$(".list-item.unit-lesson").removeClass("active");
						$(this).addClass("active");
					}
				});
		        searchLessonQuestion();
				lessonPlayer();
			}
		});
	
		// 강좌 코스 사이드바 슬라이드 
	    var $sidebar = $(".lecture-nav-left");
	    var $sidebarBtn = $(".toggle-btn-nav-left");
	
	    $sidebarBtn.on("click", function() {
	        $sidebar.toggleClass('is-active');
	        
	        if($sidebar.hasClass('is-active')) {
	            $('.overlay').fadeIn();
	            $(".toggle-btn-nav-left i").removeClass("fas fa-list-ol").addClass("fas fa-times");
	            $sidebarBtn.removeClass("none-space-left").addClass("space-left");
	        
	        } else {
	            $('.overlay').fadeOut();
	            $(".toggle-btn-nav-left i").removeClass("fas fa-times").addClass("fas fa-list-ol");
	            $sidebarBtn.removeClass("space-left").addClass("none-space-left");
	        }
	    }); 
	
		// 질문하기 사이드바 슬라이드
	    $questionbar = $(".lecture-nav-right");
	
	    $(".toggle-right").click(function() {
	        $questionbar.removeClass("closed").addClass("opened");
	    });
	    $(".toggle-btn-closed").on("click", function() {
	        $questionbar.removeClass("opened").addClass("closed");
	    }); 
	    
	    // 질문 조회 ajax 실행 이벤트
	    $(".toggle-right").on("click", function() {
	    	searchLessonQuestion();
	    });
	    
	    $("input[name=search]").on("keyup", function(e) {
	    	if(e.keyCode == 13)
	    		searchLessonQuestion();
	    });
	    
	    // 질문하기 form 컨드롤
	    $(".btn-ask").on("click", function() {
		    $(".question-editor-form").css("display", 'block');
		});
	    $(".btn-close").on("click", function() {
		    $(".question-editor-form").css("display", 'none');
	    });
	    
	    // 질문 등록 ajax
	    $(".btn-submit").on('click', function() {
	    	
	    	var lessonNo = $(".list-item.unit-lesson.active").data("lesson-no");
		    var contents = $("#questionForm textarea").val();
		    
		    $.ajax({
		    	url: "/lecture/api/addQuestion.hta",
		    	type: 'GET',
		    	contentType: "application.json",
		    	data: {lessonNo:lessonNo, contents:contents},
		    	success: function(result) {
		    		
		    		var html = '';
		    		
    				html += '<li class="list-item-box" id="question-box-'+result.no+'">';
    				html += '<article class="list-item-question">';
    				html += '<figure class="left-image is-rounded">';
    				html += '<img class="is-rounded" src="' + result.user.imageFilename + '"width="49px">';
    				html += '</figure>';
    				html += '<div class="item-title">';
    				html += '<strong class="writer">' +result.user.id + '</strong>';
    				html += '<span class="create-date">' + result.createDate + '</span>';
    				html += '</div>';
    				html += '<div class="item-contents">';
    				html += '<div class="contents">';
    				html += '<p>' + result.contents + '</p>';
                    html += '</div>';
                    
                    $("#question-box").append(html);
                    $("#questionForm textarea").val('');
                    $(".question-editor-form").css("display", 'none');
                    
                    searchLessonQuestion();
		    	}
		    });
	    });
	    
	    // 질문 조회 ajax
	    function searchLessonQuestion() {
	
	    	var lessonNo = $(".list-item.unit-lesson.active").data("lesson-no");
	    	var keyword = $("input[name=search]").val();
	    	
	    	$.ajax({
	    		url: "/lecture/api/searchLessonQuestion.hta",
	    		type: 'GET',
	    		contentType: "application/json",
	    		data: {lessonNo:lessonNo, keyword:keyword},
	    		success: function(result) {
	    			$("#question-box").empty();

	    	    	var html = '';

	    	    	if (result.length) {
		    			result.forEach(function(item, i) {
		    				
		    				html += '<li class="list-item-box" id="question-box-'+item.no+'">';
		    				html += '<article class="list-item-question">';
		    				html += '<figure class="left-image is-rounded">';
		    				html += '<img class="is-rounded" src="' + item.user.imageFilename + '"width="49px">';
		    				html += '</figure>';
		    				html += '<div class="item-title">';
		    				html += '<strong class="writer">' +item.user.id + '</strong>';
		    				html += '<span class="create-date">' + item.createDate + '</span>';
		    				html += '</div>';
		    				html += '<div class="item-contents">';
		    				html += '<div class="contents">';
		    				html += '<p>' + item.contents + '</p>';
		                    html += '</div>';
		                    
		                    if (item.isAnswered == 'Y') {
			                    html += '<div class="question-comment">';
			                    html += '<div class="comments">';
			                    html += '<i class="fas fa-comment"></i>';
			                    html += '<span class="answer-count" data-question-no="' + item.no + '"> 답글</span>';
			                    html += '</div>';
		                    	html += '</div>';
		                    
			                    html += '<div class="answer_container hidden">';
			           		 	html += '<div class="review-answer-item">';
	     						html += '<div class="review-answer-box">';
	     				 		html += '<div class="answer-contents">';
	     						html += '<div class="answer_header">';
			                    html += '<i class="answer-logo"></i>';
	     						html += '<strong class="writer"></strong>';
	     						html += '<span class="answer create_date"></span>';
	     						html += '</div>';
	     						html += '<div class="review_answer_body"></div>';
	     						html += '</div>';
	    						html += '</div>';
	    					    html += '</div>';
	     					    html += '</div>';
		                    }
		                    html += '</div>';
		                    html += '</article>';
		                    html += '</li>';
		    			});
	    			} else {
	    				html += '<p class="has-not-question">등록된 질문이 없습니다.</p>';
	    				html += '<p class="has-not-question">궁금한 점을 질문해보세요!</p>';
	    			}
	    			$("#question-box").append(html);
	    		}
	    	});
	    }
	    
	    // '답글'클릭시 답글 조회 ajax실행 이벤트
	    $("#question-box").on("click",'.answer-count', function() {
	    	var questionNo = $(this).data("question-no");
	    	var html = '';
			
	    	$.ajax({
	    		url: "/lecture/api/getAnswer.hta",
	    		type: 'GET',
	    		contentType: "application/json",
	    		data: {questionNo},
	    		success: function(result) {
	    			
	    			$answer = $('#question-box-'+ questionNo).find(".answer_container");
	    			
	    			$answer.find(".answer-logo").addClass("glyphicon glyphicon-leaf");
	    			$answer.find(".writer").text(result.user.id);
					$answer.find(".create_date").text(result.createDate);
					$answer.find(".review_answer_body").text(result.contents);
	    		}
	    	});
	    });
		
	    // 답글버튼 toggle 
	     $("#question-box").on("click",'.answer-count', function() {
	    	 const no = $(this).data("question-no");
	    	$("#question-box-"+no).find(".answer_container").toggleClass("hidden");
	    			
	     });
	    
	    // 버튼 효과 제어
	    $(".is-outlined").mousedown(function() {
	    	$(this).css({background:"none", color:"white"});
		});
	    $(".is-outlined").mouseup(function() {
	    	$(this).css({background:"none", color:"white"});
		});
    
	    /*************************  동영상 플레이어 관련 *******************************/
		var index = 0;
	    const video = document.getElementById("player");
	    
	    setInterval(function() {
	    	if(!video.paused){
	    		console.group("레슨group");
	    		
	    		console.log(index++,"레슨");
	    		console.log("currentTime",video.currentTime);
	    		
	    		const lectNo = $("h5").data("lecture-no");
	    		const lessonNo = $(".unit-lesson.active").data("lesson-no");
	    		const lastTime = Math.floor(video.currentTime);
	    		const data = {lectNo, lessonNo, lastTime};
	    		
	    		$.get("/lecture/api/updateHistory.hta", data, function(result) {
					
	    			$("#viewCount").text(result.viewCount);
	    			$("#percent").text(result.percent);
	    			$("#totalAccumulate").text(result.totalAccumulate);
	    			$("#progressBar").css("width", result.percent +"% ");
	    			
	    			
    				const hasClass = $(".list-item.unit-lesson.active").children().hasClass('fa-check-circle');
	    			if(result) {
	    				!hasClass && $(".list-item.unit-lesson.active").append('<span class="unit-checked-icon"><i class="fas fa-check-circle"></i></span>');
	    			}
	    		});
	    		console.groupEnd();
	    	}
    	}, 1000);
	    
	    // 강좌 플레이어 
	    function lessonPlayer() {   	
	    	const lessonNo = $(".unit-lesson.active").data("lesson-no");
	    	
	    	$.ajax({
	    		url: "/lecture/api/lessonPlayer.hta",
	    		type: 'GET',
	    		contentType: "application/json",
	    		data: {lessonNo},
	    		success: function(result) {
	    			
	    			var history = result.history;
	    			var lesson = result.lesson;
	    			
	    			$("#lessonTitle").text(lesson.lessonTitle);
	    			$("#player").prop("src", lesson.videoPath);
	    		}
	    	});
	    	
	    }
	    
	    $(".list-item.unit-lesson").on("click", function() {
	    	lessonPlayer();
	    });
	});
	    
</script> 
</html>