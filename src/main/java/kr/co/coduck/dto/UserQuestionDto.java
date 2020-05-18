package kr.co.coduck.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("UserQuestionDto")
public class UserQuestionDto {

	private String questionLessonTitle;
	private String questionContents;
	private Date questionCreateDate;
	private String isAnswered;
	private int lectNo;
	
	public UserQuestionDto() {
		
	}


	public String getQuestionContents() {
		return questionContents;
	}

	public void setQuestionContents(String questionContents) {
		this.questionContents = questionContents;
	}

	public Date getQuestionCreateDate() {
		return questionCreateDate;
	}

	public void setQuestionCreateDate(Date questionCreateDate) {
		this.questionCreateDate = questionCreateDate;
	}

	public String getIsAnswered() {
		return isAnswered;
	}

	public void setIsAnswered(String isAnswered) {
		this.isAnswered = isAnswered;
	}


	public String getQuestionLessonTitle() {
		return questionLessonTitle;
	}


	public void setQuestionLessonTitle(String questionLessonTitle) {
		this.questionLessonTitle = questionLessonTitle;
	}


	public int getLectNo() {
		return lectNo;
	}


	public void setLectNo(int lectNo) {
		this.lectNo = lectNo;
	}
	
	
}
