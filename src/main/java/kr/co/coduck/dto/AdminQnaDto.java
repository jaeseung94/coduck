package kr.co.coduck.dto;


import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias ("AdminQnaDto")
public class AdminQnaDto {

	private int no;
	private String title;
	private String content;
	private String fileName;
	private Date createDate;
	private String isAnswered;
	private int userNo;
	private String userName;
	private String userId;
	private String userImgFile;
	
	
	public String getUserImgFile() {
		return userImgFile;
	}
	public void setUserImgFile(String userImgFile) {
		this.userImgFile = userImgFile;
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
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
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
	
}
