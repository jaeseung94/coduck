package kr.co.coduck.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("CouponUsedTest")
public class CouponUsedTest {
	private int no;
	private int couponNo;
	private int userNo;
	private int testNo;
	private String finalUsed;
	private String title;
	private String detail;
	private String enabled;
	private Date startDate;
	private Date endDate;
	private int amount;
	private String limited;
	private int discountPrice;
	private String discountWay;
	
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getLimited() {
		return limited;
	}
	public void setLimited(String limited) {
		this.limited = limited;
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
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getTestNo() {
		return testNo;
	}
	public void setTestNo(int testNo) {
		this.testNo = testNo;
	}

	public String getFinalUsed() {
		return finalUsed;
	}

	public void setFinalUsed(String finalUsed) {
		this.finalUsed = finalUsed;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "CouponUsedTest [no=" + no + ", couponNo=" + couponNo + ", userNo=" + userNo + ", testNo=" + testNo
				+ ", finalUsed=" + finalUsed + ", title=" + title + ", detail=" + detail + ", enabled=" + enabled
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", amount=" + amount + ", limited=" + limited
				+ ", discountPrice=" + discountPrice + ", discountWay=" + discountWay + "]";
	}
	
}
