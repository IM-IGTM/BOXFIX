package com.team1.boxfix.qanda;

import java.util.Date;

public class QANDAR {

	private int qar_q_no;
	private String qar_q_writer;
	private String qar_q_comment;
	private String qar_q_title;
	private Date qar_date;
	
	public QANDAR() {
		// TODO Auto-generated constructor stub
	}

	public QANDAR(int qar_q_no, String qar_q_writer, String qar_q_comment, String qar_q_title, Date qar_date) {
		super();
		this.qar_q_no = qar_q_no;
		this.qar_q_writer = qar_q_writer;
		this.qar_q_comment = qar_q_comment;
		this.qar_q_title = qar_q_title;
		this.qar_date = qar_date;
	}

	public int getQar_q_no() {
		return qar_q_no;
	}

	public void setQar_q_no(int qar_q_no) {
		this.qar_q_no = qar_q_no;
	}

	public String getQar_q_writer() {
		return qar_q_writer;
	}

	public void setQar_q_writer(String qar_q_writer) {
		this.qar_q_writer = qar_q_writer;
	}

	public String getQar_q_comment() {
		return qar_q_comment;
	}

	public void setQar_q_comment(String qar_q_comment) {
		this.qar_q_comment = qar_q_comment;
	}

	public String getQar_q_title() {
		return qar_q_title;
	}

	public void setQar_q_title(String qar_q_title) {
		this.qar_q_title = qar_q_title;
	}

	public Date getQar_date() {
		return qar_date;
	}

	public void setQar_date(Date qar_date) {
		this.qar_date = qar_date;
	}

	
	
	
	
}
