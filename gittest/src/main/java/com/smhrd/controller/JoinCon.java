package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.member;
import com.smhrd.domain.memberDAO;

public class JoinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		// 1. 파라미터 수집
		String id = request.getParameter("signup_id");
		String pw = request.getParameter("signup_pw");
		String username = request.getParameter("signup_username");
		String email = request.getParameter("signup_email");
		
		// 2. 받아온 값을 member객체에 묶어 담아주기
		member joinMember = new member(id, pw, username, email);
		// 받아온값 확인 --> tostring()
		System.out.println(joinMember.toString());
		
		// 3-1. DAO 메소드 만들기, mapper.xml에 SQL문 작성
		// 3-2. DAO 객체 생성
		memberDAO dao = new memberDAO();
		// 3-3. DAO 메소드 사용 -> 메소드 결과/반환타입대로 다시 담아주기
		int cnt = dao.insertMember(joinMember);
		
		// 4. 명령 후 처리
		if(cnt>0) {
			System.out.println("회원가입 성공");
			// 회원가입 성공하면 joinSuccess.jsp 이동
			// 회원가입한 email을 담아서 이동 -> forward방식
			request.setAttribute("joinId", id);
			response.sendRedirect("index.jsp");
			
		}else {
			// 회원가입 실패하면 main.jsp 이동 -> redirect방식
			System.out.println("회원가입 실패");
			response.sendRedirect("index.jsp");
		}	
		
	}
}
