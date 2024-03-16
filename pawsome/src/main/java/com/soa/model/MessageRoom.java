package com.soa.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class MessageRoom {

	String room_no;
	String product_id;
	String buyer;
	String seller;
	String create_date;
	
	public MessageRoom(String buyer, String seller) {
		this.buyer = buyer;
		this.seller = seller;
	}
	
	public MessageRoom() {
		
	}
	
}
