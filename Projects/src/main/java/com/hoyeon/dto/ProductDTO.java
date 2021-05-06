package com.hoyeon.dto;

import java.sql.Date;

public class ProductDTO {
      private int product_no;
      private String product_name;
      private int product_price;
      private String product_info, product_imgName, product_reg;
      private Date product_regdate;
      public ProductDTO() {
      }
      public int getProduct_no() {
         return product_no;
      }
      public ProductDTO(int product_no, String product_name, int product_price, String product_info,
            String product_imgName, String product_reg, Date product_regdate) {
         super();
         this.product_no = product_no;
         this.product_name = product_name;
         this.product_price = product_price;
         this.product_info = product_info;
         this.product_imgName = product_imgName;
         this.product_reg = product_reg;
         this.product_regdate = product_regdate;
      }
      public void setProduct_no(int product_no) {
         this.product_no = product_no;
      }
      public String getProduct_name() {
         return product_name;
      }
      public void setProduct_name(String product_name) {
         this.product_name = product_name;
      }
      public int getProduct_price() {
         return product_price;
      }
      public void setProduct_price(int product_price) {
         this.product_price = product_price;
      }
      public String getProduct_info() {
         return product_info;
      }
      public void setProduct_info(String product_info) {
         this.product_info = product_info;
      }
      public String getProduct_imgName() {
         return product_imgName;
      }
      public void setProduct_imgName(String product_imgName) {
         this.product_imgName = product_imgName;
      }
      public String getProduct_reg() {
         return product_reg;
      }
      public void setProduct_reg(String product_reg) {
         this.product_reg = product_reg;
      }
      public Date getProduct_regdate() {
         return product_regdate;
      }
      public void setProduct_regdate(Date product_regdate) {
         this.product_regdate = product_regdate;
      }
	@Override
	public String toString() {
		return "ProductDTO [product_no=" + product_no + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_info=" + product_info + ", product_imgName=" + product_imgName
				+ ", product_reg=" + product_reg + ", product_regdate=" + product_regdate + "]";
	}
      
      
      
}