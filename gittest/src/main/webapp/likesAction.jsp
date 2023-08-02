<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


WebBoardDAO WebBoardDAO = new WebBoardDAO();
		likesDAO likesDAO = new likesDAO();
		int result = likesDAO.likes(ID,WB_SEQ);
		
		if(result == 1){
			result = WebBoardDAO.likes(WB_SEQ);
			if(result == 1){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('추천이 완료되었습니다.')");
				script.println("location.href= \'view.jsp?WB_SEQ="+WB_SEQ+"\'");
				script.println("</script>");
			} else{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류가 발생했습니다.')");
				script.println("location.href=document.referrer;");
				script.println("</script>");
			}
		} else{
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('이미 추천을 누른 글입니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}
</body>
</html>