<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smhrd.domain.WebBoardDAO" %> <!-- bbs 데이터베이스 접근 객체 -->
<%@ page import="com.smhrd.domain.WebBoard" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
        String ID = null;
        if(session.getAttribute("ID") != null) { //user가 접속이 되어있다면 세션값이 할당되어 있다면
            ID = (String) session.getAttribute("ID");
        } 
        if (ID == null) { //로그인 안되있으면 로그인하라고 안내
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요.')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        } 

 

        //글을 수정할 권한이 있는지 확인
        int WB_SEQ = 0; // 게시글 번호
        if (request.getParameter("WB_SEQ") != null) {
        	WB_SEQ = Integer.parseInt(request.getParameter("WB_SEQ"));//게시글 번호 받아오기
        }
        if (WB_SEQ == 0) {//게시글이 존재하지 않는 다는 얘기
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글입니다.')");
            script.println("location.href = 'board.jsp'"); // 다시 게시글 페이지로 이동
            script.println("</script>");
        }


        //현재 작성한 글이 작성한 본인이 한건지 확인, 수정권한 확인
        WebBoard WebBoard = new WebBoardDAO().getWebBoard(WB_SEQ);
            if (!ID.equals(WebBoard.getID())) { // !userID세션값과 bbs.getUserID 작성한사람 동일한지
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('권한이 업습니다.')");
                script.println("location.href = 'board.jsp'"); // 다시 게시글 페이지로 이동
                script.println("</script>");
            } else { 
            	WebBoardDAO WebBoardDAO = new WebBoardDAO(); //데이터 베이스에 접근 가능한 객체생성
                 int result = WebBoardDAO.delete(WB_SEQ);
                 if (result == -1) { // -1일 경우 데이터베이스 오류
                     PrintWriter script = response.getWriter();
                     script.println("<script>");
                     script.println("alert('글삭제에 실패했습니다.')");
                     script.println("history.back()");
                     script.println("</script>");
                 } else { // 삭제성공
                     PrintWriter script = response.getWriter();
                     script.println("<script>");
                     script.println("location.href = 'board.jsp'");
                     script.println("</script>");
                 }
             }
     
    %>
</body>
</html>