package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.domain.member;
import com.smhrd.domain.memberDAO;


public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("[LoginCon]");
		
		// 0. post방식 한글인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 1. 파라미터 수집
		String id = request.getParameter("signin_id");
		String pw = request.getParameter("signin_pw");
		
		// 2. member객체에 담아주기
		member login = new member(id, pw);
		// 받아온 값 확인
		System.out.println(login.toString());
		
		// 3-1. DAO 메소드 만들기, xml에 SQL문 작성
		// 3-2. DAO 객체 생성
		memberDAO dao = new memberDAO();
		// 3-3. DAO 메소드 호출 --> member객체에 결과값 담기
		member loginMember = dao.selectMember(login);
		
		// 4. 명령 후 처리
		if(loginMember != null) {
			System.out.println("로그인 성공");
			// 회원 정보를 session에 저장
			// Servlet에서 session 사용할때는 session객체 생성
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", loginMember);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인에 성공하였습니다.'); location.href='index.jsp';</script>");
			out.flush();
			
		}else {
			System.out.println("로그인 실패");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인에 실패하였습니다.'); location.href='index.jsp';</script>");
			out.flush();
		}
		
		

		
		
		
	}

}
