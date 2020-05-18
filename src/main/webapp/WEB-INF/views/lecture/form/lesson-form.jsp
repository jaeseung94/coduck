<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/head.jsp" %>
<%@ include file="../../common/header.jsp" %> 
<!-- sy.css -->
<link href="<c:url value="/resources/css/lesson-form.css" />" rel="stylesheet">   

<div class="container lecture-container">
	<form action="/instructor/addLesson.do" method="POST" class="form-horizontal">
		<div>
		<hr />
			<div class="form-group">
				<h1>강의 등록</h1>
				<p>정보를 빠짐없이 기입하셔야 등록이 완료됩니다</p>
			</div>
			<hr />
			<div class="form-group">
				<h3 class="small-title">SECTION</h3>
				<div class="col-xs-6">
					<p>SECTION NO</p>
					<input class="title-box" type="number" placeholder="단원 번호 입력"	name="sectionNo" id="sectionNo" required autofocus />
				</div>
				<div class="col-xs-6">
					<p>SECTION TITLE</p>
					<input class="title-box" type="text" placeholder="단원 제목 입력"
						name="sectionName" id="sectionName" />
				</div>
			</div>
			<hr />
			<div class="form-group">
				<h3 class="small-title">LESSON</h3>
				<div class="col-xs-6">
					<p>LESSON NO</p>
					<input class="title-box" type="number" placeholder="레슨 번호 입력" name="lessonNo" id="lessonNo" required />
				</div>
				<div class="col-xs-6">
					<p>LESSON TITLE</p>
					<input class="title-box" type="text" placeholder="레슨 제목 입력" name="lessonName" id="lessonName" />
				</div>
			</div>
			<hr />
			<div class="form-group">
				<h3 class="small-title">VIDEO UPLOAD</h3>
				<button class="replace">UPLOAD</button>
				<input type="file" accept=".avi,.mov,.mp4" name="prevfilePath"
					id="filePath" style="opacity: 0; padding-right: 600px;" /> <input
					type="hidden" name="filePath" id="uploadFilePath" value="" />
				<div id="holderVideoWrapper">
					<video id="holderVideo" style="width: 400px; height: 225px;"
						controls></video>
					<input type="hidden" name="lessonLength" id="lessonLength" /> 
					<input type="hidden" name="lectureNo" id="lectureNo" value="}" />
				</div>
			</div>
			<hr />
			<div class="form-group" style="margin-top: 30px;">
				<div class="col-xs-12">
					<input type="button" class="btn create-lecture-cancel" value="취소" />
					<input type="submit" class="btn create-lecture-save" value="등록" />
				</div>
			</div>
		</div>
	</form>
</div>
<script>
  $(function() {
    $(".replace").click(function(e) {
      e.preventDefault();
      filePath.click();
    });

    $("#filePath").on("change", function(event) {
      var file = event.target.files[0];
      var fileReader = new FileReader();

      fileReader.onload = function() {
        var blob = new Blob([fileReader.result], { type: file.type });
        var url = URL.createObjectURL(blob);
        var video = document.getElementById("holderVideo");
        video.src = url;
        video.preload = "metadata";

        video.onloadedmetadata = function() {
          const duration = Math.round(video.duration);
          $("#lessonLength").val(duration);
        };
      };

      fileReader.readAsArrayBuffer(file);
      $("#holderVideoWrapper")
        .not("#holderVideo")
        .css("border", "10px solid green");
      $("#holderVideo").css("display", "inline-block");
    });

    function lessonUpload() {
      var video = document.getElementById("filePath");

      var videoFile = video.files[0];
      var videoExt = $("#filePath")
        .val()
        .split(".")
        .pop()
        .toLowerCase();

      videoData = new FormData();
      videoData.append("videoFile", videoFile);

      $.ajax({
        data: videoData,
        type: "POST",
        url: "/instructor/addLessonVideo.do?ext=" + videoExt,
        cache: false,
        contentType: false,
        processData: false,
        success: function(data) {
          // 처리가 성공할 경우
          $("#uploadFilePath").val(data);
          $("form").submit();
        },
        error: function() {
          alert("error!");
        }
      });
    }

    $(".create-lecture-save").on("click", function(event) {
      event.preventDefault();
      var lectureNo = $("#lectureNo").val();
      var lessonNo = $("#lessonNo").val();
      var sectionNo = $("#sectionNo").val();

      console.log(lectureNo, lessonNo, sectionNo);

      $.ajax({
        data: {
          lectureNo: lectureNo,
          sectionNo: sectionNo,
          lessonNo: lessonNo
        },
        type: "POST",
        url: "/instructor/addLessonFlag.do",
        success: function(data) {
          // 처리가 성공할 경우
          if (data == "false") {
            alert("같은 섹션에 중복된 강좌 번호가 있습니다");
          } else {
            lessonUpload();
            alert("강좌 등록이 완료되었습니다");
          }
        },
        error: function() {
          alert("다시 시도해 주세요");
        }
      });
    });
  });
</script>


<%@ include file="../../common/footer.jsp" %>