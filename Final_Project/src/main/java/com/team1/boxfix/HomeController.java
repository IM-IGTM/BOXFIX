package com.team1.boxfix;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.boxfix.companymember.CompanyMemberDAO;
import com.team1.boxfix.member.MemberDAO;
import com.team1.boxfix.tracking.BOXDAO;

@Controller
public class HomeController {

	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private CompanyMemberDAO cDAO;
	@Autowired
	private BOXDAO boxdao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		
		  if(mDAO.loginCheck(req)|| cDAO.loginCheck(req)) {
			  boxdao.countAllP();
			  boxdao.getPPage(1, req);
			  req.setAttribute("contentPage", "tracking/tracking.jsp");
			return "home";
		  } else{
		 	 return "member/login";
	      }
	}
	

	@RequestMapping(value = "reservation.go", method = RequestMethod.GET)
	public String reservation(HttpServletRequest req) {

		if(mDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "Reservation/reservation.jsp");
			return "home";
		} else if (cDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "Reservation/reservation.jsp");
			return "home";
		} else {
			return "member/login";
		}

	}
}
