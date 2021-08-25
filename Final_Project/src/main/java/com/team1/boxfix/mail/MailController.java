package com.team1.boxfix.mail;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team1.boxfix.member.Member;
import com.team1.boxfix.member.MemberMapper;

@Controller
public class MailController {

	@Inject
	JavaMailSender mailSender;
	MemberMapper memberMapper;
	
	private static final Logger logger=
	LoggerFactory.getLogger(MemberMapper.class);
	private static final String String = null;
	

	@RequestMapping(value = "mail.send.go", method=RequestMethod.GET)
	public ModelAndView mailSend(HttpServletRequest req, String e_mail, HttpServletResponse res) throws IOException {
		
		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311;
		
		String setfrom = "k2012109004@gmail.com";
		String tomail = req.getParameter("mail");
		String title = "회원가입 인증 이메일 입니다.";
		
		String content =
		System.getProperty("line.separator") +
		System.getProperty("line.separator") +
		"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다." +
		System.getProperty("line.separator") +
		"인증 번호는 " + dice + " 입니다." +
		System.getProperty("line.separator") +
		System.getProperty("line.separator") +
		"받으신 인증번호를 통해 홈페이지에 입력해 주시면 인증이 완료됩니다.";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
			
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/mailConfirm");
		mv.addObject("dice", dice);
		
		System.out.println("mv : "+mv);
		
		res.setContentType("text/html; charest=utf-8");
		PrintWriter out_email = res.getWriter();
		out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		out_email.flush();
		
		return mv;
	}
		
	@RequestMapping(value = "mail.confirm.do{dice}", method = RequestMethod.POST)
	public String emailConfirm(String numberConfirm, @PathVariable String dice, HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		System.out.println("마지막 : email_injeung : "+ numberConfirm);
        
        System.out.println("마지막 : dice : "+ dice);
       		
		if (numberConfirm.equals(dice)) {

			return "member/successMailCheck";
		
		} else {
			res.setContentType("text/html; charest=utf-8"); 
			PrintWriter out_equals = res.getWriter(); 
			out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를  다시 입력해주세요.');</script>"); 
			out_equals.flush();
			
			return "member/mailConfirm";
		}
	}
}	

