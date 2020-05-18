<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common/head.jsp" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="sub-bar.jsp"%>
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
                                            <span class="won">￦ <fmt:formatNumber value="${income.allTotalIncome }"></fmt:formatNumber></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="statistics-box">
                                     <div class="statistics total-lecture">
                                        <div class="box-title">
                                            <span>내가 등록한 강좌</span>
                                        </div>
                                        <div class="box-contents">
                                            <span>${income.totalCount }</span><span class="unit"> 개</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="statistics-box">
                                    <div class="statistics total-score">
                                        <div class="box-title">
                                            <span>강좌 평점</span>
                                        </div>
                                        <div class="box-contents">
                                            <span>${income.teacherScore }</span><span class="unit"> 점</span>
                                        </div>
                                    </div>
                                </div>    
                            </div>
                            
                             <div class="row mt" id="board-top-sy">
                                <div class="form-div col-md-12">
                                	<div class="form-horizontal form-income">
                                        <div class="form-panel">
                                            <div class="form-group">
                                                <label class="col-md-1 control-label">강좌 검색</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" name="search" autocomplete="off" placeholder="검색할 키워드를 입력해주세요.">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-1">기간 조회</label>
                                                <div class="col-md-5">
                                                    <div class="input-group input-large">
	                                                    <input type="date" id="startDate" class="form-control dpd1 text-center" name="from" >
	                                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
	                                                    <input type="date" id="endDate" class="form-control dpd2 text-center" name="to" >
	                                                </div>
                                                </div>
                                            </div>
                                            <div class="text-right" id="resetBtn">
                                                <button type="reset" class="btn btn-warning btn-sm btn-reset">초기화</button>
                                            </div>
                                        </div>
                                   </div>   
                                </div>
                            </div>
                            
                            <div class="statistics-container col-sm-12">
                                <div class="statistics-table">
                                    <table class="table table-bordered table-hover" id="incomeTable">
                                        <colgroup>
                                            <col width="8%">
                                            <col width="9%">
                                            <col width="*%">
                                            <col width="7%">
                                            <col width="6%">
                                            <col width="9%">
                                            <col width="6%">
                                            <col width="9%">
                                            <col width="9%">
                                        </colgroup>
                                        <div class="table-header">
                                            <div class="col-sm-6">
                                                <div>
                                                    <p>[총 <span id="totalCount"></span>건의 조회결과]</p>
                                                </div>
                                            </div>
                                        </div>
                                        <thead>
                                            <tr>
                                                <th>강좌 번호</th>
                                                <th>카테고리</th>
                                                <th>강좌명</th>
                                                <th>난이도</th>
                                                <th>판매수</th>
                                                <th>강좌가격</th>
                                                <th>수익률</th>
                                                <th>총수익</th>
                                                <th>순수익</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
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
<script>
	$(function() {
		searchIncome();
	
		// input박스 엔터시 키워드 검색 기능 실행
		$(".form-income input[name=search]").keyup(function(e) {
			if (e.keyCode == 13) searchIncome();
		});
		
		// 날짜가 바뀔 때 마다 검색 기능 실행
		 $(".input-group.input-large input").change(function() {
			 if ($("input[name=from]").val() != '' && $("input[name=to]").val() != '') 
				 searchIncome();
		 });
		
		// 리셋 버튼
		$(".btn-reset").click(function() {
			$(".form-income input[name=search]").val('');
			$("input[name=from]").val('');
			$("input[name=to]").val('');
		});
		
		function searchIncome() {
			
			var keyword = $(".form-income input[name=search]").val();
			var startDate = $("input[name=from]").val();
			var endDate = $("input[name=to]").val();
			
			$.ajax({
				url: "/teacher/statistics.hta",
				type: 'GET',
				contentType: 'application/json',
				data: {
					"keyword":keyword,
					"startDate":startDate,
					"endDate":endDate
				},
				success: function(result) {
					console.log(result);
					if (!result) 
						return;

					var totalCount = result.length;
					
					$("#incomeTable tbody").empty();
		
					if (result.length) {
						result.forEach(function(item, i) {
							var html = '<tr>';
							html += '<td>' + item.no + '</td>';
							html += '<td>' + item.cateName + '</td>';
							html += '<td>' + item.title + '</td>';
							html += '<td>' + item.grade + '</td>';
							html += '<td>' +item.studentCnt +'</td>';
							html += '<td>' + item.discountPrice.toLocaleString() + '</td>';
							html += '<td>0.8</td>';
							html += '<td>' + item.totalIncome.toLocaleString() + '</td>';
							html += '<td>' + item.profit.toLocaleString() + '</td>';
							html += '</tr>';
							
							$("#incomeTable tbody").append(html);
							$("#totalCount").text(totalCount);
						});
					} else {
						$("#incomeTable tbody").html('<td class="col-sm-12">조회된 검색결과가 없습니다.</td>');
					}
				}
			}); 
		}
	});
</script>    
<%@ include file="../common/footer.jsp" %>