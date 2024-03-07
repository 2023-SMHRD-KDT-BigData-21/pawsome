package com.soa.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class Member {
	private String userId;
	private String userName;
	private String userPw;
	private String userPhone;
	private String userEmail;
	private String userImg;
	private String userNick;
	private int grade;
	private String userRegDate;
	private String delYs;

	public Member(String userId, String userName, String userPw, String userPhone, String userEmail, String userImg,
			String userNick) {
		this.userId = userId;
		this.userName = userName;
		this.userPw = userPw;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userImg = userImg;
		this.userNick = userNick;
	}

	public Member(String userId, String userPw) {
		this.userId = userId;
		this.userPw = userPw;
	}
}
