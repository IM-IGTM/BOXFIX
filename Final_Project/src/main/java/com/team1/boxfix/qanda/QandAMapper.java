package com.team1.boxfix.qanda;

import java.util.List;

public interface QandAMapper {

	public int writeQandA(QANDA q);

	public List<QANDA> showAllQandA();

	public QANDA showQandA(QANDA q);
	public QANDAR showQandR(QANDAR q);

	public int updateQandA(QANDA q);

	public int deleteQandA(QANDA q);

	public int getPagingQandA();
	
	public List<QANDA> getQandA(QandAPage qp);

	public int writeQandAReply(QANDAR qr);

	public List<QANDAR> getAllRly(QANDA q);

	public int deleteQandAR(QANDAR qr);

	public int updateQandAR(QANDAR qr);
	

}
