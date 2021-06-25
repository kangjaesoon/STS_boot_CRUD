package com.example.Study.member;

import lombok.Data;

@Data
public class MemberVO {
	
	private String id;
	private String pw;
	private String name;
	private String email;
	private int phone;
	private String admin;

}
