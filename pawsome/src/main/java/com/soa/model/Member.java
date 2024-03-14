package com.soa.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class Member {
	private String user_id;
	private String user_name;
	private String user_pw;
	private String user_phone;
	private String user_email;
	private String user_img;
	private String user_nick;
	private BigDecimal grade;
	private java.sql.Timestamp user_reg_date;
	private String del_yn;

	public Member(String user_id, String user_name, String user_pw, String user_phone, String user_email, String user_img,
			String user_nick) {
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_pw = user_pw;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_img = user_img;
		this.user_nick = user_nick;
	}

	public Member(String user_id, String user_pw) {
		this.user_id = user_id;
		this.user_pw = user_pw;
	}

	public Member(String user_id2, String user_name2, String user_pw2, String user_phone2, String user_email2,
			String user_nick2) {
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_pw = user_pw;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_nick = user_nick;
	}
}
