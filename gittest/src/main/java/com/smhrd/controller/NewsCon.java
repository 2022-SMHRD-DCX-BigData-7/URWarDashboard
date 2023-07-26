package com.smhrd.controller;

import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.smhrd.domain.News;
import com.smhrd.domain.NewsDAO;

@WebServlet("/news.nhn")
public class NewsCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NewsDAO dao;
	private ServletContext ctx;
	
	// 웹 리소스 기본 경로 지정
	private final String START_PAGE = "about.jsp";
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new NewsDAO();
		ctx = getServletContext();
	}
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        request.setCharacterEncoding("utf-8");
	        String action = request.getParameter("action");
	        
	        dao = new NewsDAO();
	        
	        Method m;
	        String view = null;
	        
	        if (action == null) {
	            action = "listNews";
	        }
	        
	        try {
	            m = this.getClass().getMethod(action, HttpServletRequest.class);
	            view = (String)m.invoke(this, request);
	        } catch (NoSuchMethodException e) {
	            e.printStackTrace();
	            ctx.log("요청 action 없음!!");
	            request.setAttribute("error", "action 파라미터가 잘못되었습니다!!!");
	            view = START_PAGE;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        
	        if (view != null && view.startsWith("redirect:")) {
	            // 리다이렉트 처리
	            String redirectPath = view.substring("redirect:".length());
	            response.sendRedirect(redirectPath);
	        } else {
	            // 포워드 처리
	            RequestDispatcher dispatcher = request.getRequestDispatcher(view);
	            dispatcher.forward(request, response);
	        }
	    } catch (NullPointerException e) {
	        // view 변수가 null인 경우 처리
	        e.printStackTrace();
	        // 또는 적절한 예외 처리를 수행하도록 수정
	    } catch (Exception e) {
	        // 기타 예외 처리
	        e.printStackTrace();
	    }
	}


	public String listNews(HttpServletRequest request) {
		List<News> list;
		try {
			list = dao.getAll();
			request.setAttribute("newsList", list);
		} catch(Exception e) {
			e.printStackTrace();
			ctx.log("뉴스 목록 생성 과정에서 문제 발생!!");
			request.setAttribute("error", "뉴스 목록이 정상적으로 처리되지 않았습니다!!!");
		}
		return "/about.jsp";
	}
	
	public String getNews(HttpServletRequest request) {
		int NEWS_SEQ = Integer.parseInt(request.getParameter("NEWS_SEQ"));
		
		try {
			News n = dao.getNews(NEWS_SEQ);
			request.setAttribute("news", n);
		} catch(SQLException e) {
			e.printStackTrace();
			ctx.log("뉴스를 가져오는 과정에서 문제 발생!!");
			request.setAttribute("error", "뉴스를 정상적으로 가져오지 못했습니다!!!");
		}
		
		return "/newsView.jsp";
	}

	
	private String getFilename(Part part) {
		String fileName = null;
		String header = part.getHeader("content-disposition");
		System.out.println("Header => "+header);
		
		int start = header.indexOf("filename=");
		fileName = header.substring(start+10, header.length()-1);
		ctx.log("파일명:"+fileName);
		
		return fileName;
	}
	
}
