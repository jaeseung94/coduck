<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../common/header.jsp" %>
<%@ include file="../sub-bar.jsp"%>

				<!-- teacher statistics start -->
                <div class="container">
                    <div class="teacher-container">
                        <div class="teacher main-body">
                            <div class="statistics-container col-sm-12">
                                <div class="statistics-box">
                                    <div class="statistics total-revenue ">
                                        <div class="box-title">
                                            <span>총 수익</span>
                                        </div>
                                        <div class="box-contents">
                                            <span class="won">￦ </span><span>30,000</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="statistics-box">
                                     <div class="statistics total-lecture">
                                        <div class="box-title">
                                            <span>총 등록</span>
                                        </div>
                                        <div class="box-contents">
                                            <span>13</span><span class="unit"> 개</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="statistics-box">
                                    <div class="statistics total-score">
                                        <div class="box-title">
                                            <span>강사 평점</span>
                                        </div>
                                        <div class="box-contents">
                                            <span>4.5</span><span class="unit"> 점</span>
                                        </div>
                                    </div>
                                </div>    
                            </div>
                            <div class="statistics-container col-sm-12">
                                <div class="statistics-table">
                                    <table class="table table-bordered table-hover">
                                        <colgroup>
                                            <col width="13%">
                                            <col width="*%">
                                            <col width="15%">
                                            <col width="10%">
                                            <col width="15%">
                                            <col width="17%">
                                        </colgroup>
                                        <div class="table-header">
                                            <div class="col-sm-6">
                                                <div>
                                                    <p>[총 <span id="statisticsCount">n</span>건의 조회결과]</p>
                                                </div>
                                            </div>
                                            <div class="col-sm-6" >
                                                <div class="dropdown" id="statisticSort" style="float:right;">
                                                    <select class="btn btn-sm" name="sort">
                                                        <option value="date" selected>날짜순</option>
                                                        <option value="max">강좌번호순</option>
                                                        <option value="min">높은수익순</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <thead>
                                            <tr>
                                                <th>강좌 번호</th>
                                                <th>강좌명</th>
                                                <th>판매가</th>
                                                <th>수량</th>
                                                <th>수익</th>
                                                <th>날짜</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>10004</td>
                                                <td>스프링 기초 쌉가능</td>
                                                <td>15,000 원</td>
                                                <td>5 개</td>
                                                <td>250,000 원</td>
                                                <td>2020-02-14</td>
                                            </tr>
                                            <tr>
                                                <td>10004</td>
                                                <td>스프링 기초 쌉가능</td>
                                                <td>15,000 원</td>
                                                <td>5 개</td>
                                                <td>250,000 원</td>
                                                <td>2020-02-14</td>
                                            <tr>
                                                <td>10004</td>
                                                <td>스프링 기초 쌉가능</td>
                                                <td>15,000 원</td>
                                                <td>5 개</td>
                                                <td>250,000 원</td>
                                                <td>2020-02-14</td>
                                            </tr>
                                            <tr>
                                                <td>10004</td>
                                                <td>스프링 기초 쌉가능</td>
                                                <td>15,000 원</td>
                                                <td>5 개</td>
                                                <td>250,000 원</td>
                                                <td>2020-02-14</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>  
                            </div>
                        </div>                      
                    </div>
                </div>
            </section>
        </div>
    </main>
    <!-- teacher statistics end -->
    
<%@ include file="../../common/footer.jsp" %>