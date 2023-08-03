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



public class IdSearchCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 0. post방식 한글인코딩
		request.setCharacterEncoding("UTF-8");
				
		// 1. 파라미터 수집
		String username = request.getParameter("search_username");
		String email = request.getParameter("search_email");
		
		// 2. member객체에 담아주기
		member search_id = new member(username,email);
		
		// 받아온 값 확인
		
		System.out.println(search_id.toString());
		
		
		// 3-1. DAO 메소드 만들기, xml에 SQL문 작성
		// 3-2. DAO 객체 생성
		memberDAO dao = new memberDAO();
		// 3-3. DAO 메소드 호출 --> member객체에 결과값 담기
		String idsearch = dao.idsearchMember(search_id);
		
		
		// 4. 명령 후 처리
		if(idsearch != null) {
			System.out.println("아이디조회 성공");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('귀하의 아이디는 '+idsearch+'입니다.'); location.href='index.jsp';</script>");
			out.flush();
			
		}else {
			System.out.println("아이디조회 실패");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디 조회에 실패하였습니다. 이름과 이메일 주소를 다시 확인하여 주십시오.'); location.href='index.jsp';</script>");
			out.flush();

		
	}
		

}}