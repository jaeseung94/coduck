package kr.co.coduck.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;
@Alias("OrderLectHistoryDto")
public class OrderLectHistoryDto {

	private String lectTitle;
	private int orderLectAmount;
	private int lectPrice;
	private int totalPrice;
	private Date lectCreateDate;
	
	public OrderLectHistoryDto() {
		
	}

	public String getLectTitle() {
		return lectTitle;
	}

	public void setLectTitle(String lectTitle) {
		this.lectTitle = lectTitle;
	}

	public int getLectPrice() {
		return lectPrice;
	}

	public void setLectPrice(int lectPrice) {
		this.lectPrice = lectPrice;
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
	
	public String getDescription() {
		StringBuilder sb = new StringBuilder();
		sb.append(lectTitle);
		if(orderLectAmount > 1) {
			sb.append(" 외 ");
			sb.append(orderLectAmount - 1);
			sb.append(" 종");
		}
		return sb.toString();
	}

	public int getOrderLectAmount() {
		return orderLectAmount;
	}

	public void setOrderLectAmount(int orderLectAmount) {
		this.orderLectAmount = orderLectAmount;
	}
	
}
