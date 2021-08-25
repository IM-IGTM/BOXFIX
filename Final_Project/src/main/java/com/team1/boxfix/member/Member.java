package com.team1.boxfix.member;

public class Member {

	private String b_id;
	private String b_pw;
	private String b_name;
	private String b_birth;
	private String b_gender;
	private String b_mail;
	private String b_addr;
	private String b_phone;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String b_id, String b_pw, String b_name, String b_birth, String b_gender, String b_mail,
			String b_addr, String b_phone) {
		super();
		this.b_id = b_id;
		this.b_pw = b_pw;
		this.b_name = b_name;
		this.b_birth = b_birth;
		this.b_gender = b_gender;
		this.b_mail = b_mail;
		this.b_addr = b_addr;
		this.b_phone = b_phone;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getB_pw() {
		return b_pw;
	}

	public void setB_pw(String b_pw) {
		this.b_pw = b_pw;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_birth() {
		return b_birth;
	}

	public void setB_birth(String b_birth) {
		this.b_birth = b_birth;
	}

	public String getB_gender() {
		return b_gender;
	}

	public void setB_gender(String b_gender) {
		this.b_gender = b_gender;
	}

	public String getB_mail() {
		return b_mail;
	}

	public void setB_mail(String b_mail) {
		this.b_mail = b_mail;
	}

	public String getB_addr() {
		return b_addr;
	}

	public void setB_addr(String b_addr) {
		this.b_addr = b_addr;
	}

	public String getB_phone() {
		return b_phone;
	}

	public void setB_phone(String b_phone) {
		this.b_phone = b_phone;
	}
	
	
}
