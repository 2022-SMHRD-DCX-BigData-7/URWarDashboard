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


public class DeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String dpw = request.getParameter("delete_password");
		
		HttpSession session = request.getSession();
		member loginMember = null;
		loginMember = (member)session.getAttribute("loginMember");
		String id = loginMember.getId();
		String pw = loginMember.getPw();
		
		// 2. MemberMapper.xml에서 SQL문 작성
		// 		String으로 email값만 들어감
		
		// 3. DAO 메소드 작성(deleteMember)
		// insert, update 참고
		
		// 4. DAO 객체 생성
		memberDAO dao = new memberDAO();
		// 5. DAO 메소드 호출
		
		if(pw.equals(dpw)) {
			dao.deleteMember(id);
			System.out.println("회원정보 삭제 성공");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원님의 정보가 삭제되었습니다. 이용해주셔서 감사드립니다.'); location.href='index.jsp';</script>");
			out.flush();
			session.removeAttribute("loginMember");
		}else {
			System.out.println("회원정보 삭제 실패");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('삭제에 실패하였습니다. 비밀번호를 다시 확인해 주십시오.'); location.href='index.jsp';</script>");
			out.flush();
		}
		// 6. 일을 다 마치고 나면
		
		
		
		
		
		
		
		
	}

}
