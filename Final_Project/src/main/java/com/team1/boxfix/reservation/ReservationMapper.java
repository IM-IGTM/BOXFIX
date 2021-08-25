package com.team1.boxfix.reservation;


public interface ReservationMapper {

	public int resRegister(ReservationProduct rp);

	public int recInfor(ReceiverInformation ri);

	public ReceiverInformation getReceiverInformation(ReceiverInformation ri);

	public ReservationProduct getReservationProduct(ReservationProduct rp);
	
	
	// select (결과가 여러개)
	// List<Menu>

//insert, update, delete
	// int 

//select (결과가 단 하나)
	// Menu

}
