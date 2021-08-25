package com.team1.boxfix.qanda;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.boxfix.member.Member;
import com.team1.boxfix.member.MemberDAO;

@Controller
public class QandAController {

	@Autowired
	private QDAO qdao;
	
	@Autowired
	private MemberDAO mDAO;


	@RequestMapping(value = "qanda.home", method = RequestMethod.GET)
	public String QandAgo(HttpServletRequest req, QANDA q) {

		if (mDAO.loginCheck(req)) {
			qdao.countAllP();
			qdao.getPage(1, q, req);
			
			req.setAttribute("contentPage", "qanda/qanda.jsp");
			return "home";
		}else {
			return "member/login";
		}

	}

	@RequestMapping(value = "qanda.write", method = RequestMethod.GET)
	public String writeQandA(HttpServletRequest req, QANDA q) {

		if (mDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "qanda/writeQandA.jsp");
			return "home";
		} else {
			return "member/login";
		}

	}

	@RequestMapping(value = "qanda.register", method = RequestMethod.GET)
	public String registerQandA(HttpServletRequest req, QANDA q, Member m) throws IOException {

		if (mDAO.loginCheck(req)) {
			qdao.writeQandA(req, q, m);
			req.setAttribute("contentPage", "qanda/qandaResult.jsp");
			return "home";
		
		} else {
			return "member/login";
		}
	}

	@RequestMapping(value = "qanda.view", method = RequestMethod.GET)
	public String viewQandA(HttpServletRequest req, QANDA q, Member m, QANDAR qr) throws IOException {

		if (mDAO.loginCheck(req)) {
			qdao.viewQandA(req, q, m, qr);
			req.setAttribute("contentPage", "qanda/qandaView.jsp");
			return "home";
		
		} else {
			return "member/login";
		}
	}
	
	
	
	
	
	@RequestMapping(value = "qanda.update.go", method = RequestMethod.GET)
	public String updateQandA(HttpServletRequest req, QANDA q, Member m, QANDAR qr) throws IOException {

		if (mDAO.loginCheck(req)) {
			qdao.viewQandA(req, q, m, qr);
			req.setAttribute("contentPage", "qanda/updateQandA.jsp");
			return "home";
		
		} else {
			return "member/login";
		}
	}

	
	@RequestMapping(value = "qanda.update.do", method = RequestMethod.GET)
	public String updateQandA1(HttpServletRequest req, QANDA q, Member m) throws IOException {

		if (mDAO.loginCheck(req)) {
			qdao.updateQandA(req, q, m);
			req.setAttribute("contentPage", "qanda/qandaResult.jsp");
			return "home";
		
		} else {
			return "member/login";
		}
	}
	
	
	@RequestMapping(value = "qanda.del.do", method = RequestMethod.GET)
	public String deleteQandA(HttpServletRequest req, QANDA q, Member m) throws IOException {

		if (mDAO.loginCheck(req)) {
			qdao.deleteQandA(req, q, m);
			req.setAttribute("contentPage", "qanda/qandaResult.jsp");
			return "home";
		
		} else {
			return "member/login";
		}
	}
	@RequestMapping(value = "qandaR.del.do", method = RequestMethod.GET)
	public String deleteQandARe(HttpServletRequest req, QANDA q, Member m, QANDAR qr) throws IOException {

		if (mDAO.loginCheck(req)) {
			qdao.deleteQandAR(req, q, m, qr);
			req.setAttribute("contentPage", "qanda/qandaResult.jsp");
			return "home";
		
		} else {
			return "member/login";
		}
	}
	
	@RequestMapping(value = "/qanda.page.change", method = RequestMethod.GET)
	public String pagingDiary(QANDA q, HttpServletRequest req) {

		if (mDAO.loginCheck(req)) {
			int page = Integer.parseInt(req.getParameter("p"));
			qdao.getPage(page, q, req);

			req.setAttribute("contentPage", "qanda/qanda.jsp");
			return "home";
		} else {
			return "member/login";
		}

	}
	
	@RequestMapping(value = "/qanda.reply.do", method = RequestMethod.GET)
	public String replyQandA( HttpServletRequest req) {

		if (mDAO.loginCheck(req)) {
			req.setAttribute("contentPage", "qanda/qandaReply.jsp");
			return "home";
		} else {
			return "member/login";
		}

	}
	
	@RequestMapping(value = "/qanda.reply.go", method = RequestMethod.GET)
	public String replyQandADo(QANDAR qr, HttpServletRequest req) {

		if (mDAO.loginCheck(req)) {

			qdao.replyQandA(req, qr);
			req.setAttribute("contentPage", "qanda/qandaResult.jsp");
			return "home";
		} else {
			return "member/login";
		}

	}
	
	
	// Q&A 답글 기능
	// 페이징 처리 해야됨
	// 수정, 로그인 한 사람 == 글 쓴 사람이 아니면 안된다고 할 것
}
