<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>관리자 - 공지사항</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
</head>

</head>
<body>
<br><br><h2 style="text-align: center;">공지사항 수정하기</h2><br><br>

<div style="width: 60%; margin: auto;">
	<form method="post" action="noticeupdate.hta" enctype="multipart/form-data">
		<input type="hidden" name="no" value="${notice.no }">
		<input type="text" name="title" style="width: 40%;" placeholder="제목" value="${notice.title }">
		<br><br> 
		<textarea id="summernote" name="contents" >${notice.contents }</textarea><br>
		<div class="form-group">
			<label>첨부파일</label><input type="file" name="fileName" class="form-control">
			<p>${notice.fileName }</p>
		</div>
		<button type="button" id="notice-list" style="float: right;">목록으로</button>
		<button type="button" id="submit-btn" style="float: right;" onclick="goEdit(this.form)">수정하기</button>
		
	</form>
</div>
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder: '내용',
			minHeight: 370,
			maxHeight: null,
			focus: true, 
			lang : 'ko-KR'
		});
	});
	
	$("#notice-list").click(function() {
		location.href="notice.hta"
	})
	
	function goEdit(frm) {
	
		var title = frm.title.value;
		var contents = frm.contents.value;
		
		if (title.trim() == '') {
			alert("제목을 입력해주세요");
			return false;
		}
		
		if (contents.trim() == '') {
			alert("내용을 입력해주세요");
			return false;
		}
		
		frm.submit();
	}
</script>
</body>
</html>