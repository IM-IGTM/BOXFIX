package com.team1.boxfix.tracking;

public class Shop_person {
	
	private int sp_no;
	private String sp_category;
	private String sp_name;
	
	public Shop_person() {
		// TODO Auto-generated constructor stub
	}

	public Shop_person(int sp_no, String sp_category, String sp_name) {
		super();
		this.sp_no = sp_no;
		this.sp_category = sp_category;
		this.sp_name = sp_name;
	}

	public int getSp_no() {
		return sp_no;
	}

	public void setSp_no(int sp_no) {
		this.sp_no = sp_no;
	}

	public String getSp_category() {
		return sp_category;
	}

	public void setSp_category(String sp_category) {
		this.sp_category = sp_category;
	}

	public String getSp_name() {
		return sp_name;
	}

	public void setSp_name(String sp_name) {
		this.sp_name = sp_name;
	}

	
	
}


