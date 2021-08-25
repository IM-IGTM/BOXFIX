package com.team1.boxfix.reservation;

import java.util.Date;


public class ReservationProduct {

	private int product_no;
	private String product_name;
	private int product_price;
	private String product_volume1;
	private String product_volume2;
	private String product_uniqueness;
	private Date register_date;
	
	public ReservationProduct() {
		// TODO Auto-generated constructor stub
	}

	public ReservationProduct(int product_no, String product_name, int product_price, String product_volume1,
			String product_volume2, String product_uniqueness, Date register_date) {
		super();
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_volume1 = product_volume1;
		this.product_volume2 = product_volume2;
		this.product_uniqueness = product_uniqueness;
		this.register_date = register_date;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_volume1() {
		return product_volume1;
	}

	public void setProduct_volume1(String product_volume1) {
		this.product_volume1 = product_volume1;
	}

	public String getProduct_volume2() {
		return product_volume2;
	}

	public void setProduct_volume2(String product_volume2) {
		this.product_volume2 = product_volume2;
	}

	public String getProduct_uniqueness() {
		return product_uniqueness;
	}

	public void setProduct_uniqueness(String product_uniqueness) {
		this.product_uniqueness = product_uniqueness;
	}

	public Date getRegister_date() {
		return register_date;
	}

	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	
	
}
