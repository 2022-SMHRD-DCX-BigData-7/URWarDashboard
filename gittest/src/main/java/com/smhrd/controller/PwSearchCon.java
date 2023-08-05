package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.member;
import com.smhrd.domain.memberDAO;

public class PwSearchCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		 String id = request.getParameter("search_id");
	        String username = request.getParameter("search_username");
	        String email = request.getParameter("search_email");
	        
	        member searchpw = new member(id, username, email);
	        
	        System.out.println(searchpw.toString());
	        
	        memberDAO dao = new memberDAO();
	        String pwsearch = dao.pwsearchMember(searchpw);
	        
	        if (pwsearch != null) {
	            System.out.println("비밀번호조회 성공");
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('귀하의 비밀번호는 " + pwsearch + "입니다.'); location.href='index.jsp';</script>");
	            out.flush();
	            
	        } else {
	            System.out.println("비밀번호조회 실패");
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('비밀번호 조회에 실패하였습니다. 아이디와 이름, 이메일 주소를 다시 확인하여 주십시오.'); location.href='index.jsp';</script>");
	            out.flush();

		
	}
	}

}
