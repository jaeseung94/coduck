package kr.co.coduck.form;

import org.springframework.web.multipart.MultipartFile;

public class AnswerForm {

	private int no;
	private int qnaNo;
	private String title;
	private String content;
	private MultipartFile fileName;
	
	public AnswerForm() {}

	
	
	public int getQnaNo() {
		return qnaNo;
	}



	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public MultipartFile getFileName() {
		return fileName;
	}

	public void setFileName(MultipartFile fileName) {
		this.fileName = fileName;
	}

	
}
