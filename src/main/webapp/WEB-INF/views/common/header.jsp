<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp" %>

	<script src="/resources/js/moment.js"></script>

	<!-- sy.js -->
	<script src="/resources/js/common.js"></script>
	<!-- sy.css -->
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link href="<c:url value="/resources/css/sy-style.css" />" rel="stylesheet">  
	
	
  <div id="root">
    <nav class="navbar sy-navbar">
        <div class="nav sy-nav-container">
          <div class="navbar-header">
              <a class="navbar-logo" href="/home.hta"><img src="/resources/images/logo/coduck.ico"/></a>
              <a class="sy-logo" href="/home.hta">CODUCK</a>
          </div>
      
          <div class="collapse navbar-collapse" id="myNavbar" style="width: 1500px;">
            <ul class="nav navbar-nav">
              <li class="main-menu">
                <a class="t-gray" href="/lecture/main.hta"> IT강좌</a>
              </li>
              <li class="main-menu">
                <a class="t-gray" href="/test/test-list.hta"> 모의시험</span></a>
              </li>
              <li class="main-menu">
                <a class="t-gray" href="/view/viewnotice.hta"> 공지사항</span></a>
              </li>
            </ul>
            <form class="navbar-form navbar-left" style="margin-left: 100px;" action="/action_page.php">
              <div class="input-group">
                <input type="text" class="form-control search-box" placeholder="Search" name="search">
                <div class="input-group-btn">
                  <button class="btn btn-default sy-btn-search" type="submit">
                    <i class="glyphicon glyphicon-search"></i>
                  </button>
                </div>
              </div>
            </form>    
			<c:if test="${not empty LU }">
	            	<ul class="nav navbar-nav navbar-user">
	            		<li id="student"><a href="/lecture/main.hta">수강생</a></li>
	            		<li id="teacher"><a href="/teacher/main.hta">강사</a></li>
	            	</ul>
            </c:if>  
            <c:choose>
				<c:when test="${empty LU }">
		            <ul class="nav navbar-nav navbar">
			            <li><a href="/user/login.hta" class="t-gray"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			            <li><a href="/user/register.hta" class="t-gray"><i class="fas fa-user-plus"></i> Sign Up</a></li>
			        </ul>
		        </c:when>
		        <c:otherwise>
				    <ul class="nav navbar-nav navbar-my">
					    <li><a href="/cart/myTestCartList.hta"><span class="glyphicon glyphicon-shopping-cart t-gray"></span></a></li>
					    <li><a href="/like/likelectlist.hta"><span class="glyphicon glyphicon-heart-empty t-gray"></span></a></li>
					    <li><a href="/user/userlecting.hta"><span class="far fa-user-circle t-gray"></span></a></li>
					    <li><a id="bell" data-toggle="popover" title="알림" data-placement="bottom"  href="#" style="padding-right: 0px;" class="glyphicon glyphicon-bell t-gray"></a></li>
					    <li><div id="alarm-cnt" style=" border-radius: 7px; width: 14px; height: 14px; background-color: red; font-size: xx-small; color: white; margin-top: 10px;"></div></li>
				    </ul>
				    <ul class="nav navbar-nav navbar-right">
					    <li><a href="/user/logout.hta" class="t-gray"><i class="glyphicon glyphicon-log-out"></i> Logout</a></li>
				    </ul>
		        </c:otherwise>
	         </c:choose>
          </div>
        </div>
      </nav>
      <div class="smart-bar">
        <button class="btn btn-smart-bar-close pull-right">X</button>
          <div class="container smart-bar-comment">
            <span><i class="glyphicon glyphicon-leaf smart-bar-logo"></i> </span></span>
            <span><strong>&nbsp&nbsp CODUUK</strong>에 오신걸 환영합니다. 여러분의 지식을 공유해주세요!</span>
          </div>
      </div>
      
      <script type="text/javascript">
	      	  
      	var now = moment(new Date());
      	console.log(now);
      
  			 $('[data-toggle="popover"]').popover();
	      
	    	  if($('.popover').hasClass('in')){
	    	      //$(this).popover('hide');
	    		  $(".popover, .fade, .bottom, .in").css("display", "none");
	    	  }
	    	  
	      $('#bell').click(function(e){
	    	  //e.preventDefault();
	    	  
	    	  var content ="";
	    	  $.ajax({
	    		  url:"/admin/getAlarm.hta",
	    		  method:"get"
	    	  }).done(function(data){
	    		   $.each(data, function(index, item){
	    			  var time = beforeTime(item.createDate);
	    			  var str = item.title.substring(0,5);
	    			  content += '<p><a href="/userquestion/userQnaToAdmDetail.hta?qnaNo=' + item.qnaNo +'">"' 
	    					  + str + '"...에 대한 답변이 도착했습니다.</a><span style="font-size:11px; margin-left:170px;">' + time + '</span></p>';
	    		  }) 
	  	    	$(".popover, .fade, .bottom, .in").css("left", "-80px").css("width", "300px");
	    		  $(".popover-content").empty();
	    		  $(".popover-content").append(content);
	    	  })
	    	  
    	  });  
	      
	      	//페이지 이동시마다 알림 표시
	      	$.ajax({
	      		url:"/admin/notConfirmCnt.hta",
	      		method:"get"
	      	}).done(function(data){
	      		$("#alarm-cnt").text(data);
	      	})
	      	
	      	//~전 형식으로 시간 구하기
	      	function beforeTime(t){
	      		//t1과거 t2 현재
	      		var t1 = moment(t);
	      		var t2 = moment();
	      		var month = t2.diff(t1, 'months');
	      		var m = t2.diff(t1, 'minutes');;
	      		var h = t2.diff(t1, 'hours');;
	      		var d = t2.diff(t1, 'days');;
	      		console.log(month);
	      		console.log(m);
	      		console.log(h);
	      		console.log(d);
	      		if(d < 30){
		      		if(d < 1){
		      			if(h < 24){
		      				if(m < 60){
		      					if(m < 1){
		      						return "1 분 전";
		      					}
		      					return m + "분 전";
		      				}
		      				return h + "시간 전";
		      			}
		      		}
		      		return d + "일 전";
	      		}
	      		return month + "달 전";ㅋㅌㅋ
	      	}
	      	
      </script>