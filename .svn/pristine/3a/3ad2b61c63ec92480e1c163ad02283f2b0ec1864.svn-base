package kr.co.coduck.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

@Alias("Question")
public class Question {

	private int no;
	private User user;
	private Lesson lesson;
	private String contents;
	private String isAnswered;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date createDate;

	public Question() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Lesson getLesson() {
		return lesson;
	}

	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getIsAnswered() {
		return isAnswered;
	}

	public void setIsAnswered(String isAnswered) {
		this.isAnswered = isAnswered;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "Question [no=" + no + ", user=" + user + ", lesson=" + lesson + ", contents=" + contents
				+ ", isAnswered=" + isAnswered + ", createDate=" + createDate + "]";
	}
	
	
}
