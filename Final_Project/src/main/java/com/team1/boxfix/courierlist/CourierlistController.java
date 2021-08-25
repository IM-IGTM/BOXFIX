package com.team1.boxfix.courierlist;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.boxfix.companymember.CompanyMemberDAO;
import com.team1.boxfix.member.MemberDAO;

@Controller
public class CourierlistController {

	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private CompanyMemberDAO cDAO;

	@RequestMapping(value = "courierList.get", method = RequestMethod.GET)
	public String reservation(HttpServletRequest req) {
	
		if (mDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "courierList/courierList.jsp");
			return "home";
		} else if (cDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "courierList/courierList.jsp");
			return "home";
		} else {
			return "member/login";
		}
	}

}
