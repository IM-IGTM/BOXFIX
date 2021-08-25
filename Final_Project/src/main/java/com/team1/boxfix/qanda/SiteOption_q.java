package com.team1.boxfix.qanda;

public class SiteOption_q {

		// sns 한 페이지당 몇개씩 나오게 할지
		private int productPerPage;
		
		public SiteOption_q() {
			// TODO Auto-generated constructor stub
		}

		public SiteOption_q(int productPerPage) {
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
