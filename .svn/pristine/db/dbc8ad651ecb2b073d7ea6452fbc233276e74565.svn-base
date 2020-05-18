package kr.co.coduck.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import kr.co.coduck.utils.DateUtils;

@Alias("AdQnaDto")
public class AdQnaDto {
	
	private int no;
	private int userNo;
	private String userName;
	private String userId;
	private String userImgFile;
	private String title;
	private String content;
	private Date createDate;
	private String isAnswered;
	
	public AdQnaDto() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserImgFile() {
		return userImgFile;
	}

	public void setUserImgFile(String userImgFile) {
		this.userImgFile = userImgFile;
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getIsAnswered() {
		return isAnswered;
	}

	public void setIsAnswered(String isAnswered) {
		this.isAnswered = isAnswered;
	}

	public String getFmtCreateDate() {
		return DateUtils.dateToString(createDate);
	}

}
	
