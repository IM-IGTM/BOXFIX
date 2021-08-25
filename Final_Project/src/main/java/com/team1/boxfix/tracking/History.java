package com.team1.boxfix.tracking;

import java.math.BigDecimal;
import java.util.Date;

public class History {
	private BigDecimal h_no;
	private String h_shopName;
	private String h_productName;
	private BigDecimal h_productSell_Price;
	private String h_productWeight;
	private BigDecimal h_productSize;
	private BigDecimal h_productAmount;
	private BigDecimal h_productSum;
	private String h_deliveryCode;
	private String h_deliveryNumber;
	private Date h_date;
	private String h_file;
	
	public History() {
		// TODO Auto-generated constructor stub
	}

	public History(BigDecimal h_no, String h_shopName, String h_productName, BigDecimal h_productSell_Price,
			String h_productWeight, BigDecimal h_productSize, BigDecimal h_productAmount, BigDecimal h_productSum,
			String h_deliveryCode, String h_deliveryNumber, Date h_date, String h_file) {
		super();
		this.h_no = h_no;
		this.h_shopName = h_shopName;
		this.h_productName = h_productName;
		this.h_productSell_Price = h_productSell_Price;
		this.h_productWeight = h_productWeight;
		this.h_productSize = h_productSize;
		this.h_productAmount = h_productAmount;
		this.h_productSum = h_productSum;
		this.h_deliveryCode = h_deliveryCode;
		this.h_deliveryNumber = h_deliveryNumber;
		this.h_date = h_date;
		this.h_file = h_file;
	}

	public BigDecimal getH_no() {
		return h_no;
	}

	public void setH_no(BigDecimal h_no) {
		this.h_no = h_no;
	}

	public String getH_shopName() {
		return h_shopName;
	}

	public void setH_shopName(String h_shopName) {
		this.h_shopName = h_shopName;
	}

	public String getH_productName() {
		return h_productName;
	}

	public void setH_productName(String h_productName) {
		this.h_productName = h_productName;
	}

	public BigDecimal getH_productSell_Price() {
		return h_productSell_Price;
	}

	public void setH_productSell_Price(BigDecimal h_productSell_Price) {
		this.h_productSell_Price = h_productSell_Price;
	}

	public String getH_productWeight() {
		return h_productWeight;
	}

	public void setH_productWeight(String h_productWeight) {
		this.h_productWeight = h_productWeight;
	}

	public BigDecimal getH_productSize() {
		return h_productSize;
	}

	public void setH_productSize(BigDecimal h_productSize) {
		this.h_productSize = h_productSize;
	}

	public BigDecimal getH_productAmount() {
		return h_productAmount;
	}

	public void setH_productAmount(BigDecimal h_productAmount) {
		this.h_productAmount = h_productAmount;
	}

	public BigDecimal getH_productSum() {
		return h_productSum;
	}

	public void setH_productSum(BigDecimal h_productSum) {
		this.h_productSum = h_productSum;
	}

	public String getH_deliveryCode() {
		return h_deliveryCode;
	}

	public void setH_deliveryCode(String h_deliveryCode) {
		this.h_deliveryCode = h_deliveryCode;
	}

	public String getH_deliveryNumber() {
		return h_deliveryNumber;
	}

	public void setH_deliveryNumber(String h_deliveryNumber) {
		this.h_deliveryNumber = h_deliveryNumber;
	}

	public Date getH_date() {
		return h_date;
	}

	public void setH_date(Date h_date) {
		this.h_date = h_date;
	}

	public String getH_file() {
		return h_file;
	}

	public void setH_file(String h_file) {
		this.h_file = h_file;
	}
	
	
	
	
}
