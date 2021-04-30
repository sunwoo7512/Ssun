package com.hoyeon.dto;

public class CartDTO {

	private int cart_no; // auto_incremented key
	private int cart_total; // 상품 개수
	private int product_no; // Product Table 값 가져오는 key
	private int member_no; // 식별자
	
	// PRODUCT table value
	private String product_name;
	private int product_price;
	private String product_info;
	private String product_imageName;
	private String product_reg;
	private String product_regDate;
	private String product_quantity;
	
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
	public String getProduct_info() {
		return product_info;
	}
	public String getProduct_imageName() {
		return product_imageName;
	}
	public String getProduct_reg() {
		return product_reg;
	}
	public String getProduct_regDate() {
		return product_regDate;
	}
	public String getProduct_quantity() {
		return product_quantity;
	}
	public CartDTO(int cart_total, int product_no, int member_no, String product_name, int product_price,
			String product_info, String product_imageName) {
		this.cart_total = cart_total;
		this.product_no = product_no;
		this.member_no = member_no;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_info = product_info;
		this.product_imageName = product_imageName;
	}
	
	
}
