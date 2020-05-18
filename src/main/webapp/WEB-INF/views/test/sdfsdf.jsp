<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>내 정보</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
   <%@ include file="../common/header.jsp"%>
   <%@ include file="../common/tag.jsp"%>
   <div class="container" style="font-size:17px; width:1440px;">
      <div class="row">
         <div class="col-sm-2" style="border: 1px solid red;">
            <p>대시보드</p>
            <p>내 학습</p>
            <ul>
               <li><a href="/user/userlecting.hta">수강중인 강의</a></li>
               <li><a href="/question/userqueston.hta">내 질문</a></li>
               <li>내 모의고사</li>
            </ul>
            <p>내 결제</p>
            <ul>
               <li>위시리스트</li>
               <li><a href="/cart/userCartLectList.hta">장바구니</a></li>
               <li>내 쿠폰함</li>
               <li><a href="/user/userbylist.hta">구매내역</a></li>
            </ul>
            <p>설정</p>
            <ul>
               <li>프로필 설정</li>
               <li>알림 설정</li>
            </ul>
            <p>내 강의/모의고사</p>
            <ul>
               <li>내 강의</li>
               <li>내 모의고사</li>
            </ul>
         </div>

         <div class="col-sm-10">
            <p>장바구니는 최근에 추가했던 순서로 표시됩니다.</p>
            <span>내 결제 / 장바구니</span>
            <h4>강의 장바구니</h4>
            <div class="row">
               <table class="table">
                  <thead>
                     <tr>
                        <th>전체선택<input type="checkbox" id="lectbox"/></th>
                        <th>순번</th>
                        <th>제목</th>
                        <th>가격</th>
                        <th>구매하기</th>
                        <th>삭제하기</th>
                     </tr>
                  </thead>
                  <tbody>
                  <c:choose>
                     <c:when test="${empty userCartLectLists }">
                        <tr>
                           <td colspan="5" class="text-center">고객님 추가좀 하세요</td>
                        </tr>
                     </c:when>
                     <c:otherwise>
                        <c:forEach var="userCartLect" items="${userCartLectLists }" varStatus="loop">
                           <tr>
                              <td><input type="checkbox"/></td>
                              <td>${loop.count }</td>
                              <td>${userCartLect.lectTitle }</td>
                              <td id="lectprice">${userCartLect.lectPrice }</td>
                              <td><a href="" class="btn btn-primary btn-xs">구매하기</a></td>
                              <td><a href="" class="btn btn-primary btn-xs">삭제하기</a></td>
                           </tr>
                        </c:forEach>
                     </c:otherwise>
                  </c:choose>
                  </tbody>
               </table>
               <div>
                  <p>총 가격 : <span id="lectsumprice"></span>원</p>
                  <a href="" class="btn btn-primary">구매하기</a>
               </div>
            </div>
         </div>
         
         <div class="col-sm-10">
            <h4>모의고사 장바구니</h4>
            <div class="row">
               <table class="table">
                  <thead>
                     <tr>
                        <th>순번</th>
                        <th>제목</th>
                        <th>가격</th>
                        <th>구매하기</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:choose>
                     <c:when test="${empty userCartTestLists }">
                        <tr>
                           <td colspan="5" class="text-center">고객님 추가좀 하세요</td>
                        </tr>
                     </c:when>
                     <c:otherwise>
                        <c:forEach var="userCartTest" items="${userCartTestLists }" varStatus="loop">
                           <tr>
                              <td>${loop.count }</td>
                              <td>${userCartTest.testTitle }</td>
                              <td>${userCartTest.testPrice }</td>
                              <td><a href="" class="btn btn-primary btn-xs">구매하기</a></td>
                           </tr>
                        </c:forEach>
                     </c:otherwise>
                  </c:choose>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </div>
   <script type="text/javascript">
      $("#lectbox").change(function(){
         var total = 0;
         /* $("#").each(function() {
            var text = $(this).text();
            total += parseInt(text);
         })
         
         $('#lectsumprice').text(total); */
         alert($(this).closest(tr)
         
      }) 
   </script>
</body>
<%@ include file="../common/footer.jsp"%>
</html>

