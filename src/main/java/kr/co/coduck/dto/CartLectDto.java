package kr.co.coduck.dto;

import org.apache.ibatis.type.Alias;

@Alias("CartLectDto")
public class CartLectDto {

   private int cartLectNo;
   private int lectNo;
   private int userNo;
   private String lectTitle;
   private int lectPrice;
   private int discountPrice;
   
   public CartLectDto() {
      
   }

   public int getCartLectNo() {
      return cartLectNo;
   }

   public void setCartLectNo(int cartLectNo) {
      this.cartLectNo = cartLectNo;
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

   public int getLectPrice() {
      return lectPrice;
   }

   public void setLectPrice(int lectPrice) {
      this.lectPrice = lectPrice;
   }

   public int getLectNo() {
      return lectNo;
   }

   public void setLectNo(int lectNo) {
      this.lectNo = lectNo;
   }

public int getDiscountPrice() {
	return discountPrice;
}

public void setDiscountPrice(int discountPrice) {
	this.discountPrice = discountPrice;
}
   
   
}