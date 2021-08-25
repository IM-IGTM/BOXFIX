package com.team1.boxfix.qanda;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.boxfix.member.Member;
import com.team1.boxfix.tracking.SiteOption;

@Service
public class QDAO {

	private int allQnt;


	@Autowired
	private SqlSession ss;

	@Autowired
	private SiteOption_q so2;

	public void writeQandA(HttpServletRequest req, QANDA q, Member m) throws IOException {

		m = (Member) req.getSession().getAttribute("loginMember");

		req.getParameter("q_title");
		String contents = req.getParameter("q_contents");
		req.getParameter("b_id");

		String q_contents = contents.replace("\r\n", "<br>");
		
		
		q.setQ_writer(m.getB_id());
		q.setQ_contents(q_contents);
		
		if (ss.getMapper(QandAMapper.class).writeQandA(q) == 1) {
			req.setAttribute("r", "등록성공");

		} else {
			req.setAttribute("r", "등록실패");

		}

	}

	public void allList(HttpServletRequest req, QANDA q) {
		req.setAttribute("qandas", ss.getMapper(QandAMapper.class).showAllQandA());
		
	}

	public void viewQandA(HttpServletRequest req, QANDA q, Member m, QANDAR qr) {
		int a = q.getQ_no();
	
		if(q.getQ_no() != 0){
			req.setAttribute("q", ss.getMapper(QandAMapper.class).showQandA(q));
			
		}else {
			req.setAttribute("qq", ss.getMapper(QandAMapper.class).showQandR(qr));
			
		}
		
			
		}
		

	public void updateQandA(HttpServletRequest req, QANDA q, Member m) {

		if (ss.getMapper(QandAMapper.class).updateQandA(q) == 1) {
			req.setAttribute("r", "글 수정 성공");
		} else {
			req.setAttribute("r", "글 수정 실패");
		}
	}

	public void deleteQandA(HttpServletRequest req, QANDA q, Member m) {

		if (ss.getMapper(QandAMapper.class).deleteQandA(q) == 1) {
			req.setAttribute("r", "글 삭제 성공");
		} else {
			req.setAttribute("r", "글 삭제 실패");
		}
	}

	public void countAllP() {

		allQnt = ss.getMapper(QandAMapper.class).getPagingQandA();
	}

	public void getPage(int page, QANDA q, HttpServletRequest req) {
		req.setAttribute("curPage", page);

		int pQnt = 0;
		pQnt = allQnt;
		// allMsgCnt -> msgCnt
		int allPageCount = (int) Math.ceil((double) pQnt / so2.getProductPerPage());
		System.out.println(allPageCount);
		req.setAttribute("allPageCount", allPageCount);
		// 14 / 10 한걸 올림시킨거 = 2
		int start = (page - 1) * so2.getProductPerPage() + 1;
		// 2페이지면 11 시작

		int end = (page == allPageCount) ? pQnt : start + so2.getProductPerPage() - 1;
		// 2 == 2 ? 2
		// 1 == 2 ? 아니고 : 1 + 9 = 10
		QandAPage qp = null;
		qp = new QandAPage(start, end);

		List<QANDA> qandas = ss.getMapper(QandAMapper.class).getQandA(qp);
		
		for (QANDA qq : qandas) {
			List<QANDAR> replies = ss.getMapper(QandAMapper.class).getAllRly(qq);
			qq.setReply(replies);
			
			
		}
		
		
		
		
		
		req.setAttribute("qandas", qandas);

	}

	public void replyQandA(HttpServletRequest req, QANDAR qr) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		qr.setQar_q_writer(m.getB_id());

		String contents = req.getParameter("qar_q_comment");

		String qar_q_comment = contents.replace("\r\n", "<br>");
		
	
		qr.setQar_q_comment(qar_q_comment);
		
		
		if (ss.getMapper(QandAMapper.class).writeQandAReply(qr) == 1) {
			req.setAttribute("r", "답변 쓰기 성공");
		} else {
			req.setAttribute("r", "답변 쓰기 실패");
		}

	}

	public void ReviewQandA(HttpServletRequest req, QANDA q, Member m) {
		req.setAttribute("q", ss.getMapper(QandAMapper.class).showQandA(q));	
		
	}

	public void deleteQandAR(HttpServletRequest req, QANDA q, Member m, QANDAR qr) {
		if (ss.getMapper(QandAMapper.class).deleteQandAR(qr) == 1) {
			req.setAttribute("r", "답글 삭제 성공");
		} else {
			req.setAttribute("r", "답글 삭제 실패");
		}
		
	}
	
}
