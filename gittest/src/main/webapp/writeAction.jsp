<%@page import="com.smhrd.domain.member"%>
<%@page import="oracle.security.crypto.core.Padding.ID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smhrd.domain.WebBoardDAO" %>
<%@ page import="com.smhrd.domain.memberDAO" %> 
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="WebBoard" class="com.smhrd.domain.WebBoard" scope="page" />
<jsp:setProperty name="WebBoard" property="WB_TITLE" />
<jsp:setProperty name="WebBoard" property="WB_CONTENT" />
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8" />
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
 <meta name="description" content="" />
 <meta name="author" content="" />
<title>게시판</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />

  <!-- login stylesheet -->
  <link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="css/l_style.css"> <!-- Resource style -->
	<link rel="stylesheet" href="css/demo.css"> <!-- Demo style -->
</head>
<body>
<%
		member loginMember = null;
		String WB_TITLE = request.getParameter("WB_TITLE");
		String WB_CONTENT = request.getParameter("WB_CONTENT");
			if (session.getAttribute("loginMember") != null) {
				loginMember = (member)session.getAttribute("loginMember");
				

	            if (WB_TITLE == null || WB_CONTENT == null) {
	            	System.out.print("WB_TITLE"+WB_TITLE+"WB_CONTENT"+WB_CONTENT);
	                	PrintWriter script = response.getWriter();
	                	script.println("<script>");
	                	script.println("alert('입력이 안 된 사항이 있습니다.')");
	                	script.println("history.back()");
	                	script.println("</script>");
	            } else {
	            	WebBoardDAO WebBoardDAO = new WebBoardDAO();
	                int result = WebBoardDAO.write(WB_TITLE, WB_CONTENT,loginMember.getId());
	                if (result == -1) { // -1일 경우 데이터베이스 오류
	                    PrintWriter script = response.getWriter();
	                    script.println("<script>");
	                    script.println("alert('글쓰기에 실패했습니다.')");
	                    script.println("history.back()");
	                    script.println("</script>");
	                } else { // 입력성공
	                    PrintWriter script = response.getWriter();
	                    script.println("<script>");
	                    script.println("location.href = 'board.jsp'");
	                    script.println("</script>");
	                }
	        }
				}
			
			
    		if(loginMember==null)  { //로그인 안되있으면 로그인하라고 안내
            		PrintWriter script = response.getWriter();
            		script.println("<script>");
            		script.println("alert('로그인을 하세요.')");
            		script.println("location.href = 'LoginCon'");
            		script.println("</script>");
        } 


%>
  
  
  
  
  
  
  
  <!-- footer section -->
  <footer class="footer_section">
    <div class="container">
      <p>
        &copy; <span id="displayYear"></span> All Rights Reserved By
        <a href="https://html.design/">Free Html Templates</a>
      </p>
    </div>
  </footer>
  <!-- footer section -->

  <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- owl slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <!--  OwlCarousel 2 - Filter -->
  <script src="https://huynhhuynh.github.io/owlcarousel2-filter/dist/owlcarousel2-filter.min.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
</body>
</html>