package kr.co.coduck.dto;

import org.apache.ibatis.type.Alias;

@Alias("CartChoiceLectListDto")
public class CartChoiceLectListDto {

   private int cartChoiceLectNo;
   private int no;
   private int userNo;
   private String lectTitle;
   private int price;
   private int discountPrice;
   private int couponNo;
   
   public CartChoiceLectListDto() {
      
   }
   
   public int getUserNo() {
      return userNo;
   }

   public void setUserNo(int userNo) {
      this.userNo = userNo;
   }

   public String getLectTitle() {
      return lectTitle;
   }

   public void setLectTitle(String lectTitle) {
      this.lectTitle = lectTitle;
   }

   public int getCartChoiceLectNo() {
      return cartChoiceLectNo;
   }


   public void setCartChoiceLectNo(int cartChoiceLectNo) {
      this.cartChoiceLectNo = cartChoiceLectNo;
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

public int getPrice() {
	return price;
}

public void setPrice(int price) {
	this.price = price;
}

public int getDiscountPrice() {
	return discountPrice;
}

public void setDiscountPrice(int discountPrice) {
	this.discountPrice = discountPrice;
}
   
}