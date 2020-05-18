<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tag.jsp" %>

	<!-- sy.js -->
	<script src="/resources/js/common.js"></script>
	<!-- sy.css -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link href="<c:url value="/resources/css/sy-style.css" />" rel="stylesheet">    
	
	
  <div id="root">
    <nav class="navbar sy-navbar">
        <div class="nav sy-nav-container">
          <div class="navbar-header">
              <a class="navbar-logo" href="/home.hta"><img src="/resources/images/logo/coduck.ico"/></a>
              <a class="sy-logo" href="/home.hta">CODUCK</a>
          </div>
      
          <div class="collapse navbar-collapse" id="myNavbar">
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

            <form class="navbar-form navbar-left" action="/action_page.php">
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
		            <ul class="nav navbar-nav navbar-right">
			            <li><a href="/user/login.hta" class="t-gray"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			            <li><a href="/user/register.hta" class="t-gray"><i class="fas fa-user-plus"></i> Sign Up</a></li>
			        </ul>
		        </c:when>
		        <c:otherwise>
				    <ul class="nav navbar-nav navbar-my">
					    <li><a href="/cart/userCartList.hta"><span class="glyphicon glyphicon-shopping-cart t-gray"></span></a></li>
					    <li><a href="/like/likelectlist.hta"><span class="glyphicon glyphicon-heart-empty t-gray"></span></a></li>
					    <li><a href="/user/userprofil.hta"><span class="far fa-user-circle t-gray"></span></a></li>
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