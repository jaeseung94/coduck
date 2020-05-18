package kr.co.coduck.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import kr.co.coduck.dto.LectureDto;

public class Answer {

	private int no;
	private String contents;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date createDate;
	private Question question;
	private User user;
	
	public Answer() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Answer [no=" + no + ", contents=" + contents + ", createDate=" + createDate + ", question=" + question
				+ ", user=" + user + "]";
	}

}
