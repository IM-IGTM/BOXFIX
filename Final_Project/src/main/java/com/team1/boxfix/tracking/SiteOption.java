package com.team1.boxfix.tracking;

// 수정이 일어날만한거 여기다
public class SiteOption {

	// sns 한 페이지당 몇개씩 나오게 할지
	private int productPerPage;
	
	public SiteOption() {
		// TODO Auto-generated constructor stub
	}

	public SiteOption(int productPerPage) {
		super();
		this.productPerPage = productPerPage;
	}

	public int getProductPerPage() {
		return productPerPage;
	}

	public void setProductPerPage(int productPerPage) {
		this.productPerPage = productPerPage;
	}
	
	
	
}
