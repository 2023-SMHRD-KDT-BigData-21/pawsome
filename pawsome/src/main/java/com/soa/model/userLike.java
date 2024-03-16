package com.soa.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class userLike {
	private String user_id;
	private String product_id;
	private java.sql.Timestamp like_date;
}
