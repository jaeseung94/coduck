package kr.co.coduck.form;

import org.springframework.web.multipart.MultipartFile;

public class NoticeUpdateForm {

	private int no;
	private String title;
	private String contents;
	private MultipartFile fileName;
	
	public NoticeUpdateForm() {}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public MultipartFile getFileName() {
		return fileName;
	}

	public void setFileName(MultipartFile fileName) {
		this.fileName = fileName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	
}
