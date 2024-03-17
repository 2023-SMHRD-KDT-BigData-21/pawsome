package com.soa.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class MessageRoom {

	private String room_no;
	private String product_id;
	private String buyer;
	private String seller;
	private java.sql.Timestamp create_date;
	
	public MessageRoom(String buyer, String seller) {
		this.buyer = buyer;
		this.seller = seller;
	}

	public MessageRoom(String buyer, String seller, String product_id) {
		this.product_id = product_id;
		this.buyer = buyer;
		this.seller = seller;
	}
	
	public MessageRoom() {
		
	}
	
}
