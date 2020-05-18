package kr.co.coduck.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("OrderLectListDto")
public class OrderLectListDto {

	private int orderNo;
	private int totalPrice;
	private Date lectCreateDate;
	private String lectTitle;
	private int cnt;
	private String status;
	
	public OrderLectListDto() {
		
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	

	public Date getLectCreateDate() {
		return lectCreateDate;
	}

	public void setLectCreateDate(Date lectCreateDate) {
		this.lectCreateDate = lectCreateDate;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getLectTitle() {
		int count = cnt - 1;
		if(count == 0) {
			return lectTitle;
		} else {
			return lectTitle + "  외" + (cnt-1) + "  개";
		}
	}

	public void setLectTitle(String lectTitle) {
		this.lectTitle = lectTitle;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
