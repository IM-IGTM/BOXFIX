package com.team1.boxfix.companymember;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.boxfix.member.Member;

@Service
public class CompanyMemberDAO {

	@Autowired
	private SqlSession ss;
	
	public void join(CompanyMember c, HttpServletRequest req) {
		
		ss.getMapper(CompanyMemberMapper.class).companyJoin(c);
	}

	public void login(CompanyMember c, HttpServletRequest req, HttpServletResponse res) {
		
		CompanyMember dbC = ss.getMapper(CompanyMemberMapper.class).getCompanyMemberById(c);
	
		if(dbC != null) {
			if (dbC.getC_pw().equals(c.getC_pw())) {
				req.getSession().setAttribute("companyLoginMember", dbC);
				req.getSession().setMaxInactiveInterval(6000);
			}
		if (req.getAttribute("companyAutologin") != null) {
			Cookie cc = new Cookie("companyAutoLoginID", dbC.getC_id());
			res.addCookie(cc);
		}	
		} 
	}

	public boolean loginCheck(HttpServletRequest req) {
		CompanyMember c = (CompanyMember) req.getSession().getAttribute("companyLoginMember");
		
		if (c != null) {
			req.setAttribute("loginPage", "member/companyLoginSuccess.jsp");
			return true;
		}else {
			req.setAttribute("loginPage", "member/login.jsp");
			return false;
		}		
	}
	
	public void logout(HttpServletRequest req, HttpServletResponse res) {

		req.getSession().setAttribute("companyLoginMember", null);
		
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie cc : cookies) {
				if (cc.getName().equals("companyAutoLoginID")) {
					cc.setValue(null);
					res.addCookie(cc);
				}
			}
		}
	}

	public void autologin(HttpServletRequest req) {
		Cookie[] cookies = req.getCookies();
		
		if (cookies != null) {
			for (Cookie cc : cookies) {
				if (cc.getName().equals("autoLoginID")) {
					String c_id = cc.getValue();
					if (c_id != null) {
						CompanyMember c = new CompanyMember();
						c.setC_id(c_id);
						CompanyMember dbC = ss.getMapper(CompanyMemberMapper.class).getCompanyMemberById(c);
							if(dbC != null) {
								req.getSession().setAttribute("loginMember", dbC);
								req.getSession().setMaxInactiveInterval(1200);
							}
					}
				}
			}
		}		
	}
	
	
	
	public void bye(HttpServletRequest req) {
		CompanyMember c = (CompanyMember) req.getSession().getAttribute("companyLoginMember");
		ss.getMapper(CompanyMemberMapper.class).companyBye(c);
	}
	public void update(CompanyMember c, HttpServletRequest req) {
		ss.getMapper(CompanyMemberMapper.class).companyUpdate(c);
	}
}
