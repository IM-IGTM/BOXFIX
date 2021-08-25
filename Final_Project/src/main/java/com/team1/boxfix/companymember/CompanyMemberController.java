package com.team1.boxfix.companymember;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.boxfix.member.MemberDAO;
import com.team1.boxfix.tracking.BOXDAO;


@Controller
public class CompanyMemberController {

	@Autowired
	CompanyMemberDAO cDAO;
	@Autowired
	MemberDAO mDAO;
	@Autowired
	private BOXDAO boxdao;
	
	
	@RequestMapping(value = "member.company.join.go", method = RequestMethod.GET)
	public String joinGo(HttpServletRequest req) {
		
		cDAO.loginCheck(req);
		
		return "member/companyJoin";
	}
	
	@RequestMapping(value = "member.company.join", method = RequestMethod.POST)
	public String joinCompany(CompanyMember c,  HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		cDAO.join(c, req);
		res.setContentType("text/html; charest=utf-8");
		PrintWriter check_c_id = res.getWriter();
		check_c_id.println("<script>alert('회원가입을 축하합니다 다시 로그인해주시기 바랍니다. ');</script>");
		check_c_id.flush();

			return "member/login";
		}
	
	
	@RequestMapping(value = "member.company.login", method = RequestMethod.POST)
	public String loginCompany(CompanyMember c,  HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		cDAO.login(c, req, res);
		if (cDAO.loginCheck(req)) {
			boxdao.countAllP();
			boxdao.getPPage(1, req);
			req.setAttribute("contentPage", "test.jsp");
			return "home";
		} else {
			res.setContentType("text/html; charest=utf-8");
			PrintWriter check_c_id = res.getWriter();
			check_c_id.println("<script>alert('아이디 혹은 비밀번호를 확인해주세요');</script>");
			check_c_id.flush();
			return "member/login";
		}
	}

	@RequestMapping(value = "member.company.info.go", method = RequestMethod.GET)
	public String memberInfoGo(CompanyMember c, HttpServletRequest req, HttpServletResponse res) {
		
		if (cDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "member/companyInfo.jsp");
			return "home";
		} else {
			return "member/login";
		}
	}

	
	@RequestMapping(value = "member.company.bye", method = RequestMethod.GET)
	public String companyBye(CompanyMember c,  HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		if (cDAO.loginCheck(req)) {
			cDAO.bye(req);
			cDAO.logout(req, res);
			cDAO.loginCheck(req);
			res.setContentType("text/html; charest=utf-8");
			PrintWriter check_bye = res.getWriter();
			check_bye.println("<script>alert('회원탈퇴가 완료되었습니다. 이용해 주셔서 감사합니다');</script>");
			check_bye.flush();
		}
		return "member/login";
	}
	
	
	@RequestMapping(value = "member.company.update", method = RequestMethod.POST)
	public String companyUpdate(CompanyMember c,  HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		if (cDAO.loginCheck(req)) {
			cDAO.update(c, req);
			boxdao.countAllP();
			boxdao.getPPage(1, req);
			res.setContentType("text/html; charest=utf-8");
			PrintWriter check_c_id = res.getWriter();
			check_c_id.println("<script>alert('수정이 완료되었습니다');</script>");
			check_c_id.flush();
			req.setAttribute("contentPage", "tracking/tracking.jsp");
		}
		
		return "home";
	}
	
	
}
