package com.team1.boxfix.reservation;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.boxfix.companymember.CompanyMemberDAO;
import com.team1.boxfix.member.MemberDAO;


@Controller
public class ReservationController {

    @InitBinder
    protected void initBinder(WebDataBinder binder){
        DateFormat  dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
    }

	@Autowired
	private RDAO rdao;
	
	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private CompanyMemberDAO cDAO;
	
	
	@RequestMapping(value = "reservation.join", method = RequestMethod.GET)
	public String reservationJoin(HttpServletRequest req) {
		
		
		if (mDAO.loginCheck(req) == true) {
			req.setAttribute("contentPage", "Reservation/reservationForm.jsp");
			return "home";
		} else if (cDAO.loginCheck(req) == true) {
			req.setAttribute("contentPage", "Reservation/reservationForm.jsp");
			return "home";
		} else {
			return "member/login";
		}
		
	
	}

	@RequestMapping(value = "reservation.form", method = RequestMethod.GET)
	public String reservationForm(HttpServletRequest req, ReservationProduct rp, ReceiverInformation ri) {
	
		if (mDAO.loginCheck(req)) {
			mDAO.divideAddr(req);
			rdao.reservationRegister(req, rp);
			rdao.receiverInformation(req, ri);
			req.setAttribute("contentPage", "Reservation/reservationResult.jsp");
			return "home"; 
		} else if (cDAO.loginCheck(req)) {
			rdao.reservationRegister(req, rp);
			rdao.receiverInformation(req, ri);
			req.setAttribute("contentPage", "Reservation/reservationResult.jsp");
			return "home"; 
		} else {
			return "member/login";
		}
		
	}
	
}
