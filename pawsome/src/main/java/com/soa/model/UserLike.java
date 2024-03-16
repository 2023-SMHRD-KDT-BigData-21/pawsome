package com.soa.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserLike {
	
	public UserLike(String product_id, String user_id) {
		this.user_id = user_id;
		this.product_id = product_id;
	}
	
	private String user_id;
	private String product_id;
	private java.sql.Timestamp like_date;
}
