package com.team1.boxfix.tracking;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BOXDAO {

   private int allPCnt;

   @Autowired
   private SqlSession ss;

   @Autowired
   private SiteOption so;

   public void regshop(Shop_person s, HttpServletRequest req) {
      TrackingMapper tm = ss.getMapper(TrackingMapper.class);
      if (tm.regshop(s) == 1) {
         req.setAttribute("r", "등록성공");
      } else {
         req.setAttribute("r", "등록실패");
      }
   }

   public void regchecklist(Shop_person s, HttpServletRequest req) {
      TrackingMapper tm = ss.getMapper(TrackingMapper.class);
      List<Shop_person> shops = tm.regchecklist(s);
      req.setAttribute("shops", shops);

   }

   public void regshopGetAll(Shop_person s, HttpServletRequest req) {
      TrackingMapper tm = ss.getMapper(TrackingMapper.class);
      if (tm.regGetAll(s) == 1) {
         req.setAttribute("r", "관리자 승인");
      } else {
         req.setAttribute("r", "관리자 승인 실패");

      }

   }

   public void approvedList(HttpServletRequest req) {
      TrackingMapper tm = ss.getMapper(TrackingMapper.class);
      List<History> historys = tm.approvedList();
      req.setAttribute("shops", historys);

   }

   public void shopList(Shop_office so, HttpServletRequest req) {
      TrackingMapper tm = ss.getMapper(TrackingMapper.class);
      List<Shop_office> shops = tm.shopList(so);
      req.setAttribute("shops", shops);

   }

   public void selecthistroy(HttpServletRequest req) {
      TrackingMapper tm = ss.getMapper(TrackingMapper.class);
      List<History> historys = tm.selecthistroy();
      req.setAttribute("historys", historys);
   }

   public void searchMsg(HttpServletRequest req) {
      String search = req.getParameter("search");
      System.out.println(search);
      req.getSession().setAttribute("search", search);
   }
   
   public void searchClear(HttpServletRequest req) {
      req.getSession().setAttribute("search", null);
   }
   
   public void regdel(Shop_person s, HttpServletRequest req) {
      TrackingMapper tm = ss.getMapper(TrackingMapper.class);
      if (tm.regdel(s) == 1) {
         req.setAttribute("r", "삭제성공");
      } else {
         req.setAttribute("r", "삭제성공");
      }
   }

   /// 페이징처리

   public void countAllP() {
      System.out.println(so.getProductPerPage());
      allPCnt = ss.getMapper(TrackingMapper.class).getAllPCount();
      System.out.println(allPCnt);
   }

   
   
   public void getPPage(int page, HttpServletRequest req) {
      String result = req.getParameter("searchProduct");
      String search = (String) req.getSession().getAttribute("search");   // 검색어로 쓸꺼
      
      if (result != null) {

         if (result.equals("productName")) {

            req.setAttribute("curPage", page);
            int pCnt = 0;
            
            if (search == null) { // 전체조회 (검색어 없으면) 
            pCnt = allPCnt;
            search = "";
            }else { // 검색어가 있으면 검색인거. 
             ProductSelector ps = new ProductSelector(search, 0, 0);
             pCnt = ss.getMapper(TrackingMapper.class).getSearchPCnt(ps); 
              }
            
            // allMsgCnt -> msgCnt
            int allPageCount = (int) Math.ceil((double) pCnt / so.getProductPerPage());
            req.setAttribute("allPageCount", allPageCount);
            // 14 / 10 한걸 올림시킨거 = 2
            int start = (page - 1) * so.getProductPerPage() + 1;
            // 2페이지면 11 시작

            int end = (page == allPageCount) ? pCnt : start + so.getProductPerPage() - 1;
            // 2 == 2 ? 2
            // 1 == 2 ? 아니고 : 1 + 9 = 10
            ProductSelector ps = new ProductSelector(search, start, end);
            List<History> products = ss.getMapper(TrackingMapper.class).getProducts(ps);

            
            
            req.setAttribute("shops", products);

            System.out.println("ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ");
            
         } else if (result.equals("shopName")) {

            req.setAttribute("curPage", page);
            int pCnt = 0;
            
            if (search == null) { // 전체조회 (검색어 없으면) 
               pCnt = allPCnt;
               search = "";
            }else { // 검색어가 있으면 검색인거. 
            ProductSelector ps = new ProductSelector(search, 0, 0);
            pCnt = ss.getMapper(TrackingMapper.class).getSearchPCnt2(ps); 
                 }
            // allMsgCnt -> msgCnt
            int allPageCount = (int) Math.ceil((double) pCnt / so.getProductPerPage());
            req.setAttribute("allPageCount", allPageCount);
            // 14 / 10 한걸 올림시킨거 = 2
            int start = (page - 1) * so.getProductPerPage() + 1;
            // 2페이지면 11 시작

            int end = (page == allPageCount) ? pCnt : start + so.getProductPerPage() - 1;
            // 2 == 2 ? 2
            // 1 == 2 ? 아니고 : 1 + 9 = 10
            ProductSelector ps = new ProductSelector(search, start, end);
            List<History> products = ss.getMapper(TrackingMapper.class).getProducts2(ps);

            req.setAttribute("shops", products);
            
         }

      } else {

         result = "";
         req.setAttribute("curPage", page);

         int pCnt = 0;
         pCnt = allPCnt;
         // allMsgCnt -> msgCnt
         int allPageCount = (int) Math.ceil((double) pCnt / so.getProductPerPage());
         System.out.println(allPageCount);
         req.setAttribute("allPageCount", allPageCount);
         // 14 / 10 한걸 올림시킨거 = 2
         int start = (page - 1) * so.getProductPerPage() + 1;
         // 2페이지면 11 시작

         int end = (page == allPageCount) ? pCnt : start + so.getProductPerPage() - 1;
         // 2 == 2 ? 2
         // 1 == 2 ? 아니고 : 1 + 9 = 10
         ProductSelector ps = null;
         if(search != null) {
            ps = new ProductSelector(search, start, end);
         }else {
            ps = new ProductSelector("", start, end);
         }
         List<History> products = ss.getMapper(TrackingMapper.class).getProducts(ps);

         req.setAttribute("shops", products);
      }

   }




   public void getDiaryPage(int page, History h, HttpServletRequest req) {
   
      TrackingMapper tm = ss.getMapper(TrackingMapper.class);
      String month_category = req.getParameter("month_category");
      System.out.println(month_category);
      req.setAttribute("curPage", page);
      int pCnt = 0;
      
      req.setAttribute("sumPrice8", tm.sumPriceEight(h));
      req.setAttribute("sumPrice7", tm.sumPriceSeven(h));
      req.setAttribute("sumPrice5", tm.sumPriceFive(h));
      req.setAttribute("sumPrice6", "0");
      int month = 0;
      if (month_category.equals("eight")) {
         pCnt = ss.getMapper(TrackingMapper.class).productsEightCnt(h); 
         month = 8;
         req.setAttribute("sumPrice8", tm.sumPriceEight(h));
      }else if (month_category.equals("seven")) {
         pCnt = ss.getMapper(TrackingMapper.class).productsSevenCnt(h); 
         month = 7;
         req.setAttribute("sumPrice7", tm.sumPriceSeven(h));
      }else if (month_category.equals("five")) {
         pCnt = ss.getMapper(TrackingMapper.class).productsFiveCnt(h); 
         month = 5;
         req.setAttribute("sumPrice5", tm.sumPriceFive(h));
      }else if (month_category.equals("six")) {
         req.setAttribute("sumPrice6", "0");
      }
         // allMsgCnt -> msgCnt
      int allPageCount = (int) Math.ceil((double) pCnt / so.getProductPerPage());
      req.setAttribute("allPageCount", allPageCount);
         // 14 / 10 한걸 올림시킨거 = 2
      int start = (page - 1) * so.getProductPerPage() + 1;
         // 2페이지면 11 시작

      int end = (page == allPageCount) ? pCnt : start + so.getProductPerPage() - 1;
            // 2 == 2 ? 2
            // 1 == 2 ? 아니고 : 1 + 9 = 10

            
      ProductSelector ps = new ProductSelector(null, start, end);
      List<History> products = null;
      if(month == 8) {
         products = ss.getMapper(TrackingMapper.class).productsEight(ps);
      }else if(month == 7) {
         products = ss.getMapper(TrackingMapper.class).productsSeven(ps);
      }else if(month == 5) {
         products = ss.getMapper(TrackingMapper.class).productsFive(ps);
      }
      req.setAttribute("shops", products);

         

      } 
   
   
   public void siteRanking(History h, HttpServletRequest req) {
   
	      TrackingMapper tm = ss.getMapper(TrackingMapper.class);
	      List<History> products = null;
	      String month = req.getParameter("month_category");
	      if(month.equals("eight")) {
	    	  products = tm.rankEight(h);
	      }else if(month.equals("seven")) {
	    	  products = tm.rankSeven(h);
	      }else if(month.equals("five")) {
	    	  products = tm.rankFive(h);
	      }
	      if(products !=null) {
	    	  
	      req.setAttribute("rank", products.get(0));
	      } 
	      
	   
   
   }



   
}