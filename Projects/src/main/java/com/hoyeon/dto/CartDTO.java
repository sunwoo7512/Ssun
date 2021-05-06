package com.hoyeon.dto;

public class CartDTO {

   private int cart_no; // auto_incremented key
   private int cart_total; // 상품 개수
   private int product_no; // Product Table 값 가져오는 key
   private int member_no; // 식별자
   
   // PRODUCT table value
   private String product_name;
   private int product_price;
   private String product_imageName;
   
   public int getCart_no() {
      return cart_no;
   }
   public int getCart_total() {
      return cart_total;
   }
   public int getProduct_no() {
      return product_no;
   }
   public int getMember_no() {
      return member_no;
   }
   public String getProduct_name() {
      return product_name;
   }
   public int getProduct_price() {
      return product_price;
   }
   public String getProduct_imageName() {
      return product_imageName;
   }
   public void setCart_no(int cart_no) {
      this.cart_no = cart_no;
   }
   public void setCart_total(int cart_total) {
      this.cart_total = cart_total;
   }
   public void setProduct_no(int product_no) {
      this.product_no = product_no;
   }
   public void setMember_no(int member_no) {
      this.member_no = member_no;
   }
   public void setProduct_name(String product_name) {
      this.product_name = product_name;
   }
   public void setProduct_price(int product_price) {
      this.product_price = product_price;
   }
   public void setProduct_imageName(String product_imageName) {
      this.product_imageName = product_imageName;
   }
   public CartDTO(int cart_total, int product_no, int member_no, String product_name, int product_price, String product_imageName) {
      this.cart_total = cart_total;
      this.product_no = product_no;
      this.member_no = member_no;
      this.product_name = product_name;
      this.product_price = product_price;
      this.product_imageName = product_imageName;
   }
   @Override
   public String toString() {
      return "CartDTO [cart_no=" + cart_no + ", cart_total=" + cart_total + ", product_no=" + product_no
            + ", member_no=" + member_no + ", product_name=" + product_name + ", product_price=" + product_price
            + ", product_imageName=" + product_imageName + "]";
   }
}