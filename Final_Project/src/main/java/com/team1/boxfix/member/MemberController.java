package com.team1.boxfix.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.boxfix.companymember.CompanyMemberDAO;
import com.team1.boxfix.tracking.BOXDAO;

@Controller
public class MemberController {

	@Autowired
	MemberDAO mDAO;
	@Autowired
	CompanyMemberDAO cDAO;
	@Autowired
	private BOXDAO boxdao;


	@RequestMapping(value = "joinSelect.go", method = RequestMethod.GET)
	public String joinSelectGo(HttpServletRequest req) {

		mDAO.loginCheck(req);

		return "member/joinSelect";
	}

	@RequestMapping(value = "member.join.go", method = RequestMethod.GET)
	public String joinGo(HttpServletRequest req) {

		mDAO.loginCheck(req);

		return "member/join";
	}

	@RequestMapping(value = "member.join", method = RequestMethod.POST)
	public String memberJoin(Member m, HttpServletRequest req, HttpServletResponse res) throws IOException {

		mDAO.join(m, req);
		res.setContentType("text/html; charest=utf-8");
		PrintWriter check_b_id = res.getWriter();
		check_b_id.println("<script>alert('회원가입을 축하합니다 다시 로그인 해 주시기 바랍니다');</script>");
		check_b_id.flush();

		return "member/login";
	}

	@RequestMapping(value = "member.login", method = RequestMethod.POST)
	public String login(Member m, HttpServletRequest req, HttpServletResponse res) throws IOException {


	      String b_id = req.getParameter("b_id");
	      
	      mDAO.login(m, req, res);
	      if (mDAO.loginCheck(req) && b_id.equals("admin")) {
	         boxdao.countAllP();
	         boxdao.getPPage(1, req);
	         req.setAttribute("contentPage", "test.jsp");
	         return "home";
	      } else if (mDAO.loginCheck(req)) {
	         boxdao.countAllP();
	         boxdao.getPPage(1, req);
	         req.setAttribute("contentPage", "tracking/tracking.jsp");
	         return "home";
	      } else {
	         res.setContentType("text/html; charest=utf-8");
	         PrintWriter check_b_id = res.getWriter();
	         check_b_id.println("<script>alert('아이디 혹은 비밀번호를 확인해주세요');</script>");
	         check_b_id.flush();
	         return "member/login";
	      }
	   }

	@RequestMapping(value = "member.logout", method = RequestMethod.GET)
	public String logout(Member m, HttpServletRequest req, HttpServletResponse res) {

			mDAO.logout(req, res);
			mDAO.loginCheck(req);
			cDAO.logout(req, res);
			cDAO.loginCheck(req);
			return "member/login";
	}

	@RequestMapping(value = "member.info.go", method = RequestMethod.GET)
	public String memberInfoGo(Member m, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.loginCheck(req)) {
			mDAO.divideBirht(req);
			mDAO.divideMail(req);
			mDAO.divideAddr(req);
			req.setAttribute("contentPage", "member/info.jsp");
			return "home";
		} else {
			return "member/login";
		}
	}

	@RequestMapping(value = "member.bye ", method = RequestMethod.GET)
	public String memberBye(Member m, HttpServletRequest req, HttpServletResponse res) throws IOException {

		if (mDAO.loginCheck(req)) {
			mDAO.bye(req);
			mDAO.logout(req, res);
			mDAO.loginCheck(req);
			res.setContentType("text/html; charest=utf-8");
			PrintWriter check_bye = res.getWriter();
			check_bye.println("<script>alert('회원탈퇴가 완료되었습니다. 이용해 주셔서 감사합니다');</script>");
			check_bye.flush();
			return "member/login";
		} else if (cDAO.loginCheck(req)) {
			cDAO.bye(req);
			cDAO.logout(req, res);
			cDAO.loginCheck(req);
			res.setContentType("text/html; charest=utf-8");
			PrintWriter check_bye = res.getWriter();
			check_bye.println("<script>alert('회원탈퇴가 완료되었습니다. 이용해 주셔서 감사합니다');</script>");
			check_bye.flush();
			return "member/login";
	} else {
			return "member/info";
		}
	}	

	@RequestMapping(value = "member.update", method = RequestMethod.POST)
	public String memberUpdate(Member m, HttpServletRequest req, HttpServletResponse res) throws IOException {

		if (mDAO.loginCheck(req)) {
			mDAO.update(m, req);
			boxdao.countAllP();
			boxdao.getPPage(1, req);
			res.setContentType("text/html; charest=utf-8");
			PrintWriter check_b_id = res.getWriter();
			check_b_id.println("<script>alert('수정이 완료되었습니다');</script>");
			check_b_id.flush();
			req.setAttribute("contentPage", "tracking/tracking.jsp");
		}

		return "home";

	}
	
	   @RequestMapping(value = "member.id.find.go", method = RequestMethod.GET)
	   public String memberIdFindPage(Member m, HttpServletRequest req, HttpServletResponse res) {
	      
	      return "member/findMemberId";

	   }
	   
	   @RequestMapping(value = "member.id.find.do", method = RequestMethod.GET)
	   public String memberIdFind(Member m, HttpServletRequest req, HttpServletResponse res) throws IOException {
	     
		   if (mDAO.findID(m, req)) {
			   return "member/resultFindId";
		} else {
			res.setContentType("text/html; charest=utf-8");
			PrintWriter check_findId = res.getWriter();
			check_findId.println("<script>alert('이름 혹은 핸드폰번호를 확인하세요');</script>");
			check_findId.flush();
			req.setAttribute("contentPage", "tracking/tracking.jsp");
			return "member/findMemberId";
		}
	   }
	      
	   @RequestMapping(value = "member.pw.find.go", method = RequestMethod.GET)
	   public String memberPwFindPage(Member m, HttpServletRequest req, HttpServletResponse res) {
	      
	      return "member/findMemberPw";

	   }   
	   
	   @RequestMapping(value = "member.pw.find.do", method = RequestMethod.GET)
	   public String memberPwFind(Member m, HttpServletRequest req, HttpServletResponse res) throws IOException {
	      
		  if (mDAO.findPW(m, req)) {
	    	  return "member/changePw";
		} else {
			res.setContentType("text/html; charest=utf-8");
			PrintWriter check_findPw = res.getWriter();
			check_findPw.println("<script>alert('아이디, 이름, 핸드폰번호를 확인하세요');</script>");
			check_findPw.flush();
			return "member/findMemberPw";
		}
	   }
	   
	   @RequestMapping(value = "member.pw.change", method = RequestMethod.POST)
	   public String changePw(Member m, HttpServletRequest req, HttpServletResponse res) {
	      
		  mDAO.changePW(m, req);
	      
	      return "member/confirmChangePw";
	      
	   }
}