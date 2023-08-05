package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.member;
import com.smhrd.domain.memberDAO;

public class IdCheckCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		// 1. 파라미터 수집
				String id = request.getParameter("signup_id");
				
				// 2. 받아온 값을 member객체에 묶어 담아주기
				member checkId = new member(id);
				
				// 3-1. DAO 메소드 만들기, mapper.xml에 SQL문 작성
				// 3-2. DAO 객체 생성
				memberDAO dao = new memberDAO();
				// 3-3. DAO 메소드 사용 -> 메소드 결과/반환타입대로 다시 담아주기
				int cnt = dao.idcheckMember(checkId);
				
				// 4. AJAX 응답 처리
				response.setContentType("text/plain");
				PrintWriter out = response.getWriter();
				if (cnt == 1) {
					out.print("unavailable"); // 아이디가 데이터베이스에 이미 존재함
				} else {
					out.print("available"); // 아이디가 사용 가능함
				}
				out.flush();
				out.close();
			}
		}
