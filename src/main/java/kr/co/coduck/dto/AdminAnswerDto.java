package kr.co.coduck.dto;


import java.util.Date;

import org.apache.ibatis.type.Alias;

import kr.co.coduck.utils.DateUtils;

@Alias ("AdminAnswerDto")
public class AdminAnswerDto {

	private String title;
	private String content;
	private String fileName;
	private Date createDate;
	private int qnaNo;
	private int no;
	private String userId;
	private String userName;
	private String userImgFile;
	private int userNo;
	
	
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	
	public String getFmtCreateDate() {
		return DateUtils.dateToString(createDate);
	}
	
}
