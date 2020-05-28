package kr.co.coduck.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("OrderTestDetailDto")
public class OrderTestDetailDto {

	private int orderNo;
	private String testTitle;
	private int totalPrice;
	private Date testCreateDate;
	private String status;
	private int testprice;
	private String ep;
	private int testNo;
	private int couponNo;
	private int discountPrice;
	private String discountWay;
	
	public OrderTestDetailDto() {
		
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getTestTitle() {
		return testTitle;
	}

	public void setTestTitle(String testTitle) {
		this.testTitle = testTitle;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getTestCreateDate() {
		return testCreateDate;
	}

	public void setTestCreateDate(Date testCreateDate) {
		this.testCreateDate = testCreateDate;
	}

	public int getTestprice() {
		return testprice;
	}

	public void setTestprice(int testprice) {
		this.testprice = testprice;
	}

	public int getTestNo() {
		return testNo;
	}

	public void setTestNo(int testNo) {
		this.testNo = testNo;
	}

	public String getEp() {
		return ep;
	}

	public void setEp(String ep) {
		this.ep = ep;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	public int getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	public String getDiscountWay() {
		return discountWay;
	}

	public void setDiscountWay(String discountWay) {
		this.discountWay = discountWay;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "OrderTestDetailDto [orderNo=" + orderNo + ", testTitle=" + testTitle + ", totalPrice=" + totalPrice
				+ ", testCreateDate=" + testCreateDate + ", status=" + status + ", testprice=" + testprice + ", ep="
				+ ep + ", testNo=" + testNo + ", couponNo=" + couponNo + ", discountPrice=" + discountPrice
				+ ", discountWay=" + discountWay + "]";
	}
}
