package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.memberDAO;


public class DeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		// 1. 쿼리스트링으로 넘어오는 값 받아오기
		// ?name=value
		// request.getParameter("name값")
		String id = request.getParameter("signin_id");
		
		// 2. MemberMapper.xml에서 SQL문 작성
		// 		String으로 email값만 들어감
		
		// 3. DAO 메소드 작성(deleteMember)
		// insert, update 참고
		
		// 4. DAO 객체 생성
		memberDAO dao = new memberDAO();
		// 5. DAO 메소드 호출
		int cnt = dao.deleteMember(id);
		
		if(cnt>0) {
			System.out.println("회원정보 삭제 성공~");
		}else {
			System.out.println("회원정보 삭제 실패ㅜ");
		}
		// 6. 일을 다 마치고 나면
		response.sendRedirect("select.jsp");
		
		
		
		
		
		
	}

}
