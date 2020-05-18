package kr.co.coduck.vo;

import org.apache.ibatis.type.Alias;

@Alias("CouponBox")
public class CouponBox {

	private int couponNo;
	private int userNo;
	
	public CouponBox() {
		
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
	
}
