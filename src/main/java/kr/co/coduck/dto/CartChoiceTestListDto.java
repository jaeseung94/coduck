package kr.co.coduck.dto;

import org.apache.ibatis.type.Alias;

@Alias("CartChoiceTestListDto")
public class CartChoiceTestListDto {

	private int no;
	private int userNo;
	private String name;
	private int price;
	private int couponNo;
	private String ep;
	
	public CartChoiceTestListDto() {
		
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getEp() {
		return ep;
	}

	public void setEp(String ep) {
		this.ep = ep;
	}

	@Override
	public String toString() {
		return "CartChoiceTestListDto [no=" + no + ", userNo=" + userNo + ", name=" + name + ", price=" + price
				+ ", couponNo=" + couponNo + ", ep=" + ep + "]";
	}
	
}
