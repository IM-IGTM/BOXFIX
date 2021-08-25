package com.team1.boxfix.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberDAO {

	@Autowired
	private SqlSession ss;
	
	public void join(Member m, HttpServletRequest req) {
		
		String b_brith1 = req.getParameter("b_birht1");
		String b_brith2 = req.getParameter("b_birht2");
		String b_brith3 = req.getParameter("b_birht3");
		
		String b_mail1 = req.getParameter("b_mail1");
		String b_mail2 = req.getParameter("b_mail2");
		
		String b_addr1 = req.getParameter("b_addr1");
		String b_addr2 = req.getParameter("b_addr2");
		String b_addr3 = req.getParameter("b_addr3");
		String b_addr4 = req.getParameter("b_addr4");
		String b_addr5 = req.getParameter("b_addr5");
		
		
		m.setB_birth(b_brith1 + "!" + b_brith2 + "!" + b_brith3);
		m.setB_mail(b_mail1 + "!" + b_mail2); 
		m.setB_addr(b_addr1 + "!" + b_addr2 + "!" + b_addr3 + "!" + b_addr4 + "!" + b_addr5);
		
		if(ss.getMapper(MemberMapper.class).join(m) == 1) {
			req.setAttribute("r", "가입 성공");
		}else {
			req.setAttribute("r", "가입 실패");
		}
		
		
	}

	public void login(Member m, HttpServletRequest req, HttpServletResponse res) {

		Member dbM = ss.getMapper(MemberMapper.class).getMemberById(m);
		
		if(dbM != null) {
			if(dbM.getB_pw().equals(m.getB_pw())) {
				req.setAttribute("r", "로그인 성공");
			
				req.getSession().setAttribute("loginMember", dbM);
				req.getSession().setMaxInactiveInterval(6000);
		
				if(req.getAttribute("autologin") != null) {
					Cookie c = new Cookie("autoLoginID", dbM.getB_id());
					res.addCookie(c);
				}
			} else {
				req.setAttribute("r", "로그인 실패 (PW 오류)");
			} 
		} else { 
			req.setAttribute("r", "로그인 실패(미가입 ID)");
		}
	}

	public boolean loginCheck(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		
		if (m != null) {
			req.setAttribute("loginPage", "member/loginSuccess.jsp");
			return true;
		}else {
			req.setAttribute("loginPage", "member/login.jsp");
			return false;
		}
	}
	
	public void logout(HttpServletRequest req, HttpServletResponse res) {
		req.getSession().setAttribute("loginMember", null);
		
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("autoLoginID")) {
					c.setValue(null);
					res.addCookie(c);
				}
			}
		}
	}

	public void divideBirht(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		String birth = m.getB_birth();
		String[] birth2 = birth.split("!");
		req.setAttribute("birth", birth2);
	}
	
	public void divideMail(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		String mail = m.getB_mail();
		String[] mail2 = mail.split("!");
		req.setAttribute("mail", mail2);
	}
	
	public void divideAddr(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		String addr = m.getB_addr();
		String[] addr2 = addr.split("!");
		req.setAttribute("addr", addr2);
	}

	public void bye(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		if (ss.getMapper(MemberMapper.class).bye(m) == 1) {
			req.setAttribute("r", "탈퇴 성공!");
		} else {
			req.setAttribute("r", "탈퇴 실패!");
		}
	}
	
	public void autologin(HttpServletRequest req) {
		Cookie[] cookies = req.getCookies();
		
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("autoLoginID")) {
					String b_id = c.getValue();
					if (b_id != null) {
						Member m = new Member();
						m.setB_id(b_id);
						Member dbM = ss.getMapper(MemberMapper.class).getMemberById(m);
							if(dbM != null) {
								req.getSession().setAttribute("loginMember", dbM);
								req.getSession().setMaxInactiveInterval(1200);
							}
					}
				}
			}
		}
	}
	
	public void update(Member m, HttpServletRequest req) {
		
		String b_brith1 = req.getParameter("b_birht1");
		String b_brith2 = req.getParameter("b_birht2");
		String b_brith3 = req.getParameter("b_birht3");
		
		String b_mail1 = req.getParameter("b_mail1");
		String b_mail2 = req.getParameter("b_mail2");
		
		String b_addr1 = req.getParameter("b_addr1");
		String b_addr2 = req.getParameter("b_addr2");
		String b_addr3 = req.getParameter("b_addr3");
		String b_addr4 = req.getParameter("b_addr4");
		String b_addr5 = req.getParameter("b_addr5");
		
		m.setB_birth(b_brith1 + "!" + b_brith2 + "!" + b_brith3);
		m.setB_mail(b_mail1 + "!" + b_mail2); 
		m.setB_addr(b_addr1 + "!" + b_addr2 + "!" + b_addr3 + "!" + b_addr4 + "!" + b_addr5);
		
		if (ss.getMapper(MemberMapper.class).update(m) == 1) {
			req.setAttribute("r", "수정 성공");
		} else {
			req.setAttribute("r", "수정 실패");
		}
	}
	
	  public boolean findID(Member m, HttpServletRequest req) {
		  
		  if (ss.getMapper(MemberMapper.class).findID(m) != null) {
			  req.setAttribute("b", ss.getMapper(MemberMapper.class).findID(m));
			  return true;
		} else {
			return false;
		}
		
	   }

	   public boolean findPW(Member m, HttpServletRequest req) {

		  if (ss.getMapper(MemberMapper.class).findPW(m) != null) {
			  ss.getMapper(MemberMapper.class).findPW(m);
			  return true;
		} else {
			return false;
		}
	   }

	   public void changePW(Member m, HttpServletRequest req) {

	      ss.getMapper(MemberMapper.class).changePW(m);
	   }

	   public void showAllMembers(Member m, HttpServletRequest req) {
	      
	   }
	
	
	
}
