package com.team1.boxfix.tracking;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.boxfix.companymember.CompanyMemberDAO;
import com.team1.boxfix.member.Member;
import com.team1.boxfix.member.MemberDAO;

@Controller
public class TrackingController {
	@Autowired
	private BOXDAO boxdao;
	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private CompanyMemberDAO cDAO;

	@RequestMapping(value = "/home.go", method = RequestMethod.GET)
	public String gohome(Shop_office so, History h, HttpServletRequest req) {


	      if (mDAO.loginCheck(req)) {
	         HttpSession session = req.getSession();
	         Member mm =  (Member) session.getAttribute("loginMember"); 
	      
	         if (mm.getB_id().equals("admin")) {
	            boxdao.searchClear(req);
	            boxdao.countAllP();
	            boxdao.getPPage(1, req);
	            req.setAttribute("contentPage", "test.jsp");
	            return "home";
	         }else {
	               boxdao.searchClear(req);
	               boxdao.countAllP();
	               boxdao.getPPage(1, req);
	               req.setAttribute("contentPage", "tracking/tracking.jsp");
	               return "home";
	         }      
	      } else if (cDAO.loginCheck(req)) {
	         boxdao.searchClear(req);
	         boxdao.countAllP();
	         boxdao.getPPage(1, req);
	         req.setAttribute("contentPage", "test.jsp");
	         return "home";
	         
	      } else {
	         return "member/login";
	      }

	   }

	@RequestMapping(value = "/shopReg.go", method = RequestMethod.GET)
	public String regGO(Shop_person s, Shop_office so, History h, HttpServletRequest req) {

		if (mDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "tracking/reg.jsp");
			return "home";
		} else if (cDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "tracking/reg.jsp");
			return "home";
		} else {
			return "member/login";
		}

	}

	@RequestMapping(value = "/shopReg.do", method = RequestMethod.GET)
	public String regDO(Shop_person s, Shop_office so, History h, HttpServletRequest req) {

		if (mDAO.loginCheck(req)) {
			boxdao.regshop(s, req);
			boxdao.approvedList(req);
			boxdao.getPPage(1, req);
			req.setAttribute("contentPage", "tracking/tracking.jsp");

			return "home";
		} else if (cDAO.loginCheck(req)) {
			boxdao.regshop(s, req);
			boxdao.approvedList(req);
			boxdao.getPPage(1, req);
			req.setAttribute("contentPage", "test.jsp");

			return "home";
		} else {
			return "member/login";
		}

	}

	@RequestMapping(value = "/shopReg.getAll.go", method = RequestMethod.GET)
	public String regGetAlllist(Shop_person s, HttpServletRequest req) {

		if (mDAO.loginCheck(req)) {
			boxdao.regchecklist(s, req);
			req.setAttribute("contentPage", "tracking/regcheck.jsp");
			return "home";

		} else if (cDAO.loginCheck(req)) {
			boxdao.regchecklist(s, req);
			req.setAttribute("contentPage", "tracking/regcheck.jsp");
			return "home";
		} else {
			return "member/login";
		}

	}

	@RequestMapping(value = "/shopReg.getAll.check", method = RequestMethod.GET)
	public String shopcheck(Shop_person s, HttpServletRequest req) {

		if (mDAO.loginCheck(req)) {
			boxdao.regshopGetAll(s, req);
			boxdao.regdel(s, req);
			boxdao.regchecklist(s, req);
			req.setAttribute("contentPage", "tracking/regcheck2.jsp");
			return "home";

		} else if (cDAO.loginCheck(req)) {
			boxdao.regshopGetAll(s, req);
			boxdao.regdel(s, req);
			boxdao.regchecklist(s, req);
			req.setAttribute("contentPage", "tracking/regcheck2.jsp");
			return "home";
		} else {
			return "member/login";
		}

	}

	@RequestMapping(value = "/search.product", method = RequestMethod.GET)
	public String searchProduct(ProductSelector p, HttpServletRequest req) {

		if (mDAO.loginCheck(req)) {
			boxdao.searchMsg(req);
			boxdao.getPPage(1, req);
			req.setAttribute("contentPage", "tracking/tracking.jsp");
			return "home";

		} else if (cDAO.loginCheck(req)) {
			boxdao.searchMsg(req);
			boxdao.getPPage(1, req);
			req.setAttribute("contentPage", "tracking/tracking.jsp");
			return "home";
		} else {
			return "member/login";
		}

	}

	@RequestMapping(value = "/product.page.change", method = RequestMethod.GET)
	public String paging(History h, HttpServletRequest req) {

		if (mDAO.loginCheck(req)) {
			int p = Integer.parseInt(req.getParameter("p"));
			boxdao.getPPage(p, req);

			req.setAttribute("contentPage", "tracking/tracking.jsp");
			return "home";

		} else if (cDAO.loginCheck(req)) {
			int p = Integer.parseInt(req.getParameter("p"));
			boxdao.getPPage(p, req);

			req.setAttribute("contentPage", "tracking/tracking.jsp");
			return "home";

		} else {
			return "member/login";
		}

	}

	///////////////////// 다이어리 부분

	@RequestMapping(value = "/diary.go", method = RequestMethod.GET)
	public String goDiary(Shop_office so, History h, HttpServletRequest req) {

		if (mDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "tracking/diary.jsp");
			return "home";

		} else if (cDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "tracking/diary.jsp");
			return "home";

		} else {
			return "member/login";
		}

	}

	   @RequestMapping(value = "/diary.do", method = RequestMethod.GET)
	   public String doDiary(Shop_office so, History h, HttpServletRequest req) {

	      if (mDAO.loginCheck(req)) {
	        boxdao.siteRanking(h, req);
	         boxdao.getDiaryPage(1, h, req);
	         req.setAttribute("contentPage", "tracking/diary.jsp");

	         return "home";

	      } else if (cDAO.loginCheck(req)) {
	         boxdao.siteRanking(h, req);
	         boxdao.getDiaryPage(1, h, req);
	         req.setAttribute("contentPage", "tracking/diary.jsp");

	         return "home";
	      } else {
	         return "member/login";
	      }

	   }

	   @RequestMapping(value = "/diary.page.change", method = RequestMethod.GET)
	   public String pagingDiary(History h, HttpServletRequest req) {

	      if (mDAO.loginCheck(req)) {
	         boxdao.siteRanking(h, req);
	         int p = Integer.parseInt(req.getParameter("p"));
	         boxdao.getDiaryPage(p, h, req);

	         req.setAttribute("contentPage", "tracking/diary.jsp");
	         return "home";

	      } else if (cDAO.loginCheck(req)) {
	         int p = Integer.parseInt(req.getParameter("p"));
	        boxdao.siteRanking(h, req);
	         boxdao.getDiaryPage(p, h, req);

	         req.setAttribute("contentPage", "tracking/diary.jsp");
	         return "home";
	      } else {
	         return "member/login";
	      }

	   }

	   

}
