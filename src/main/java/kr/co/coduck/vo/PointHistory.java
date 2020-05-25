package kr.co.coduck.vo;

import java.util.Date;

public class PointHistory {
	private Integer no;
	private Date createDate;
	private String contents;
	private Integer point;
	private Integer ordLectNo;
	private Integer ordTestNo;
	private Integer userNo;
	private String role;
	
	public PointHistory() {}

	public Integer getNo() {
		return no;
	}



	public void setNo(Integer no) {
		this.no = no;
	}



	public Date getCreateDate() {
		return createDate;
	}



	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}



	public String getContents() {
		return contents;
	}



	public void setContents(String contents) {
		this.contents = contents;
	}



	public Integer getPoint() {
		return point;
	}


	public void setPoint(Integer point) {
		this.point = point;
	}


	public Integer getOrdLectNo() {
		return ordLectNo;
	}

	public void setOrdLectNo(Integer ordLectNo) {
		this.ordLectNo = ordLectNo;
	}

	public Integer getOrdTestNo() {
		return ordTestNo;
	}

	public void setOrdTestNo(Integer ordTestNo) {
		this.ordTestNo = ordTestNo;
	}

	public Integer getUserNo() {
		return userNo;
	}



	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}



	public String getRole() {
		return role;
	}



	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "PointHistory [no=" + no + ", createDate=" + createDate + ", contents=" + contents + ", point=" + point
				+ ", ordLectNo=" + ordLectNo + ", ordTestNo=" + ordTestNo + ", userNo=" + userNo + ", role=" + role
				+ "]";
	}

}
