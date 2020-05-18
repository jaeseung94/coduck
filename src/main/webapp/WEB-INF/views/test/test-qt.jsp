<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
	#form tbody img{
		height: 20px;
	}
	
	p {
		font-size: 18px;
	}
	.xxx {
		border: 1px solid black;
	}
	
	.mark-green {
		color: #008000; font-weight: bold; 
	}
	
	.mark-number {
		height: 25px;
	}
	
	 a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: black; text-decoration: none;}
	 
	 select {
		width: 200px;
		padding: 8px 8px;
		border: 1px solid #999;
		font-family: inherit;
		background: url('/resources/images/test/arrow.jpg') no-repeat 95% 50%;
		border-radius: 0px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
	}
	
	select::-ms-expand {
		display: none;
	}


</style>

<%@ include file="../common/tag.jsp" %>
<body>

<div class="container xxx">
	<div class="row xxx" style="margin: 10px 0px 10px 0px">
		<div class="col-sm-8">
			<h2 style="margin-top: 12px; padding: 10px;">
				${test.name } 필기 <span style="font-size: 25px;">(${test.ep } 기출문제)</span>
			</h2>
		</div>
		<div class="col-sm-4">
			<p style="margin-top: 10px; font-size: 20px; padding-left: 5px;">제한 시간 : <span id="timer"></span></p>
			<p>
				<select name="subj" style="width: 300px;">
					<c:forEach var="subj" items="${subjs}" varStatus="loop">
						<option value="${subj.no }">${loop.count }과목 : ${subj.name }</option>
					</c:forEach>
				</select>
			</p>
		</div>
	</div>

	<div class="row" style="margin-left: 0">
		<div class="col-sm-10 xxx" id="div-qt">
				<c:forEach var="qt" items="${testQtDtos }" varStatus="loop"> 
					<c:if test="${loop.count % 5 == 1 }">
						<div class="row" data-subj-no="${qt.subjNo }" id="qt-no-${loop.count }">
							<div class="col-sm-6" style="border-right: 1px solid black; 
							margin-top: 15px; margin-bottom: 15px; padding-right: 5px; padding-left: 2px;">
					</c:if>
					<c:if test="${loop.count % qt.subjQtCnt == 1 }">
						<div class="col-sm-12 xxx" style="padding: 5px; margin-bottom: 10px; margin-left: 2px; margin-right: 5px;">
							<div class="col-sm-12 xxx text-center" style="background-color: #cccccc;">
								<h4 style="font-weight: bold; margin: 5px;">${qt.subjLv }과목 : ${qt.subjName }</h4>
							</div>
						</div>
					</c:if>
					<div class="col-sm-1" data-qt-no="${qt.qtNum }" style="font-size: 18px;">${qt.qtNum }.</div>
					<div class="col-sm-11" style="padding-left: 5px; padding-right: 5px;" data-qt-no="${qt.qtNum }">
						<p>${qt.contents }</p>
						<c:if test="${qt.img != null }">
							<p><img src="../../resources/images/test/qt-img/${qt.img}" style="width:100%" height="140px;"></p>
						</c:if>
						<p><a href=""><img class="img-replace" src="/resources/images/test/marking-img/1.gif" alt="1" id="qt-${qt.qtNum }-1"/> ${qt.v1 }</a></p>
						<p><a href=""><img class="img-replace"  src="/resources/images/test/marking-img/2.gif" alt="2" id="qt-${qt.qtNum }-2"/> ${qt.v2 }</a></p>
						<p><a href=""><img class="img-replace"  src="/resources/images/test/marking-img/3.gif" alt="3" id="qt-${qt.qtNum }-3"/> ${qt.v3 }</a></p>
						<p><a href=""><img class="img-replace"  src="/resources/images/test/marking-img/4.gif" alt="4" id="qt-${qt.qtNum }-4"/> ${qt.v4 }</a></p>
						<br/>
					</div>
					<c:if test="${loop.count % 5 == 3 }">
						</div><!-- 3문제 출력된 부분 닫기 -->
						<div class="col-sm-6" style="margin-top: 15px; margin-bottom: 15px; padding-right: 0px;"><!-- 2문제 출력된 부분 -->
					</c:if>
					
					<c:if test="${loop.count % 5 == 0 }">
						</div><!-- 2문제 출력된 부분 닫기 -->
						</div><!-- row 닫기 -->
					</c:if>
				</c:forEach>
		</div>
		
		<div class="col-sm-2" >
			<form action="/test/submitTest.hta" method="post" id="form">
				<div class="row" id="div-mark">
					<c:forEach var="subj" items="${subjs }">
						<div class="col-sm-12" data-subj-no="${subj.no }"><!-- 과목을 반복 -->
							<table style="width: 100%;">
								<tbody style="text-align: center;">
									<tr>
										<td colspan="5" style="border: 1px solid black; height: 50px; font-size: 20px;" class="mark-green">${subj.name }</td>
									</tr>
									<c:forEach var="no" begin="${(subj.lv -1) * subj.qtCnt + 1}" end="${subj.lv * subj.qtCnt}">
										<tr>
											<td style="border: 1px solid black; width: 32px;" class="mark-green" data-qt-no="${no}"><a href="" class="zzz" style="font-size: 18px; font-weight: normal;">${no }</a></td>
											<td style="border: 1px solid black; width: 32px;" class="mark-green mark-number">
												<a href=""><img src="/resources/images/test/marking-img/1.gif" alt="1" id="mark-${no }-1"></a>
											</td>
											<td style="border: 1px solid black; width: 32px;" class="mark-green mark-number">
												<a href=""><img	src="/resources/images/test/marking-img/2.gif" alt="2" id="mark-${no }-2"></a>
											</td>
											<td style="border: 1px solid black; width: 32px;" class="mark-green mark-number">
												<a href=""><img src="/resources/images/test/marking-img/3.gif" alt="3" id="mark-${no }-3"></a>
											</td>
											<td style="border: 1px solid black; width: 32px;" class="mark-green mark-number">
												<a href="" ><img src="/resources/images/test/marking-img/4.gif" alt="4" id="mark-${no }-4"></a>
											</td>
											<td><input type="hidden" name="ans" value="0" id="input-ans-${no }"/></td>
											<td><input type="hidden" name="qtNos" value="${no }"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:forEach>
					<br>
				</div>
				<!-- 시험 제출 영역 -->
				<input type="hidden" name="testNo" value="${test.no }">
				<input type="hidden" name="time" value="">
				
			</form>
			
			<br>
			<p style="text-align: center;">
				<button id="button-submit" type="button">제출</button>
			</p>
		</div>
		
		<div class="col-sm-10" style="margin-bottom: 20px;">
			<br>
			<div class="col-sm-6" style="text-align: right;">
				<button class="btn btn-default" id="btn-prev">이전</button>
			</div>
			<div class="col-sm-6">
				<button class="btn btn-default" id="btn-next">다음</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var passedTime = 0;
	var isStop = false;

	countdown('timer',${test.ltdTime}, 0);
	
	//타이머 기능
	function countdown(elementName, minutes, seconds) {
		var $element, endTime, hours, mins, msLeft, time;
		
		function twoDigits(n) {
			return (n <= 9 ? "0" + n : n);
		}

		function updateTimer() {
			msLeft = endTime - (+new Date);
			passedTime = Math.ceil((minutes*60*1000 - msLeft)/1000);
			
			if (isStop) {
				return;	
			}
			//1000은 1초
			if(msLeft < 11000){
				$element.css("color", "red");
			}
			if (msLeft <= 0) {
				//제출하는 코드 실행
				alert("제한 시간이 초과되었습니다!<br/> 답안지를 제출합니다.");
				$("input[name='time']").val(${test.ltdTime});
				$("#form").submit();
				return;
			} else {
				time = new Date(msLeft);
				hours = time.getUTCHours();
				mins = time.getUTCMinutes();
				$element.html( (hours ? hours + ':' + twoDigits(mins) : mins) + ':' + twoDigits(time.getUTCSeconds() ));
				setTimeout(updateTimer, time.getUTCMilliseconds());
			}
		}

		$element = $("#" + elementName);
		endTime = (+new Date) + 1000 * (60 * minutes + seconds);
		updateTimer();
	}
	
	//새로고침 막기
	document.onkeydown = doNotReload;
	
	function doNotReload(){
	    if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
	    	showAlert();
	    	event.keyCode = 0;
	        event.cancelBubble = true;
	        event.returnValue = false;
	    } 
	}
	
	function showAlert(){
    	alert("새로고침이 불가능한 페이지입니다.");
	}
	
	//제출하기
	$("#button-submit").click(function(){
		isStop = true;
		$("input[name='time']").val(passedTime);
		console.log("시험시간", passedTime);
		$("#form").submit();
		opener.location.reload();
	})
	
	//답안지의 문항번호 클릭했을 때 문제로 이동
	$(".zzz").click(function(event) {
		event.preventDefault();
		var blockNo = (Math.ceil($(this).text()/5) - 1) * 5 + 1 ;
		$("#div-qt > div").hide();
		$("#div-qt > div").filter("#qt-no-" + blockNo).show();
	})
	
	
	$("#mark-qt-").find("a").first()
	
	//답안지의 문항 번호 클릭했을 때
	function showQt(event){
		var qtNo = event.data("qt-no");
		$("#div-qt div").hide();
		$("#qt-no-" + qtNo).show();
	}

	//답안지 마킹 기능
	$("#div-mark a").click(
			function(event) {
				event.preventDefault();
				var markedQtNo = $(this).closest("tr").find("td:eq(0)").data(
						"qt-no");
				var markedVNo = $(this).find("img").attr("alt");

				//이미 마킹되어 있으면
				if ($(this).find("img").is(
						$(this).find("img[src*='blackmark']"))) {
					//해당 답안지 마킹 없애기
					$(this).find("img").attr(
							"src",
							"/resources/images/test/marking-img/" + markedVNo
									+ ".gif");
					//해당 문제 마킹 없애기
					$("#qt-" + markedQtNo + "-" + markedVNo).attr(
							"src",
							"/resources/images/test/marking-img/" + markedVNo
									+ ".gif");
					//입력값 없애기
					$("#input-ans-" + markedQtNo).val(0);
					return;
				}
				//마킹 되어 있지 않으면
				$(this).closest("tr").find("img").each(
						function() {
							var altNo = $(this).attr("alt");
							//답안지 영역 마킹하기
							$(this).attr(
									"src",
									"/resources/images/test/marking-img/"
											+ altNo + ".gif");
							//문제 영역 마킹하기
							$("#qt-" + markedQtNo + "-" + altNo).attr(
									"src",
									"/resources/images/test/marking-img/"
											+ altNo + ".gif");
						})
				//마킹하기
				$(this).find("img").attr("src",
						"/resources/images/test/marking-img/blackmark.gif");
				$("#qt-" + markedQtNo + "-" + markedVNo).attr("src",
						"/resources/images/test/marking-img/blackmark.gif");

				//입력값 설정
				$("#input-ans-" + markedQtNo).val(markedVNo);
			})

	//문제 마킹 기능
	$("#div-qt a").click(
			function(event) {
				event.preventDefault();
				var markedQtNo = $(this).closest("div").data("qt-no");
				var markedVNo = $(this).find("img").attr("alt");

				//이미 마킹되어 있으면
				if ($(this).find("img").is(
						$(this).find("img[src*='blackmark']"))) {
					//해당 문제 마킹 없애기
					$(this).find("img").attr(
							"src",
							"/resources/images/test/marking-img/" + markedVNo
									+ ".gif");
					//해당 답안지 마킹 없애기
					$("#mark-" + markedQtNo + "-" + markedVNo).attr(
							"src",
							"/resources/images/test/marking-img/" + markedVNo
									+ ".gif");
					//입력값 없애기
					$("#input-ans-" + markedQtNo).val(0);
					return;
				}
				//마킹 되어 있지 않으면
				$(this).closest("div").find(".img-replace").each(
						function() {
							var altNo = $(this).attr("alt");
							//문제 영역 마킹 없애기
							$(this).attr(
									"src",
									"/resources/images/test/marking-img/"
											+ altNo + ".gif");
							//답안지 영역 마킹 없애기
							$("#mark-" + markedQtNo + "-" + altNo).attr(
									"src",
									"/resources/images/test/marking-img/"
											+ altNo + ".gif");
						})
				//마킹하기
				$(this).find("img").attr("src",
						"/resources/images/test/marking-img/blackmark.gif");
				$("#mark-" + markedQtNo + "-" + markedVNo).attr("src",
						"/resources/images/test/marking-img/blackmark.gif");

				//입력값 설정
				$("#input-ans-" + markedQtNo).val(markedVNo);
			})

	//문제 영역 첫번째만 보이게
	$("#div-qt > div").hide();
	$("#div-qt > div:first-child").show();

	//마킹 영역 첫번째만 보이게
	$("#div-mark > div").hide();
	$("#div-mark > div:first-child").show();

	//이전버튼 클릭 설정
	$("#btn-prev").click(function() {
		if ($("#div-qt > div:visible").index() <= 0) {
			alert("첫 페이지입니다.");
			return;
		}
		//문제 영역 변경
		$("#div-qt > div:visible").hide().prev().show();
		//과목 셀렉트 변경
		changeSubjSelect();
		//답안지 변경
		changeAnsPaper();
	});

	//다음버튼 클릭 설정
	$("#btn-next").click(function() {
		//문제 영역 변경
		var len = $("#div-qt > div").length;
		if ($("#div-qt > div:visible").index() < len - 1) {
			$("#div-qt > div:visible").hide().next().show();
		} else {
			alert("마지막 페이지입니다.");
		}
		//과목 셀렉트 변경
		changeSubjSelect();
		//답안지 변경
		changeAnsPaper();
	});

	//과목 셀렉트 값이 변경될 때
	$("[name='subj']").change(function() {
		//문제 변경
		var cnt = 0;
		$("#div-qt > div").hide();
		var subjNo = $("[name='subj']").val();
		$("#div-qt > div").each(function() {
			var data = $(this).data("subj-no");
			if (data == subjNo && cnt < 1) {
				$(this).show();
				cnt++;
			}
		})
		// 답안지 변경
		$("#div-mark > div").hide();
		$("#div-mark > div").each(function() {
			var data = $(this).data("subj-no");
			if (data == subjNo) {
				$(this).show();
			}
		})
	});

	//과목 셀렉트 변경시키기
	function changeSubjSelect() {
		var data = $("#div-qt > div:visible").data("subj-no");
		$("[name='subj'] > option").each(function() {
			var val = $(this).val();
			if (data == val) {
				$(this).prop("selected", true);
			}
		})
	};

	//답안지 변경시키기
	function changeAnsPaper() {
		var data = $("#div-qt > div:visible").data("subj-no");
		$("#div-mark > div").hide();
		$("#div-mark > div").each(function() {
			var subjNo = $(this).data("subj-no");
			if (data == subjNo) {
				$(this).show();
			}
		})
	}
	
</script>
</body>
</html>