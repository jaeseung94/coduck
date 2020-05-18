package kr.co.coduck.vo;

import java.util.Date;

public class OrdTest {

	private int no;
	private int userNo;
	private Date testCreateDate;
	private String status;
	private int totalPrice;
	
	public OrdTest() {
		
	}

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

	public Date getTestCreateDate() {
		return testCreateDate;
	}

	public void setTestCreateDate(Date testCreateDate) {
		this.testCreateDate = testCreateDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
}
