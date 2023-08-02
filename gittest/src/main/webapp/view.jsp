<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.smhrd.domain.WebBoard" %> <!-- view.jsp에서 추가생성 -->
<%@ page import="com.smhrd.domain.WebBoardDAO" %> <!-- view.jsp에서 추가생성 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>Insert title here</title>
</head>
<body>
<%
	String ID = null;
	if(session.getAttribute("ID") != null) {
    ID = (String) session.getAttribute("ID"); //로그인한 사람들은 해당아이디가 userID에 저장
	}

	int CREATED_AT = 0;
		if (request.getParameter("CREATED_AT") != null) {
			CREATED_AT = Integer.parseInt(request.getParameter("CREATED_AT"));//게시글 번호 받아오기
	}
		if (CREATED_AT == 0) {//번호가 반드시 존재하는지 확인
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('유효하지 않은 글입니다.')");
    		script.println("location.href = 'board.jsp'"); // 다시 게시글 페이지로 이동
    		script.println("</script>");
	}		
		WebBoard WebBoard = new WebBoardDAO().getWebBoard(CREATED_AT); // 유효한 글이라면 구체적인 정보를 bbs에 담음
%>

 <!-- 테이블 -->
    <div class = "container">
        <div class="row">

            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                <thead>
                    <tr><!-- 테이블의 행, 한줄 -->
                        <th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 20%;">글 제목</td>
                        <td colspan="2"><%= WebBoard.getWB_TITLE().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>;") %>
                        </td>
                    </tr>
                     <tr>
                        <td>작성자</td>
                        <td colspan="2"><%= WebBoard.getID() %></td>
                     </tr>
                     <tr>
                        <td>작성일자</td>
                        <td colspan="2"><%= WebBoard.getCREATED_AT().substring(0, 11) %>

                        </td>
                    </tr>
                    <tr>
                        <td>내용</td>
                            <td colspan="2" style="min-height: 200px; text-align: left;"><%= WebBoard.getWB_CONTENT().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>;") %>
                        </td>
                    </tr>
                    <tr>
						<td>조회수</td>
						<td colspan="2"><%=WebBoard.getWB_VIEWS() + 1%></td>
					</tr>
					 <a onclick="return confirm('추천하시겠습니까?')"href="likeAction.jsp?bbsID=%=bbsID%>" class="btn btn-success pull-right">👍</a>
				</tbody>
            </table>
            <a href="board.jsp" class="btn btn-primary">목록</a>

            <%
                if(ID != null && ID.equals(WebBoard.getID())) { //해당글의 작성자가 본인이라면 수정버튼 보임
            %>
                <a href="update.jsp?BOARD_ID=<%= CREATED_AT %>" class="btn btn-primary">수정</a>
                <a href="deleteAction.jsp?BOARD_ID=<%= CREATED_AT %>" class="btn btn-primary">삭제</a>
            <%
                }
            %>
				<input type = "submit" class="btn btn-primary pull-right" value="글 쓰기">
        </div>

    </div>






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