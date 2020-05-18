package kr.co.coduck.dto;


import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias ("AdminLectIncome")
public class AdminLectIncome {

	private int no;
	private int totalPrice;
	private Date createDate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
