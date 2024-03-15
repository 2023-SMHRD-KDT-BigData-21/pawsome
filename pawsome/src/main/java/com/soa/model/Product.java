package com.soa.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private BigDecimal product_id;
	private String product_name;
	private String product_price; 
	private String product_content;
	private java.sql.Timestamp product_reg_date;
	private String product_cate ;
	private String animal_cate;
	private String product_status;
	private String seller_id;
	private String buyer_id;
	private String review_yn;
	   
	public Product(String product_name, String product_price, String product_content, String product_cate, String animal_cate ) {
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_content = product_content;
		this.product_cate = product_cate;
		this.animal_cate = animal_cate;
   }
	
}
