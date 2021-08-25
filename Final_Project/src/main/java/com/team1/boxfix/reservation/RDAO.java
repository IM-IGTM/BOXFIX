package com.team1.boxfix.reservation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class RDAO {

	@Autowired
	private SqlSession ss;

	public void reservationRegister(HttpServletRequest req, ReservationProduct rp) {
		String dd = req.getParameter("register_date");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(dd);

		// sdf.parse(dd);

		// 주소 파라미터 값 3개를 1개로 바꿔야됨

		System.out.println(dd);
		ReservationMapper rm = ss.getMapper(ReservationMapper.class);

		if (rm.resRegister(rp) == 1) {
			req.setAttribute("r", "상품 등록 성공!");
		} else {
			req.setAttribute("r", "상품 등록 실패");
		}

	}

	public void receiverInformation(HttpServletRequest req, ReceiverInformation ri) {
		ReservationMapper rm = ss.getMapper(ReservationMapper.class);

		String receiver_addr = req.getParameter("receiver_post");
		String receiver_addr2 = req.getParameter("receiver_addr");
		String receiver_addr3 = req.getParameter("receiver_detail_addr");

		ri.setReceiver_addr(receiver_addr + " " + receiver_addr2 + " " + receiver_addr3);

		if (rm.recInfor(ri) == 1) {
			req.setAttribute("s", "받는 사람 등록 성공!");
		} else {
			req.setAttribute("s", "받는 사람 등록 실패");
		}

	}

	public void divideAddr(HttpServletRequest req, ReceiverInformation ri) {
		String addr = ri.getReceiver_addr();
		String[] addr2 = addr.split("!");
		req.setAttribute("addr", addr2);
	}
	
	public void result(HttpServletRequest req, ReceiverInformation ri, ReservationProduct rp) {

		ReservationMapper mm = ss.getMapper(ReservationMapper.class);
		
		req.setAttribute("ReceiverInformation", ss.getMapper(ReservationMapper.class).getReceiverInformation(ri));
		req.setAttribute("ReservationProduct", ss.getMapper(ReservationMapper.class).getReservationProduct(rp));
		

	}



}