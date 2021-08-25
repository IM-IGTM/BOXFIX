package com.team1.boxfix.tracking;

import java.util.List;

public interface TrackingMapper {

	public int regshop(Shop_person s);
	
	public List<Shop_person> regchecklist(Shop_person s);
	
	public List<History> approvedList();

	public int regGetAll(Shop_person s);

	public List<History> selecthistroy();

	public List<Shop_office> shopList(Shop_office so);

	public int regdel(Shop_person s);
	
	public List<History> searchProduct(History h);

	public List<History> searchShop(History h);

	public int getAllPCount();
	
	public List<History> getProducts(ProductSelector ps);

	public List<History> getProducts2(ProductSelector ps);
	
	public int getSearchPCnt(ProductSelector ps);

	public int getSearchPCnt2(ProductSelector ps);
	
	public int sumPriceEight(History h);

	public int sumPriceSeven(History h);

	public int sumPriceSix(History h);

	public int sumPriceFive(History h);

	public List<History> productsEight(ProductSelector ps);
	public int productsEightCnt(History h);

	public List<History> productsSeven(ProductSelector ps);
	public int productsSevenCnt(History h);

	public List<History> productsFive(ProductSelector ps);
	public int productsFiveCnt(History h);


	public List<History> rankEight(History h);
	public List<History> rankSeven(History h);
	public List<History> rankFive(History h);


}
