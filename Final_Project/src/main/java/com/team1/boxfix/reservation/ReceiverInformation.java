package com.team1.boxfix.reservation;

public class ReceiverInformation {

	private int receiver_no;
	private String receiver_name;
	private int receiver_phone;
	private String receiver_addr;
	
	public ReceiverInformation() {
		// TODO Auto-generated constructor stub
	}

	public ReceiverInformation(int receiver_no, String receiver_name, int receiver_phone, String receiver_addr) {
		super();
		this.receiver_no = receiver_no;
		this.receiver_name = receiver_name;
		this.receiver_phone = receiver_phone;
		this.receiver_addr = receiver_addr;
	}

	public int getReceiver_no() {
		return receiver_no;
	}

	public void setReceiver_no(int receiver_no) {
		this.receiver_no = receiver_no;
	}

	public String getReceiver_name() {
		return receiver_name;
	}

	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}

	public int getReceiver_phone() {
		return receiver_phone;
	}

	public void setReceiver_phone(int receiver_phone) {
		this.receiver_phone = receiver_phone;
	}

	public String getReceiver_addr() {
		return receiver_addr;
	}

	public void setReceiver_addr(String receiver_addr) {
		this.receiver_addr = receiver_addr;
	}
	
	
	
	
}
