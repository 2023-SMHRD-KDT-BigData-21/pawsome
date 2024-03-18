package com.soa.model;

import lombok.AllArgsConstructor;
import lombok.Data;
@AllArgsConstructor
@Data
public class MessageLog {
	public MessageLog(String room_no, String sender) {
		this.room_no = room_no;
		this.sender = sender;
	}
	
	public MessageLog(String room_no, String sender, String m_content) {
		this.room_no = room_no;
		this.sender = sender;
		this.m_content = m_content;
	}
	
	public MessageLog(String room_no) {
		this.room_no = room_no;
	}
	
	String room_no;
	String seq;
	String sender;
	String m_content;
	java.sql.Timestamp send_date;
}
