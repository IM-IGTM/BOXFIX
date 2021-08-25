package com.team1.boxfix.qanda;

import java.util.Date;
import java.util.List;

public class QANDA {

	private int q_no;
	private String q_title;
	private String q_contents;
	private Date q_date;
	private String q_writer;
	
	private List<QANDAR> reply; 

	
	public QANDA() {
		// TODO Auto-generated constructor stub
	}



	public QANDA(int q_no, String q_title, String q_contents, Date q_date, String q_writer, List<QANDAR> reply) {
		super();
		this.q_no = q_no;
		this.q_title = q_title;
		this.q_contents = q_contents;
		this.q_date = q_date;
		this.q_writer = q_writer;
		this.reply = reply;
	}



	public int getQ_no() {
		return q_no;
	}


	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}


	public String getQ_title() {
		return q_title;
	}


	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}


	public String getQ_contents() {
		return q_contents;
	}


	public void setQ_contents(String q_contents) {
		this.q_contents = q_contents;
	}


	public Date getQ_date() {
		return q_date;
	}


	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}


	public String getQ_writer() {
		return q_writer;
	}


	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}


	public List<QANDAR> getReply() {
		return reply;
	}


	public void setReply(List<QANDAR> reply) {
		this.reply = reply;
	}



	
	
}
