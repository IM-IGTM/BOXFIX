package com.team1.boxfix.companymember;

public class CompanyMember {
	private String c_id;
	private String c_pw;
	private String c_name;
	private String c_mail;
	private String c_phone;
	private String c_topname;
	private String c_comnumber;
	
	public CompanyMember() {
		// TODO Auto-generated constructor stub
	}

	public CompanyMember(String c_id, String c_pw, String c_name, String c_mail, String c_phone, String c_topname,
			String c_comnumber) {
		super();
		this.c_id = c_id;
		this.c_pw = c_pw;
		this.c_name = c_name;
		this.c_mail = c_mail;
		this.c_phone = c_phone;
		this.c_topname = c_topname;
		this.c_comnumber = c_comnumber;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getC_pw() {
		return c_pw;
	}

	public void setC_pw(String c_pw) {
		this.c_pw = c_pw;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_mail() {
		return c_mail;
	}

	public void setC_mail(String c_mail) {
		this.c_mail = c_mail;
	}

	public String getC_phone() {
		return c_phone;
	}

	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}

	public String getC_topname() {
		return c_topname;
	}

	public void setC_topname(String c_topname) {
		this.c_topname = c_topname;
	}

	public String getC_comnumber() {
		return c_comnumber;
	}

	public void setC_comnumber(String c_comnumber) {
		this.c_comnumber = c_comnumber;
	}

	
	
}
