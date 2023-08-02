package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LogoutCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");
		// session에 저장된 회원정보를 삭제
		
		// 1. session 객체 생성
		HttpSession session = request.getSession();
		// 2. session 삭제
		session.removeAttribute("loginMember");
		
		PrintWriter out = response.getWriter();
		out.println("<script>alert('로그아웃이 완료되었습니다.'); location.href='index.jsp';</script>");
		out.flush();

		
	}

}
