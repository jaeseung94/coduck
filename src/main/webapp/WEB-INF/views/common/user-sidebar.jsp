<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.side-menu {
		margin-bottom: 10px;
		font-weight: 500;
	}
	
	.is-on {
		font-weight: 1000;
	}
	
</style>
</head>

<div class="container" style="font-size:14px; width:1440px; min-height: 1000px;">

	<div class="row" style="margin-top: 40px;">
		<div class="col-sm-2">
			<p class="side-menu">내 학습</p>
			<ul style="list-style: none;">
				<li class="side-menu"><a href="/user/userlecting.hta">수강중인 강의</a></li>
				<li class="side-menu"><a href="/user/mybytestlist.hta">모의고사</a></li>
				<li class="side-menu"><a href="/userquestion/myquestionlist.hta">강의 질문</a></li>
			</ul>
			<p class="side-menu">내 결제</p>
			<ul style="list-style: none;">
				<li class="side-menu"><a href="/like/likelectlist.hta">위시리스트</a></li>
				<li class="side-menu"><a href="/cart/myLectCartList.hta">강의 장바구니</a></li>
				<li class="side-menu"><a href="/cart/myTestCartList.hta">모의고사 장바구니</a></li>
				<li class="side-menu"><a href="/user/mycouponlist.hta">내 쿠폰함</a></li>
				<li class="side-menu"><a href="/order/myOrderTestList.hta">구매내역</a></li>
			</ul>
			<p class="side-menu">내 강의</p>
			<ul style="list-style: none;">
				<li class="side-menu" id="teacher"><a href="/teacher/main.hta">내 강의</a></li>
			</ul>
			<p class="side-menu">관리자 문의</p>
			<ul style="list-style: none;">
				<li class="side-menu" id="teacher"><a href="/userquestion/questionFormToAdm.hta">문의하기</a></li>
				<li class="side-menu"><a href="/userquestion/userqnatoadmlist.hta?pageno=1">문의 내역 조회</a></li>
			</ul>
			<p class="side-menu">회원 정보</p>
			<ul style="list-style: none;">
				<li class="side-menu"><a href="/user/profile-check.hta">내 정보 수정</a></li>
			</ul>
		</div>
		
<script type="text/javascript">
	//현재 페이지 사이드바에 표시하기
	var path = window.location.pathname;
	$("a[href*='" + path + "']").addClass("is-on");
	
</script>