package kr.co.coduck.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("TestResult")
public class TestResult {
	private int no;
	private Double avg;
	private String isPassed;
	private int passedTime;
	private int testNo;
	private int userNo;
	private Date createDate;
	private String isDone;
	
	public TestResult() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Double getAvg() {
		return avg;
	}

	public void setAvg(Double avg) {
		this.avg = avg;
	}

	public String getIsPassed() {
		return isPassed;
	}

	public void setIsPassed(String isPassed) {
		this.isPassed = isPassed;
	}

	public int getTestNo() {
		return testNo;
	}

	public void setTestNo(int testNo) {
		this.testNo = testNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getPassedTime() {
		return passedTime;
	}

	public void setPassedTime(int passedTime) {
		this.passedTime = passedTime;
	}

	public String getIsDone() {
		return isDone;
	}

	public void setIsDone(String isDone) {
		this.isDone = isDone;
	}

	@Override
	public String toString() {
		return "TestResult [no=" + no + ", avg=" + avg + ", isPassed=" + isPassed + ", passedTime=" + passedTime
				+ ", testNo=" + testNo + ", userNo=" + userNo + ", createDate=" + createDate + ", isDone=" + isDone
				+ "]";
	}
	
}
